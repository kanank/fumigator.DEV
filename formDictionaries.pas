unit formDictionaries;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, RzButton, Vcl.ExtCtrls,
  RzPanel, dxGDIPlusClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.ComCtrls, dxtree, dxdbtree, dxSkinsCore,
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
  TfrmDictionaries = class(TSimpleForm)
    GridUserTypes: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    pnlEdit: TRzPanel;
    btnAdd: TRzBitBtn;
    btnEdit: TRzBitBtn;
    btnDel: TRzBitBtn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    GridProfs: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    GridMaterials: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    GridServices: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    tvMaterials: TdxDBTreeView;
    procedure GridUserTypesEnter(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure tvMaterialsEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDictionaries: TfrmDictionaries;

implementation

{$R *.dfm}
uses
  DM_Main, ClassSimpleSprForm, ClassSimpleSprTypeForm, IBX.IBQuery, System.UITypes;

procedure TfrmDictionaries.btnAddClick(Sender: TObject);
var
  data: TDataSet;
  frm: TfrmSimpleSpr;
  s: string;
  parent, type_id, service_id, subtype_id: integer;
begin
  data := TcxGridDBTableView(TcxGrid(pnlEdit.Tag).ActiveView).DataController.DataSet;
  s := TcxGridDBTableView(TcxGrid(pnlEdit.Tag).ActiveView).Columns[0].Caption;
  try
    try
      frm := TfrmSimpleSpr.Create(Self, s + ' [добавление]');
      frm.DS.DataSet := data;

      if data = DM.DicMaterials then
      begin
        parent      := DM.DicMaterials.FieldByName('parent').AsInteger;
        type_id     := DM.DicMaterials.FieldByName('type_id').AsInteger;
        service_id  := DM.DicMaterials.FieldByName('service_id').AsInteger;
        subtype_id  := DM.DicMaterials.FieldByName('subtype_id').AsInteger;
      end;
      data.Append;
      if data = DM.DicMaterials then
      begin
          DM.DicMaterials.FieldByName('parent').AsInteger     :=  parent;
          DM.DicMaterials.FieldByName('type_id').AsInteger    :=  type_id;
          DM.DicMaterials.FieldByName('service_id').AsInteger := service_id;
          DM.DicMaterials.FieldByName('subtype_id').AsInteger := subtype_id;
      end;

      frm.ShowModal;
      if frm.ModalResult = mrOk then
      begin
        data.Post;
        TIBQuery(data).ApplyUpdates;
        if TIBQuery(data).Transaction.InTransaction then
          TIBQuery(data).Transaction.CommitRetaining;
      end
      else
      begin
        data.Cancel;
        TIBQuery(data).RevertRecord;
        if TIBQuery(data).Transaction.InTransaction then
          TIBQuery(data).Transaction.RollbackRetaining;
      end;
    except
      data.Cancel;
      TIBQuery(data).RevertRecord;
      if TIBQuery(data).Transaction.InTransaction then
        TIBQuery(data).Transaction.RollbackRetaining;
    end;
  finally
    FreeAndNil(frm);
  end;
end;

procedure TfrmDictionaries.btnDelClick(Sender: TObject);
var
  data: TDataSet;
  s: string;
begin
  data := TcxGridDBTableView(TcxGrid(pnlEdit.Tag).ActiveView).DataController.DataSet;
  s := TcxGridDBTableView(TcxGrid(pnlEdit.Tag).ActiveView).Columns[0].Caption;

  if Application.MessageBox('Вы действительно хотите удалить текущую запись?', 'Подтверждение',
        MB_ICONQUESTION + MB_YESNO) <> mrYes then
    Exit;

   data.Delete;
   TIBQuery(data).ApplyUpdates;
   if TIBQuery(data).Transaction.InTransaction then
     TIBQuery(data).Transaction.CommitRetaining;

end;

procedure TfrmDictionaries.btnEditClick(Sender: TObject);
var
  data: TDataSet;
  frm: TfrmSimpleSpr;
  s: string;
begin
  data := TcxGridDBTableView(TcxGrid(pnlEdit.Tag).ActiveView).DataController.DataSet;
  s := TcxGridDBTableView(TcxGrid(pnlEdit.Tag).ActiveView).Columns[0].Caption;
  try
    try
      frm := TfrmSimpleSpr.Create(Self, s + ' [изменение]');
      frm.DS.DataSet := data;
      data.Edit;
      frm.ShowModal;
      if frm.ModalResult = mrOk then
      begin
        data.Post;
        TIBQuery(data).ApplyUpdates;
        if TIBQuery(data).Transaction.InTransaction then
          TIBQuery(data).Transaction.CommitRetaining;
      end
      else
      begin
        data.Cancel;
        TIBQuery(data).RevertRecord;
        if TIBQuery(data).Transaction.InTransaction then
          TIBQuery(data).Transaction.RollbackRetaining;
      end;
    except
      data.Cancel;
      TIBQuery(data).RevertRecord;
      if TIBQuery(data).Transaction.InTransaction then
        TIBQuery(data).Transaction.RollbackRetaining;
    end;
  finally
    FreeAndNil(frm);
  end;
end;

procedure TfrmDictionaries.FormShow(Sender: TObject);
begin
  GridUserTypes.SetFocus;
end;

procedure TfrmDictionaries.GridUserTypesEnter(Sender: TObject);
begin
  pnlEdit.Left := TcxGrid(Sender).Left;
  pnlEdit.Tag := Integer(TcxGrid(Sender));
 end;

procedure TfrmDictionaries.tvMaterialsEnter(Sender: TObject);
begin
  GridUserTypesEnter(GridMaterials);

end;

end.
