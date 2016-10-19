unit formSessions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSprForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzButton, Vcl.ExtCtrls, RzPanel, dxGDIPlusClasses,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Vcl.StdCtrls, IBX.IBCustomDataSet, IBX.IBQuery,
  cxDBLookupComboBox, dxmdaset, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinscxPCPainter, cxCheckBox, formRecordPlay, IBX.IBUpdateSQL;

type
  TfrmSessions = class(TSprForm)
    Q: TIBQuery;
    DS: TDataSource;
    Label11: TLabel;
    edtTimeStart: TcxDateEdit;
    edtTimeEnd: TcxDateEdit;
    GridViewColumn1: TcxGridDBColumn;
    GridViewColumn2: TcxGridDBColumn;
    GridViewColumn3: TcxGridDBColumn;
    GridViewColumn4: TcxGridDBColumn;
    GridViewColumn5: TcxGridDBColumn;
    GridViewColumn6: TcxGridDBColumn;
    Label1: TLabel;
    GridViewColumn7: TcxGridDBColumn;
    GridViewColumn8: TcxGridDBColumn;
    GridViewColumn9: TcxGridDBColumn;
    GridViewColumn10: TcxGridDBColumn;
    RzButton1: TRzButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    RzPanel3: TRzPanel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    MemHeader: TdxMemData;
    DsHeader: TDataSource;
    MemHeaderCNT_SESSION: TIntegerField;
    MemHeaderCNT_GOOD_SESSION: TIntegerField;
    MemHeaderEND_BY_CLIENT: TIntegerField;
    MemHeaderEND_BY_USER: TIntegerField;
    MemHeaderSUM_DURATION: TDateTimeField;
    MemHeaderAVG_DURATION: TDateTimeField;
    GridViewColumn11: TcxGridDBColumn;
    GridPopup: TPopupMenu;
    N1: TMenuItem;
    miFilterAccepted: TMenuItem;
    miFilterDuration: TMenuItem;
    miFilterOff: TMenuItem;
    cmbFilter: TcxComboBox;
    chkWorkerClients: TcxCheckBox;
    MemQ: TdxMemData;
    RecColumn: TcxGridDBColumn;
    pnlForm: TPanel;
    GridViewColumn12: TcxGridDBColumn;
    GridViewColumn13: TcxGridDBColumn;
    GridViewColumn14: TcxGridDBColumn;
    GridViewColumn15: TcxGridDBColumn;
    pnlFiltered: TPanel;
    Label2: TLabel;
    lblCount: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure GridViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure QFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure miFilterOffClick(Sender: TObject);
    procedure miFilterAcceptedClick(Sender: TObject);
    procedure miFilterDurationClick(Sender: TObject);
    procedure Edit_btnClick(Sender: TObject);
    procedure cmbFilterPropertiesChange(Sender: TObject);
    procedure chkWorkerClientsClick(Sender: TObject);
    procedure GridViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure QAfterRefresh(DataSet: TDataSet);
  private
    procedure CalcHeader;
    function MillesecondToDateTime(ms: int64): TDateTime;
    procedure SetFilter;
    procedure SetMemDataset;
    procedure FilterNonAnswer;
  protected
    procedure SetControls; override;
  public
    frmPlay: TfrmRecordPlay;
  end;

var
  frmSessions: TfrmSessions;

implementation

{$R *.dfm}
uses
  DM_Main, formSessionEdit, formSessionResult, formClientFiz, formClientUr,
  formClientResult, CommonTypes, CommonVars, CommonFunc;

procedure TfrmSessions.CalcHeader;
var
  SUM_DURATION, AVG_DURATION: integer;
  cnt_good, cnt, endByClient, endByUser: Integer;

