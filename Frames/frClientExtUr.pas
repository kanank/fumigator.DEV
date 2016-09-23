unit frClientExtUr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit, frBank,
  Vcl.StdCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery,
  IBX.IBUpdateSQL, IBX.IBDatabase, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFrameClientExtUr = class(TDbFrameBase)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxDBMaskEdit1: TcxDBMaskEdit;
    Label5: TLabel;
    cxDBMaskEdit3: TcxDBMaskEdit;
    Label6: TLabel;
    cxDBMaskEdit4: TcxDBMaskEdit;
    cmbForma: TcxDBLookupComboBox;
    cmbSfera: TcxDBLookupComboBox;
    FrameRekvizits: TFrameRekvizits;
  private
    { Private declarations }
  protected
    procedure SetTransaction(AValue: TIBTransaction); override;
  public
    function OpenData(Aid: integer = 0): Boolean; override;
    function SaveData: Boolean; override;
  end;

var
  FrameClientExtUr: TFrameClientExtUr;

implementation

{$R *.dfm}
uses
  DM_Main;

{ TFrameClientExtUr }

function TFrameClientExtUr.OpenData(Aid: integer): Boolean;
begin
 Result := inherited OpenData(Aid);
  if not result then
    Exit;

  Result := False;
  try
    FrameRekvizits.AddParam('REKVIZIT_ID', Query.FieldByName('REKVIZIT_ID'));
    FrameRekvizits.OpenData;
    Result := True;
    SetNonValidate('CLIENT_ID');
  except
    Result := False;
  end;
end;

function TFrameClientExtUr.SaveData: Boolean;
var
  client_id, ind: Integer;
begin
  client_id := 0;
  //подготовка
  ind := QueryParams.IndexOf('CLIENT_ID');
  if ind > -1 then
    client_id := TField(QueryParams.Objects[ind]).AsInteger;

  if Query.FieldByName('Client_id').AsInteger <> client_id then
  begin
    if Query.State = dsBrowse then
      Query.Edit;
    Query.FieldByName('Client_id').AsInteger := client_id;
  end;

  //if Query.Modified then
  //  Query.post;

 Result := false;
  try
    try
      Result := FrameRekvizits.SaveData;
      if not Result then
        Exit;

      if not (Query.State in [dsInsert, dsEdit]) then
        Query.Edit;

      if Query.FieldByName('REKVIZIT_ID').AsInteger <> FrameRekvizits.Id then
        Query.FieldByName('REKVIZIT_ID').AsInteger := FrameRekvizits.Id;

      Result := inherited SaveData;
      if not result then
        Exit;

    except
      Result := false;
      fErr := 'SaveData error:'+ #13#10 + Exception(ExceptObject).Message;
    end;
  finally

  end;
end;

procedure TFrameClientExtUr.SetTransaction(AValue: TIBTransaction);
begin
  inherited;
  FrameRekvizits.Transaction := AValue;
end;

end.
