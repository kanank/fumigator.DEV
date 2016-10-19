unit frmWorker;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit, Vcl.StdCtrls,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxGroupBox, DM_Main,
  RzButton, Vcl.ExtCtrls, RzPanel, RzTabs, cxMemo, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCurrencyEdit, cxCheckBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxListBox, cxImage, ClassSimpleForm,
  dxGDIPlusClasses, frameBase, frPersonSmall, frPersonSmallFoto,
  frPersonFullFoto, frListBase, frWorkerRegions, dxSkinsCore, dxSkinBlack,
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
  TfrmWorker = class(TSimpleForm)
    RzPageControl1: TRzPageControl;
    Short_Tab: TRzTabSheet;
    Full_Tab: TRzTabSheet;
    RzPanel3: TRzPanel;
    Save_btn: TRzButton;
    Cancel_btn: TRzButton;
    RzPanel5: TRzPanel;
    FullForm_btn: TRzButton;
    _FramePersonSmall: TFramePersonSmallFoto;
    _FramePersonFull: TFramePersonFullFoto;
    RzPanel4: TRzPanel;
    Label28: TLabel;
    ATSNUM_edt: TcxDBTextEdit;
    Label25: TLabel;
    Label26: TLabel;
    RzPanel6: TRzPanel;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label2: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    RzPanel2: TRzPanel;
    Label3: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    DS: TDataSource;
    FrameRegions: TFrameWorkerRegions;
    Label4: TLabel;
    cmbUserType: TcxDBLookupComboBox;
    procedure FullForm_btnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Save_btnClick(Sender: TObject);
    procedure Cancel_btnClick(Sender: TObject);
    procedure Exit_bntClick(Sender: TObject);
    procedure _FramePersonFullcmbDateBirthPropertiesInitPopup(Sender: TObject);
  private
    { Private declarations }
  protected
   procedure SetControls; override;
  public
    { Public declarations }
  end;

var
  formWorker: TfrmWorker;

implementation

{$R *.dfm}

uses
  System.StrUtils, CommonTypes, IBX.IBQuery, frPersonFull, CommonVars;


procedure TfrmWorker.Cancel_btnClick(Sender: TObject);
begin
  if DS.DataSet.Modified then
  begin
    DS.DataSet.Cancel;
    TIBQuery(DS.DataSet).CancelUpdates;
    TIBQuery(DS.DataSet).RevertRecord;
  end;
  _FramePersonFull.Cancel;
end;

procedure TfrmWorker.Exit_bntClick(Sender: TObject);
begin
  if DS.DataSet.Modified then
    if Application.MessageBox('Имеются несохраненные изменения!' + #13#10 +
        'Продолжить без сохранения?', 'Внимание',
        MB_ICONWARNING + MB_YESNO) = IdNo then
      TButton(Sender).ModalResult := mrNone
    else
      Cancel_btn.Click;
end;

procedure TfrmWorker.FormCreate(Sender: TObject);
begin
  inherited;
  if fFrmParam.Dataset <> nil then
    DS.DataSet := fFrmParam.Dataset;

  case fFrmParam.action of
    asCreate:
      begin
        FullForm_btn.Click;

        Title := Title + ' [новая запись]';
        if (DS.DataSet <> nil) and DS.DataSet.Active then
        begin
          DS.DataSet.Append;
          DS.DataSet.FieldByName('USER_BLOCKED').AsInteger := 0;
          DS.DataSet.FieldByName('IS_DELETED').AsInteger := 0;
          fNonValidateList.Add('PERSON_ID');
        end;
      end;
    asEdit:
      begin
        Title := Title + ' [редактирование]';
        if (DS.DataSet <> nil) and DS.DataSet.Active then
          DS.DataSet.Edit;
      end;
    asShow:
      begin
        Title := Title + ' [просмотр]';

        Short_tab.TabVisible := Short_tab.Enabled;
        RzPageControl1.ActivePage := Short_Tab;
        FullForm_btn.Visible := True;
        self.Constraints.MaxHeight := _FramePersonSmall.Height + 20 + RzPanel1.Height;
        self.Constraints.MaxWidth  := _FramePersonSmall.Width + 10;
        self.Constraints.MinHeight := _FramePersonSmall.Height + 20 + RzPanel1.Height;
        self.Constraints.MinWidth  := _FramePersonSmall.Width + 10;
      end;
  end;

  if fFrmParam.action <> asCreate then
  begin
    _FramePersonSmall.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
    _FramePersonSmall.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
    _FramePersonSmall.AddParam('PERSON_ID', DS.DataSet.FindField('PERSON_ID'));
    _FramePersonSmall.OpenData;
    _FramePersonSmall.ReadOnly := True;
  end;

  _FramePersonFull.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  _FramePersonFull.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  _FramePersonFull.AddParam('PERSON_ID', DS.DataSet.FindField('PERSON_ID'));
  _FramePersonFull.OpenData;

  FrameRegions.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FrameRegions.AddParam('WORKER_ID', DS.DataSet.FindField('ID'));
  FrameRegions.OpenData;