begin
  SUM_DURATION := 0; AVG_DURATION := 0;
  cnt_good := 0; cnt := 0; endByClient := 0; endByUser := 0;
  cnt := Q.RecordCount;
  Q.First;
  while not Q.Eof do
  begin
    SUM_DURATION := SUM_DURATION + q.FieldByName('duration').AsInteger;
    if Q.FieldByName('callresult').AsString = 'ANSWER' then
      inc(cnt_good);
    Q.Next;
  end;


  with MemHeader do
  begin
    Edit;
    if cnt > 0 then
    begin
      AVG_DURATION := Trunc(SUM_DURATION/cnt);
      FieldByName('sum_duration').AsDateTime    := MillesecondToDateTime(SUM_DURATION);
      FieldByName('avg_duration').AsDateTime    := MillesecondToDateTime(AVG_DURATION);
      FieldByName('cnt_session').AsInteger      := cnt;
      FieldByName('cnt_good_session').AsInteger := cnt_good;
      FieldByName('END_BY_USER').AsInteger      := cnt;
      FieldByName('END_BY_CLIENT').AsInteger    := 0;
    end
    else
    begin
      FieldByName('sum_duration').Clear;
      FieldByName('avg_duration').Clear;
      FieldByName('cnt_session').Clear;
      FieldByName('cnt_good_session').Clear;
      FieldByName('END_BY_USER').Clear;
      FieldByName('END_BY_CLIENT').Clear;
    end;

    Post;
  end;

end;


procedure TfrmSessions.chkWorkerClientsClick(Sender: TObject);
begin
  inherited;
  SetFilter;
end;

procedure TfrmSessions.cmbFilterPropertiesChange(Sender: TObject);
begin
  SetFilter;
end;

procedure TfrmSessions.Edit_btnClick(Sender: TObject);
var
  prm: TFrmCreateParam;
  mres: TModalResult;
  frm: TForm;
