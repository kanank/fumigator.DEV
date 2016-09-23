unit frItemKLADR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, RzButton,
  cxTextEdit, cxMemo, cxDBEdit, Vcl.StdCtrls, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBUpdateSQL, IBX.IBDatabase, dxSkinsCore, dxSkinBlack,
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
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

const
  SearchStr =  '''%:searchstr%''';

type TTypeItemKladr = (tikRegion, tikArea, tikCity, tikSite, tikStreet,
  tikDom);

type
  TFrameItemKLADR = class(TDbFrameBase)
    lblName: TLabel;
    btnEdit: TRzBitBtn;
    edtName: TcxTextEdit;
    edtSocr: TcxTextEdit;
    QuerySearch: TIBQuery;
    procedure btnEditClick(Sender: TObject);
    procedure QueryBeforeOpen(DataSet: TDataSet);
    procedure QuerySearchBeforeOpen(DataSet: TDataSet);
    procedure edtNameKeyPress(Sender: TObject; var Key: Char);
  private

  protected
    fCode: string; // код КЛАДР
    fTypeItem: TTypeItemKladr;

    fRegion: Integer;
    fArea:   Integer;
    fCity:   Integer;
    fSite:   Integer;
    fStreet: Integer;
    fDom:    Integer;
    fActive: Integer;

    fCodeRegion: string; //колы для выбора элементов
    fCodeArea:   string;
    fCodeCity:   string;
    fCodeSite:   string;
    fCodeStreet: string;
    fCodeDom:    string;

    fChildFrame: TFrameItemKLADR; //зависимый фрейм

    fNotSelected: Boolean; //признак, что текст введен вручную

    procedure SetCode(AValue: string); virtual;
    procedure SetEdtText(AQuery: TIBQuery); virtual;
    procedure SetQueryParam(AQuery: TIBQuery);
    procedure SetTransaction(AValue: TIBTransaction);override;
  public
    property Code: string read fCode write SetCode;

    property CodeRegion: string read fCodeRegion;
    property CodeArea:   string read fCodeArea;
    property CodeCity:   string read fCodeCity;
    property CodeSite:   string read fCodeSite;
    property CodeStreet: string read fCodeStreet;
    property CodeDom:    string read fCodeDom;

    property Region: Integer read fRegion;
    property Area:   Integer read fArea;
    property City:   Integer read fCity;
    property Site:   Integer read fSite;
    property Street: Integer read fStreet;
    property Dom:    Integer read fDom;
    property ActiveKLADR: Integer read fActive;

    property notSelected: boolean read fNotSelected;

    property TypeItem: TTypeItemKladr read fTypeItem write fTypeItem;
    property ChildFrame: TFrameItemKLADR read fChildFrame write fChildFrame;

    function OpenData(Aid: integer = 0): Boolean; override;
    function SaveData: Boolean; override;

    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}
uses
  System.StrUtils, formKLADRList, DM_Main;

{ TFrameItemKLADR }

procedure TFrameItemKLADR.btnEditClick(Sender: TObject);
var
  frm: TfrmKLADRList;
begin
  if QuerySearch.Active then
    QuerySearch.Close;

    QuerySearch.Open;
    QuerySearch.FetchAll;

  try
    frm := TfrmKLADRList.Create(self);
    frm.DS.DataSet := QuerySearch;
    frm.ShowModal;
    if frm.ModalResult = mrOk then
    begin
      fNotSelected := False;
      if QuerySearch.RecordCount > 0 then
      begin
        Code := QuerySearch.FieldByName('CODE').AsString;
        SetEdtText(QuerySearch);
      end;
    end;
  finally
    FreeAndNil(frm);
  end;


end;

constructor TFrameItemKLADR.Create(AOwner: TComponent);
begin
  inherited;
  fAutoAppend := False;
  fRegion := 0;
  fArea := 0;
  fCity := 0;
  fSite := 0;
  fStreet := 0;
  fDom := 0;
  fActive := 0;
end;

procedure TFrameItemKLADR.edtNameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Ord(Key) > 31 then
    fNotSelected := True;
end;

function TFrameItemKLADR.OpenData(Aid: integer): Boolean;
begin
  //result := inherited OpenData(aid);
  try
    if Query.Active then
       Query.Close;
    SetQueryParam(Query);
    Query.Open;
    DS.DataSet := Query;
    result := true;
  except
    result := false;
  end;
  SetEdtText(Query);
end;

procedure TFrameItemKLADR.QueryBeforeOpen(DataSet: TDataSet);
begin
  SetQueryParam(TIBQuery(DataSet));
end;

procedure TFrameItemKLADR.QuerySearchBeforeOpen(DataSet: TDataSet);
begin
  SetQueryParam(TIBQuery(DataSet));
end;

function TFrameItemKLADR.SaveData: Boolean;
begin
  result := true;
  fCode := Query.FieldByName('CODE').AsString;
end;

