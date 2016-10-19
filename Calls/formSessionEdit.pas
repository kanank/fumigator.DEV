unit formSessionEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, RzButton, Vcl.ExtCtrls,
  RzPanel, dxGDIPlusClasses, frameBase, frListBase, frClientCalls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
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
  cxScrollBox;

type
  TfrmSessionEdit = class(TSimpleForm)
    RzButton1: TRzButton;
    btnClientEdit: TRzButton;
    ScrollBox: TScrollBox;
    pnlCalls: TRzPanel;
    frameClientCalls: TframeClientCalls;
    pnlClient: TRzPanel;
    pnlResult: TRzPanel;
    procedure btnClientEditClick(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    frm: TForm;
    frmResult: TForm;
    procedure SetClientForm;
  end;

var
  frmSessionEdit: TfrmSessionEdit;

implementation

{$R *.dfm}

uses
  formSessionResult, formClientFiz, formClientUr, CommonTypes;

procedure TfrmSessionEdit.btnClientEditClick(Sender: TObject);
begin
  frm.Hide;
  frm.BorderIcons := [biSystemMenu, biMaximize];
  frm.BorderStyle := bsSizeable;
  frm.Parent      := nil;
  frm.Position    := poDesktopCenter;

  if frm is TfrmClientFiz then
  begin
    TfrmClientFiz(frm).RzPanel1.Visible := True;
    TfrmClientFiz(frm).FrameClientCalls.Visible := True;
    frm.Height := frm.Height + TfrmClientFiz(frm).RzPanel1.Height +
      TfrmClientFiz(frm).frameClientCalls.Height ;
    TfrmClientFiz(frm).Mode := asEdit;
  end

  else

  begin
    TfrmClientUr(frm).RzPanel1.Visible := True;
    TfrmClientUr(frm).FrameClientCalls.Visible := True;
    frm.Height := frm.Height + TfrmClientUr(frm).RzPanel1.Height +
      TfrmClientUr(frm).frameClientCalls.Height;
    TfrmClientUr(frm).Mode := asEdit;
  end;

  frm.ShowModal;
  SetClientForm;
end;

procedure TfrmSessionEdit.FormDestroy(Sender: TObject);
begin
  if Assigned(frm) then
  begin
    frm.hide;
    frm.Parent := nil;
    if frm is TfrmClientFiz then
    begin
      frmClientFiz.Free;
      frmClientFiz := nil;
    end
    else
    if frm is TfrmClientUr then
    begin
      frmClientUr.Free;
      frmClientUr := nil;
    end;
    frm := nil;
  end;

  if Assigned(frmResult) then
  begin
    frmResult.Parent := nil;
    frmResult.Free;
    frmResult := nil;
    frmSessionResult := nil;
  end;

  inherited;

end;

procedure TfrmSessionEdit.FormShow(Sender: TObject);
begin
  btnClientEdit.Enabled := Assigned(frm);

  pnlClient.Top := pnlResult.Height + 1;
  pnlCalls.Top  := pnlClient.Top + pnlClient.Height + 1;
  ScrollBox.VertScrollBar.Range := pnlCalls.Top + pnlcalls.Height;
  ScrollBox.VertScrollBar.Visible := True;

end;

procedure TfrmSessionEdit.RzButton1Click(Sender: TObject);
begin
  if Assigned(frmResult) and TfrmSessionResult(frmResult).isModified then
  begin
    if TfrmSessionResult(frmResult).CheckFields then
      ModalResult := mrOk;
  end
  else
    ModalResult := mrOk;
end;

procedure TfrmSessionEdit.SetClientForm;
begin
  btnClientEdit.Enabled := Assigned(frm);
  if not Assigned(frm) then
    Exit;

  frm.BorderIcons := [];
  frm.BorderStyle := bsNone;
  frm.Parent      := pnlClient;
  frm.Position    := poDefault;

  if frm is TfrmClientFiz then
  begin
    TfrmClientFiz(frm).RzPanel1.Visible := False;
    TfrmClientFiz(frm).FrameClientCalls.Visible := False;

    pnlClient.Height := frm.Height - TfrmClientFiz(frm).RzPanel1.Height -
      TfrmClientFiz(frm).frameClientCalls.Height ;
    TfrmClientFiz(frm).Mode := asShow;
  end

  else

  begin
    TfrmClientUr(frm).RzPanel1.Visible := false;
    TfrmClientUr(frm).FrameClientCalls.Visible := False;
    frm.Height := frm.Height - TfrmClientUr(frm).RzPanel1.Height -
      TfrmClientUr(frm).frameClientCalls.Height;
    TfrmClientUr(frm).Mode := asShow;
  end;

  if frm.Width > self.Width then
    self.Width := frm.Width;
  pnlClient.Top := pnlResult.Height + 1;
 // pnlClient.Height := frm.Height;

  frm.Show;

  if Self.Height > Screen.WorkAreaHeight then
    Self.Height := Screen.WorkAreaHeight - 10;

  btnClientEdit.Enabled := Assigned(frm);
  //Self.VertScrollBar.Visible := True;
end;

end.
