unit formClients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSprForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzButton, Vcl.ExtCtrls, RzPanel, dxGDIPlusClasses,
  Vcl.Menus, cxDropDownEdit, cxDBExtLookupComboBox, cxPropertiesStore,
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
  TfrmClients = class(TSprForm)
    Fiz_btn: TRzButton;
    Ur_btn: TRzButton;
    GridViewColumn1: TcxGridDBColumn;
    GridViewColumn2: TcxGridDBColumn;
    GridViewColumn3: TcxGridDBColumn;
    GridViewColumn4: TcxGridDBColumn;
    GridViewColumn5: TcxGridDBColumn;
    GridViewColumn6: TcxGridDBColumn;
    GridViewUrColumn1: TcxGridDBColumn;
    GridViewUrColumn2: TcxGridDBColumn;
    GridViewUrColumn3: TcxGridDBColumn;
    GridViewUrColumn4: TcxGridDBColumn;
    GridViewUrColumn5: TcxGridDBColumn;
    GridViewUrColumn6: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    DS: TDataSource;
    btnCli: TRzButton;
    btnLid: TRzButton;
    GridViewUr: TcxGridDBTableView;
    GridViewUrColumn7: TcxGridDBColumn;
    GridViewUrColumn8: TcxGridDBColumn;
    RzButton1: TRzButton;
    btnAll: TRzButton;
    GridViewColumn7: TcxGridDBColumn;
    GridViewColumn8: TcxGridDBColumn;
    GridViewAll: TcxGridDBTableView;
    GridViewAllColumn1: TcxGridDBColumn;
    GridViewAllColumn2: TcxGridDBColumn;
    GridViewAllColumn3: TcxGridDBColumn;
    GridViewAllColumn4: TcxGridDBColumn;
    GridViewAllColumn5: TcxGridDBColumn;
    GridViewAllColumn6: TcxGridDBColumn;
    GridViewAllColumn7: TcxGridDBColumn;
    GridViewAllColumn8: TcxGridDBColumn;
    GridViewAllColumn9: TcxGridDBColumn;
    Add_btn1: TRzMenuButton;
    NewClientBtn_PUM: TPopupMenu;
    NewFizClnt_mi: TMenuItem;
    NewURClnt_mi: TMenuItem;
    PropStore: TcxPropertiesStore;
    btnFavCli: TRzButton;
    procedure Fiz_btnClick(Sender: TObject);
    procedure Ur_btnClick(Sender: TObject);
    procedure Edit_btnClick(Sender: TObject);
    procedure Add_btnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCliClick(Sender: TObject);
    procedure btnLidClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Del_btnClick(Sender: TObject);
    procedure GridViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridViewUrCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure RzButton1Click(Sender: TObject);
    procedure btnAllClick(Sender: TObject);
    procedure NewFizClnt_miClick(Sender: TObject);
    procedure Add_btn1Click(Sender: TObject);
    procedure btnFavCliClick(Sender: TObject);
  private
    FisUr: integer;
    fStatus: Integer;
    procedure SetFilter;
    procedure SetIsUr(AValue: integer);
    procedure SetStatus(AValue: integer);
    procedure FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure SetButton(AButton: TRzButton);
  protected
    procedure SetFormRegim(AValue: TSprFormRegim); override;
  public
    constructor Create(AOwner: TComponent; ADataSet: TDataset = nil; AisUr: Integer=0); overload;
    property isUr: Integer read FisUr write SetIsUr;
    property status: Integer read fStatus write setStatus;
  end;

var
  frmClients: TfrmClients;

implementation

{$R *.dfm}
uses
  IBX.IBQuery,
  DM_Main, frmMain, formClientFiz, formClientUr, CommonTypes,
  formClientResult;


procedure TfrmClients.Add_btn1Click(Sender: TObject);
begin
  if fFormRegim = sfrSelect then
    ModalResult := mrOk;
  inherited;
end;

procedure TfrmClients.Add_btnClick(Sender: TObject);
var
  id: integer;
  extPrm: TClientParam;
  fUr: integer;
begin
  try
    //DS.DataSet.Filtered := false;

    extPrm := TClientParam.Init(status, 0, nil);
    //extPrm.CallParam.Status_Id := status;

    if Sender is TMenuItem then
    begin
      if (TComponent(Sender).Name = 'NewURClnt_mi') then
        fUr := 1
      else
        fUr :=0;
    end
    else
      fUr := FisUr;

    if (FUr = 1) then
      DM.ShowClientUr(asCreate, extPrm)
    else
      DM.ShowClientFiz(asCreate, extPrm);

   id := DS.DataSet.FieldByName('id').AsInteger;
  finally
    //DS.DataSet.Filtered := True;
    DS.DataSet.Locate('ID', id, []);
    Grid.SetFocus;
  end;
end;

