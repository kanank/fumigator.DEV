unit formClientFiz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit,
  cxDropDownEdit, cxMemo, cxCalendar, cxTextEdit, cxMaskEdit, Vcl.StdCtrls,
  RzButton, Vcl.ExtCtrls, RzPanel, dxGDIPlusClasses, Data.DB, frameBase,
  frPersonSmall, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, frPhones,
  frPasport, frListBase, frPersonFull, frUslugi, frKladrAll, FrKladrAdrFull,
  IBX.IBCustomDataSet, IBX.IBQuery, frGoods, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  frClientCalls, CommonTypes;

type
  TfrmClientFiz = class(TSimpleForm)
    ID_edt: TcxDBTextEdit;
    Label14: TLabel;
    Comments_memo: TcxDBMemo;
    DS: TDataSource;
    FramePerson: TFramePersonFull;
    FrameUslugi: TFrameUslugi;
    butOK: TRzButton;
    FrameAddress: TFrameKladrAdrFull;
   	FramePhones: TFramePhones;
    QCheck: TIBQuery;
    cmbWorker: TcxDBLookupComboBox;
    Label5: TLabel;
    RzPanel2: TRzPanel;
    Label2: TLabel;
    Label1: TLabel;
    cmbFormat: TcxDBLookupComboBox;
    cmbStatus: TcxDBLookupComboBox;
    cmbRegion: TcxDBLookupComboBox;
    Label3: TLabel;
    edtDogNum: TcxDBTextEdit;
    Label6: TLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    Label7: TLabel;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
    Label4: TLabel;
    cxDBMemo1: TcxDBMemo;
    Label8: TLabel;
    frameClientCalls: TframeClientCalls;
    btnHide: TRzButton;
    procedure FormCreate(Sender: TObject);
    procedure butOKClick(Sender: TObject);
    procedure FramePersoncmbDateBirthPropertiesInitPopup(Sender: TObject);
    procedure FramePersonDSDataChange(Sender: TObject; Field: TField);
    procedure Exit_bntClick(Sender: TObject);
    procedure cmbWorkerPropertiesCloseUp(Sender: TObject);
    procedure cmbWorkerPropertiesPopup(Sender: TObject);
    procedure btnHideClick(Sender: TObject);
    procedure FrameUslugiQueryAfterPost(DataSet: TDataSet);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    fMode: TActionstr;
    procedure ChangeFormat(Sender: TObject);
    procedure SetMode(AValue: TActionstr);
  protected
    procedure SetCaption(AValue: string); override;
  public
   //constructor Create(AOwner: TComponent ); override;
   property Mode: TActionstr read fMode write SetMode;
  end;

var
  frmClientFiz: TfrmClientFiz;

implementation

{$R *.dfm}
uses
  DM_Main, CommonVars, System.StrUtils,
  formIncomeCallRoot, formSmallClientFiz;

procedure TfrmClientFiz.btnHideClick(Sender: TObject);
begin
  Self.ModalResult := mrOk;
  //if Assigned(frmSmallCardFiz) then
  //  frmSmallCardFiz.Show;

end;

procedure TfrmClientFiz.butOKClick(Sender: TObject);
var
  res: Boolean;
  err: string;
