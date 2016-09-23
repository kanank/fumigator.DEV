unit formSessionResult;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, Data.DB, IBX.IBQuery, cxTextEdit,
  cxMemo, cxDBEdit, Vcl.StdCtrls, dxGDIPlusClasses, Vcl.ExtCtrls, RzButton,
  cxMaskEdit, cxDropDownEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  cxGroupBox;

type
  TfrmSessionResult = class(TBaseForm)
    DS: TDataSource;
    Q: TIBQuery;
    Q_upd: TIBUpdateSQL;
    Cancel_btn: TRzButton;
    Label1: TLabel;
    edtResult: TcxMemo;
    grpIshod: TcxGroupBox;
    btnConsult: TRzButton;
    btnNonConsult: TRzButton;
    btnOther: TRzButton;
    edtIshod: TcxMemo;
    btnCardNoCreated: TRzButton;
    btnBack: TRzButton;
    procedure QBeforeOpen(DataSet: TDataSet);
    procedure Cancel_btnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnConsultClick(Sender: TObject);
    procedure btnOtherClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QAfterOpen(DataSet: TDataSet);
    procedure QBeforePost(DataSet: TDataSet);
  private
    fBack: Boolean; //нажат возврат
    function GetModified: Boolean;
  public
    CallResult: string;
    ResultType: string; //тип нажатой кнопки
    ShowOnTop: Boolean; //показать поверх
    NeedCheckCall: Boolean; //надо проверять окончание звонка True по умолчанию

    property isModified: Boolean read GetModified;

    function CheckFields: Boolean;
    destructor Destroy; overload;

    procedure ClearResult;
    procedure EnableButtons;
    procedure TextToField;
    procedure FieldToText;
  end;

var
  frmSessionResult: TfrmSessionResult;

implementation

{$R *.dfm}
uses
  DM_Main, CommonVars, formIncomeCallRoot;


procedure TfrmSessionResult.btnBackClick(Sender: TObject);
begin
  FormStyle := fsNormal;
  fBack := True;
  ModalResult := mrClose;
end;

procedure TfrmSessionResult.btnConsultClick(Sender: TObject);
begin
  ResultType := TRzButton(Sender).Name;
  edtIshod.Text := TRzButton(Sender).Caption;
  edtIshod.Properties.ReadOnly := True;
  //TRzButton(Sender).Down := True;
end;

procedure TfrmSessionResult.btnOtherClick(Sender: TObject);
begin
  //if not edtIshod.Visible then
  //begin
    ResultType := TRzButton(Sender).Name;
    edtIshod.Text := '';
    edtIshod.Properties.ReadOnly := False;
    //btnOther.Caption := 'Отменить "другое"';
    //TRzButton(Sender).Down := True;
  //end
//  else
//  begin
//    edtIshod.Text := '';
//    edtIshod.Visible := false;
//    btnOther.Caption := 'Другое';
//    TRzButton(Sender).Down := False;
//  end;
end;

procedure TfrmSessionResult.Cancel_btnClick(Sender: TObject);
begin
  if not Q.Active then
    Q.ParamByName('CALLAPIID').AsString := CallObj.CallInfo.CallApiId;
    Q.Open;

  if Q.RecordCount = 0 then
    MsgBoxWarning('Не найдена сессия в БД');

   if Q.RecordCount > 0 then
   begin
     if Q.State <> dsEdit then
      Q.Edit;

      if CheckFields then
      begin
        Q.FieldByName('RESULT').AsString := edtResult.Text;
        Q.FieldByName('ISHOD').AsString  := edtIshod.Text;
        Q.Post;

        Self.ModalResult := mrOk;
      end;
   end
   else
     Self.ModalResult := mrCancel;
end;

function TfrmSessionResult.CheckFields: Boolean;
begin
  Result := false;
  if (edtIshod.Text = '') or (Length(edtResult.Text) < 5)  then
  begin
    Application.MessageBox('Необходимо заполнить поля! (Комментарий - не менее 5 символов) ', 'Результат сессии', MB_ICONSTOP);
    Result := False;
  end
  else
    Result := True;
  fCanClose := Result;
end;

procedure TfrmSessionResult.ClearResult;
begin
    ResultType := '';
    edtIshod.Text := '';
    edtIshod.Properties.ReadOnly := False;
    edtResult.Text := '';

    btnConsult.Enabled    := True;
    btnNonConsult.Enabled := True;
    btnOther.Enabled      := True;
end;

destructor TfrmSessionResult.Destroy;
begin
  CallObj.Ready := True;
  inherited;
end;

procedure TfrmSessionResult.EnableButtons;
begin
  btnConsult.Enabled    := True;
  btnNonConsult.Enabled := True;
  btnOther.Enabled      := True;
end;

procedure TfrmSessionResult.FieldToText;
begin
  if not Q.Active then
    Exit;
  edtResult.Text := Q.FieldByName('RESULT').AsString;
  edtIshod.Text  := Q.FieldByName('ISHOD').AsString;
end;

procedure TfrmSessionResult.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;

  if NeedCheckCall and not fBack and Assigned(frmIncomeCallRoot) and CallObj.Accepted and
    CallObj.Active then
  begin
    MsgBoxWarning('Звонок еще не завершен!');
    CanClose := False;
    Exit;
  end ;

  CanClose := CheckFields;
  fCanClose := CanClose;
  //inherited;
end;

procedure TfrmSessionResult.FormCreate(Sender: TObject);
begin
  inherited;
  NeedCheckCall := True;
end;

procedure TfrmSessionResult.FormDestroy(Sender: TObject);
begin
  CallObj.Ready := True;
  inherited;
end;

procedure TfrmSessionResult.FormShow(Sender: TObject);
begin
  if ShowOnTop then
    SetTopMost;
end;

function TfrmSessionResult.GetModified: Boolean;
begin
  if Q.Active then
    Result := (edtResult.Text <> Q.FieldByName('RESULT').AsString) or
        (edtIshod.Text <> Q.FieldByName('ISHOD').AsString)
  else
    Result := (edtResult.Text <> '') or
        (edtIshod.Text <> '')
end;

procedure TfrmSessionResult.QAfterOpen(DataSet: TDataSet);
begin
  if edtIshod.Text = '' then
    FieldToText;
end;

procedure TfrmSessionResult.QBeforeOpen(DataSet: TDataSet);
begin
  //cmbIshod.Text  := '';
  //edtResult.Text := '';
end;

procedure TfrmSessionResult.QBeforePost(DataSet: TDataSet);
begin
  TextToField;
end;

procedure TfrmSessionResult.TextToField;
begin
  if not Q.Active then
    Exit;
  if (Q.State <> dsEdit) or (Q.State <> dsInsert) then
    Q.Edit;

  Q.FieldByName('RESULT').AsString := edtResult.Text;
  Q.FieldByName('ISHOD').AsString  := edtIshod.Text;
end;

end.