procedure TfrmClients.btnAllClick(Sender: TObject);
begin
  isUr := -1;
end;

procedure TfrmClients.btnCliClick(Sender: TObject);
begin
  inherited;
  Status := 1;
end;

procedure TfrmClients.btnFavCliClick(Sender: TObject);
begin
  inherited;
  status := 3;
end;

procedure TfrmClients.btnLidClick(Sender: TObject);
begin
  inherited;
  status := 2;
end;

constructor TfrmClients.Create(AOwner: TComponent; ADataSet: TDataset = nil; AisUr: Integer=0);
begin
  DM.ClientList.AfterScroll := nil;
  try
    inherited Create(AOwner);

    if ADataSet = nil then
      DS.DataSet := DM.ClientList;
    isUr := AisUr;

    status := 1;

    DS.DataSet.OnFilterRecord := Self.FilterRecord;
  finally
    DM.ClientList.AfterScroll := DM.ClientListAfterScroll;
  end;
end;

procedure TfrmClients.Del_btnClick(Sender: TObject);
//var
//  id: integer;
begin
  try
    //id := DS.DataSet.FieldByName('id').AsInteger;
    //DS.DataSet.Filtered := false;

    //if not DS.DataSet.Locate('ID', id, []) then
    //  Exit;

    if not (DM.Clients.State in [dsInsert, dsEdit]) then
      DM.Clients.Edit;

    DM.Clients.FieldByName('act').AsInteger := 0;
    DM.Clients.Post;
    //DS.Dataset.Delete;
    TIBQuery(DM.Clients).ApplyUpdates;
    TIBQuery(DM.Clients).Transaction.CommitRetaining;
  finally
    //DS.DataSet.Filtered := True;
  end;

end;

procedure TfrmClients.Edit_btnClick(Sender: TObject);
var
  prm: TFrmCreateParam;
  mres: TModalResult;
  //id: integer;
begin
  try
//    id := DS.DataSet.FieldByName('id').AsInteger;
//    DS.DataSet.Filtered := False;
//    if not DS.DataSet.Locate('id', id, []) then
//      Exit;

    DM.GetDataset(DM.Clients);

    prm := NewFrmCreateParam(asEdit, DM.Clients);
    if DM.Clients.FieldByName('isur').AsInteger = 0 then
    begin
      frmClientFiz := TfrmClientFiz.Create(self, '', @prm);
      mres := frmClientFiz.ShowModal;
      FreeAndNil(frmClientFiz);
    end
    else
    begin
      frmClientUr := TfrmClientUr.Create(self, '', @prm);
      mres := frmClientUr.ShowModal;
      FreeAndNil(frmClientUr);
    end;

    if mres <> mrCancel then
    begin
      //DM.Clients.Transaction.CommitRetaining;
      DM.Clients.Refresh;
    end;
  finally
    //DS.DataSet.Filtered := True;
  end;
end;

procedure TfrmClients.FilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := (DataSet.FieldByName('ACT').AsInteger = 1) and
             DM.isWorkersRegion(DataSet.FieldByName('region_id').AsInteger) and
            (((isUr >= 0) and (DataSet.FieldByName('type_cli').AsInteger = isUr)) or
             ((isUr < 0) and  (DataSet.FieldByName('type_cli').AsInteger >= 0 ))) and
            (DataSet.FieldByName('status_id').AsInteger = status);
end;

procedure TfrmClients.Fiz_btnClick(Sender: TObject);
begin
  inherited;
  isUr := 0;
end;

procedure TfrmClients.FormDestroy(Sender: TObject);
begin
  DM.ClientList.AfterScroll := nil;
  try
    DS.DataSet.Filtered := False;
    DS.DataSet.OnFilterRecord := nil;
  finally
    DM.ClientList.AfterScroll := DM.ClientListAfterScroll;
  end;

  inherited;
end;

procedure TfrmClients.FormShow(Sender: TObject);
begin
  inherited;
  SetFilter;
end;

procedure TfrmClients.GridViewCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  i: Integer;
begin
  inherited;
 // i := TcxGridDBTableView(Sender).GetColumnByFieldName('phone').Index;

 // if ACellViewInfo.Item.Index = i then
 //  DM.Calling(DM.CurrentUserSets.ATS_Phone_Num, TcxGridDBTableView(Sender).Columns[i].DataBinding.Field.AsString);

  //ACellViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('record-id').Index]
end;

procedure TfrmClients.GridViewUrCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if fFormRegim = sfrSelect then
    Add_btn1.Click
  else
    Edit_btn.Click;
end;

procedure TfrmClients.NewFizClnt_miClick(Sender: TObject);
begin
  Add_btnClick(Sender);
end;

procedure TfrmClients.RzButton1Click(Sender: TObject);
var
  prm: TFrmCreateParam;
  mres: TModalResult;
  frm: TForm;