begin
  frmSessionEdit := TfrmSessionEdit.Create(nil);

  try
  DS.dataset.DisableControls;

  frmSessionResult := TfrmSessionResult.Create(nil);
  frmSessionResult.NeedCheckCall := False;
  frmSessionResult.Cancel_btn.Visible := False;
  frmSessionResult.Height := frmSessionResult.Height -
    frmSessionResult.Cancel_btn.Height - 10;
  frmSessionResult.Parent := frmSessionEdit.pnlResult;
  frmSessionResult.Q.ParamByName('callapiid').AsString :=
    DS.DataSet.FieldByName('callapiid').AsString;
  frmSessionResult.Q.ParamByName('callednum').AsString :=
    DS.DataSet.FieldByName('callednum').AsString;
  frmSessionResult.Q.ParamByName('callernum').AsString :=
    DS.DataSet.FieldByName('callernum').AsString;

  frmSessionResult.Q.Open;
  frmSessionResult.Q.Edit;

  (*frmSessionResult.edtResult.Text :=
    frmSessionResult.Q.FieldByName('RESULT').AsString;
  frmSessionResult.edtIshod.Text :=
    frmSessionResult.Q.FieldByName('ISHOD').AsString;*)

  frmSessionResult.Position := poDefault;

  frmSessionResult.BorderIcons := [];
  frmSessionResult.BorderStyle := bsNone;

  //frmSessionEdit.pnlResult.Height := frmSessionResult.Height + 5;
  frmSessionEdit.frmResult := frmSessionResult;
  frmSessionResult.Show;

  //карточка клиента
  DM.GetDataset(DM.Clients);

  if DM.Clients.Locate('id', DS.DataSet.FieldByName('client_id').AsInteger, []) then
  begin

    prm := NewFrmCreateParam(asShow, DM.Clients);
    if DM.Clients.FieldByName('type_cli').AsInteger = 0 then
    begin
      frmClientFiz := TfrmClientFiz.Create(nil, '', @prm);
      //frmClientFiz.RzPanel1.Visible := False;
      //frmClientFiz.Height := frmClientFiz.Height - frmClientFiz.RzPanel1.Height;
      frm := frmClientFiz;
      frmSessionEdit.frm := frmClientFiz;
    end
    else
    begin
      frmClientUr := TfrmClientUr.Create(nil, '', @prm);
      //frmClientUr.RzPanel1.Visible := False;
      //frmClientUr.Height := frmClientUr.Height - frmClientUr.RzPanel1.Height;
      frm := frmClientUr;
      frmSessionEdit.frm := frmClientUr;
    end;

    if Assigned(frmSessionEdit.frm) then
      frmSessionEdit.SetClientForm
    else
      frmSessionEdit.btnClientEdit.Enabled := False;

    //frmSessionEdit.ScrollBox.Height:= frmSessionResult.Height + 5 +
    //  frm.Height + 5 + frmSessionEdit.pnlCalls.Height;
    frmSessionEdit.pnlClient.Height := frm.Height + 5;

  end
  else
  begin
    frmSessionEdit.pnlClient.Visible := False;
    frmSessionEdit.pnlClient.Height := 0;
    //frmSessionEdit.ScrollBox.Height := frmSessionResult.Height + 5 +
    //   frmSessionEdit.pnlCalls.Height;
  end;

    frmSessionEdit.pnlResult.Height := frmSessionResult.Height + 5;

    frmSessionEdit.frameClientCalls.AddParam('client_id', DS.DataSet.FieldByName('client_id'));
    frmSessionEdit.frameClientCalls.OpenData;

    frmSessionEdit.ShowModal;

    if (frmSessionEdit.ModalResult = mrOk) and
       frmSessionResult.isModified  then
      try
        frmSessionResult.Q.FieldByName('worker_id').AsInteger := DM.CurrentUserSets.ID;
        frmSessionResult.Q.Post;
          if frmSessionResult.Q.Transaction.Active then
             frmSessionResult.Q.Transaction.CommitRetaining;
          MemQ.Edit;
          MemQ.FieldByName('ISHOD').AsString :=
            frmSessionResult.Q.FieldByName('ISHOD').AsString;
          MemQ.FieldByName('RESULT').AsString :=
            frmSessionResult.Q.FieldByName('RESULT').AsString;
          MemQ.FieldByName('WORKER_ID').AsString :=
            frmSessionResult.Q.FieldByName('WORKER_ID').AsString;

          MemQ.Post;
        except
           if frmSessionResult.Q.Transaction.Active then
             frmSessionResult.Q.Transaction.RollbackRetaining;
        end

  finally
    FreeAndNil(frmSessionEdit);
    FreeAndNil(frmSessionResult);

    DS.DataSet.EnableControls;
  end;
end;

procedure TfrmSessions.FilterNonAnswer;
var
  scur, s: string;
begin
  if not Q.Active then
    Exit;

  MemQ.Close;
  MemQ.CreateFieldsFromDataSet(Q);
  MemQ.Open;

  Q.First;
  while not Q.Eof do
  begin
    if (Q.FieldByName('CALLTYPE').AsInteger = 0) and
       (Q.FieldByName('answer').AsInteger = 0) then
    begin
      if scur <> Q.FieldByName('CALLAPIID').AsString then
      begin
        MemQ.Append;
        CopyRecord(Q, MemQ);
        scur := Q.FieldByName('CALLAPIID').AsString;
      end
    end;

    Q.Next;
  end;
end;

procedure TfrmSessions.FormCreate(Sender: TObject);
begin
  edtTimeStart.Date := Date;
  edtTimeEnd.Date   := edtTimeStart.Date;

  frmRecordPlay := TfrmRecordPlay.Create(nil);
  frmPlay := frmRecordPlay;
  frmPlay.Parent :=  pnlForm;
  frmPlay.BorderIcons := [];
  frmPlay.BorderStyle := bsNone;
  pnlForm.Visible := False;
  //pnlForm.Parent := TWinControl(GridView.GetParentComponent);

  MemHeader.Open;
  MemHeader.Append;
  MemHeader.Post;
  cmbFilter.ItemIndex := 0;
end;


procedure TfrmSessions.FormDestroy(Sender: TObject);
begin
  frmPlay.Free;
  inherited;
