unit formKladrAdr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFormEditData, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  frameBase, frKladrAll, Data.DB, RzButton, cxTextEdit, cxMaskEdit, cxDBEdit,
  Vcl.StdCtrls, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  TfrmKladrAdr = class(TfrmEditData)
    FrameKladrAll1: TFrameKladrAll;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKladrAdr: TfrmKladrAdr;

implementation

{$R *.dfm}


procedure TfrmKladrAdr.btnOKClick(Sender: TObject);
begin
  if FrameKladrAll1.FrameRegion.notSelected then
    FrameKladrAll1.FrameRegion.edtName.Text := '';
  if FrameKladrAll1.FrameArea.notSelected then
    FrameKladrAll1.FrameArea.edtName.Text := '';
  if FrameKladrAll1.FrameCity.notSelected then
    FrameKladrAll1.FrameCity.edtName.Text := '';
  if FrameKladrAll1.FrameSite.notSelected then
    FrameKladrAll1.FrameSite.edtName.Text := '';
  if FrameKladrAll1.FrameStreet.notSelected then
    FrameKladrAll1.FrameStreet.edtName.Text := '';
end;

end.
