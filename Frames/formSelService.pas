unit formSelService;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFormEditData, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxClasses, cxGridLevel, cxGrid, RzButton, cxTextEdit,
  cxMaskEdit, cxDBEdit, Vcl.StdCtrls, dxmdaset, cxCheckBox, dxSkinsCore,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TfrmSelectService = class(TfrmEditData)
    grdService: TcxGrid;
    grdServiceLevel1: TcxGridLevel;
    grdServiceDBTableView1: TcxGridDBTableView;
    MemServices: TdxMemData;
    grdServiceDBTableView1Column1: TcxGridDBColumn;
    grdServiceDBTableView1Column2: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    DsServiceCli: TDataSet;
  end;


implementation

{$R *.dfm}
uses
  DM_Main;

procedure TfrmSelectService.FormShow(Sender: TObject);
begin
  inherited;
  MemServices.LoadFromDataSet(DM.DicServices);

  DsServiceCli.First;
  while not DsServiceCli.Eof do
  begin
    if MemServices.Locate('id', DsServiceCli.FieldByName('service_id').AsInteger, []) then
    begin
      MemServices.Edit;
      MemServices.FieldByName('sel').AsInteger := 1;
      MemServices.Post;
    end;

    DsServiceCli.Next;
  end;

  DS.DataSet := MemServices;
end;

end.
