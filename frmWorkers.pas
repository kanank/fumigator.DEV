unit frmWorkers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSprForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzButton, Vcl.ExtCtrls, RzPanel, dxGDIPlusClasses,
  cxLocalization, cxDBLookupComboBox, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinscxPCPainter;

type
  TfrmWorkers = class(TSprForm)
    GridViewColumn1: TcxGridDBColumn;
    GridViewColumn2: TcxGridDBColumn;
    GridViewColumn3: TcxGridDBColumn;
    GridViewColumn4: TcxGridDBColumn;
    GridViewColumn5: TcxGridDBColumn;
    GridViewColumn6: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    StyleHeader: TcxStyle;
    procedure Add_btnClick(Sender: TObject);
    procedure Edit_btnClick(Sender: TObject);
    procedure Del_btnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    procedure FilterRecord(DataSet: TDataSet; var Accept: Boolean);
  public
    { Public declarations }
  end;

var
  formWorkers: TfrmWorkers;

implementation

{$R *.dfm}

 uses
   DM_Main, CommonVars, CommonTypes, frmWorker;

procedure TfrmWorkers.Add_btnClick(Sender: TObject);
var
  prm: TFrmCreateParam;
begin
  if not DM.Workers.Active then
    DM.Workers.Open;

  prm := NewFrmCreateParam(asCreate, DM.Workers);
  formWorker := TfrmWorker.Create(self, '', @prm);
  formWorker.ShowModal;
  FreeAndNil(formWorker);
end;

procedure TfrmWorkers.Del_btnClick(Sender: TObject);
begin
  try
//    DM.Workers.Edit;
//    DM.Workers.FieldByName('IS_DELETED').AsInteger := 1;
//    DM.Workers.Post;
    DM.Workers.Delete;
    DM.Workers.ApplyUpdates;
    DM.Workers.Transaction.CommitRetaining;
  finally
  end;
end;

procedure TfrmWorkers.Edit_btnClick(Sender: TObject);
var
  prm: TFrmCreateParam;
begin
  if not DM.Workers.Active then
    DM.Workers.Open;

  prm := NewFrmCreateParam(asEdit, DM.Workers);
  formWorker := TfrmWorker.Create(self, '', @prm);
  formWorker.ShowModal;
  FreeAndNil(formWorker);
end;

procedure TfrmWorkers.FilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := (DataSet.FieldByName('is_deleted').AsInteger = 0);
end;

procedure TfrmWorkers.FormCreate(Sender: TObject);
begin
  inherited;
  DM.Workers.OnFilterRecord := FilterRecord;
  DM.Workers.Filtered := True;
end;

procedure TfrmWorkers.FormDestroy(Sender: TObject);
begin
  DM.Workers.OnFilterRecord := nil;
  DM.Workers.Filtered := False;
  inherited;
end;

end.
