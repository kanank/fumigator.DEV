unit formIncomeCallRoot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, dxGDIPlusClasses,
  Vcl.ExtCtrls,
  CommonTypes, CommonVars ;

type
  TfrmIncomeCallRoot = class(TBaseForm)
    Timer1: TTimer;
    Timer2: TTimer;
    CheckTimer: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure CheckTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    fCallId: string;
    fCallApiId: string;
    fClientClose: boolean;
    fSessionClose: Boolean;
    fCallResult: string;
    fClientId: Integer;
    fClientCallPrm: ClientCallParams;
    fClientForm: TForm;
    fCallCancel: Boolean;
    fCallAccepted: Boolean;
    fNeedFinish: Boolean;
    fResultSaved: Boolean;
    function  GetCallFinished: boolean;
    procedure SetClientClose(AValue: boolean);
    procedure SetCallResult(AValue: string);
    procedure SetClientCallPrm(AValue: ClientCallParams);
    procedure doFinishCall; override;
    procedure doAcceptCall; override;
    procedure doTransferCall; override;
  public
    property CallResult: string read fCallResult write SetCallResult;
    property CallId: string read fCallId write fCallId;
    property CallApiId: string read fCallApiId write fCallApiId;
    property CallFinished: boolean read GetCallFinished;
    property ClientClose: boolean read fClientClose write SetClientClose;
    property ClientId: Integer read fClientId write fClientId;
    property SessionClose: Boolean read fSessionClose write fSessionClose;
    property ClientCallPrm: ClientCallParams read fClientCallPrm write SetClientCallPrm;
    property ClientForm: TForm read fClientForm write fClientForm;
    property CallCancel: Boolean read fCallCancel write fCallCancel;
    property CallAccept: Boolean read fCallAccepted write  fCallAccepted;

    procedure CallFinish;
    procedure CheckSession;
    procedure DoCallCancel;
    destructor Destroy; overload;

    class function ShowIncomeCall(ACallId: string = ''; ACallApiId: string = ''): Boolean;
    class function ShowCall: Boolean;
    class procedure CloseCall;
    //class procedure CheckAccept(Sender: TObject);
  end;

var
  frmIncomeCallRoot: TfrmIncomeCallRoot;

implementation

{$R *.dfm}
uses
  DM_Main, IBX.IBQuery, formClientFiz, formClientUr,
  formIncomeCalls, formIncomeCallsUr, formCallUnknown,
  formCallEvent, frmMain, formContact, formSessionResult;
{ TfrmIncomeCallRoot }

procedure TfrmIncomeCallRoot.DoCallCancel;
begin
  fCallCancel := True;
  CallObj.CallInfo.CallResult := 'CANCEL';
    
  if Assigned(frmIncomeCall) then
  begin
     frmIncomeCall.ModalResult := mrCancel;
    //FreeAndNil(frmIncomeCall);
  end;
  if Assigned(frmIncomeCallUr) then
  begin
    frmIncomeCallUr.ModalResult := mrCancel;
    //frmIncomeCallUr.Close;
    //FreeAndNil(frmIncomeCallUr);
  end;
  if Assigned(frmCallUnknown) then
  begin
    frmCallUnknown.HideAbsolute;

  end;

  //Self.ModalResult := mrCancel;
  (*if Assigned(frmCallEvent) then
    FreeAndNil(frmCallEvent); 
       
    fClientClose  := True;
    fSessionClose := True;
    Self.ModalResult := mrCancel;
    Self.CloseModal;*)
end;

procedure TfrmIncomeCallRoot.doFinishCall;
begin
  //inherited;

  //frmCallEvent.ModalResult := mrCancel;
  //if fClose then
  //if CallObj.Accepted then
  //  fNeedFinish := True;
  CallFinish;

end;

procedure TfrmIncomeCallRoot.doTransferCall;
begin
  inherited;
  CallFinish;
end;

procedure TfrmIncomeCallRoot.CallFinish;
var
  mr: TModalResult;
