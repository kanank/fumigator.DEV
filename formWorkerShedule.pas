unit formWorkerShedule;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, RzButton, Vcl.ExtCtrls,
  RzPanel, dxGDIPlusClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxClasses, cxGridLevel,
  cxGrid, cxContainer, dxmdaset, cxDropDownEdit, cxCalendar, cxDBEdit,
  Vcl.StdCtrls, cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  TfrmWorkerShedule = class(TSimpleForm)
    GridCli: TcxGrid;
    GridCliLevel1: TcxGridLevel;
    GridCliUrView: TcxGridDBTableView;
    DS: TDataSource;
    GridCliUrViewColumn1: TcxGridDBColumn;
    GridCliUrViewColumn2: TcxGridDBColumn;
    GridCliUrViewColumn3: TcxGridDBColumn;
    GridCliUrViewColumn4: TcxGridDBColumn;
    Fiz_btn: TRzButton;
    Ur_btn: TRzButton;
    DsCli: TDataSource;
    GridShedule: TcxGrid;
    GridSheduleView: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    butOk: TRzButton;
    btnAdd: TRzBitBtn;
    btnDel: TRzBitBtn;
    Label11: TLabel;
    Label1: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    memData: TdxMemData;
    DsMem: TDataSource;
    cmbWorker: TcxDBLookupComboBox;
    QWorkerShedule: TIBQuery;
    QWorkerShedule_upd: TIBUpdateSQL;
    memDataWORKER_ID: TIntegerField;
    memDataDATESHEDULE: TDateField;
    MemCli: TdxMemData;
    GridCliUrViewColumn5: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Ur_btnClick(Sender: TObject);
    procedure Fiz_btnClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure butOkClick(Sender: TObject);
    procedure DsMemDataChange(Sender: TObject; Field: TField);
  private
    FisUr: integer;
    fStatus: Integer;
    procedure SetFilter;
    procedure SetIsUr(AValue: integer);
    procedure FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FilterWorkers(DataSet: TDataSet; var Accept: Boolean);
    procedure SaveModifications;
  public
    property isUr: Integer read FisUr write SetIsUr;

    procedure ReOpenData;
  end;

var
  frmWorkerShedule: TfrmWorkerShedule;

implementation

{$R *.dfm}
uses
  DM_Main;



procedure TfrmWorkerShedule.btnAddClick(Sender: TObject);
Var
  i, id: integer;
  ARowIndex: Integer;
  ARowInfo:  TcxRowInfo;
begin
  try
    ARowIndex := GridCliUrView.DataController.GetFocusedRowIndex;

    with GridCliUrView.DataController do
    begin
      BeginUpdate;
      Screen.Cursor := crHourGlass;
      try
        for I := 0 to GetSelectedCount - 1 do
          begin
            ARowIndex := GetSelectedRowIndex(I);
            ARowInfo  := GetRowInfo(ARowIndex);
            if ARowInfo.Level < Groups.GroupingItemCount then
              Continue
            else
              begin
                id := Values[ARowInfo.RecordIndex,  GridCliUrView.GetColumnByFieldName('id').Index];
                QWorkerShedule.Append;
                QWorkerShedule.FieldByName('WORKER_ID').AsInteger :=
                  MemData.FieldByName('WORKER_ID').AsInteger;
                QWorkerShedule.FieldByName('DATESHEDULE').AsDateTime :=
                  MemData.FieldByName('DATESHEDULE').AsDateTime;
                QWorkerShedule.FieldByName('CLIENT_ID').AsInteger := id;
                  //DsCli.DataSet.FieldByName('ID').AsInteger;
                QWorkerShedule.Post;

                if MemCli.Locate('id', id, []) then
                begin
                  MemCli.Edit;
                  MemCli.FieldByName('spec').AsInteger :=1;
                  MemCli.Post;
                end;
              end;//else
          end;//for
      finally
        EndUpdate;
        Screen.Cursor := crDefault;
        GridCliUrView.DataController.DeleteSelection;
        if ARowIndex > GetRowCount - 1 then
           ARowIndex := GetRowCount - 1;
        if ARowIndex >= 0 then
          GridCliUrView.DataController.SelectRows(ARowIndex, ARowIndex);
      end;//try
    end;

  except

  end;
end;


procedure TfrmWorkerShedule.FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := (DataSet.FieldByName('act').AsInteger = 1) and
            (DataSet.FieldByName('type_cli').AsInteger = isUr) and
            (DataSet.FieldByName('spec').AsInteger = 0);
end;