procedure TFrameItemKLADR.SetCode(AValue: string);
begin
  if (fCode = Avalue) or (AValue = '') then
    Exit;

  fCode := AValue;

  fCodeRegion := '';
  fCodeArea   := '';
  fCodeCity   := '';
  fCodeSite   := '';
  fCodeStreet := '';
  fCodeDom    := '';

  fRegion := StrToInt(LeftStr(fCode, 2));
  fCodeRegion := LeftStr(fCode, 2) + DupeString('0', 11);

  fArea := StrToInt(Copy(fCode, 3, 3));
  if fArea > 0 then
    fCodeArea := LeftStr(fCode, 2) + Copy(fCode, 3, 3) + DupeString('0', 8);

  fCity := StrToInt(Copy(fCode, 6, 3));
  if fCity > 0 then
    fCodeCity := LeftStr(fCode, 5) + Copy(fCode, 6, 3) + DupeString('0', 5);

  fSite := StrToInt(Copy(fCode, 9, 3));
  if fSite > 0 then
    fCodeSite := LeftStr(fCode, 8) + Copy(fCode, 9, 3) + DupeString('0', 2);

  if Length(fCode) > 13 then
    fStreet := StrToInt(Copy(fCode, 12, 4));
  if fStreet > 0 then
    fCodeStreet := LeftStr(fCode, 11) + Copy(fCode, 12, 4) + DupeString('0', 2);

  if Length(fCode) > 17 then
    fDom := StrToInt(Copy(fCode, 16, 4));
  if fDom > 0 then
    fCodeDom := fCode; //LeftStr(fCode, 15) + Copy(fCode, 16, 4);

  if Length(fCode) < 18 then
    fActive := StrToInt(RightStr(fCode, 2));

  if Assigned(ChildFrame) then
    if (ChildFrame.Region <> Region) or
       (ChildFrame.Area <> Area) or
       (ChildFrame.City <> City) or
       (ChildFrame.Site <> Site) or
       (ChildFrame.Street <> Street) then
      ChildFrame.Code := Code;

  if (region > 0) and ((TypeItem = tikArea) or
                       (TypeItem = tikCity) or
                       (TypeItem = tikSite) or
                       (TypeItem = tikStreet)) then
    self.Enabled := true;
 end;

procedure TFrameItemKLADR.SetEdtText(AQuery: TIBQuery);
begin
  if AQuery.RecordCount > 0 then
  begin
    edtName.Text := Trim(AQuery.FieldByName('NAME').AsString);
    edtSocr.Text := Trim(AQuery.FieldByName('SOCR').AsString);
  end;
  if Assigned(fChildFrame) then
    if AQuery.RecordCount > 0 then
      fChildFrame.Enabled := true;
end;

procedure TFrameItemKLADR.SetQueryParam(AQuery: TIBQuery);
var
  prm: TParam;
  sstr: string;
begin
//  AQuery.Params.ParseSQL(AQuery.SQL.text, true);
//  AQuery.ParamCheck := True;

  prm := AQuery.Params.FindParam('REGION_ID'); // регион
  if prm <> nil then
    prm.AsInteger := fRegion;

  prm := AQuery.Params.FindParam('AREA_ID'); //район
  if prm <> nil then
    prm.AsInteger := fArea;

  prm := AQuery.Params.FindParam('CITY_ID'); //город
  if prm <> nil then
    prm.AsInteger := fCity;

  prm := AQuery.Params.FindParam('SITE_ID'); //нас. пункт
  if prm <> nil then
    prm.AsInteger := fSite;

  prm := AQuery.Params.FindParam('Street_ID'); // улица
  if prm <> nil then
    prm.AsInteger := fStreet;

  prm := AQuery.Params.FindParam('Dom_ID'); // дом
  if prm <> nil then
    prm.AsInteger := fDom;

  prm := AQuery.Params.FindParam('CODE_REGION'); // регион
  if prm <> nil then
    prm.AsString := fCodeRegion;

  prm := AQuery.Params.FindParam('CODE_AREA'); //район
  if prm <> nil then
    prm.AsString := fCodeArea;

  prm := AQuery.Params.FindParam('CODE_CITY'); //город
  if prm <> nil then
    prm.AsString := fCodeCity;

  prm := AQuery.Params.FindParam('CODE_SITE'); //нас. пункт
  if prm <> nil then
    prm.AsString := fCodeSite;

  prm := AQuery.Params.FindParam('CODE_Street'); // улица
  if prm <> nil then
    prm.AsString := fCodeStreet;

  prm := AQuery.Params.FindParam('CODE_Dom'); // дом
  if prm <> nil then
    prm.AsString := fCodeDom;

  if fNotSelected then
    sstr := Trim(edtName.Text);

  if (AQuery.Params.FindParam('searchstr') <> nil) then
    AQuery.ParamByName('searchstr').AsString :=
      '%' + sstr + '%';
end;

procedure TFrameItemKLADR.SetTransaction(AValue: TIBTransaction);
begin
  inherited;
  QuerySearch.Transaction := AValue;
end;

end.