begin
  fInUpdate := True;
  if not (DM.isModifiedData(Ds.DataSet) or
          DM.isModifiedData(FramePerson.DS.DataSet) or
          DM.isModifiedData(FramePhones.DS.DataSet) or
          DM.isModifiedData(FrameUslugi.DS.DataSet) or
          DM.isModifiedData(FrameAddress.DS.DataSet)) then
  begin
    ModalResult := mrOk;
    Exit;
  end;


  //проверка
  res := False;
  if not (ValidateData(DS, self) and ValidateData(FramePerson.DS, FramePerson)) then
  begin
    Application.MessageBox('Не заполнены все необходимые поля!',
     'Внимание', MB_ICONWARNING + MB_OK);
    self.ModalResult := mrNone;
    Exit;
  end
  else
    self.ModalResult := mrOk;

  res := False;
  try
    try
      ModalResult := mrNone;
      //CanClose := False;

      if not TIBQuery(DS.DataSet).Transaction.Active then
        TIBQuery(DS.DataSet).Transaction.StartTransaction;
      DS.DataSet.FieldByName('name').AsString :=
        //сохраняем имя
        DM.GetPersonFullName(FramePerson.Query.FieldByName('FAMILY').AsString,
          FramePerson.Query.FieldByName('NAME').AsString,
          FramePerson.Query.FieldByName('SURNAME').AsString);

      //сохраняем ссылки
      res := FramePerson.SaveData;
      err := FramePerson.Err;

      if res then
      begin
        res := FrameAddress.SaveData;
        err := FrameAddress.Err;
      end;

      // PERSON_ID
      if DS.DataSet.FieldByName('PERSON_ID').AsInteger <> FramePerson.Id then
        DS.DataSet.FieldByName('PERSON_ID').AsInteger := FramePerson.Id;

      if DS.DataSet.FieldByName('EMAIL').AsString <>
         FramePerson.DS.DataSet.FieldByName('EMAIL_WORK').AsString then
        DS.DataSet.FieldByName('EMAIL').AsString :=
         FramePerson.DS.DataSet.FieldByName('EMAIL_WORK').AsString;

      if DS.DataSet.FieldByName('ADRES_ID').AsInteger <> FrameAddress.Id then
        DS.DataSet.FieldByName('ADRES_ID').AsInteger := FrameAddress.Id;

      try
        DS.DataSet.Post;
        TIBQuery(DS.DataSet).ApplyUpdates;
        res := True;
      except
        res := False;
        err := Exception(ExceptObject).Message;
      end;

      //телефоны
      if res then
      begin
        res := FramePhones.SaveData;
        err := FramePhones.err;
      end;

      //услуги
      if res then
      begin
        res := FrameUslugi.SaveData;
        err := FrameUslugi.Err;
      end;

      if res then
      begin
        ModalResult := mrOk;
        //CanClose := True;
      end
      else
        raise Exception.Create(err);
    except
      res := False;
      ShowMessage('Произошла ошибка сохранения данных!' + #13#10 +
      Exception(ExceptObject).Message);
      self.ModalResult := mrNone;
      fCanClose := False;
    end;
  finally
    fInUpdate := False;
    if Res then
    begin
      if TIBQuery(DS.DataSet).Transaction.InTransaction then
           TIBQuery(DS.DataSet).Transaction.CommitRetaining;
      if Assigned(frmIncomeCallRoot) then
        frmIncomeCallRoot.ClientId := DS.DataSet.FieldByName('ID').AsInteger;
     end
    else
      if TIBQuery(DS.DataSet).Transaction.InTransaction then
           TIBQuery(DS.DataSet).Transaction.RollbackRetaining;
    if not fCanClose then
      self.ModalResult := mrNone;
  end;
end;

procedure TfrmClientFiz.ChangeFormat(Sender: TObject);
var
  i1, i2: Integer;
begin
  i1 := 0; i2 := 0;
  if FrameUslugi.DS.DataSet.RecordCount > 0  then
    i1 := 1;
  if DS.DataSet.FieldByName('GOODS').AsString <> '' then
    i2 := 2;
  if (DS.DataSet.State <> dsBrowse) and
      (DS.DataSet.FieldByName('FORMAT_ID').AsInteger <> i1 + i2) then
  DS.DataSet.FieldByName('FORMAT_ID').AsInteger := i1 + i2;
end;

procedure TfrmClientFiz.cmbWorkerPropertiesCloseUp(Sender: TObject);
var
  id: Integer;
begin
  id := TcxDBLookupComboBox(Sender).EditValue;
  DM.OffFilter(DM.Workers);
  TcxDBLookupComboBox(Sender).EditValue := id;
end;

procedure TfrmClientFiz.cmbWorkerPropertiesPopup(Sender: TObject);
begin
  DM.SetFilterNonDelete(DM.Workers);
end;

procedure TfrmClientFiz.DSDataChange(Sender: TObject; Field: TField);
begin
  if Field = nil then
    exit;

  if Field.FieldName = 'GOODS' then
   ChangeFormat(sender);
end;

procedure TfrmClientFiz.Exit_bntClick(Sender: TObject);
begin
  DS.DataSet.Cancel;
  FramePerson.Cancel;
  FramePhones.Cancel;
  FrameUslugi.Cancel;
  FrameAddress.Cancel;
  fCanClose := True;
end;

procedure TfrmClientFiz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult <> mrOk then
  begin
    DS.DataSet.Cancel;
    TIBQuery(DS.DataSet).CancelUpdates;
  end;
end;

procedure TfrmClientFiz.FormCreate(Sender: TObject);
begin
  inherited;
  if fFrmParam.Dataset <> nil then
    DS.DataSet := fFrmParam.Dataset;

  Mode := fFrmParam.action;

  SetValidateList('NAME,FORMAT_ID,STATUS_ID');

  FramePerson.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FramePerson.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  FramePerson.AddParam('PERSON_ID', DS.DataSet.FindField('PERSON_ID'));
  FramePerson.OpenData;

  FramePhones.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FramePhones.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  FramePhones.OpenData;

  if (fFrmParam.action = asCreate) and
     (fFrmParam.ExtParam <> nil) and (fFrmParam.ExtParam^.CallParam <> nil) then //and
     //(TClientParam(fFrmParam.ExtParam^).CallParam.id_call <> 0) then
  begin
    FramePhones.DS.DataSet.Append;
    FramePhones.DS.DataSet.FieldByName('phone').AsString :=
      RightStr(TClientParam(fFrmParam.ExtParam^).CallParam.TelNum, 10);
    FramePhones.DS.DataSet.FieldByName('ismain').AsInteger := 1;
    FramePhones.DS.DataSet.FieldByName('phone_type_id').AsInteger := 1;
    FramePhones.DS.DataSet.Post;
  end;

  //добавление в существующий
  if (fFrmParam.action = asEdit) and
     (fFrmParam.ExtParam <> nil) and (fFrmParam.ExtParam^.CallParam <> nil) and
      (fFrmParam.ExtParam^.CallParam.TelNum <> '') then
  begin
    if not FramePhones.DS.DataSet.Locate('phone',
       RightStr(TClientParam(fFrmParam.ExtParam^).CallParam.TelNum, 10), []) then
    begin
      FramePhones.DS.DataSet.Append;
      FramePhones.DS.DataSet.FieldByName('phone').AsString :=
        RightStr(TClientParam(fFrmParam.ExtParam^).CallParam.TelNum, 10);
      //FramePhones.DS.DataSet.FieldByName('ismain').AsInteger := 1;
      FramePhones.DS.DataSet.FieldByName('phone_type_id').AsInteger := 1;
      FramePhones.DS.DataSet.Post;
    end;
  end;

  FrameUslugi.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FrameUslugi.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  FrameUslugi.OpenData;

  FrameAddress.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FrameAddress.AddParam('ID', DS.DataSet.FindField('ADRES_ID'));
  FrameAddress.OpenData;
  FrameAddress.Visible := true;

  FrameClientCalls.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FrameClientCalls.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  FrameClientCalls.OpenData;
  FrameClientCalls.Visible := true;
