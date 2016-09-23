unit frListBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, RzButton,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls, RzPanel,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL,
  ClassFormEditData, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter;

type
  TFrameListBase = class(TDbFrameBase)
    grpPhone: TRzGroupBox;
    grdPhoneLevel1: TcxGridLevel;
    grdPhone: TcxGrid;
    RzPanel2: TRzPanel;
    btnAdd: TRzBitBtn;
    btnEdit: TRzBitBtn;
    btnDel: TRzBitBtn;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure DSDataChange(Sender: TObject; Field: TField);
  private
    FEditFormClass: TfrmEditDataClass;
  protected
    procedure SetEnabled; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    property EditFormClass: TfrmEditDataClass read FEditFormClass write FEditFormClass;
  end;

implementation

{$R *.dfm}

{ TFrameListBase }

procedure TFrameListBase.btnAddClick(Sender: TObject);
var
  frm: TfrmEditData;
begin
  try
    try
      Query.Append;
      frm := EditFormClass.Create(self);
      frm.DS.DataSet := Query;

      frm.ShowModal;
      if frm.ModalResult = mrOk then
        Query.Post
      else
        Query.Cancel;
    except
      Query.Cancel;
    end;
  finally
    FreeAndNil(frm);
  end;
end;

procedure TFrameListBase.btnDelClick(Sender: TObject);
begin
  if Application.MessageBox('Вы действительно хотите удалить запись?',
      'Подтверждение', MB_ICONQUESTION + MB_YESNO) = IDNO then
    Exit;
  Query.Delete;
end;

procedure TFrameListBase.btnEditClick(Sender: TObject);
var
  frm: TfrmEditData;
begin
  try
    try
      Query.Edit;
      frm := EditFormClass.Create(self);
      frm.DS.DataSet := Query;

      frm.ShowModal;
      if frm.ModalResult = mrOk then
        Query.Post
      else
        Query.Cancel;
    except
      Query.Cancel;
    end;
  finally
    FreeAndNil(frm);
  end;
end;

constructor TFrameListBase.Create(AOwner: TComponent);
begin
  inherited;
  fAutoAppend := False; //для списков выключаем
  EditFormClass := TfrmEditData;
end;

procedure TFrameListBase.DSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  SetEnabled;
end;

procedure TFrameListBase.SetEnabled;
begin
  btnAdd.Enabled := True;
  btnEdit.Enabled := (Query.RecordCount > 0);
  btnDel.Enabled := btnEdit.Enabled;
end;

end.
