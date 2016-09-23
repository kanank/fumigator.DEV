program fumigator;

uses
  Vcl.Forms,
  System.UITypes,
  System.SysUtils,
  Winapi.ShellAPI,
  Winapi.Windows,
  ClassFrmBase in 'classes\ClassFrmBase.pas' {BaseForm},
  ClassSprForm in 'classes\ClassSprForm.pas' {SprForm},
  DM_Main in 'DM_Main.pas' {DataModuleMain: TDataModule},
  frmMain in 'frmMain.pas' {frmMain},
  frmWorkers in 'frmWorkers.pas' {frmWorkers},
  ClassSimpleForm in 'Classes\ClassSimpleForm.pas' {SimpleForm},
  frmWorker in 'frmWorker.pas' {frmWorker},
  formOptions in 'formOptions.pas' {frmOptions},
  formLogin in 'formLogin.pas' {frmLogin},
  uLocalizeDevExpress in 'uLocalizeDevExpress.pas',
  formDictionaries in 'formDictionaries.pas' {frmDictionaries},
  ClassSimpleSprForm in 'Classes\ClassSimpleSprForm.pas' {frmSimpleSpr},
  ClassSimpleSprTypeForm in 'Classes\ClassSimpleSprTypeForm.pas' {frmSimpleSprType},
  ClassProc in 'Classes\ClassProc.pas',
  formClients in 'clients\formClients.pas' {frmClients},
  formClientFiz in 'clients\formClientFiz.pas' {frmClientFiz},
  frameBase in 'Frames\frameBase.pas' {DbFrameBase: TFrame},
  frPasport in 'Frames\frPasport.pas' {FramePassport: TFrame},
  CommonVars in 'CommonVars.pas',
  CommonTypes in 'Classes\CommonTypes.pas',
  frListBase in 'Frames\frListBase.pas' {FrameListBase: TFrame},
  frPhones in 'Frames\frPhones.pas' {FramePhones: TFrame},
  frUslugi in 'Frames\frUslugi.pas' {FrameUslugi: TFrame},
  formEditPhone in 'Frames\formEditPhone.pas' {frmEditPhone},
  frBank in 'Frames\frBank.pas' {FrameRekvizits: TFrame},
  formSelService in 'Frames\formSelService.pas' {frmSelectService},
  formKLADRList in 'Frames\formKLADRList.pas' {frmKLADRList},
  frItemKLADR in 'Frames\frItemKLADR.pas' {FrameItemKLADR: TFrame},
  frKladrAll in 'Frames\frKladrAll.pas' {FrameKladrAll: TFrame},
  formKladrAdr in 'Frames\formKladrAdr.pas' {frmKladrAdr},
  FrKladrAdrFull in 'Frames\FrKladrAdrFull.pas' {FrameKladrAdrFull: TFrame},
  frPersonSmall in 'Frames\frPersonSmall.pas' {FramePersonSmall: TFrame},
  frPersonFull in 'Frames\frPersonFull.pas' {FramePersonFull: TFrame},
  frClientExtUr in 'Frames\frClientExtUr.pas' {FrameClientExtUr: TFrame},
  formClientUr in 'Clients\formClientUr.pas' {frmClientUr},
  ClassFormEditData in 'Classes\ClassFormEditData.pas' {frmEditData},
  frItemDomKLADR in 'Frames\frItemDomKLADR.pas' {FrameItemDomKLADR: TFrame},
  frPersonSmallFoto in 'Frames\frPersonSmallFoto.pas' {FramePersonSmallFoto: TFrame},
  frFoto in 'Frames\frFoto.pas' {FrameFoto: TFrame},
  frPersonFullFoto in 'Frames\frPersonFullFoto.pas' {FramePersonFullFoto: TFrame},
  formWorkerShedule in 'formWorkerShedule.pas' {frmWorkerShedule},
  formLogo in 'formLogo.pas' {frmLogo},
  formIncomeCalls in 'Calls\formIncomeCalls.pas' {frmIncomeCall},
  formIncomeCallsUr in 'Calls\formIncomeCallsUr.pas' {frmIncomeCallUr},
  formCallUnknown in 'Calls\formCallUnknown.pas' {frmCallUnknown},
  formCalling in 'Calls\formCalling.pas' {frmCalling},
  formClientsForCall in 'Calls\formClientsForCall.pas' {frmClientsForCall},
  formEndCalling in 'Calls\formEndCalling.pas' {frmEndCalling},
  formSessionResult in 'Calls\formSessionResult.pas' {frmSessionResult},
  formSessions in 'Calls\formSessions.pas' {frmSessions},
  formClientCard in 'Clients\formClientCard.pas' {frmClientCard},
  formCallPause in 'Calls\formCallPause.pas' {frmCallPause},
  formIncomeCallRoot in 'Calls\formIncomeCallRoot.pas' {frmIncomeCallRoot},
  formClientResult in 'Clients\formClientResult.pas' {frmClientResult},
  formCallEvent in 'Calls\formCallEvent.pas' {frmCallEvent},
  CommonFunc in 'Server\CommonFunc.pas',
  formSessionEdit in 'Calls\formSessionEdit.pas' {frmSessionEdit},
  frClientCalls in 'Frames\frClientCalls.pas' {frameClientCalls: TFrame},
  frContact in 'Frames\frContact.pas' {FrameContact: TFrame},
  formContact in 'Clients\formContact.pas' {frmContact},
  frGoods in 'Frames\frGoods.pas' {FrameGoods: TFrame},
  frWorkerRegions in 'Frames\frWorkerRegions.pas' {FrameWorkerRegions: TFrame},
  formEditRegion in 'Frames\formEditRegion.pas' {frmEditRegion},
  formReportSessions in 'Report\formReportSessions.pas' {frmReportSessions},
  formDbBase in 'Classes\formDbBase.pas' {frmDbBaseForm},
  formCallReport in 'Report\formCallReport.pas' {frmCallReport},
  formRecordPlay in 'Classes\formRecordPlay.pas' {frmRecordPlay},
  MappedFunc in 'Classes\MappedFunc.pas',
  ClassFormSmallCard in 'Classes\ClassFormSmallCard.pas' {frmSmallCard},
  formSmallClientFiz in 'Clients\formSmallClientFiz.pas' {frmSmallCardFiz},
  formSmallClientUr in 'Clients\formSmallClientUr.pas' {frmSmallCardUr},
  formListActivePhones in 'Calls\formListActivePhones.pas' {frmListActivePhones};