end;

procedure TfrmClientFiz.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FramePerson);
  FreeAndNil(FramePhones);
  FreeAndNil(FrameUslugi);
  FreeAndNil(FrameAddress);
  FreeAndNil(FrameClientCalls);

  inherited;

end;

procedure TfrmClientFiz.FramePersoncmbDateBirthPropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  if TcxDateEdit(Sender).EditValue = null then
    TcxDateEdit(Sender).EditValue := IncMonth(Now(), -(InitBirthYear*12));
end;

procedure TfrmClientFiz.FramePersonDSDataChange(Sender: TObject; Field: TField);
begin
  if Field = nil then
    Exit;

  if (fFrmParam.action =  asCreate) and
     ((Field.FieldName = 'FAMILY') or
     (Field.FieldName = 'NAME') or
     (Field.FieldName = 'SURNAME')) then
  begin
    if (Field.DataSet.FieldByName('FAMILY').AsString = '') or
       (Field.DataSet.FieldByName('NAME').AsString = '') or
       (Field.DataSet.FieldByName('SURNAME').AsString = '') then
      Exit;

    QCheck.Close;
    QCheck.ParamByName('name').AsString := DM.GetPersonFullName(FramePerson.Query.FieldByName('FAMILY').AsString,
          FramePerson.Query.FieldByName('NAME').AsString,
          FramePerson.Query.FieldByName('SURNAME').AsString);
    QCheck.Open;
    if QCheck.RecordCount > 0 then
    begin
      Application.MessageBox('Клиент с таким именем уже существует', 'Проверка',
        MB_ICONWARNING);
      FramePerson.edtFamily.SetFocus;
    end;
  end;
end;

procedure TfrmClientFiz.FrameUslugiQueryAfterPost(DataSet: TDataSet);
begin
  inherited;
  ChangeFormat(self);
end;

procedure TfrmClientFiz.SetCaption(AValue: string);
begin
  inherited;
 case Mode of
    asCreate:
      begin
        Caption := Caption + ' [новая запись]';
      end;
    asEdit:
      begin
        Caption := Caption + ' [редактирование]';
      end;
    asShow:
      begin
        Caption := Caption + ' [просмотр]';
      end;
  end;
end;

procedure TfrmClientFiz.SetMode(AValue: TActionstr);
var
  status_id: Integer;
begin
  if fMode <> AValue  then
   fMode := AValue;
  Title := Title;

 case fMode of
    asCreate:
      begin
        status_id := 1;
        if (fFrmParam.ExtParam <> nil) and (fFrmParam.ExtParam^.CallParam <> nil) and
        (TClientParam(fFrmParam.ExtParam^).CallParam^.Status_Id <> 0) then
          status_id := TClientParam(fFrmParam.ExtParam^).CallParam^.Status_Id;

        if (DS.DataSet <> nil) and DS.DataSet.Active then
        begin
          DS.DataSet.Append;
          DS.DataSet.FieldByName('TYPE_CLI').AsInteger  := 0;
          DS.DataSet.FieldByName('STATUS_ID').AsInteger := status_id;
          DS.DataSet.FieldByName('FORMAT_ID').AsInteger := 1;
          DS.DataSet.FieldByName('ACT').AsInteger := 1;
          DS.DataSet.FieldByName('WORKER_ID').AsInteger := DM.CurrentUserSets.ID;
        end;
      end;
    asEdit:
      begin
        if (DS.DataSet <> nil) and DS.DataSet.Active then
          DS.DataSet.Edit;
      end;
    asShow:
      if DS.Dataset.State <> dsBrowse then
      begin
        DS.DataSet.Cancel;
        TIBQuery(DS.DataSet).CancelUpdates;
      end;
  end;
end;

end.