begin
  try
    DM.GetDataset(DM.Clients);
    frmClientResult := TfrmClientResult.Create(self);

    prm := NewFrmCreateParam(asEdit, DM.Clients);
    if fIsUr = 0 then
    begin
      frmClientFiz := TfrmClientFiz.Create(frmClientResult, '', @prm);
      frmClientFiz.RzPanel1.Visible := False;
      frm := frmClientFiz;
    end
    else
    begin
      frmClientUr := TfrmClientUr.Create(frmClientResult, '', @prm);
      frmClientUr.RzPanel1.Visible := False;
      frm := frmClientUr;
    end;

    frm.BorderIcons := [];
    frm.BorderStyle := bsNone;
    frm.Parent      := frmClientResult.pnlForm;
    frmClientResult.pnlForm.Height := frm.Height + 10;
    frmClientResult.pnlForm.Width  := frm.Width;
    frmClientResult.Height := frmClientResult.pnlForm.Height +
      frmClientResult.pnlResult.Height + frmClientResult.RzPanel1.Height;

    frm.Position := poDefault;
    frm.Show;


    frmClientResult.ShowModal;
  finally
    FreeAndNil(frmClientResult);
  end;
end;

procedure TfrmClients.SetButton(AButton: TRzButton);
begin
    if AButton.Down then
    begin
      AButton.Color  := $00FAECDE;
      Abutton.Font.Style := Abutton.Font.Style + [fsBold];
    end
    else
    begin
      AButton.Color  := $00E9F4F8;
      Abutton.Font.Style := Abutton.Font.Style - [fsBold];
    end;
end;

procedure TfrmClients.SetFilter;
begin
  DS.DataSet.Filtered := false;
  //DS.DataSet.Filter := Format('type_cli = %d', [isUr]);
  DS.DataSet.Filtered := True;

  if isUr = 0 then
    GridLevel1.GridView := GridView
  else
  if isUr = 1 then
    GridLevel1.GridView := GridViewUr
  else
    GridLevel1.GridView := GridViewAll;

  //Add_btn.Visible := isUr > -1;
  //Add_btn1.Visible := isUr = -1;

  Grid.Refresh;
end;

procedure TfrmClients.SetFormRegim(AValue: TSprFormRegim);
var
  f: Boolean;
begin
  inherited;
  f := fFormRegim = sfrSelect;

  if f then
  begin
    Add_btn1.Caption := 'Œ ';
    Add_btn1.DropDownMenu := nil;
  end;

  Edit_btn.Visible := not f;
  Del_btn.Visible  := not f;
end;

procedure TfrmClients.SetIsUr(AValue: integer);
begin
  if AValue <> fIsUr then
  begin
    fisUr := AValue;
    SetFilter;
  end;

  Ur_btn.Down   := AValue = 1;
  Fiz_btn.Down  := AValue = 0;
  btnAll.Down   := AValue = -1;

  SetButton(Ur_btn);
  SetButton(Fiz_btn);
  SetButton(btnAll);
end;

procedure TfrmClients.SetStatus(AValue: integer);
begin
 if AValue <> fStatus then
  begin
    fStatus := AValue;
    SetFilter;
  end;

  case AValue of
    1:
    begin
      btnCli.Down      := True;
      btnLid.Down      := False;
      btnFavCli.Down   := False;
      btnCli.Color     := $00FAECDE;
      btnLid.Color     := $00E9F4F8;
      btnFavCli.Color  := $00E9F4F8;
      btnCli.Font.Style    := btnCli.Font.Style + [fsBold];
      btnLid.Font.Style    := btnLid.Font.Style - [fsBold];
      btnFavCli.Font.Style := btnLid.Font.Style - [fsBold];
    end;
    2:
    begin
      btnCli.Down   := False;
      btnLid.Down   := True;
      btnFavCli.Down := False;
      btnCli.Color  := $00E9F4F8;
      btnLid.Color  := $00FAECDE;
      btnFavCli.Color  := $00E9F4F8;
      btnCli.Font.Style  := btnCli.Font.Style - [fsBold];
      btnLid.Font.Style  := btnLid.Font.Style + [fsBold];
      btnFavCli.Font.Style := btnLid.Font.Style - [fsBold]
    end;
    3:
    begin
      btnCli.Down      := False;
      btnLid.Down      := False;
      btnFavCli.Down   := True;
      btnCli.Color     := $00E9F4F8;
      btnLid.Color     := $00E9F4F8;
      btnFavCli.Color  := $00FAECDE;
      btnCli.Font.Style  := btnCli.Font.Style - [fsBold];
      btnLid.Font.Style  := btnLid.Font.Style - [fsBold];
      btnFavCli.Font.Style := btnLid.Font.Style + [fsBold]
    end;
  end;
end;

procedure TfrmClients.Ur_btnClick(Sender: TObject);
begin
  isUr := 1;
 end;

end.