{$R *.res}
var
  err: string;
begin
  Application.Initialize;
  Application.Title := 'Фумигатор';

  try
    if CheckStartRepeat(CheckAppName) then  //проверяем повторный запуск
    begin
      UnlockMutex(hMutex);
      Application.Terminate;
    end
    else
      WriteToMapped(CheckAppName, IntToStr(Application.Handle));
  finally
    //UnlockMutex(hMutex);
  end;

  frmLogo := TFrmLogo.Create(nil);
  frmLogo.Info.Caption := 'Проверка новой версии';
  frmLogo.Show;
  frmLogo.RefreshForm;

  Application.CreateForm(TDataModuleMain, DM);
  LoadOptions(CfgFileName);

  if CheckUpdates then
  begin
    ShellExecute(0, 'open', PChar(Application.ExeName), 'NEWVERSION', nil, SW_SHOW);
    Application.Terminate;
    Exit;
  end;

  frmLogo.ProgressBar.Visible := False;
  frmLogo.InfoText := 'Подготовка к запуску...';

  frmLogin := TfrmLogin.Create(nil);
  if frmLogin.ShowModal <> mrOk then
  begin
    Application.Terminate;
    Exit;
  end;

  frmLogo.InfoText := 'Запуск программы...';

  SaveLogin(ExtractFilePath(Application.ExeName) + CfgFileName, frmLogin.Edt1.Text);

  DM.AfterLogin;
  frmLogin.Free;

  frmLogo.Free;

  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, formMain);

  Application.OnException := formMain.AppException;

  try
    Application.Run;
  except
    err := Exception(ExceptObject).Message;
  end;
end.
