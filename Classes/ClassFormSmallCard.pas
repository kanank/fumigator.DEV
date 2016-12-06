unit ClassFormSmallCard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, RzButton, Vcl.ExtCtrls,
  RzPanel, dxGDIPlusClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
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
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxMemo,
  cxDBEdit, frameBase, frListBase, frUslugi, cxMaskEdit, cxTextEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.StdCtrls;

type
  TfrmSmallCard = class(TSimpleForm)
    RzBitBtn1: TRzBitBtn;
    Label7: TLabel;
    cmbArea: TcxDBLookupComboBox;
    cmbAreaUnit: TcxDBLookupComboBox;
    edtPhone: TcxMaskEdit;
    Label1: TLabel;
    Label8: TLabel;
    cmbRegion: TcxDBLookupComboBox;
    FrameUslugi: TFrameUslugi;
    edtGoods: TcxDBMemo;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
   procedure SetControls; override;
  public
    { Public declarations }
  end;

var
  frmSmallCard: TfrmSmallCard;

implementation

{$R *.dfm}
uses
  DM_Main;

{ TfrmSmallCard }

procedure TfrmSmallCard.FormCreate(Sender: TObject);
begin
  inherited;
  NoDefaultCallEvent := True;
end;

procedure TfrmSmallCard.SetControls;
begin
  RzBitBtn1.Enabled := DM.CurrentUserSets.Rights.WorkClientCard;
end;

end.
