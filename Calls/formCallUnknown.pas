unit formCallUnknown;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, RzLabel,
  cxTextEdit, cxMaskEdit, cxDBEdit, Vcl.StdCtrls, RzButton, Vcl.ExtCtrls,
  RzPanel, dxGDIPlusClasses, Data.DB, Vcl.Menus, dxSkinsCore, dxSkinBlack,
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
  System.Actions, Vcl.ActnList;

type
  TfrmCallUnknown = class(TSimpleForm)
    RzLabel1: TRzLabel;
    btnPost: TRzButton;
    DS: TDataSource;
    edtPhone: TcxMaskEdit;
    btnLID: TRzMenuButton;
    btnCorporate: TRzButton;
    btnErrorCall: TRzButton;
    pmNewClient: TPopupMenu;
    NewFizClnt_mi: TMenuItem;
    NewURClnt_mi: TMenuItem;
    pmExistsClient: TPopupMenu;
    mExistsClient: TMenuItem;
    mExistsContact: TMenuItem;
    btnAddToExist: TRzMenuButton;
    ActionList: TActionList;
    acExistClient: TAction;
    procedure FormCreate(Sender: TObject);
    procedure Exit_bntClick(Sender: TObject);
    procedure btnClick(Sender: TObject);
    procedure NewFizClnt_miClick(Sender: TObject);
    procedure NewURClnt_miClick(Sender: TObject);
    procedure mExistsClientClick(Sender: TObject);
  private
    fOutcomeCall: Boolean;
    procedure SetOutcomeCall(AValue: boolean);
  protected
    procedure doFinishCall; override;
    procedure doAcceptCall; override;
  public
    TypeBtnClick: string; //нажатая кнопка
    SubTypeBtnClick: string; //подтип
    ContactType: integer;
    SelectId: Integer;
    ResultSaved: Boolean;
    property OutcomeCall: Boolean read fOutcomeCall write SetOutcomeCall;
  end;

var
  frmCallUnknown: TfrmCallUnknown;

implementation

{$R *.dfm}

uses
  DM_Main, formClientFiz, formClientUr, CommonTypes, frmMain,
  formClients, formSessionResult, CommonVars, ClassSprForm, formCallEvent;


{ TfrmCallUnknown }



procedure TfrmCallUnknown.btnClick(Sender: TObject);
begin
  TypeBtnClick := TComponent(Sender).Name;
  fCanClose := True;

  if (TypeBtnClick <> btnLID.Name) then
  begin
    ResultSaved := False;
    if not Assigned(frmSessionResult) then
      frmSessionResult := TfrmSessionResult.Create(nil);
    with frmSessionResult do
    begin
      btnBack.Visible := True;
      btnCardNoCreated.Enabled := False;
      btnConsult.Enabled := False;
      btnNonConsult.Enabled := False;
      btnOther.Enabled := False;
      edtIshod.Text := TRzButton(Sender).Caption;
      ShowOnTop := True;
      //frmSessionResult.FormStyle := fsStayOnTop;
      NeedCheckCall := False;
      try
        frmSessionResult.ShowModal;
      finally
        NeedCheckCall := True;
      end;

      if frmSessionResult.ModalResult = mrClose then
        Exit;
      fCanClose := True;
    end;
  end;

  ModalResult := mrOk;
end;

procedure TfrmCallUnknown.doAcceptCall;
begin
  inherited;
  if Assigned(frmCallEvent) then
    frmCallEvent.ModalResult := mrOk;
end;

procedure TfrmCallUnknown.doFinishCall;
begin
  //if not CallObj.Accepted then
  //  ModalResult := mrCancel;
end;

procedure TfrmCallUnknown.Exit_bntClick(Sender: TObject);
begin
  fCanClose := True;
end;

procedure TfrmCallUnknown.FormCreate(Sender: TObject);
begin
  inherited;
  fCanClose := false;
end;

procedure TfrmCallUnknown.mExistsClientClick(Sender: TObject);
var
  fSpr: TfrmClients;
  f: Boolean;
begin
  if not DM.Clients.Active then
    DM.Clients.Open;

  fSpr := TfrmClients.Create(self);
  try
    fSpr.FormRegim := sfrSelect;
    fSpr.FormStyle := fsStayOnTop;
    fSpr.ShowModal;
    f := fSpr.ModalResult = mrOk;
    if f then //выбран клиент
    begin
      TypeBtnClick := btnAddToExist.Name;
      SelectId := fSpr.DS.DataSet.FieldByName('id').AsInteger;
    end;
  finally
    FreeAndNil(fSpr);
    if f then
    begin
      fCanClose := True;
      frmCallUnknown.ModalResult := mrOk;
    end;
  end;
end;

procedure TfrmCallUnknown.NewFizClnt_miClick(Sender: TObject);
begin
  SubTypeBtnClick := 'FIZ';
  btnClick(btnLID);
end;

procedure TfrmCallUnknown.NewURClnt_miClick(Sender: TObject);
begin
  SubTypeBtnClick := 'UR';
  btnClick(btnLID);
end;

procedure TfrmCallUnknown.SetOutcomeCall(AValue: boolean);
begin
  fOutcomeCall := AValue;

  if AValue then
    Caption := 'Исходящий звонок. Клиент не найден'
  else
    Caption := 'Входящий звонок. Клиент не найден';

end;

end.
