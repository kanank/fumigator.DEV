unit formIncomeCalls;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, RzPanel, Data.DB,
  cxTextEdit, cxMaskEdit, cxDBEdit, Vcl.StdCtrls, RzButton, Vcl.ExtCtrls,
  dxGDIPlusClasses, frameBase, frPersonSmall, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxLabel, cxDBLabel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  TfrmIncomeCall = class(TSimpleForm)
    Label11: TLabel;
    DS: TDataSource;
    grpBox: TRzGroupBox;
    FramePerson: TFramePersonSmall;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    grdDog: TcxGrid;
    grdDogDBTableView1: TcxGridDBTableView;
    grdDogDBTableView1Column1: TcxGridDBColumn;
    grdDogLevel1: TcxGridLevel;
    grdDogDBTableView1Column2: TcxGridDBColumn;
    grdDogDBTableView1Column3: TcxGridDBColumn;
    grdDogDBTableView1Column4: TcxGridDBColumn;
    Label3: TLabel;
    btnTransfer: TRzButton;
    edtPhone: TcxMaskEdit;
    cmbFormat: TcxLookupComboBox;
    cmbStatus: TcxLookupComboBox;
    lblWorker: TcxLabel;
    btnOk: TRzButton;
    procedure FormCreate(Sender: TObject);
    procedure Exit_bntClick(Sender: TObject);
    procedure btnTransferClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure doAcceptCall; override;
    procedure doFinishCall; override;
    procedure Setcontrols; override;

  public
    finished: Boolean;
    function CallFinish(ACallId: string; AClientId: Integer): string;
  end;

var
  frmIncomeCall: TfrmIncomeCall;

implementation

{$R *.dfm}
uses
  DM_Main, formIncomeCallRoot, formCallEvent, formClientFiz;


procedure TfrmIncomeCall.btnOkClick(Sender: TObject);
begin

  if Assigned(frmClientFiz) then
  try
    frmClientFiz.butOK.Click;
     fCanClose := True;
     ModalResult := mrClose;
  finally

  end
  else
  begin
    fCanClose := True;
    ModalResult := mrClose;
  end;


end;

procedure TfrmIncomeCall.btnTransferClick(Sender: TObject);
begin
  fCanClose := True;

  if finished then //после окончания звонка можно закрыть
    ModalResult := mrCancel;
end;

function TfrmIncomeCall.CallFinish(ACallId: string; AClientId: Integer): string;
begin
  finished := True;
  ModalResult := mrOk;
end;

procedure TfrmIncomeCall.doAcceptCall;
begin
  inherited;
  btnTransfer.Caption := 'Закрыть';
  if Assigned(frmCallEvent) then
    frmCallEvent.ModalResult := mrOk;
end;

procedure TfrmIncomeCall.doFinishCall;
begin
  inherited;
  finished := True;
  btnTransfer.Caption := 'Закрыть';
end;

procedure TfrmIncomeCall.Exit_bntClick(Sender: TObject);
begin
  fCanClose := True;
  frmIncomeCallRoot.ClientClose := False;
end;

procedure TfrmIncomeCall.FormCreate(Sender: TObject);
begin
  inherited;
  fCanClose := False;
end;

procedure TfrmIncomeCall.Setcontrols;
begin
  Exit_bnt.Enabled := UserRights.WorkClientCard;
end;

end.
