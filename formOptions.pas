unit formOptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxListBox,
  cxDBEdit, cxTextEdit, Vcl.StdCtrls, RzButton, Vcl.ExtCtrls, RzPanel,
  dxGDIPlusClasses,
  DM_Main, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxClasses,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGridCustomView, cxGrid, cxCheckBox, IBX.IBUpdateSQL, IBX.IBDatabase,
  Datasnap.DBClient, dxmdaset, Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBLookupComboBox, dxSkinsCore, dxSkinBlack,
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
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter;

type
  TfrmOptions = class(TSimpleForm)
    Label22: TLabel;
    txtDBPath: TcxTextEdit;
    Label1: TLabel;
    txtSMTP: TcxTextEdit;
    Label2: TLabel;
    txtTemp: TcxTextEdit;
    rights_list: TIBQuery;
    DS_rights_list: TDataSource;
    GridRights: TcxGrid;
    GridRightsView: TcxGridDBTableView;
    GridRightsLevel1: TcxGridLevel;
    GridRightsViewColumn1: TcxGridDBColumn;
    GridRightsViewColumn2: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    GridUserTypes: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Label3: TLabel;
    rights_upd: TIBUpdateSQL;
    RightsTran: TIBTransaction;
    btnTuneDictionaries: TRzButton;
    btnTuneOPClentList: TRzButton;
    btnAccept: TRzButton;
    memRights_list: TdxMemData;
    RzPanel2: TRzPanel;
    cxGrid1: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    Label4: TLabel;
    edtWorkerDate: TcxDateEdit;
    cxGridDBTableView2Column1: TcxGridDBColumn;
    cxGridDBTableView2Column2: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure rights_listFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure GridRightsViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure DS_rights_listDataChange(Sender: TObject; Field: TField);
    procedure btnAcceptClick(Sender: TObject);
    procedure btnTuneDictionariesClick(Sender: TObject);
    procedure btnTuneOPClentListClick(Sender: TObject);
    procedure edtWorkerDatePropertiesCloseUp(Sender: TObject);
    procedure cxGridDBTableView2Column2PropertiesCloseUp(Sender: TObject);
  private
    procedure FilterRights;
  public
    { Public declarations }
  end;

var
  frmOptions: TfrmOptions;

implementation

{$R *.dfm}

uses
  Datasnap.Provider, formDictionaries, formWorkerShedule;

procedure TfrmOptions.btnTuneDictionariesClick(Sender: TObject);
var
  frm: TfrmDictionaries;
begin
  frm := TfrmDictionaries.Create(nil);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure TfrmOptions.btnTuneOPClentListClick(Sender: TObject);
begin
  try
    DM.GetDataset(DM.Clients);
    frmWorkerShedule := TfrmWorkerShedule.Create(self);
    frmWorkerShedule.ShowModal;
  finally
    FreeAndNil(frmWorkerShedule);
  end;

end;

procedure TfrmOptions.btnAcceptClick(Sender: TObject);
var
  Q: TIBQuery;

  function SendUpdate: boolean;
  begin
    Result := false;
    try
      Q.Close;
      Q.Open;

      if Q.Transaction.Active then
           Q.Transaction.Commit;
      result := True;
     except
       if Q.Transaction.Active then
           Q.Transaction.Rollback;
     end;
  end;


begin
  Q := nil;
  try
    memRights_list.Filtered := False;
    memRights_list.First;
    rights_list.First;
    while not memRights_list.Eof do
    begin
      if memRights_list.FieldByName('val').AsInteger <>
           Rights_list.FieldByName('val').AsInteger then
      begin
         if Q = nil then
         begin
           Q := CreateRWQuery;
           Q.ParamCheck := True;
           Q.DataSource := DS_rights_list;
           Q.SQL.Text := 'select * from update_rights (:ur_id, :user_id, :right_id, :val)';
         end;
         if not SendUpdate then
          raise Exception.Create('Ошибка обновления прав!');
      end;
      memRights_list.Next;
      Rights_list.Next;
    end;
  finally
    FreeAndNil(Q);
  end;

    btnAccept.Visible := False;
    FilterRights;
end;

procedure TfrmOptions.cxGridDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
   FilterRights;
end;


procedure TfrmOptions.cxGridDBTableView2Column2PropertiesCloseUp(
  Sender: TObject);
var
  Q: TIBQuery;
begin
  try
    Q := CreateRWQuery;
    Q.SQL.Text := 'execute procedure INS_UP_WORKER_TYPE_BY_DATE(:worker_id, :type_id, :date_)';
    Q.ParamByName('worker_id').AsInteger :=
      DM.WorkerTypeByDate.FieldByName('worker_id').AsInteger;
    Q.ParamByName('type_id').AsInteger :=
      TcxLookupComboBoxProperties(cxGridDBTableView2Column2.Properties).ListSource.DataSet.FieldByName('id').AsInteger;
    Q.ParamByName('date_').AsDateTime := edtWorkerDate.Date;
    Q.ExecSQL;
    if DM.WorkerTypeByDate.Transaction.Active then
      DM.WorkerTypeByDate.Transaction.CommitRetaining;
  finally
    Q.Free;
  end;
  (*with DM.WorkerTypeByDate do
  begin
    Edit;
    FieldByName('date_').AsDateTime := edtWorkerDate.Date;
    FieldByName('type_id').AsInteger := TcxLookupComboBoxProperties(cxGridDBTableView2Column2.Properties).ListSource.DataSet.FieldByName('id').AsInteger;

    Post;
    ApplyUpdates;
  end;*)
end;


procedure TfrmOptions.DS_rights_listDataChange(Sender: TObject; Field: TField);
begin
  if Field <> nil then
    btnAccept.Visible := Field.DataSet.Modified;
end;

procedure TfrmOptions.edtWorkerDatePropertiesCloseUp(Sender: TObject);
begin
  with DM.WorkerTypeByDate do
  begin
    Close;
    ParamByName('date_').AsDate := edtWorkerDate.Date;
    Open;
  end;
end;

procedure TfrmOptions.FilterRights;
begin
  memRights_list.Filtered := false;
  memRights_list.Filtered := True;
end;

procedure TfrmOptions.FormCreate(Sender: TObject);
begin
  inherited;
  DM.DicUserTypes.Open;
  DM.DicUserTypes.FetchAll;
  rights_list.Open;
  rights_list.FetchAll;

  memRights_list.CopyFromDataSet(rights_list);
  memRights_list.Open;
  memRights_list.Filtered := True;

  //типы пользователей по датам
  edtWorkerDate.Date := Date;
  edtWorkerDatePropertiesCloseUp(edtWorkerDate);

end;

procedure TfrmOptions.FormShow(Sender: TObject);
begin
  FilterRights;
end;


procedure TfrmOptions.GridRightsViewCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  AColumn: TcxGridDBColumn;
begin
  AColumn := TcxGridDBColumn(ACellViewInfo.Item);
  if (AColumn <> nil) and (LowerCase(AColumn.DataBinding.FieldName) = 'val') then
  begin
    //AColumn.DataBinding.DataController.DataSet;
    memRights_list.Edit;
    memRights_list.FieldByName('val').AsInteger :=
      Abs(memRights_list.FieldByName('val').AsInteger - 1);
    memRights_list.Post;
  end;
 end;

procedure TfrmOptions.rights_listFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if DataSet.FieldByName('user_id').AsInteger = DM.DicUserTypes.FieldByName('id').AsInteger then
    Accept := True
  else
    Accept := False;

end;

end.
