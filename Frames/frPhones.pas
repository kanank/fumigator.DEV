unit frPhones;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frListBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL, RzButton, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.ExtCtrls, RzPanel, cxCheckBox,
  cxDBLookupComboBox, cxMaskEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  TFramePhones = class(TFrameListBase)
    grdPhoneDBTableView2: TcxGridDBTableView;
    grdPhoneDBTableView2Column1: TcxGridDBColumn;
	grdPhoneDBTableView2Column2: TcxGridDBColumn;
    grdPhoneDBTableView2Column3: TcxGridDBColumn;
    grdPhoneDBTableView2Column4: TcxGridDBColumn;
    Q_Check: TIBQuery;
    grdPhoneDBTableView2Column5: TcxGridDBColumn;
    procedure QueryAfterPost(DataSet: TDataSet);
    procedure grdPhoneDBTableView2CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure QueryNewRecord(DataSet: TDataSet);
  private
    procedure SetMainPhone(id: integer);
  public
    typePhone: SmallInt; //0-clients
    constructor Create(AOwner: TComponent); override;
    function SaveData: Boolean; override;
  end;

implementation

{$R *.dfm}
uses
  formEditPhone, DM_Main;

{ TFramePhones }


constructor TFramePhones.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  EditFormClass := TfrmEditPhone;
  typePhone := 0;
end;

procedure TFramePhones.grdPhoneDBTableView2CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  i, ind, client_id: Integer;
  nom: string;
begin
  Exit;
  inherited;
  i := TcxGridDBTableView(Sender).GetColumnByFieldName('phone').Index;

  if ACellViewInfo.Item.Index = i then
  begin
    nom := TcxGridDBTableView(Sender).Columns[i].DataBinding.Field.DataSet.FieldByName('CODE').AsString +
      TcxGridDBTableView(Sender).Columns[i].DataBinding.Field.AsString;

    ind := QueryParams.IndexOf('CLIENT_ID');
    if ind > -1 then
      client_id := TField(QueryParams.Objects[ind]).AsInteger;

    DM.Calling(DM.CurrentUserSets.ATS_Phone_Num, nom, client_id);
  end;

end;

procedure TFramePhones.QueryAfterPost(DataSet: TDataSet);
begin
  if Query.FieldByName('ismain').AsInteger = 1 then
    SetMainPhone(Query.FieldByName('id').AsInteger);
end;

procedure TFramePhones.QueryNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('CODE').AsString := '+7';
end;

function TFramePhones.SaveData: Boolean;
var
  client_id, ind: Integer;
begin
  ind := QueryParams.IndexOf('CLIENT_ID');
  if ind > -1 then
    client_id := TField(QueryParams.Objects[ind]).AsInteger;

  Query.First;
  while not Query.Eof do
  begin
    if Query.FieldByName('Client_id').AsInteger <> client_id then
    begin
      if Query.State = dsBrowse then
        Query.Edit;
      Query.FieldByName('Client_id').AsInteger := client_id;
    end;
    if Query.FieldByName('type').IsNull or
      (Query.FieldByName('type').AsInteger <> typePhone) then
    begin
      if Query.State = dsBrowse then
        Query.Edit;
      Query.FieldByName('type').AsInteger := typePhone;
    end;
    if Query.State <> dsBrowse then
      Query.post;

    Query.Next;
  end;

  Result := inherited SaveData;
end;

procedure TFramePhones.SetMainPhone(id: integer);
var
  bm: TBookmark;
begin
  if Query.RecordCount > 1 then
  try
    bm := Query.GetBookmark;

    Query.First;
    while not Query.Eof do
    begin
      if Query.FieldByName(FieldId).AsInteger = id then
      begin
        if Query.FieldByName('ismain').AsInteger = 0 then
        begin
          Query.Edit;
          Query.FieldByName('ismain').AsInteger := 1;
          Query.Post;
        end
      end
      else //другая запись
      begin
        if Query.FieldByName('ismain').AsInteger = 1 then
          begin
            Query.Edit;
            Query.FieldByName('ismain').AsInteger := 0;
            Query.Post;
          end
      end;
      Query.Next;
    end;
  finally
    Query.GotoBookmark(bm);
    Query.FreeBookmark(bm);
  end;
end;

end.