end;


procedure TfrmWorker.FullForm_btnClick(Sender: TObject);
begin
//  self.Constraints.MaxHeight := 363 ;
//  self.Constraints.MaxWidth  := 788 ;
//  self.Constraints.MinHeight := 363 ;
//  self.Constraints.MinWidth  := 788 ;

  self.Constraints.MaxHeight := RzPageControl1.Height + 40 + RzPanel1.Height;
  self.Constraints.MaxWidth  := RzPageControl1.Width + 10;
  self.Constraints.MinHeight := self.Constraints.MaxHeight;
  self.Constraints.MinWidth  := self.Constraints.MaxWidth;

  RzPageControl1.ActivePage := Full_Tab;
  Short_Tab.TabVisible := False;
  Full_Tab.TabVisible  := Full_Tab.Enabled;
  FullForm_btn.Visible := False;
end;


procedure TfrmWorker.Save_btnClick(Sender: TObject);
var
  res: Boolean;
begin

  //сохраняем полное имя
  DS.DataSet.FieldByName('full_name').AsString :=
    _FramePersonFull.FullName;

  //сохраняем короткое имя
  DS.DataSet.FieldByName('short_name').AsString :=
    _FramePersonFull.ShortName;

  //проверка
  res := False;
  if not ValidateData(DS, self, fNonValidateList) then
  begin
    Application.MessageBox('Не заполнены все необходимые поля!',
     'Внимание', MB_ICONWARNING + MB_OK);
    ModalResult := mrNone;
    Exit;
  end
  else
    ModalResult := mrOk;

  //прошли проверку
  try
    try
      if not TIBQuery(DS.DataSet).Transaction.Active then
        TIBQuery(DS.DataSet).Transaction.StartTransaction;

      //сохраняем ссылки
      res := _FramePersonFull.SaveData;
      if not res then
        Exit;

      // PERSON_ID
      if DS.DataSet.FieldByName('PERSON_ID').AsInteger <> _FramePersonFull.Id then
        DS.DataSet.FieldByName('PERSON_ID').AsInteger := _FramePersonFull.Id;

      DS.DataSet.Post;
      TIBQuery(DS.DataSet).ApplyUpdates;
      TIBQuery(DS.DataSet).Transaction.CommitRetaining;
      TIBQuery(DS.DataSet).Refresh;

      //регионы
      res := FrameRegions.SaveData;
    except
      res := False;
      ModalResult := mrNone;
      ShowMessage('Произошла ошибка сохранения данных!' + #13#10 +
      Exception(ExceptObject).Message);
    end;
  finally
    if Res then
    begin
      if TIBQuery(DS.DataSet).Transaction.InTransaction then
           TIBQuery(DS.DataSet).Transaction.CommitRetaining;
    end
    else
      if TIBQuery(DS.DataSet).Transaction.InTransaction then
           TIBQuery(DS.DataSet).Transaction.RollbackRetaining;
  end;
end;

procedure TfrmWorker.SetControls;
begin
  Short_Tab.Enabled := UserRights.ShowWorkerInfoSmall;
  Full_Tab.Enabled := UserRights.ShowWorkerInfoFull;
end;

procedure TfrmWorker._FramePersonFullcmbDateBirthPropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  if TcxDateEdit(Sender).EditValue = null then
    TcxDateEdit(Sender).EditValue := IncMonth(Now(), -(InitBirthYear*12));
end;

end.
