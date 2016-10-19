unit formIncomeCallsUr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formIncomeCalls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxDBLookupComboBox, cxLabel, cxDBLabel, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, frameBase, frPersonSmall,
  RzPanel, cxTextEdit, cxMaskEdit, cxDBEdit, RzButton, Vcl.ExtCtrls,
  Vcl.StdCtrls, dxGDIPlusClasses, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  TfrmIncomeCallUr = class(TfrmIncomeCall)
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtPersonName: TcxDBTextEdit;
    Label8: TLabel;
    cmbForma: TcxLookupComboBox;
    edtINN: TcxTextEdit;
    edtName: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure Exit_bntClick(Sender: TObject);
    procedure btnTransferClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure doAcceptCall; override;
    procedure doFinishCall; override;
    procedure Setcontrols; override;
  public
    { Public declarations }
  end;

var
  frmIncomeCallUr: TfrmIncomeCallUr;

implementation

{$R *.dfm}
uses
  DM_Main, formIncomeCallRoot, formCallEvent;


procedure TfrmIncomeCallUr.btnTransferClick(Sender: TObject);
begin
  fCanClose := True;

  if finished then //после окончани€ звонка можно закрыть
    ModalResult := mrCancel;
end;

procedure TfrmIncomeCallUr.doAcceptCall;
begin
  inherited;
  if Assigned(frmCallEvent) then
    frmCallEvent.ModalResult := mrOk;
end;

procedure TfrmIncomeCallUr.doFinishCall;
begin
  inherited;
  finished := True;
  btnTransfer.Caption := '«акрыть';
end;

procedure TfrmIncomeCallUr.Exit_bntClick(Sender: TObject);
begin
  fCanClose := True;
  frmIncomeCallRoot.ClientClose := False;
end;

procedure TfrmIncomeCallUr.FormCreate(Sender: TObject);
begin
  inherited;
    fCanClose := false;
end;

procedure TfrmIncomeCallUr.Setcontrols;
begin
  Exit_bnt.Enabled := UserRights.WorkClientCard;
end;

end.
