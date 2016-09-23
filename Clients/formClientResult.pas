unit formClientResult;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, Vcl.ExtCtrls, RzPanel,
  dxGDIPlusClasses, RzButton, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TfrmClientResult = class(TBaseForm)
    pnlForm: TRzPanel;
    pnlResult: TRzPanel;
    RzPanel1: TRzPanel;
    Image2: TImage;
    Exit_bnt: TRzButton;
    butOK: TRzButton;
    pnlCall: TRzPanel;
    btnTransferCall: TRzButton;
    btnCallLater: TRzButton;
    btnDeleteCall: TRzButton;
    Q: TIBQuery;
    procedure btnDeleteCallClick(Sender: TObject);
    procedure butOKClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnCallLaterClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnTransferCallClick(Sender: TObject);
  private
    fCallId: string;
    fCallApiId: string;
    fClientSaved: Boolean;
    fResultSaved: Boolean;
    fCallResult: string;
    fCallFinished: Boolean;

    procedure SetCallId(AValue: string);
    function GetCallFinished: boolean;
    function SaveResult: Boolean;
    function SaveClient: Boolean;
    function CheckFinish: boolean;
    function GetCallResult: string;
  public
    AtsPhone: string;
    Phone: string;
    //CallResult: string;
    ClientId: Integer;
    frmCli: TForm;
    frmResult: TForm;
    TypeCli: Integer;
    property CallId: string read fCallId write SetCallId;
    property CallApiId: string read fCallApiId write fCallApiId;
    property ClientSaved: Boolean read fClientSaved write fClientSaved;

    property  CallFinished: boolean read GetCallFinished;
    property  CallResult: string read GetCallResult write fCallResult;
    procedure CallFinish;
    procedure CheckSession;
    procedure doFinishCall; override;
    procedure doTransferCall; override;
    procedure CreateFormResult;
  end;

var
  frmClientResult: TfrmClientResult;

implementation

{$R *.dfm}
uses
  DM_Main, formClientFiz, formClientUr, frmMain,
  formSessionResult, formContact, CommonVars, formCallUnknown;


procedure TfrmClientResult.butOKClick(Sender: TObject);
begin
  if not CheckFinish then
    Exit;

  if not fClientSaved then
    SaveClient;

  if not fResultSaved then
    SaveResult;

  if fClientSaved and fResultSaved then
  begin
    fCanClose := True;
    ModalResult := mrOk;
  end;
end;

procedure TfrmClientResult.CallFinish;
var
  f: Boolean; //для отладки
  step: integer;
begin
  fCallFinished := True;

  if frmCallUnknown.Visible then
  begin
    // не закрывать автоматом frmCallUnknown.ModalResult := mrCancel;
    Exit;
  end;

  if not Assigned(frmSessionResult) then
    CreateFormResult;

  try
    if Assigned(frmSessionResult.Q) and Assigned(frmSessionResult.Q.Transaction) and
        frmSessionResult.Q.Transaction.Active then
      frmSessionResult.Q.Transaction.CommitRetaining;
  except
  end;

  frmSessionResult.Q.ParamByName('callapiid').AsString := CallObj.CallInfo.CallApiId;
  while 1=1 do
  begin
    frmSessionResult.Q.Close;
    frmSessionResult.Q.Open;
    if (frmSessionResult.Q.RecordCount > 0) or f or (step > 20) then
      Break;
    inc(step);
    Sleep(200);
  end;
  frmSessionResult.Q.Edit;
  frmSessionResult.Q.FieldByName('worker_id').AsInteger := DM.CurrentUserSets.ID;
  frmSessionResult.Q.FieldByName('client_id').AsInteger := ClientId;
  if clientid = 0 then //клиент не был создан
      frmSessionResult.btnCardNoCreated.Click; // .edtIshod.Text := (*.Q.FieldByName('ishod').AsString*) 'Карточка клиента не создана';
  Self.CallResult := CallObj.CallInfo.CallResult; //frmSessionResult.Q.FieldByName('callresult').AsString;


  btnTransferCall.Enabled := false;
  btnDeleteCall.Enabled   := false;

  fCallFinished := True;

end;

function TfrmClientResult.CheckFinish: boolean;
begin
  Result := not CallObj.Active;
  if not Result then
    Application.MessageBox('Действие не разрешено во время звонка!',
     'Исходящий звонок', MB_ICONSTOP);
end;

procedure TfrmClientResult.CheckSession;
begin
  if DM.CheckCloseSession(CallId) then
    CallFinish;

end;

