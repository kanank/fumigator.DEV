unit FrKladrAdrFull;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  RzButton, system.StrUtils,
  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, Vcl.StdCtrls,
  Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL,
  frameBase, frItemKLADR, frItemDomKLADR, frKladrAll, dxSkinsCore, dxSkinBlack,
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
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFrameKladrAdrFull = class(TFrameKladrAll)
    btnEdit: TRzBitBtn;
    Label8: TLabel;
    edtRegion: TcxTextEdit;
    Label1: TLabel;
    edtSite: TcxTextEdit;
    Label2: TLabel;
    edtAddress: TcxTextEdit;
    procedure btnEditClick(Sender: TObject);
  private
    function BuildStr(s0, s1, s2: string):string;
  protected
    procedure SetEdtText; virtual;
  public
    function OpenData(Aid: integer = 0): Boolean; override;
    function SaveData: Boolean; override;
  end;


implementation
{$R *.dfm}

uses
  formKladrAdr;

procedure TFrameKladrAdrFull.btnEditClick(Sender: TObject);
var
  frm: TFrmKladrAdr;
begin
  try
    frm := TFrmKladrAdr.Create(self);

    frm.FrameKladrAll1.Transaction := Self.Transaction;
    frm.FrameKladrAll1.FrameRegion.Code         := FrameRegion.Code;
    frm.FrameKladrAll1.FrameRegion.edtSocr.text := FrameRegion.edtSocr.Text;
    frm.FrameKladrAll1.FrameRegion.edtName.text := FrameRegion.edtName.Text;

    frm.FrameKladrAll1.FrameArea.Code         := FrameArea.Code;
    frm.FrameKladrAll1.FrameArea.edtSocr.text := FrameArea.edtSocr.Text;
    frm.FrameKladrAll1.FrameArea.edtName.text := FrameArea.edtName.Text;

    frm.FrameKladrAll1.FrameCity.Code         := FrameCity.Code;
    frm.FrameKladrAll1.FrameCity.edtSocr.text := FrameCity.edtSocr.Text;
    frm.FrameKladrAll1.FrameCity.edtName.text := FrameCity.edtName.Text;

    frm.FrameKladrAll1.FrameSite.Code         := FrameSite.Code;
    frm.FrameKladrAll1.FrameSite.edtSocr.text := FrameSite.edtSocr.Text;
    frm.FrameKladrAll1.FrameSite.edtName.text := FrameSite.edtName.Text;

    frm.FrameKladrAll1.FrameStreet.Code         := FrameStreet.Code;
    frm.FrameKladrAll1.FrameStreet.edtSocr.text := FrameStreet.edtSocr.Text;
    frm.FrameKladrAll1.FrameStreet.edtName.text := FrameStreet.edtName.Text;

    frm.FrameKladrAll1.FrameDom.Code         := FrameDom.Code;
    frm.FrameKladrAll1.FrameDom.edtSocr.text := FrameDom.edtSocr.Text;
    frm.FrameKladrAll1.FrameDom.edtName.text := FrameDom.edtName.Text;
    frm.FrameKladrAll1.FrameDom.cmbName.text := FrameDom.cmbName.Text;
    frm.FrameKladrAll1.edtKvartira.text      := edtKvartira.Text;

    frm.ShowModal;
    if frm.ModalResult <> mrOk then
      Exit;

    FrameRegion.Code := frm.FrameKladrAll1.FrameRegion.Code;
    FrameRegion.edtSocr.Text := frm.FrameKladrAll1.FrameRegion.edtSocr.text;
    FrameRegion.edtName.Text := frm.FrameKladrAll1.FrameRegion.edtName.text;

    FrameArea.Code := frm.FrameKladrAll1.FrameArea.Code;
    FrameArea.edtSocr.Text := frm.FrameKladrAll1.FrameArea.edtSocr.text;
    FrameArea.edtName.Text := frm.FrameKladrAll1.FrameArea.edtName.text;

    FrameCity.Code := frm.FrameKladrAll1.FrameCity.Code;
    FrameCity.edtSocr.Text := frm.FrameKladrAll1.FrameCity.edtSocr.text;
    FrameCity.edtName.Text := frm.FrameKladrAll1.FrameCity.edtName.text;

    FrameSite.Code := frm.FrameKladrAll1.FrameSite.Code;
    FrameSite.edtSocr.Text := frm.FrameKladrAll1.FrameSite.edtSocr.text;
    FrameSite.edtName.Text := frm.FrameKladrAll1.FrameSite.edtName.text;

    FrameStreet.Code := frm.FrameKladrAll1.FrameStreet.Code;
    FrameStreet.edtSocr.Text := frm.FrameKladrAll1.FrameStreet.edtSocr.text;
    FrameStreet.edtName.Text := frm.FrameKladrAll1.FrameStreet.edtName.text;

    FrameDom.Code := frm.FrameKladrAll1.FrameDom.Code;
    FrameDom.edtSocr.Text := frm.FrameKladrAll1.FrameDom.edtSocr.text;
    FrameDom.edtName.Text := frm.FrameKladrAll1.FrameDom.edtName.text;
    FrameDom.cmbName.Text := frm.FrameKladrAll1.FrameDom.cmbName.text;
    edtKvartira.Text      := frm.FrameKladrAll1.edtKvartira.text;

    SetEdtText;
  finally
    FreeAndNil(frm);
  end;
end;

function TFrameKladrAdrFull.OpenData(Aid: integer): Boolean;
begin
  Result := inherited OpenData(Aid);
  SetEdtText;
end;

function TFrameKladrAdrFull.SaveData: Boolean;
begin
  Result := inherited SaveData;
end;

function TFrameKladrAdrFull.BuildStr(s0, s1, s2: string): string;
begin
 result := s0;

 if (s1 <> '') and (s2 <> '') then
   result := result + ' ' + s1;
 if s2 <> '' then
   result := result + ' ' + s2;
end;

procedure TFrameKladrAdrFull.SetEdtText;
var
  regionSocr, regionName, CitySocr, CityName, SiteSocr, SiteName,
  StreetSocr, StreetName, DomSocr, DomName, Kvartira: string;
begin
  regionSocr := FrameRegion.edtSocr.Text;
  regionName := FrameRegion.edtName.Text;
  CitySocr := FrameCity.edtSocr.Text;
  CityName := FrameCity.edtName.Text;
  SiteSocr := FrameSite.edtSocr.Text;
  SiteName := FrameSite.edtName.Text;
  StreetSocr := FrameStreet.edtSocr.Text;
  StreetName := FrameStreet.edtName.text;
  DomSocr := LowerCase(FrameDom.edtSocr.Text);
  DomName := FrameDom.cmbName.Text;
  Kvartira := edtKvartira.Text;

  edtRegion.Text := BuildStr('', RegionSocr, RegionName);

  edtSite.Text := BuildStr('', CitySocr, CityName);
  edtSite.Text := BuildStr(edtSite.Text, SiteSocr, SiteName);

  edtAddress.Text := BuildStr('', CitySocr, CityName);
  edtAddress.Text := BuildStr(edtAddress.Text, SiteSocr, SiteName);
  edtAddress.Text := BuildStr(edtAddress.Text, StreetSocr, StreetName);
  edtAddress.Text := BuildStr(edtAddress.Text, DomSocr, DomName);
  edtAddress.Text := BuildStr(edtAddress.Text, 'кв', Kvartira)
end;

end.