begin
  if CallObj.Accepted then
    mr := mrOk
  else
    mr := mrCancel;
  if Assigned(frmCallEvent) and frmCallEvent.Visible then
  begin
    fNeedFinish := True;
    frmCallEvent.ModalResult := mrOk;
    Exit;
  end;

  if CallObj.Transfered or (not CallObj.Active and not CallObj.Accepted) then //Callobj.Cancelled or fSessionClose then
  begin
    fNeedFinish := True;
    if Assigned(frmIncomeCall) and frmIncomeCall.Visible then
    begin
      frmIncomeCall.CloseAbsolute;
      Exit;
      //frmIncomeCall.Free;
    end;
    if Assigned(frmIncomeCallUr) and frmIncomeCallUr.Visible then
    begin
      frmIncomeCallUr.CloseAbsolute;
      Exit;
      //frmIncomeCallUr.Free;
    end;
    if Assigned(frmContact) and frmContact.Visible then
    begin
      frmContact.CloseAbsolute;
      Exit;
    end;

    if frmCallUnknown.Visible then
    begin
     //frmCallUnknown.ModalResult := mrCancel;
      frmCallUnknown.HideAbsolute;
      Exit;
    end;

    Self.ModalResult := mrCancel;
    fCanClose := True;
    Close;
    Exit;
    //Self.CloseModal;
 end;

  if Callobj.Cancelled and not CallObj.Accepted then
  begin
   // if Assigned(frmCallEvent) then
   //   frmCallEvent.ModalResult := mrCancel;

    ModalResult := mrCancel;
    Exit;
  end;

  if CallObj.Active and CallObj.Accepted and fClientClose  then
  begin
    if not fResultSaved then
    begin
      try
        fCallResult  := DM.FinishSession(CallObj.CallInfo.CallApiId, ClientId);
        fResultSaved := True;
      except
        fResultSaved := False;
      end;
    end;
  end;

  if not CallObj.Active and CallObj.Accepted and fClientClose  then
  begin
    if not fNeedFinish then //не закрывались модальные окна
    begin
      if Assigned(frmIncomeCall) then
      begin
        fNeedFinish := True;
        frmIncomeCall.CloseAbsolute;
        Exit;
      end;
      if Assigned(frmIncomeCallUr) then
      begin
        fNeedFinish := True;
        frmIncomeCallUr.CloseAbsolute;
        Exit;
      end;
      if frmCallUnknown.Visible then
      begin
        //frmCallUnknown.ModalResult := mrCancel;;
        if Assigned(frmSessionResult) and frmSessionResult.Visible then
          Exit;

        frmCallUnknown.HideAbsolute;
        Exit;
      end;

    end;

    if not fResultSaved then
    try
      fCallResult  := DM.FinishSession(CallObj.CallInfo.CallApiId, ClientId);
      fResultSaved := True;
    except
      fResultSaved := False;
    end;

    fCanClose := fResultSaved;
    ModalResult := mrOk;
  end;
end;

procedure TfrmIncomeCallRoot.CheckSession;
var
  accept: boolean;
begin
  (*if fCallCancel then
    ModalResult := mrCancel
  else
  if Assigned(frmCallEvent) and (frmCallEvent.ModalResult = mrNone) then
  begin
    if not fCallAccepted and DM.CheckCloseCall(CallId) then
    begin
      frmCallEvent.ModalResult := mrCancel;
      Exit;
    end;
  end;

  if Assigned(frmCallEvent) and
     ((frmCallEvent.ModalResult = mrNone) or
     (frmCallEvent.ModalResult = mrCancel)) then
    Exit;*)
  //fSessionClose := DM.CheckCloseSession(CallId);
(*  if callid = ''  then
    exit;

  DM.CheckSession(CallId, fSessionClose, accept);
  if accept then //прин€ли звонок
  begin
    fCallAccepted := true;
    if Assigned(frmCallEvent) then
      frmCallEvent.ModalResult := mrOk
    else
      DoCallCancel;
  end;
  CallFinish;*)