procedure TfrmClientResult.CreateFormResult;
begin
  if not Assigned(frmSessionResult) then
    frmSessionResult := TfrmSessionResult.Create(nil);

  frmSessionResult.BorderIcons := [];
  frmSessionResult.BorderStyle := bsNone;
  frmSessionResult.Position := poDefault;
  frmSessionResult.Height   := frmSessionResult.Cancel_btn.Top - 2;
  frmSessionResult.Parent   := frmClientResult.pnlResult;
  frmSessionResult.Top := 5;
  Self.Height := Self.Height + frmSessionResult.Height - Self.pnlResult.Height;
  Self.pnlResult.Height := frmSessionResult.Height;

  frmSessionResult.Cancel_btn.Visible := False;
  frmSessionResult.Show;
end;

procedure TfrmClientResult.doFinishCall;
begin
  CallFinish;
end;

procedure TfrmClientResult.doTransferCall;
begin
  Self.ModalResult := mrCancel;
end;

procedure TfrmClientResult.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if not (fClientSaved and fResultSaved) then
    CanClose := False;
  inherited;
end;

procedure TfrmClientResult.FormDestroy(Sender: TObject);
begin
  if Assigned(frmCli) then
  begin
    frmCli.Parent := nil;
    frmCli := nil;
  end;

  if Assigned(frmResult) then
  begin
    frmResult.Parent := nil;
    frmResult := nil;
  end;

  inherited;
end;

procedure TfrmClientResult.FormShow(Sender: TObject);
begin
  if TypeCli = 0 then
    Caption := Caption + '. ' + 'Физическое лицо'
  else
  if TypeCli = 1 then
    Caption := Caption + '. ' + 'Юридическое лицо'
  else
    Caption := Caption + '. ' + 'Контакт';
end;

function TfrmClientResult.GetCallFinished: boolean;
begin
  Result := fCallFinished;
  //Result := (CallResult <> '');
end;

function TfrmClientResult.GetCallResult: string;
begin
  if Assigned(frmSessionResult) and frmSessionResult.Q.Active then
    Result := frmSessionResult.Q.FieldByName('callresult').AsString;
end;

procedure TfrmClientResult.btnCallLaterClick(Sender: TObject);
begin
  fClientSaved := True;
  fResultSaved := True;
  ModalResult  := mrOk;
end;

procedure TfrmClientResult.btnDeleteCallClick(Sender: TObject);
begin
  try
    formMain.TCPClient.Socket.WriteLn('#calldelete:' + Self.CallApiId);
  finally
    DM.inCalling := False;
  end;
end;

procedure TfrmClientResult.btnTransferCallClick(Sender: TObject);
begin
  CallObj.TransferCall;
end;

function TfrmClientResult.SaveClient: Boolean;
begin
  try
    if TypeCli = 0 then
      if Assigned(frmCli) then
        TfrmClientFiz(frmCli).butOK.Click
    else
    if TypeCli = 1 then
      if Assigned(frmCli) then
         TfrmClientUr(frmCli).butOK.Click
    else
      if Assigned(frmCli) then
        TFrmContact(frmCli).butOk.Click;

    Result := not Assigned(frmCli) or (frmCli.ModalResult = mrOk);
    fClientSaved := True;
  except
    result := False;
  end;
end;

function TfrmClientResult.SaveResult: Boolean;
begin
  Result := False;
  if not Assigned(frmSessionResult) then
    CreateFormResult;

  with frmSessionResult do
  begin
    if (*(Q.FieldByName('ISHOD').AsString = '') or
       (Length(Q.FieldByName('RESULT').AsString) < 5)  then *)
       (edtResult.Text = '') or
       (Length(edtIshod.Text) < 5)  then
    begin
      Application.MessageBox('Не заполнены все поля результата сессии!',
       'Исходящий звонок', MB_ICONSTOP);
      Exit;
    end;

    if Q.FieldByName('ISHOD').AsString <> edtIshod.Text then
      Q.FieldByName('ISHOD').AsString := edtIshod.Text;
    if Q.FieldByName('RESULT').AsString <> edtResult.Text then
      Q.FieldByName('RESULT').AsString := edtResult.Text;

    if Q.Modified then
    try
      Q.Post;
      if Q.Transaction.Active then
         Q.Transaction.CommitRetaining;
      Result := True;
      fResultSaved := True;
    except
       if Q.Transaction.Active then
         Q.Transaction.RollbackRetaining;
       Result := False;
    end;
  end;
end;

procedure TfrmClientResult.SetCallId(AValue: string);
begin
  if AValue <> fCallId then
  begin
    fCallId := AValue;
    btnDeleteCall.Enabled   := (fCallId <> '');
    btnTransferCall.Enabled := (fCallId <> '');
    btnCallLater.Enabled    := (fCallId = '');
  end;

end;

end.