end;

procedure TfrmSessions.GridViewCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
 var
  ColumnID: integer;
  Cellvalue : variant;
begin
 ColumnID := TcxGridDBTableView(Sender).GetColumnByFieldName('DURATION').Index;
 Cellvalue := AViewInfo.GridRecord.Values[ColumnID];
 if (Cellvalue > 40000) then
  begin
    ACanvas.Canvas.Brush.Color := clMoneyGreen; //$00F1A283;
  end;
 ColumnID := TcxGridDBTableView(Sender).GetColumnByFieldName('ISHOD').Index;
 Cellvalue := AViewInfo.GridRecord.Values[ColumnID];
 if not VarIsNull(Cellvalue) then
   ACanvas.Canvas.Font.Style := [fsBold]
 else
   ACanvas.Canvas.Font.Style := [];
end;

procedure TfrmSessions.GridViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  ColumnId: Integer;
  Cellvalue : variant;
  vRecId: Variant;
  sRecId: string;
  focusedCell: TcxGridTableDataCellViewInfo;
begin
  if not GridView.Focused then
    Exit;
  focusedCell := nil;

  if RecColumn.FocusedCellViewInfo = nil then
  begin
    if GridView.ViewData.RowCount > 0 then
      if GridView.ViewData.Rows[0].ViewInfo <> nil then
        focusedCell := GridView.ViewData.Rows[0].ViewInfo.GetCellViewInfoByItem(GridViewColumn5);
  end
  else
    focusedCell := RecColumn.FocusedCellViewInfo;

  if focusedCell = nil then
    Exit;

  pnlForm.Top  := Grid.Top + focusedCell.RealBounds.Top + 1;
  pnlForm.Left := focusedCell.RealBounds.Left + 1;
  ColumnID     := GridView.GetColumnByFieldName('CALLAPIID').Index;
  Cellvalue    := focusedCell.GridRecord.Values[ColumnID];
  frmPlay.CallApiId := focusedCell.GridRecord.Values[ColumnId];
  ColumnID     := GridView.GetColumnByFieldName('LOCALNUM').Index;
  frmPlay.ext  := focusedCell.GridRecord.Values[ColumnId];

  ColumnID      := GridView.GetColumnByFieldName('RECAPIID').Index;

  vRecId := focusedCell.GridRecord.Values[ColumnId];
  if VarIsNull(vRecId) then
    sRecId := ''
  else
    sRecId := vRecId;

  frmPlay.RecId := sRecId;

  frmPlay.FileName  := '';
  frmPlay.Width  := 35;//GridViewColumn5.Width;
  frmPlay.Height := focusedCell.Height-2;
  pnlForm.Width  := frmPlay.Width;
  pnlForm.Height := frmPlay.Height;
  frmPlay.Top := 0;
  frmPlay.Left := 0;
  frmPlay.Visible := True;

  pnlForm.Visible := frmPlay.RecId <> '';

  pnlForm.BringToFront;
  frmPlay.BringToFront;
end;

procedure TfrmSessions.miFilterAcceptedClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  SetFilter;
end;

procedure TfrmSessions.miFilterDurationClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  SetFilter;
end;

procedure TfrmSessions.miFilterOffClick(Sender: TObject);
begin
  miFilterAccepted.Checked := false;
  miFilterDuration.Checked := False;
  MemQ.Filtered := false;
end;

function TfrmSessions.MillesecondToDateTime(ms: int64): TDateTime;
const
  //Значение 1 миллисекунды в формате TDateTime.
  MsTime : TDateTime = 1 / (24 * 60 * 60 * 1000);
begin
  //Время в формате TDateTime.
  Result := Ms * MsTime;
end;

procedure TfrmSessions.QAfterRefresh(DataSet: TDataSet);
begin
  if MemQ.Locate('id', DataSet.FieldByName('id').AsInteger, []) then
  begin
    MemQ.Edit
  end;

end;

