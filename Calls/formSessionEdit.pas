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
    RzPanel2: TRzPanel;
    pnlClientResult: TRzPanel;
    pnlResult: TRzPanel;
    pnlClient: TScrollBox;
    procedure btnClientEditClick(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlClientResize(Sender: TObject);
  private
    { Private declarations }
    procedure SetCaptionClient;
  protected
    procedure SetControls; override;
  public
    frm: TForm;
    frmResult: TForm;
    AddedClientId: integer;
    procedure SetClientForm;
    procedure SetupClientForm(AClientId: integer);
  end;

var
  frmSessionEdit: TfrmSessionEdit;

implementation

{$R *.dfm}

uses
  formSessionResult, formClientFiz, formClientUr, CommonTypes,
   formClients, ClassSprForm, DM_Main;

procedure TfrmSessionEdit.btnClientEditClick(Sender: TObject);
var
  fSpr: TfrmClients;
  f: Boolean;
begin
  if Assigned(frm) then //редактирование клиента
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
  end
  else
  begin //добавление клиента
    fSpr := TfrmClients.Create(self);
    try
      fSpr.FormRegim := sfrSelectAdd;
      fSpr.FormStyle := fsStayOnTop;
      fSpr.ShowModal;
      f := fSpr.ModalResult = mrOk;
      if f then //выбран клиент
      begin
        AddedClientId := fSpr.DS.DataSet.FieldByName('id').AsInteger;
        SetupClientForm(fSpr.DS.DataSet.FieldByName('id').AsInteger);

        if Assigned(frm) then
        begin
          pnlClient.Width := Self.Width - pnlResult.Width + 5;
          if pnlClient.Tag > frmResult.Height then
            pnlClientResult.Height := pnlClient.Tag + 1;
          //pnlCalls.Height := Self.ClientHeight - pnlClient.Tag - 1;
          pnlClient.Height := pnlClient.Tag;
          pnlClient.HorzScrollBar.Range := frm.Width;
        end;
      end;
    finally
      FreeAndNil(fSpr);
    end;

  end;
end;

procedure TfrmSessionEdit.FormDestroy(Sender: TObject);
begin
  if Assigned(frm) then
  begin
    frm.hide;
    frm.Parent := nil;
    {if frm is TfrmClientFiz then
    begin
      frmClientFiz.Free;
      frmClientFiz := nil;
    end
    else
    if frm is TfrmClientUr then
    begin
      frmClientUr.Free;
      frmClientUr := nil;
    end;}
    FreeAndNil(frm);
    frm := nil;
  end;

  if Assigned(frmResult) then
  begin
    frmResult.Parent := nil;
    frmResult.Free;
    frmResult := nil;
    //frmSessionResult := nil;
  end;

  inherited;

end;

procedure TfrmSessionEdit.FormShow(Sender: TObject);
var
  w, h: integer;
begin
  Self.Constraints.MaxHeight := Screen.WorkAreaHeight - 20;
  Self.Constraints.MaxWidth := Screen.WorkAreaWidth - 20;

  //btnClientEdit.Enabled := Assigned(frm);

  //pnlClient.Top := pnlResult.Height + 1;
  //pnlCalls.Top  := pnlClient.Top + pnlClient.Height + 1;
  //ScrollBox.VertScrollBar.Range := pnlCalls.Top + pnlcalls.Height;
  //ScrollBox.VertScrollBar.Visible := True;

  w := pnlCalls.Width + 10;
  h := frmResult.Height + pnlCalls.Height + RzPanel1.Height + 10;

  if Assigned(frm) then
  begin
    SetClientForm;
    if frm.Width + frmResult.Width > w then
      w := frm.Width + frmResult.Width;
    if pnlClient.Tag > frmResult.Height then
      h := h + pnlClient.Tag - frmResult.Height;
  end
  else
  begin
    pnlClient.Height := 0;
    pnlClient.Width := 0;
  end;

  Self.ClientHeight := h;
  Self.ClientWidth  := w;

  pnlResult.Width  := frmResult.Width;
  pnlResult.Height := frmResult.Height;

  if Assigned(frm) then
  begin
    pnlClient.Width := Self.Width - pnlResult.Width + 5;
    if pnlClient.Tag > frmResult.Height then
      pnlClientResult.Height := pnlClient.Tag + 1;
    //pnlCalls.Height := Self.ClientHeight - pnlClient.Tag - 1;
    pnlClient.Height := pnlClient.Tag;
    pnlClient.HorzScrollBar.Range := frm.Width;
  end;

end;

procedure TfrmSessionEdit.pnlClientResize(Sender: TObject);
begin
 // if TWinControl(Sender).Height > pnlClientResult.Height then
 //   pnlClientResult.Height := TWinControl(Sender).Height + 1;
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

procedure TfrmSessionEdit.SetCaptionClient;
begin
  if Assigned(frm) then
    btnClientEdit.Caption := 'Изменить карточку клиента'
  else
    btnClientEdit.Caption := 'Добавить клиента';
end;

procedure TfrmSessionEdit.SetClientForm;
begin
  //btnClientEdit.Enabled := Assigned(frm);
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

    pnlClient.Tag := frm.Height - TfrmClientFiz(frm).RzPanel1.Height -
      TfrmClientFiz(frm).frameClientCalls.Height + 3 ;
    if pnlClient.Tag > frmResult.Height then
      self.ClientHeight := pnlClient.Tag + pnlCalls.Height + RzPanel1.Height + 10;
    pnlClient.Height := pnlClient.Tag;

    TfrmClientFiz(frm).Mode := asShow;
    pnlClient.Visible := True;
    SetCaptionClient;
  end

  else

  begin
    TfrmClientUr(frm).RzPanel1.Visible := false;
    TfrmClientUr(frm).FrameClientCalls.Visible := False;

    pnlClient.Height := frm.Height - TfrmClientUr(frm).RzPanel1.Height -
      TfrmClientUr(frm).frameClientCalls.Height + 3;
    TfrmClientUr(frm).Mode := asShow;
  end;

  if self.Width > frm.Width + pnlResult.Width then
    self.Width := frm.Width + pnlResult.Width;
  //pnlClient.Top := pnlResult.Height + 1;
 // pnlClient.Height := frm.Height;

  frm.Left := 3;
  frm.Show;

  if Self.Height > Screen.WorkAreaHeight then
    Self.Height := Screen.WorkAreaHeight - 10;

  btnClientEdit.Enabled := Assigned(frm);
  //Self.VertScrollBar.Visible := True;
end;

procedure TfrmSessionEdit.SetControls;
begin
  inherited;
  SetCaptionClient;
end;

procedure TfrmSessionEdit.SetupClientForm(AClientId: integer);
var
  prm: TFrmCreateParam;
  mres: TModalResult;
begin
 //карточка клиента
  DM.GetDataset(DM.Clients);

  if DM.Clients.Locate('id', AClientId, []) then
  begin
    prm := NewFrmCreateParam(asShow, DM.Clients);
    if DM.Clients.FieldByName('type_cli').AsInteger = 0 then
    begin
      frm := TfrmClientFiz.Create(nil, '', @prm);
      //frm := frmClientFiz;
    end
    else
    begin
      frm := TfrmClientUr.Create(nil, '', @prm);
      //frm := frmClientUr;
    end;
  end;
  SetClientForm;
  SetCaptionClient;
end;

end.
