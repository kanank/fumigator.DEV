unit frUslugi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frListBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL, RzButton, RzPanel,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls, cxDBLookupComboBox,
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
  TFrameUslugi = class(TFrameListBase)
    grdPhoneDBTableView1: TcxGridDBTableView;
    grdPhoneDBTableView1Column1: TcxGridDBColumn;
    procedure btnEditClick(Sender: TObject);
  private
    procedure SetServices(ASource: TDataset);
  public
    function SaveData: Boolean; override;
  end;

implementation

{$R *.dfm}
uses
  formSelService, DM_Main;


procedure TFrameUslugi.btnEditClick(Sender: TObject);
var
  frm: TfrmSelectService;
begin
  try
    frm := TfrmSelectService.Create(self);
    frm.DsServiceCli := Query;
    frm.ShowModal;
    SetServices(frm.MemServices);
  finally
    FreeAndNil(frm);
  end;
end;


function TFrameUslugi.SaveData: Boolean;
var
  client_id, ind: Integer;
begin
  if not DM.isModifiedData(Query) then
  begin
    Result := True;
    Exit;
  end;

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

    if DM.isModifiedData(Query) then
      Query.post;

    Query.Next;
  end;

  result := inherited SaveData;
end;

procedure TFrameUslugi.SetServices(ASource: TDataset);
begin
  Query.First;
  //проверка на снятие отметки
  while not Query.Eof do
  begin
    if not ASource.Locate('id; sel', VarArrayOf([Query.FieldByName('service_id').AsInteger, 1]), []) then
      Query.Delete;
    Query.Next;
  end;

  ASource.First;
  while not ASource.Eof do
  begin
    if ASource.FieldByName('sel').AsInteger = 1 then
    begin
      if not Query.Locate('service_id', ASource.FieldByName('id').AsInteger, []) then
      with Query do
      begin
        Append;
        FieldByName('service_id').AsInteger := ASource.FieldByName('id').AsInteger;
        FieldByName('client_id').AsInteger := 0; //установка потом
        Post;
      end;
    end;
    ASource.Next;
  end;



end;

end.