end;

procedure TfrmIncomeCallRoot.CheckTimerTimer(Sender: TObject);
begin
  //CheckAccept(CallObj);
  if CallObj.Accepted then
    CheckTimer.Enabled := false;
end;

class procedure TfrmIncomeCallRoot.CloseCall;
begin
  CallObj.Ready := True;
  FreeAndNil(frmCallEvent);
  FreeAndNil(frmIncomeCallRoot);
end;

destructor TfrmIncomeCallRoot.Destroy;
begin
  CallObj.Ready := true;
  inherited;
end;

procedure TfrmIncomeCallRoot.doAcceptCall;
begin
  inherited;
  if Assigned(frmCallEvent) then
    frmCallEvent.ModalResult := mrOk;
end;

procedure TfrmIncomeCallRoot.FormCreate(Sender: TObject);
begin
  inherited;
  //NoDefaultCallEvent := False; //событи€ звонков нужны
end;

procedure TfrmIncomeCallRoot.FormShow(Sender: TObject);
begin
  if not CallObj.Active then
    ModalResult := mrCancel;

  fClientClose := True; //по умолчанию
  Timer1.Enabled := True;
end;

function TfrmIncomeCallRoot.GetCallFinished: boolean;
begin
   result := (CallResult <> '');
end;

procedure TfrmIncomeCallRoot.SetCallResult(AValue: string);
begin
  if AValue <> fCallResult then
    fCallResult := AValue;
  CallFinish;
end;

procedure TfrmIncomeCallRoot.SetClientCallPrm(AValue: ClientCallParams);
begin
  fClientCallPrm.Assign(AValue);
end;

procedure TfrmIncomeCallRoot.SetClientClose(AValue: boolean);
begin
  if AValue <> fClientClose then
    fClientClose := AValue;
  if AValue then
    CallFinish;
end;

class function TfrmIncomeCallRoot.ShowCall: Boolean;
begin
 if DM.Db.Connected = false then
    Exit;

  try
    DM.incomeCalling := True;
    frmIncomeCallRoot := TfrmIncomeCallRoot.Create(nil);

    frmIncomeCallRoot.ClientId := CallObj.CallInfo.ClientId;
    frmIncomeCallRoot.ClientClose       := true;
    frmIncomeCallRoot.CloseOnCancelCall := true;
    frmIncomeCallRoot.ModalResult := mrNone;
    //if CallObj.Active then
    //  frmIncomeCallRoot.ShowModal;

  finally
    //CallObj.Ready := True;
    //FreeAndNil(frmCallEvent);
    //FreeAndNil(frmIncomeCallRoot);
  end;
end;

class function TfrmIncomeCallRoot.ShowIncomeCall(ACallId: string = ''; ACallApiId: string = ''): Boolean;
var Q : TIBQuery;
    tel :string;
    id: integer;
    CLP: ClientCallParams;
    //extPrm: TClientParam;
begin
  if DM.Db.Connected = false then
    Exit;

  CLP.Setup; //установка

  DM.incomeCalling := True;
  frmIncomeCallRoot := TfrmIncomeCallRoot.Create(nil);
  if ACallId <> '' then
    frmIncomeCallRoot.CallId := ACallId;
  if ACallApiId <> '' then
    frmIncomeCallRoot.CallApiId:= ACallApiId;
  
  try
    with DM.CallS_Q do
    begin
         Close;
         if Transaction.InTransaction then
           Transaction.CommitRetaining;
         ParamByName('ATS_Num').AsString := DM.CurrentUserSets.ATS_Phone_Num;
         ParamByName('date_start').AsDateTime := DM.DateStart;

         Open;

         if FieldByName('ID').IsNull = false then
         begin //если звонок есть.
           tel := FieldByName('CALL_NUM').AsString;
           id  := FieldByName('ID').AsInteger;
           //Delete;
           if Transaction.InTransaction then
              Transaction.CommitRetaining;

           //получаем параметры звонка
           CLP := DM.getClientCallParams(tel);
           CLP.id_call := id;
           ClP.TelNum  := tel;

           //ExtPrm.CallParam := CLP;

           //берем звонок в обработку
