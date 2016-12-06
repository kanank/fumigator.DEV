unit formLogo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RzLabel, dxGDIPlusClasses,
  Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxProgressBar, IdComponent, Vcl.XPMan, dxSkinsCore,
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
  TfrmLogo = class(TForm)
    img1: TImage;
    Info: TRzLabel;
    Shape1: TShape;
    ProgressBar: TcxProgressBar;
    XPManifest1: TXPManifest;
  private
    procedure SetInfo(AValue: string);
    function GetInfo: string;
  public
    property InfoText: string read GetInfo write SetInfo;
    procedure RefreshForm;
    procedure HTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
  end;

var
  frmLogo: TfrmLogo;

implementation

{$R *.dfm}

{ TfrmLogo }

function TfrmLogo.GetInfo: string;
begin
  Result := Info.Caption;
end;

procedure TfrmLogo.RefreshForm;
begin
  BringWindowToTop(self.Handle);
  //self.Repaint;
  Info.Repaint;
  ProgressBar.Repaint;
end;

procedure TfrmLogo.SetInfo(AValue: string);
begin
  Self.info.Caption := AValue;
  Info.Alignment := taCenter;
  RefreshForm;
end;

procedure TfrmLogo.HTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
   self.ProgressBar.Position := AWorkCount;
   self.RefreshForm;
end;

procedure TfrmLogo.HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  Self.Info.Caption := 'Загрузка новой версии';
  Self.ProgressBar.Properties.Max:= AWorkCountMax;
end;

procedure TfrmLogo.HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  Self.ProgressBar.Visible := False;
  InfoText := 'Загрузка завершена';
end;

end.
