unit formEditPhone;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFormEditData, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Data.DB, RzButton, cxTextEdit, cxMaskEdit, cxDBEdit, Vcl.StdCtrls, cxCheckBox,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TfrmEditPhone = class(TfrmEditData)
    chbkIsMain: TcxDBCheckBox;
    Label2: TLabel;
    cmbPhoneType: TcxDBLookupComboBox;
    Label1: TLabel;
    cxDBMaskEdit1: TcxDBMaskEdit;
    Label3: TLabel;
    cxDBMaskEdit2: TcxDBMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TfrmEditPhoneClass = class of TfrmEditPhone;

implementation

{$R *.dfm}
uses
  DM_Main, frPhones, IBX.IBQuery;

procedure TfrmEditPhone.btnOKClick(Sender: TObject);
var
  Q: TIBQuery;
begin
  Q := TFramePhones(Self.Owner).Q_Check;
  Q.Close;
  Q.ParamByName('typecli').AsInteger := TFramePhones(Self.owner).typePhone;
  Q.ParamByName('code').AsString := DS.DataSet.FieldByName('code').AsString;
  Q.ParamByName('phone').AsString := DS.DataSet.FieldByName('phone').AsString;
  try
    Q.Open;
    if Q.RecordCount > 0  then
    begin
      Application.MessageBox(PWideChar('Такой номер уже есть в БД у клиента: ' +
      Q.FieldByName('name').AsString), 'Телефон', MB_ICONSTOP);
      Exit;
    end;

  except

  end;

  ModalResult := mrOk;
  inherited;

end;

procedure TfrmEditPhone.FormShow(Sender: TObject);
var
  rc: integer;
  fld: TField;
begin
  inherited;
  if DS.DataSet = nil then
    Exit;

  rc := DS.DataSet.RecordCount;
  fld := DS.DataSet.FieldByName('ismain');

  if ((DS.DataSet.State = dsEdit) and (rc = 1)) or
     ((DS.DataSet.State = dsInsert) and (rc = 0)) then
  begin
    if fld.AsInteger <> 1 then
      DS.DataSet.FieldByName('ismain').AsInteger := 1;
    chbkIsMain.Enabled := False;
  end;

  if DS.DataSet.State = dsInsert then
    cmbPhoneType.EditValue := 1;
end;

end.