//           if not DM.SetReadedCall(id) then
//           begin
//             // ошибка
//             exit;
//           end;

           if ACallId = '' then
             frmIncomeCallRoot.CallId         := FieldByName('CALLID').AsString;
           if ACallApiId = '' then
             frmIncomeCallRoot.CallApiId      := FieldByName('CALLAPIID').AsString;
           frmIncomeCallRoot.ClientCallPrm  := ClP;
           frmIncomeCallRoot.ClientId       := ClP.Client_id;
           frmIncomeCallRoot.ClientClose    := false;
           frmIncomeCallRoot.ShowModal;

          (* if clp.Client_Type = '' then
           begin  // ¬ызываем неизвестный звонок.
             case DM.ShowUnknownCallForm(tel).ModalRes of
               mrOk: DM.ShowClientFiz(asCreate, ExtPrm);
               mrYes: DM.ShowClientUr(asCreate, ExtPrm);
             end;
           end
           else
           begin
             frmIncomeCallRoot.ClientId  := ClP.Client_id;
             if ClP.Client_Type = 'F' then
             begin
               DM.ShowFizCallForm(clp);
             end;

             if ClP.Client_Type = 'U' then
             begin
               DM.ShowUrCallForm(clp);
             end;*)
           end;

          if Transaction.Active then
           Transaction.CommitRetaining;
         end;

  finally
    //formMain.CallId    := '';
    //formMain.CallApiId := '';
    DM.incomeCalling := False;
    FreeAndNil(frmCallEvent);
    FreeAndNil(frmIncomeCallRoot);
  end;
end;

(*class procedure TfrmIncomeCallRoot.CheckAccept(Sender: TObject);
begin
  if not TCallProto(Sender).Active then
    exit;

  with DM.QSessionCheckAct do
  begin
    Close;
    //ParamByName('callid').AsString := TCallProto(Sender).CallInfo.CallId;
    ParamByName('callapiid').AsString := TCallProto(Sender).CallInfo.CallApiId;
    Open;

    if (RecordCount = 1) and
       (FieldByName('callid').AsString =
         TCallProto(Sender).CallInfo.CallId) then
    begin
      TCallProto(Sender).Accepted := True;
      if Assigned(frmCallEvent) then
        frmCallEvent.ModalResult := mrCancel;
    end
  end;
end;*)

procedure TfrmIncomeCallRoot.Timer1Timer(Sender: TObject);
var
  extPrm: TClientParam;
  callPrm: ClientCallParams;
  formRes: FormResult;
  newCli: Boolean;
