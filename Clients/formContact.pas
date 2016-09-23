unit formContact;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, frameBase, frContact,
  RzButton, Vcl.ExtCtrls, RzPanel, dxGDIPlusClasses, Data.DB;

type
  TfrmContact = class(TSimpleForm)
    FrameContact: TFrameContact;
    butOk: TRzButton;
    DS: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure butOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContact: TfrmContact;

implementation

{$R *.dfm}

uses
  IBX.IBQuery, system.StrUtils,
  frPhones, CommonTypes, DM_Main, formIncomeCallRoot;

procedure TfrmContact.butOkClick(Sender: TObject);
var
  res: Boolean;
begin
  //проверка
  res := False;
  if not ValidateData(DS, self) then
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
      res := FrameContact.SaveData;
    except
      res := False;
      ShowMessage('Произошла ошибка сохранения данных!' + #13#10 +
      Exception(ExceptObject).Message);
    end;
  finally
    if Res then
    begin
      if TIBQuery(DS.DataSet).Transaction.InTransaction then
           TIBQuery(DS.DataSet).Transaction.CommitRetaining;
      if Assigned(frmIncomeCallRoot) then
        frmIncomeCallRoot.ClientId := FrameContact.DS.DataSet.FieldByName('ID').AsInteger;
     end
    else
      if TIBQuery(DS.DataSet).Transaction.InTransaction then
           TIBQuery(DS.DataSet).Transaction.RollbackRetaining;
  end;
end;

procedure TfrmContact.FormCreate(Sender: TObject);
var
  Type_id, id: integer;
begin
  inherited;
  if fFrmParam.Dataset <> nil then
    DS.DataSet := fFrmParam.Dataset;

   Type_id := 1;
   if (fFrmParam.ExtParam <> nil) and
      (fFrmParam.ExtParam^.ClientType <> 0) then

    if fFrmParam.ExtParam <> nil then
      type_id := fFrmParam.ExtParam^.ClientType;

   if (fFrmParam.ExtParam <> nil) and (fFrmParam.ExtParam^.CallParam <> nil) and
         (fFrmParam.ExtParam^.CallParam.Client_id <> 0) then
     id := fFrmParam.ExtParam^.CallParam.Client_id;

  FrameContact.OpenData(id);
  case fFrmParam.action of
    asCreate:
      begin
        Title := Title + ' [новая запись]';
        if (DS.DataSet <> nil) and DS.DataSet.Active then
        begin
          //FrameContact.DS.DataSet.Append;
          FrameContact.DS.DataSet.FieldByName('TYPE_ID').AsInteger  := type_id;
        end;
      end;
    asEdit:
      begin
        Title := Title + ' [редактирование]';
        if (FrameContact.DS.DataSet <> nil) and
             FrameContact.DS.DataSet.Active then
          FrameContact.DS.DataSet.Edit;
      end;
    asShow:
      begin
        Title := Title + ' [просмотр]';
      end;
  end;

  (*FramePhones.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FramePhones.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  FramePhones.OpenData;*)
  //FrameContact.OpenData;

  if (fFrmParam.action = asCreate) and
     (fFrmParam.ExtParam <> nil) and
     (fFrmParam.ExtParam^.CallParam <> nil) and
     (TClientParam(fFrmParam.ExtParam^).CallParam.TelNum <> '') then
  begin
    FrameContact.FramePhones.DS.DataSet.Append;
    FrameContact.FramePhones.DS.DataSet.FieldByName('phone').AsString :=
      RightStr(TClientParam(fFrmParam.ExtParam^).CallParam.TelNum, 10);
    FrameContact.FramePhones.DS.DataSet.FieldByName('ismain').AsInteger := 1;
    FrameContact.FramePhones.DS.DataSet.FieldByName('phone_type_id').AsInteger := 1;
    FrameContact.FramePhones.DS.DataSet.Post;
  end;

end;

end.