procedure TfrmSessions.QFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  ff, f0, f1, f2: Boolean;
begin
  f1 := True; f2 := True;
  f0 := not chkWorkerClients.Checked  or
        (chkWorkerClients.Checked and
           DM.isWorkerClient(DataSet.FieldByName('Client_id').asInteger));
  if f0 then
  begin
    if miFilterAccepted.Checked or (cmbFilter.ItemIndex = 1) then
      f1 := (DataSet.FieldByName('ACCEPTED').AsInteger = 1) and
            (DataSet.FieldByName('CALLTYPE').AsInteger = 0);
    if miFilterDuration.Checked or (cmbFilter.ItemIndex = 4) then
      f2 := DataSet.FieldByName('DURATION').AsInteger > 40000;

     case cmbFilter.ItemIndex of
       0: ff := DataSet.FieldByName('ID').AsInteger > 0;
       1: ff := (DataSet.FieldByName('ACCEPTED').AsInteger = 1) and
                  (DataSet.FieldByName('CALLTYPE').AsInteger = 0);
       2: ff := DataSet.FieldByName('CALLTYPE').AsInteger = 1;
       3: ff := (DataSet.FieldByName('ACCEPTED').AsInteger = 0) and
                  (DataSet.FieldByName('CALLTYPE').AsInteger = 0);
       4: ff := DataSet.FieldByName('DURATION').AsInteger > 40000;
       5: ff := DataSet.FieldByName('ACCEPTED').AsInteger = 1;
       //6: ff :=
     end;
  end;
  Accept := f0 and ff and f1 and f2;
end;

procedure TfrmSessions.RzButton1Click(Sender: TObject);
begin
  try
   try
    Screen.Cursor := crSQLWait;
    MemQ.DisableControls;

    Q.Close;
    MemQ.Close;

    DM.GetDataset(DM.Clients);

    if Q.Transaction.Active then
      Q.Transaction.CommitRetaining;

    Q.ParamByName('date1').AsDateTime := edtTimeStart.Date;
    Q.ParamByName('date2').AsDateTime := edtTimeEnd.Date + 1;
    Q.Open;
    //MemQ.CopyFromDataSet(Q);
    SetMemDataset;

    CalcHeader;
    MemQ.First;
   except
     MsgBoxError('Ошибка открытия списка сессий:' + #13#10 +
       Exception(ExceptObject).Message);

   end;
  finally
    MemQ.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSessions.SetControls;
begin
  Edit_btn.Enabled := UserRights.InputSessionResult;
end;

procedure TfrmSessions.SetFilter;
begin
  try
    GridView.OnFocusedRecordChanged := nil;
    Screen.Cursor := crHourGlass;
    //MemQ.Filtered := False;
    //MemQ.Filtered := True;
    SetMemDataset;
  finally
    Screen.Cursor := crDefault;
    GridView.OnFocusedRecordChanged := GridViewFocusedRecordChanged;
    pnlForm.Visible := (MemQ.RecordCount > 0);
  end;
end;

procedure TfrmSessions.SetMemDataset;
var
  f: Boolean;
  i: integer;
begin
  if not Q.Active then
    Exit;

  MemQ.ControlsDisabled;
  try
    case cmbFilter.ItemIndex  of
      0: begin
           MemQ.CopyFromDataSet(Q);
           Exit;
         end;
      6: begin
           FilterNonAnswer;
         end;
      else
      begin
        MemQ.Close;
        MemQ.CreateFieldsFromDataSet(Q);
        MemQ.Open;

        Q.First;
        while not Q.Eof do
        begin
          QFilterRecord(Q, f);
          if f then
          begin
            MemQ.Append;
            CopyRecord(Q, MemQ);
          end;
          Q.Next;
        end;
      end;
    end;

    MemQ.First;
  finally
    MemQ.EnableControls;
    lblCount.Caption := IntToStr(MemQ.RecordCount);
    pnlFiltered.Visible := MemQ.Active and (MemQ.RecordCount > 0);
  end;
end;

end.