begin
  /// не используетс€
  extPrm.Setup;

 Timer1.Enabled := False;
 DM.GetDataset(DM.Clients);
 try
 try
  Timer2.Enabled := True;
  CallPrm.Setup;
  CallPrm.TelNum      := CallObj.CallInfo.Phone;
  CallPrm.Client_id   := CallObj.CallInfo.ClientId;
  CallPrm.Client_Type := CallObj.CallInfo.ClientType;
  fClientCallPrm.Assign(CallPrm);

  if CallObj.CallInfo.ClientType = '' then
  try  // ¬ызываем неизвестный звонок.
   ExtPrm.CallParam := @CallPrm;
   fClientClose := False;
   case DM.ShowUnknownCallForm(CallObj.CallInfo.Phone, false).ModalRes of
     mrOk:
     begin
       // новый лид
       if frmCallUnknown.TypeBtnClick = frmCallUnknown.btnLID.Name then
       begin
         fClientClose := False;
         ExtPrm.CallParam.Status_Id := 2; //Ћид
         if frmCallUnknown.SubTypeBtnClick = 'FIZ' then
         begin
           if DM.ShowClientFizForCall(asCreate, ExtPrm).ModalRes = mrOk then
           begin
             ClientId                    := DM.Clients.FieldByName('id').AsInteger;
             CallObj.CallInfo.ClientId   := DM.Clients.FieldByName('id').AsInteger;
             CallObj.CallInfo.ClientType := 'F';
           end;
         end
         else
         begin
           if DM.ShowClientURForCall(asCreate, ExtPrm).ModalRes = mrOk then
           begin
             ClientId                    := DM.Clients.FieldByName('id').AsInteger;
             CallObj.CallInfo.ClientId   := DM.Clients.FieldByName('id').AsInteger;
             CallObj.CallInfo.ClientType := 'U';
           end;
         end;
         if Assigned(frmSessionResult) then
           frmSessionResult.EnableButtons;
       end
       else //добавить к существующему
       if frmCallUnknown.TypeBtnClick = frmCallUnknown.btnAddToExist.Name then
       begin
         if frmCallUnknown.SelectId > 0 then
         begin
           fClientClose := False;
           if DM.Clients.Locate('id', frmCallUnknown.SelectId, []) then
             begin
             extPrm.CallParam.Client_id := frmCallUnknown.SelectId;
             ClientId := frmCallUnknown.SelectId;
             if DM.Clients.FieldByName('type_cli').AsInteger = 0 then
                DM.ShowClientFizForCall(asEdit, ExtPrm)
             else
                DM.ShowClientURForCall(asEdit, ExtPrm);
           end;
           if Assigned(frmSessionResult) then
             frmSessionResult.EnableButtons;
         end;
       end

       else  //корпоративный и др
       begin
         fClientClose := true;
         fCallResult := 'ANSWER';
         fResultSaved := True;
      end;

     end;
     mrCancel:
       if CallObj.Accepted then
         fClientClose := True;
   end;
     (*mrYes: formRes := DM.ShowClientUr(asCreate, ExtPrm);
     mrAll:
       begin
        extPrm.ClientType := frmCallUnknown.ContactType;
        formRes := DM.ShowContact(asCreate, ExtPrm);
       end;*)
    // end;
   //end;
  finally
    //frmCallUnknown.Free;
    fClientClose := True;
    if fNeedFinish or not CallObj.Active or CallObj.Accepted then
     CallFinish;
     FreeAndNil(frmClientFiz);
     FreeAndNil(frmClientUr);
    //frmCallUnknown.HideAbsolute;
  end
  else
  begin
    fClientClose := False; // карточка клиента закрываетс€ только вручную
    if CallObj.CallInfo.ClientType = 'F' then
    begin
      DM.ShowFizCallForm(fClientCallPrm);

    end
    else
    if CallObj.CallInfo.ClientType = 'U' then
    begin
      DM.ShowUrCallForm(fClientCallPrm);
    end
    else
    if CallObj.CallInfo.ClientType = 'C' then
    begin
      DM.ShowContactCallForm(fClientCallPrm);
    end;

    fClientClose := True;
    if fNeedFinish or not CallObj.Active or CallObj.Accepted then
     CallFinish;

  end;
 except
   MsgBoxError(Exception(ExceptObject).Message, 'Ќепредвиденна€ ошибка');
   fNeedFinish := True;
   CallFinish;
 end;
 finally
   fClientClose := True;
   if CallObj.Accepted or fNeedFinish or not CallObj.Active  then
      CallFinish;
 end;
end;

procedure TfrmIncomeCallRoot.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  //CheckTimer.Enabled := true;

  frmCallEvent := TfrmCallEvent.Create(nil);

  if not CallObj.Accepted then
    frmCallEvent.ShowModal
  else
    frmCallEvent.ModalResult := mrOk;

   if fNeedFinish then
      CallFinish;

  //if frmCallEvent.ModalResult = mrCancel then
  //  DoCallCancel
  //else
  //if frmCallEvent.ModalResult = mrOk then
  //   formMain.ClientSocket.Socket.SendText('#callaccept:' + CallApiId +',' +DM.CurrentUserSets.ATS_Phone_Num);
  
end;

end.