procedure TfrmWorkerShedule.FilterWorkers(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := (DataSet.FieldByName('is_deleted').AsInteger = 0);
end;

procedure TfrmWorkerShedule.Fiz_btnClick(Sender: TObject);
begin
  inherited;
  isUr := 0;
end;

procedure TfrmWorkerShedule.FormCreate(Sender: TObject);
begin
  inherited;
   isUr := 0;
   DM.GetDataset(DM.Clients);
   DM.Workers.OnFilterRecord := FilterWorkers;
   DM.Workers.Filtered := True;
   MemCli.LoadFromDataSet(DM.Clients);
   DSCli.DataSet.OnFilterRecord := Self.FilterRecord;
   memData.Open;
   memData.Append;
   memData.FieldByName('WORKER_ID').AsInteger := 0;
   memData.FieldByName('DATESHEDULE').AsDateTime := Now();
   memData.Post;
   DSMem.OnDataChange := DsMemDataChange;
end;

procedure TfrmWorkerShedule.FormDestroy(Sender: TObject);
begin
  DsCli.DataSet.OnFilterRecord := nil;
  DsCli.DataSet.Filtered := False;
  DM.Workers.OnFilterRecord := nil;
  DM.Workers.Filtered := false;
  inherited;
end;

procedure TfrmWorkerShedule.FormShow(Sender: TObject);
begin
  inherited;
  SetFilter;
end;

procedure TfrmWorkerShedule.ReOpenData;
var
  id: Integer;
  res: Boolean;
begin
  if QWorkerShedule.UpdatesPending then
    if MessageBox(Self.Handle, PWideChar('Обнаружены несохраненные данные.'+#13#10 + 'Сохранить?'), 'Внимание', MB_ICONQUESTION + MB_YESNO) = idYes then
      SaveModifications;

  QWorkerShedule.Close;
  QWorkerShedule.ParamByName('WORKER_ID').AsInteger :=
    MemData.FieldByName('WORKER_ID').AsInteger;
  QWorkerShedule.ParamByName('DATESHEDULE').AsDateTime :=
    MemData.FieldByName('DATESHEDULE').AsDateTime;
  QWorkerShedule.Open;

  btnAdd.Enabled := (MemData.FieldByName('WORKER_ID').AsInteger > 0);
  btnDel.Enabled := (MemData.RecordCount > 0);

  //установка MemCli
  id := MemCli.FieldByName('id').AsInteger;
  try
    MemCli.Filtered := False;
    MemCli.First;
    MemCli.DisableControls;
    while not MemCli.Eof do
    begin
      if QWorkerShedule.Locate('CLIENT_ID', MemCli.FieldByName('id').AsInteger, []) then
        res := SetFieldValue(MemCli.FieldByName('spec'), 1)
      else
        res := SetFieldValue(MemCli.FieldByName('spec'), 0);
      MemCli.Next;
    end;
  finally
    MemCli.Locate('ID', id, []);
    MemCli.Filtered := True;
    MemCli.EnableControls;
  end;

end;

procedure TfrmWorkerShedule.btnDelClick(Sender: TObject);
Var
  i, id: integer;
  ARowIndex: Integer;
  ARowInfo:  TcxRowInfo;
begin
  try
    ARowIndex := GridSheduleView.DataController.GetFocusedRowIndex;

    with GridSheduleView.DataController do
    begin
      BeginUpdate;
      Screen.Cursor := crHourGlass;
      try
        for I := 0 to GetSelectedCount - 1 do
          try
            ARowIndex := GetSelectedRowIndex(I);
            ARowInfo  := GetRowInfo(ARowIndex);

            id := Values[ARowInfo.RecordIndex,  GridSheduleView.GetColumnByFieldName('CLIENT_ID').Index];
            if not QWorkerShedule.Locate('CLIENT_ID', id, []) then
              Continue;

            QWorkerShedule.Delete;

             MemCli.Filtered := False;
             if MemCli.Locate('ID', id, []) then
               SetFieldValue(MemCli.FieldByName('spec'), 0);

          except
            MemCli.Cancel;
            QWorkerShedule.CancelUpdates;

          end;//for
      finally
        EndUpdate;
        Screen.Cursor := crDefault;
        DeleteSelection;
        if ARowIndex > GetRowCount - 1 then
           ARowIndex := GetRowCount - 1;
        if ARowIndex >= 0 then
          SelectRows(ARowIndex, ARowIndex);
      end;//try
    end;
      (*id := QWorkerShedule.FieldByName('CLIENT_ID').AsInteger;
      QWorkerShedule.Delete;

       MemCli.Filtered := False;
       if MemCli.Locate('ID', id, []) then
         SetFieldValue(MemCli.FieldByName('spec'), 0);

    except
      MemCli.Cancel;
      QWorkerShedule.CancelUpdates;
    end;*)
  finally
    MemCli.Filtered := True;
    MemCli.Locate('ID', id, []);
  end;
end;

procedure TfrmWorkerShedule.butOkClick(Sender: TObject);
begin
  if QWorkerShedule.Modified or QWorkerShedule.UpdatesPending then
    SaveModifications;
end;

procedure TfrmWorkerShedule.DsMemDataChange(Sender: TObject; Field: TField);
begin
  if Field = nil then
    Exit;
  ReOpenData;
end;

procedure TfrmWorkerShedule.SetFilter;
begin
  DsCli.DataSet.Filtered := false;
  DsCli.DataSet.Filtered := True;
end;

procedure TfrmWorkerShedule.SetIsUr(AValue: integer);
begin
  if AValue <> fIsUr then
  begin
    fisUr := AValue;
    SetFilter;
  end;
  if AValue = 1 then
  begin
    Ur_btn.Down   := True;
    Fiz_btn.Down  := False;
    Ur_btn.Color  := $00FAECDE;
    Fiz_btn.Color := $00E9F4F8;
    Fiz_btn.Font.Style := Fiz_btn.Font.Style - [fsBold];
    Ur_btn.Font.Style  := Ur_btn.Font.Style + [fsBold];
  end
  else
  begin
    Ur_btn.Down   := False;
    Fiz_btn.Down  := True;
    Ur_btn.Color  := $00E9F4F8;
    Fiz_btn.Color := $00FAECDE;
    Fiz_btn.Font.Style := Fiz_btn.Font.Style + [fsBold];
    Ur_btn.Font.Style  := Ur_btn.Font.Style - [fsBold];
  end;
end;

procedure TfrmWorkerShedule.Ur_btnClick(Sender: TObject);
begin
  inherited;
  isUr := 1;
 end;

procedure TfrmWorkerShedule.SaveModifications;
begin
  if not QWorkerShedule.UpdatesPending then
    Exit;

  QWorkerShedule.ApplyUpdates;
  QWorkerShedule.Transaction.CommitRetaining;
end;

end.
