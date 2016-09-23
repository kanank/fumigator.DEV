unit formCallReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDbBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxDBLookupComboBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  RzButton, cxTextEdit, cxMaskEdit, cxCalendar, Vcl.StdCtrls, Vcl.ExtCtrls,
  RzPanel, IBX.IBCustomDataSet, IBX.IBQuery, dxGDIPlusClasses, cxTimeEdit,
  formRecordPlay, dxmdaset;

type
  TfrmCallReport = class(TfrmDbBaseForm)
    Image1: TImage;
    RzPanel2: TRzPanel;
    Image2: TImage;
    Label11: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtTimeStart: TcxDateEdit;
    RzButton1: TRzButton;
    edtTimeEnd: TcxDateEdit;
    cmbRegion: TcxLookupComboBox;
    Grid: TcxGrid;
    GridView: TcxGridDBTableView;
    GridViewColumn1: TcxGridDBColumn;
    GridViewColumn2: TcxGridDBColumn;
    GridViewColumn8: TcxGridDBColumn;
    GridViewColumn3: TcxGridDBColumn;
    GridViewColumn7: TcxGridDBColumn;
    GridViewColumn9: TcxGridDBColumn;
    GridViewColumn10: TcxGridDBColumn;
    GridViewColumn6: TcxGridDBColumn;
    GridViewColumn4: TcxGridDBColumn;
    GridViewColumn5: TcxGridDBColumn;
    GridViewColumn11: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    GridViewColumn12: TcxGridDBColumn;
    pnlForm: TPanel;
    GridViewColumn13: TcxGridDBColumn;
    GridViewColumn14: TcxGridDBColumn;
    MemRegions: TdxMemData;
    DsRegions: TDataSource;
    procedure RzButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure _QueryFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure cmbRegionPropertiesChange(Sender: TObject);
    procedure GridViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    fInQuery: Boolean;
    procedure SetFilter;
  public
    frmPlay: TfrmRecordPlay;
  end;

var
  frmCallReport: TfrmCallReport;

implementation

{$R *.dfm}

uses
  DM_Main;

procedure TfrmCallReport.cmbRegionPropertiesChange(Sender: TObject);
begin
  inherited;
  SetFilter;
end;

procedure TfrmCallReport.FormCreate(Sender: TObject);
begin
  inherited;
  frmRecordPlay := TfrmRecordPlay.Create(nil);
  frmPlay := frmRecordPlay;
  frmPlay.Parent :=  pnlForm;
  pnlForm.Visible := False;
  edtTimeStart.Date := Date;
  edtTimeEnd.Date   := edtTimeStart.Date;
  with MemRegions do
  begin
    CopyFromDataSet(DM.DicRegions);
    First;
    Insert;
    FieldByName('NAME').AsString := 'Ыўсющ';
    Post;
  end;
end;

procedure TfrmCallReport.FormDestroy(Sender: TObject);
begin
  GridView.OnFocusedRecordChanged := nil;
  frmPlay.Free;
  inherited;

end;

procedure TfrmCallReport.GridViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  ColumnId: Integer;
  Cellvalue : variant;
  vRecId: Variant;
  sRecId: string;
  focusedCell: TcxGridTableDataCellViewInfo;
begin
  if fInQuery or not GridView.Focused then
    Exit;
  focusedCell := nil;

  if GridViewColumn5.FocusedCellViewInfo = nil then
  begin
    if GridView.ViewData.RowCount > 0 then
      focusedCell := GridView.ViewData.Rows[0].ViewInfo.GetCellViewInfoByItem(GridViewColumn5);
  end
  else
    focusedCell := GridViewColumn5.FocusedCellViewInfo;

  if focusedCell = nil then
    Exit;

  pnlForm.Top  := Grid.Top + focusedCell.RealBounds.Top + 1;
  pnlForm.Left := focusedCell.RealBounds.Left + 1;
  ColumnID     := GridView.GetColumnByFieldName('CALLAPIID').Index;
  Cellvalue    := focusedCell.GridRecord.Values[ColumnID];
  frmPlay.CallApiId := focusedCell.GridRecord.Values[ColumnId];
  ColumnID     := GridView.GetColumnByFieldName('LOCALNUM').Index;
  frmPlay.ext  := focusedCell.GridRecord.Values[ColumnId];

  ColumnID     := GridView.GetColumnByFieldName('RECID').Index;

  vRecId := focusedCell.GridRecord.Values[ColumnId];
  if VarIsNull(vRecId) then
    sRecId := ''
  else
    sRecId := vRecId;

  frmPlay.RecId := sRecId;

  frmPlay.FileName  := '';
  frmPlay.Width  := GridViewColumn5.Width;
  frmPlay.Height := focusedCell.Height-2;
  pnlForm.Width  := frmPlay.Width;
  pnlForm.Height := frmPlay.Height;
  frmPlay.Top := 0;
  frmPlay.Left := 0;
  frmPlay.Visible := True;
  pnlForm.Visible := True;
  pnlForm.BringToFront;
  frmPlay.BringToFront;
end;

procedure TfrmCallReport.RzButton1Click(Sender: TObject);
begin
  fInQuery := True;
  _Query.Close;
  _Query.Filtered := False;

  DM.GetDataset(DM.Clients);

  if _Query.Transaction.Active then
    _Query.Transaction.CommitRetaining;

  _Query.ParamByName('date1').AsDateTime := edtTimeStart.Date;
  _Query.ParamByName('date2').AsDateTime := edtTimeEnd.Date + 1;
   try
     _Query.Open;
     SetFilter;

     frmPlay.BorderIcons := [];
     frmPlay.BorderStyle := bsNone;
     //frmPlay.Visible := True;
     fInQuery := False;

     pnlForm.Visible := (_Query.RecordCount > 0);
     GridView.ViewData.Rows[0].Selected := True;
     GridViewFocusedRecordChanged(GridView, nil,
       GridView.ViewData.Rows[0], false);
     //GridView.sel FirstRecordIndex

   except
     frmPlay.Hide;
     fInQuery := False;
   end;

end;

procedure TfrmCallReport.SetFilter;
begin
  try
    GridView.OnFocusedRecordChanged := nil;
    _Query.Filtered := False;
    _Query.Filtered := True;
  finally
    GridView.OnFocusedRecordChanged := GridViewFocusedRecordChanged;
  end;
end;

procedure TfrmCallReport._QueryFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := (cmbRegion.EditValue = null) or (cmbRegion.EditValue = 0);
  if not Accept then
    Accept := DataSet.FieldByName('region_id').AsInteger =
        cmbRegion.EditValue;



end;

end.
