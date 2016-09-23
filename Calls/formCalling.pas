unit formCalling;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, dxGDIPlusClasses, Vcl.ExtCtrls, cxDBEdit, Vcl.StdCtrls, RzPanel,
  Data.DB, RzButton, IBX.IBCustomDataSet, IBX.IBQuery, dxSkinsCore, dxSkinBlack,
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

type
  TfrmCalling = class(TBaseForm)
    Image1: TImage;
    edtPhone: TcxMaskEdit;
    pnlFiz: TRzPanel;
    Label11: TLabel;
    edtFamily: TcxDBTextEdit;
    pnlUr: TRzPanel;
    Label1: TLabel;
    edtNameOrg: TcxDBTextEdit;
    Label2: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    DS: TDataSource;
    Label3: TLabel;
    Exit_bnt: TRzButton;
    btnTransferCall: TRzButton;
    RzButton2: TRzButton;
    btnDeleteCall: TRzButton;
    Q: TIBQuery;
    procedure edtPhoneMouseEnter(Sender: TObject);
    procedure edtPhoneMouseLeave(Sender: TObject);
    procedure edtPhoneClick(Sender: TObject);
    procedure Exit_bntClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnDeleteCallClick(Sender: TObject);
  private
    fCallId: string;
    procedure SetCallId(AValue: string);
    function GetCallFinished: boolean;
  public
    AtsPhone: string;
    Phone: string;
    CallResult: string;
    property CallId: string read fCallId write SetCallId;
    property CallFinished: boolean read GetCallFinished;
    procedure CallFinish;
    procedure CheckSession;
  end;

var
  frmCalling: TfrmCalling;

implementation

{$R *.dfm}

uses
  DM_Main, frmMain, formSessionResult, CommonTypes, formClientCard;


procedure TfrmCalling.CallFinish;
begin
  Self.CallResult := DM.FinishSession('', Self.DS.Dataset.FieldByName('ID').AsInteger, CallId);
  ModalResult := mrOk;
  (*frmSessionResult := TfrmSessionResult.Create(nil);
  with frmSessionResult do
  try
    if Q.Transaction.Active then
      Q.Transaction.CommitRetaining;

    Q.ParamByName('callid').AsString := Callid;
    Q.Open;
    Q.Edit;
    Q.FieldByName('worker_id').AsInteger := DM.CurrentUserSets.ID;
    Q.FieldByName('client_id').AsInteger := Self.DS.Dataset.FieldByName('ID').AsInteger;
    Self.CallResult := Q.FieldByName('callresult').AsString;
    ShowModal;
    if Q.Modified then
    try
      Q.Post;
      if Q.Transaction.Active then
         Q.Transaction.CommitRetaining;
    except
       if Q.Transaction.Active then
         Q.Transaction.RollbackRetaining;
    end;

  finally
    FreeAndNil(frmSessionResult);
  end; *)
end;

procedure TfrmCalling.CheckSession;
begin
  if DM.CheckCloseSession('', CallId) then
    CallFinish;

  (*Q.Close;
  Q.ParamByName('callid').AsString := CallId;
  if Q.Transaction.Active then
    Q.Transaction.CommitRetaining;
  try
    Q.Open;
    if Q.RecordCount > 0  then
      CallFinish;
  except
    if Q.Transaction.Active then
     Q.Transaction.RollbackRetaining;
  end;*)

end;

procedure TfrmCalling.edtPhoneClick(Sender: TObject);
begin
  try
    DM.inCalling := True;
    //formMain.ClientSocket.Socket.SendText('#call:' + AtsPhone + ',' + Phone + ',' + AtsPhone);
  finally
    DM.inCalling := False;
  end;
end;

procedure TfrmCalling.edtPhoneMouseEnter(Sender: TObject);
begin
  inherited;
  edtPhone.Style.Font.Style := [fsBold, fsUnderline];
  edtPhone.Cursor := crHandPoint;
end;

procedure TfrmCalling.edtPhoneMouseLeave(Sender: TObject);
begin
  inherited;
  edtPhone.Style.Font.Style := [];
end;

procedure TfrmCalling.Exit_bntClick(Sender: TObject);
begin
  TfrmClientCard.ShowClientCard(DS.DataSet.FieldByName('id').AsInteger);
end;

procedure TfrmCalling.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if DM.inCalling and not CallFinished then
    CanClose := False;
end;

function TfrmCalling.GetCallFinished: boolean;
begin
  Result := (CallResult <> '');
end;

procedure TfrmCalling.btnDeleteCallClick(Sender: TObject);
begin
  try
    //formMain.ClientSocket.Socket.SendText('#calldelete:' + Self.CallId);
  finally
    DM.inCalling := False;
  end;
end;

procedure TfrmCalling.SetCallId(AValue: string);
begin
  if AValue <> fCallId then
  begin
    fCallId := AValue;
    btnDeleteCall.Enabled   := (fCallId <> '');
    btnTransferCall.Enabled := (fCallId <> '');
  end;

end;

end.
