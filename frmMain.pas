unit FrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, dxGDIPlusClasses,
  Vcl.ExtCtrls, RzButton, Vcl.Menus, Vcl.StdCtrls, System.Win.ScktComp, RzTray,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdSync, IdGlobal, Vcl.XPMan, IdAntiFreezeBase, Vcl.IdAntiFreeze,
  CommonTypes, CallClasses, RzLabel;

const
  WM_SHOWMSG         = WM_USER + 100;
  WM_SHOWINCOMECALL  = WM_USER + 101;
  WM_SHOWOUTCOMECALL = WM_USER + 102;
  WM_CONNECTSOCKET   = WM_USER + 103;

type
  TAppOptions = class
    DbServer: string;
    DbName: string;
    ServerHost: string;
    ServerPort: integer;
  end;

  TReadingThread = class(TThread)
    protected
      FConn: TIdTCPConnection;
      procedure Execute; override;
    public
      constructor Create(AConn: TIdTCPConnection); reintroduce;
    end;

  TServerCmd = class(TIdSync)
    protected
      FMsg: String;
      fStream: TMemoryStream;
      procedure DoSynchronize; override;
    public
      constructor Create(const AMsg: String);
      class procedure DoCmd(const AMsg: String);
    end;

  TScocketStream = class(TIdSync)
    protected
      fStream: TMemoryStream;
      fFileName: string;
      procedure DoSynchronize; override;
    public
      constructor Create(const AFileName: string; const AStream: TMemoryStream);
      class procedure DoFile(const AFileName: string; const AStream: TMemoryStream);
    end;

type
  TfrmMain = class(TBaseForm)
    btnWorkers: TRzMenuButton;
    btnTune: TRzMenuButton;
    btnNewClient: TRzMenuButton;
    btnClients: TRzMenuButton;
    NewClientBtn_PUM: TPopupMenu;
    NewFizClnt_mi: TMenuItem;
    NewURClnt_mi: TMenuItem;
    Clients_PUM: TPopupMenu;
    UrClients_mi: TMenuItem;
    FizClients_mi: TMenuItem;
    RzMenuButton2: TRzMenuButton;
    lblSocket: TLabel;
    RzMenuButton3: TRzMenuButton;
    btnSessions: TRzMenuButton;
    TrayIcon: TRzTrayIcon;
    TrayMenu: TPopupMenu;
    miShowMain: TMenuItem;
    miExit: TMenuItem;
    AllCli_mi: TMenuItem;
    mOptions: TPopupMenu;
    miListCli: TMenuItem;
    N2: TMenuItem;
    miOptions: TMenuItem;
    TCPClient: TIdTCPClient;
    XPManifest1: TXPManifest;
    Timer1: TTimer;
    mExceptList: TPopupMenu;
    btnReports: TRzMenuButton;
    lblCall: TRzLabel;
    TimerCheck: TTimer;
    TimerUpdate: TTimer;

    procedure btnWorkersClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTuneClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure UrClients_miClick(Sender: TObject);
    procedure NewFizClnt_miClick(Sender: TObject);
    procedure NewURClnt_miClick(Sender: TObject);
    procedure btnClientsClick(Sender: TObject);
    procedure RzMenuButton2Click(Sender: TObject);
    //procedure ClientSocketDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    //procedure ClientSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
    //procedure ClientSocketError(Sender: TObject; Socket: TCustomWinSocket;
    // ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    //procedure ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure RzMenuButton3Click(Sender: TObject);
    procedure btnSessionsClick(Sender: TObject);
    procedure FizClients_miClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miShowMainClick(Sender: TObject);
    procedure AllCli_miClick(Sender: TObject);
    procedure miListCliClick(Sender: TObject);
    procedure miOptionsClick(Sender: TObject);
    procedure TCPClientConnected(Sender: TObject);
    procedure TCPClientDisconnected(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnReportsClick(Sender: TObject);
    procedure TimerCheckTimer(Sender: TObject);
    procedure TimerUpdateTimer(Sender: TObject);
  private
    fCanClose: Boolean; // можно закрыть
    fPhoneListUpdated: Boolean;
    FisServerCmd: boolean; //нет ответа от сервера
    fNeedUpdate: Boolean;

    procedure WmShowMsg(var Msg: TMessage); message WM_SHOWMSG;
    procedure WmShowIncomeCall(var Msg: TMessage); message WM_SHOWINCOMECALL;
    procedure WmShowOutcomeCall(var Msg: TMessage); message WM_SHOWOUTCOMECALL;
    procedure WmConnectSocket(var Msg: TMessage);  message WM_CONNECTSOCKET;

    procedure WmCmdFumigator(var Msg: TMessage); message WM_CMDFUMIGATOR;

    procedure UpdateClients;

    procedure SetConnectCaption;
    procedure SetIsServerCmd(AValue: Boolean);
    procedure SetNeedUpdate(AValue: Boolean);

    procedure SetControls; override;
  public
    ReadThread: TReadingThread;
    isBusy: Boolean; //выполняются обновления
    property IsServerCmd: Boolean read FisServerCmd write SetIsServerCmd;
    property NeedUpdate: Boolean read fNeedUpdate write SetNeedUpdate;

    procedure DoSocketConnect;
    procedure AppException(Sender: TObject; E: Exception);

    procedure OnCallFinish(Sender: TObject);
    procedure OnCallStart(Sender: TObject);
    procedure OnCallTransfer(Sender: TObject);

    function GetHideOnCloseForAll(Sender: tObject): Boolean; // для расчета HideOnClose
  end;

procedure LoadOptions(AIniFile: string);
function SaveLogin(AIniFile, Alogin: string): Boolean;
function ReadLogin(AIniFile: string): string;
function CheckUpdates: boolean;
function FindParam(AParam: string): Boolean;  // проверка наличия параметра запуска
//procedure FreeAndNilModal(var AForm); inline;//уничтожение с проверкой на модальность

var
  formMain: TfrmMain;
  MainOptions: TAppOptions;
  msgText: string;
  OutCallid: string; // callId из сообщения об исх. звонке
  OutCallApiId: string;
  OutPhone: string;  // телефон из сообщения об исх. звонке
  TimeShift: Integer; //смещение с сервером в секундах

implementation

{$R *.dfm}

uses
  System.IniFiles, Winapi.ShellAPI,
  DM_Main, frmWorkers, formOptions, formClients, formClientFiz,
  formClientUr, formLogo, formCalling, formSessions,
  formIncomeCallRoot, System.DateUtils, formClientResult,
  CommonVars, CommonFunc, formWorkerShedule, formCallReport,
  formRecordPlay, formCallUnknown, formSessionResult,
  formListActivePhones, commonSocketCmd;

procedure TfrmMain.btnTuneClick(Sender: TObject);
begin
  frmOptions := TfrmOptions.Create(self);
  frmOptions.ShowModal;
  FreeAndNil(frmOptions);
end;

procedure TfrmMain.btnWorkersClick(Sender: TObject);
begin
  formWorkers := TfrmWorkers.Create(self);
  formWorkers.ShowModal;
  FreeAndNil(formWorkers);
end;

(*procedure TfrmMain.ClientSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  inherited;
  DM.SocketTimer.Interval := 0;
  lblSocket.Caption := 'Соединение с сервером установлено';
  DM.DateStart := Now;
  ClientSocket.Socket.SendText('#setphone:' + DM.CurrentUserSets.ATS_Phone_Num); //посылаем номер телефона
end;

procedure TfrmMain.ClientSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  inherited;
  lblSocket.Caption := 'Соединение с сервером разорвано';
  DM.SocketTimer.Interval := 20000;
end;

procedure TfrmMain.ClientSocketError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  if not ClientSocket.Active then
    DM.SocketTimer.Interval := 20000;
end;*)

(*procedure TfrmMain.ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
var
  s: string;
  p: Integer;
  cmd, arg: string;
  argList: TStringList;
begin
  s := Socket.ReceiveText;

  if Copy(s, 1, 1) = '#' then
  begin
    p := Pos(':', s);
    cmd := Copy(s, 2, p - 2);
    arg := Copy(s, p + 1, Length(s));
  end;

  if cmd = 'msg' then
  begin
    msgText := arg;
    PostMessage(Self.Handle, WM_SHOWMSG, 0,0);
    Application.ProcessMessages;
  end
  else

  if cmd = 'callid' then //создан исходящий звонок с CallId
  begin
    if Assigned(frmCalling) then
      frmCalling.CallId := arg;
    if Assigned(frmClientResult) then
      frmClientResult.CallId := arg;
  end
  else
  if cmd = 'callfinish' then  //в варианте c CallListener
  begin
    if Assigned(frmCalling) and (frmCalling.CallId = arg) then
      frmCalling.CallFinish;
    if Assigned(frmClientResult) and (frmClientResult.CallId = arg) then
      frmClientResult.CallFinish;
  end

  else

  if cmd = 'checkcall' then //поступил новый звонок
  begin
    PostMessage(Self.Handle, WM_SHOWINCOMECALL, 0,0);
    //DM.Calls_TimerTimer(DM.Calls_Timer);
  end

  else
  if cmd = 'checksession' then //завершен звонок
  begin
    if Assigned(frmCalling) then
      frmCalling.CheckSession
    else
    if Assigned(frmIncomeCallRoot) then
      frmIncomeCallRoot.CheckSession
    else
    if Assigned(frmClientResult) then
      frmClientResult.CheckSession;

  end

       
  else
  if cmd = 'checkacceptcall' then //звонок принят
  begin
    //if Assigned(frmIncomeCallRoot) then
    //  frmIncomeCallRoot.CheckSession; //.CheckAccept;
  end

  else
  if cmd = 'servertime' then
  begin
    TimeShift := StrToInt(arg) - SecondOfTheDay(DM.DateStart);
    DM.DateStart := IncSecond(DM.DateStart, TimeShift);
    DM.CallS_Q.ParamByName('date_start').AsDateTime := DM.DateStart;
  end;


end;*)

procedure TfrmMain.FizClients_miClick(Sender: TObject);
begin
  if not DM.Clients.Active then
    DM.Clients.Open;

  frmClients := TfrmClients.Create(self, nil, 0);
  try
    frmClients.ShowModal;
  finally
    FreeAndNil(frmClients);
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.DB.Tag := 1;
  TCPClient.IOHandler.WriteLn('ќкончание работы');
  TCPClient.Disconnect;

end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //inherited;
  //Application.MainForm.Close;
  CanClose := fCanClose;
  if not fCanClose then
    TrayIcon.MinimizeApp;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  inherited;
  Title := 'ѕользователь - ' + DM.CurrentUserSets.UserName +
    ' (' + DM.CurrentUserSets.UserTypeName + ')' + ' [вер.: ' + FileVersion(Application.ExeName) + ']';
  DoSocketConnect;
  CallObj.OnStartCall := OnCallStart;
  CallObj.OnFinishCall := OnCallFinish;
  CallObj.OnTransferCall := OnCallTransfer;

  UserRights := TUserRights.Create(DM.CurrentUserSets.ID);
end;

function TfrmMain.GetHideOnCloseForAll(Sender: tObject): Boolean;
begin
  Result := fCanClose;
end;

procedure TfrmMain.miExitClick(Sender: TObject);
begin
  if Application.MessageBox('¬ы действительно хотите закрыть программу?',
    '¬ыход из программы', MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      fCanClose := True;
      Self.Close;
    end;
end;

procedure TfrmMain.miListCliClick(Sender: TObject);
begin
  try
    DM.GetDataset(DM.Clients);
    frmWorkerShedule := TfrmWorkerShedule.Create(self);
    frmWorkerShedule.ShowModal;
  finally
    FreeAndNil(frmWorkerShedule);
  end;
end;

procedure TfrmMain.miOptionsClick(Sender: TObject);
begin
  frmOptions := TfrmOptions.Create(self);
  frmOptions.ShowModal;
  FreeAndNil(frmOptions);
end;

procedure TfrmMain.miShowMainClick(Sender: TObject);
begin
  TrayIcon.RestoreApp;
end;

procedure TfrmMain.NewFizClnt_miClick(Sender: TObject);
var
  prm: TFrmCreateParam;
begin
  if not DM.Clients.Active then
    DM.Clients.Open;

  prm := NewFrmCreateParam(asCreate, DM.Clients);
  frmClientFiz := TfrmClientFiz.Create(self, '', @prm);
  try
  if frmClientFiz.ShowModal = mrOk then
    DM.Clients.Refresh;
  finally
    FreeAndNil(frmClientFiz);
  end;
end;

procedure TfrmMain.NewURClnt_miClick(Sender: TObject);
var
  prm: TFrmCreateParam;
begin
  DM.GetDataset(DM.Clients);

  prm := NewFrmCreateParam(asCreate, DM.Clients);
  frmClientUr := TfrmClientUr.Create(self, '', @prm);
  try
  if frmClientUr.ShowModal = mrOk then
    DM.Clients.Refresh;
  finally
    FreeAndNil(frmClientUr);
  end;
end;

procedure TfrmMain.OnCallFinish(Sender: TObject);
begin
  lblCall.Blinking := False;
  lblCall.Visible  := False;
   (*if Assigned(frmCalling) then
      frmCalling.CallFinish
    else
    if Assigned(frmIncomeCallRoot) then
      frmIncomeCallRoot.CallFinish
    else
    if Assigned(frmClientResult) then
      frmClientResult.CallFinish;*)
end;

procedure TfrmMain.OnCallStart(Sender: TObject);
begin
  lblCall.Blinking := True;
  lblCall.Visible  := True;
end;

procedure TfrmMain.OnCallTransfer(Sender: TObject);
var
  i: Integer;
begin
  TCPClient.Socket.WriteLn ('#getuserlist:' + DM.CurrentUserSets.ATS_Phone_Num);
  fPhoneListUpdated :=False;
  i := 0;
  while i < 20 do
  begin
    if fPhoneListUpdated then
      break;
    Sleep(250);
    Application.ProcessMessages;
    inc(i)
  end;

  if i = 20 then
  begin
    MsgBoxError('Ќе удалось получить список абонентов с сервера!');
    Exit;
  end;

  try
    frmListActivePhones := TfrmListActivePhones.Create(nil);
    frmListActivePhones.ShowModal;
    if frmListActivePhones.ModalResult = mrOk then
    begin
      TCPClient.Socket.WriteLn (Format('#calltransfer:%s,%s',
       [CallObj.CallInfo.CallApiId,
        DM.ActivePhones.FieldByName('phone').AsString]));
      //PostMessageToAll(WM_TRANSFERCALL);
    end;
  finally
    FreeAndNil(frmListActivePhones);
  end;

end;

procedure TfrmMain.RzMenuButton2Click(Sender: TObject);
var
  n: string;
begin
  TCPClient.Socket.WriteLn ('#getuserlist:' + DM.CurrentUserSets.ATS_Phone_Num);
end;

procedure TfrmMain.RzMenuButton3Click(Sender: TObject);
begin
  inherited;
  DM.ShowClientsForCall;
end;

procedure TfrmMain.btnSessionsClick(Sender: TObject);
begin
  frmSessions := TfrmSessions.Create(self);
  frmSessions.ShowModal;
  FreeAndNil(frmSessions);
end;

procedure TfrmMain.SetConnectCaption;
var
  s: string;
begin
  if not TCPClient.Connected then
    s := '—оединение с сервером не установлено'
  else
  begin
    s := '—оединение с сервером установлено';
    if not FisServerCmd then
      s := '—оединение с сервером ограничено(!!!)'
  end;
  lblSocket.Caption := s;
end;

procedure TfrmMain.SetControls;
begin
  btnWorkers.Enabled   := UserRights.ShowWorkerList;
  miListCli.Enabled    := UserRights.TuneClientList;
  btnClients.Enabled   := UserRights.ShowClientList;
  btnNewClient.Enabled := UserRights.ShowClientCard and UserRights.WorkClientCard;
  btnSessions.Enabled  := UserRights.ShowSessions;
  miOptions.Enabled    := UserRights.TuneSystem;
  miListCli.Enabled    := UserRights.TuneClientList;
end;

procedure TfrmMain.SetIsServerCmd(AValue: Boolean);
begin
  if AValue <> FisServerCmd then
  begin
    FisServerCmd := AValue;
    SetConnectCaption;
  end;
end;

procedure TfrmMain.SetNeedUpdate(AValue: Boolean);
begin
  if Avalue = fNeedUpdate then
    Exit;

  fNeedUpdate := AValue;

  if fNeedUpdate and not TimerUpdate.Enabled then
  begin
    TimerUpdate.Enabled := True;;
    TimerUpdate.OnTimer(TimerUpdate);
  end;
end;

procedure TfrmMain.TCPClientConnected(Sender: TObject);
begin
  DM.SocketTimer.Interval := 0;
  ReadThread := TReadingThread.Create(TCPClient);


  DM.DateStart := Now;
  TCPClient.IOHandler.DefStringEncoding := IndyTextEncoding_UTF8;
  TCPClient.Socket.WriteLn(Format('#setphone:%s,%d,%s',
    [DM.CurrentUserSets.ATS_Phone_Num,
     DM.CurrentUserSets.ID,
     FileVersion(Application.ExeName)
{$IFDEF DEBUG}
     + '.DEV'
{$ENDIF}
     ])); //посылаем номер телефона

  //TCPClient.Socket.WriteLn(Format('#setphone:%s',
  //  [DM.CurrentUserSets.ATS_Phone_Num]));
  TimerCheck.Enabled := True;

  if not DM.DB.Connected then //реконнект к Ѕƒ, если нужно
    DM.DBAfterDisconnect(DM.DB);
end;

procedure TfrmMain.TCPClientDisconnected(Sender: TObject);
begin
  lblSocket.Caption := '—оединение с сервером не установлено';
  isServerCmd := False;
  TrayIcon.ShowBalloonHint('–азрыв соединени€ с сервером', 'ќграниченный режим работы', bhiWarning);

  if CallObj.Active then
    CallObj.Active := False;

  if ReadThread <> nil then
  begin
    ReadThread.Terminate;
    ReadThread.WaitFor;
    FreeAndNil(ReadThread);
  end;

end;

procedure TfrmMain.TimerCheckTimer(Sender: TObject);
begin
  TimerCheck.Enabled := False;
  if not isServerCmd then
    MsgBoxWarning('Ќе получен ответ от сервера. ¬озможны проблемы со звонками');
end;

procedure TfrmMain.TimerUpdateTimer(Sender: TObject);
begin
  if MsgBoxQuestion('¬ерси€ программы устарела, необходимо обновление.' + #13#10 +
    'ѕерезапустить программу сейчас, или сделать это позже?') = idNo then
    Exit;

  ShellExecute(0, 'open', PChar(Application.ExeName), 'RESTART', nil, SW_SHOW);
  DM.DB.Tag := 1;
  Application.Terminate;
  Exit;
end;

procedure TfrmMain.DoSocketConnect;
begin
  TCPClient.Host := MainOptions.ServerHost;
  TCPClient.Port := MainOptions.ServerPort;
  try
    TCPClient.Connect;
  except
    DM.SocketTimer.Interval := 5000;
  end;
end;

procedure TfrmMain.AllCli_miClick(Sender: TObject);
begin
  if not DM.Clients.Active then
    DM.Clients.Open;

  frmClients := TfrmClients.Create(self, nil, -1);
  try
    frmClients.ShowModal;
  finally
    FreeAndNil(frmClients);
  end;
end;

procedure TfrmMain.AppException(Sender: TObject; E: Exception);
begin
  if E.ClassName = 'EIdNotConnected' then
    Exit
  else
    MsgBoxError('Ќепредвиденна€ ошибка программы: ' + Exception(ExceptObject).Message);
end;

procedure TfrmMain.btnClientsClick(Sender: TObject);
begin
  if not DM.Clients.Active then
    DM.Clients.Open;

  frmClients := TfrmClients.Create(self);
  try
  frmClients.ShowModal;
  finally
    FreeAndNil(frmClients);
  end;
end;

procedure TfrmMain.btnReportsClick(Sender: TObject);
begin
  frmCallReport := TfrmCallReport.Create(nil);
  if Assigned(frmCallReport) then
  try
    frmCallReport.ShowModal;
  finally
    frmCallReport._Query.Close;
    frmCallReport.Free;
  end;

end;

procedure TfrmMain.UpdateClients;
var
  id: Integer;
begin
  if not DM.Clients.Active or
     Assigned(frmClientResult) or Assigned(frmIncomeCallRoot) or
    (Assigned(frmClientFiz) and frmClientFiz.InUpdate) or
    (Assigned(frmClientUr) and frmClientUr.InUpdate) then
    Exit;

  while not CallObj.Ready do
  begin
    Application.ProcessMessages;
    Sleep(500);
  end;

  try
    isBusy := True;
    id := DM.Clients.FieldByName('id').AsInteger;
    DM.Clients.Close;
    DM.Clients.Open;
    DM.Clients.Locate('id', id, []);
  finally
    isBusy := False;
  end;
end;

procedure TfrmMain.UrClients_miClick(Sender: TObject);
begin
  if not DM.Clients.Active then
    DM.Clients.Open;

  frmClients := TfrmClients.Create(self, nil, 1);
  try
    frmClients.ShowModal;
  finally
    FreeAndNil(frmClients);
  end;
end;

procedure TfrmMain.WmCmdFumigator(var Msg: TMessage);
begin
  case Msg.WParam of
    1: UpdateClients;
    2: if Assigned(UserRights) then
         UserRights.Refresh;
  end;
end;

procedure TfrmMain.WmConnectSocket(var Msg: TMessage);
begin
  TCPClientDisconnected(TCPClient);
  DM.SocketTimer.Interval := 100;
end;

procedure TfrmMain.WmShowIncomeCall(var Msg: TMessage);
begin
  if not UserRights.DoCallIncom or Assigned(frmClientFiz) or
       Assigned(frmClientUr) or Assigned(frmSessionResult) then
    Exit;

  try
    CallObj.StartCall(CallInfo);
    DM.ShowCall;
  finally
    CallObj.Ready := True;
  end;
end;

procedure TfrmMain.WmShowMsg(var Msg: TMessage);
begin
  MsgBoxInformation(msgText, '—ообщение от сервера');
end;

procedure TfrmMain.WmShowOutcomeCall(var Msg: TMessage);
begin
   //CallObj.OnFinishCall := OnCallFinish;
   if not UserRights.DoCallOutcome then
      Exit;

   try
     CallObj.StartCall(CallInfo);
     DM.ShowOutcomCall(CallInfo.CallId, CallInfo.CallApiid, CallInfo.Phone);
   finally
     CallObj.Ready := True;
   end;
end;

procedure LoadOptions(AIniFile: string);
begin
  MainOptions := TAppOptions.Create;

  MainOptions.ServerHost := ServerHost; //'81.177.48.139'; //'localhost';//
  MainOptions.ServerPort := ServerPort; //1025;
end;

function SaveLogin(AIniFile, ALogin: string): Boolean;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(AIniFile);
  try
    Ini.WriteString('LastLogin', 'Name', ALogin);
  finally
  Ini.Free;
  end;
end;

function ReadLogin(AIniFile: string): string;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(AIniFile);
  if Assigned(Ini) then
  try
    Result := Ini.ReadString('LastLogin', 'Name', '');
  finally
    Ini.Free;
  end;
end;

function CheckUpdates: boolean;
var
  HTTP: TIdHTTP;
  url: string;
  Stream: TStringStream;
  fStream: TMemoryStream;
  verServer, verLocal: string;
  fGet: boolean;
begin
  result := False;

  if FindParam('NOUPDATE') then // без проверки
    Exit;


  HTTP := TIdHTTP.Create(nil);
  try
    Stream := TStringStream.Create;
    url := 'http://' + ServerHost + ':' + IntToStr(ServerHttpPort) + '/fumigator?action=getlastversion';
    try
      HTTP.Get(url, Stream); except end;
  //    if HTTP.ResponseCode = 200 then
      verServer := Stream.DataString;
      verLocal  := FileVersion(Application.ExeName);
      if (HTTP.ResponseCode = 200) and (verLocal <> verServer) then
      try
        frmLogo.ProgressBar.Visible := True;
        HTTP.OnWork      := frmLogo.HTTPWork;
        HTTP.OnWorkBegin := frmLogo.HTTPWorkBegin;
        HTTP.OnWorkEnd   := frmLogo.HTTPWorkEnd;

        fStream := TMemoryStream.Create;
        url := 'http://' + ServerHost + ':' + IntToStr(ServerHttpPort) + '/fumigator?action=getlastfile';
        try
          fGet := False;
          HTTP.Get(url, fStream);
          if HTTP.Response.ContentLength = fStream.Size then
            fGet := True;
        except
          fGet := false;
        end;
        if fGet and (HTTP.ResponseCode = 200) then
        begin
          if FileExists(Application.ExeName + '_') then
            DeleteFile(Application.ExeName + '_');

          RenameFile(Application.ExeName, Application.ExeName + '_');
          fStream.SaveToFile(ExtractFilePath(Application.ExeName)+ 'fumigator.exe');
          Result := True;
        end;

      finally
        fStream.Free;
      end;
  finally
     Stream.Free;
     HTTP.Free;
  end;
end;

function FindParam(AParam: string): Boolean;
var
  i, cnt: Integer;
begin
  Result := False;
  cnt := ParamCount;
  if cnt = 0 then
    Exit;
  for I := 1 to cnt do
    if UpperCase(ParamStr(i)) = UpperCase(AParam) then
    begin
      Result := True;
      break;
    end;
end;

{ TServerCmd }

class procedure TServerCmd.DoCmd(const AMsg: String);
begin
  with Create(AMsg) do
  try
    Synchronize;
  finally
    Free;
  end;
end;

constructor TServerCmd.Create(const AMsg: String);
begin
  FMsg := AMsg;
  inherited Create;
end;

procedure TServerCmd.DoSynchronize;
var
  s: string;
  p: Integer;
  cmd, arg: string;
  argList: TStringList;
begin
  s := FMsg;

  if s <> '' then
    formMain.isServerCmd := True;

  if Copy(s, 1, 1) = '#' then
  begin
    p := Pos(':', s);
    cmd := LowerCase(Copy(s, 2, p - 2));
    arg := Copy(s, p + 1, Length(s));
  end;

  if cmd = 'msg' then
  begin
    msgText := arg;
    PostMessage(formMain.Handle, WM_SHOWMSG, 0,0);
    Application.ProcessMessages;
  end
  else

  if cmd = 'callid' then //создан исходящий звонок с CallId (теперь через CallEvent)
  begin
    //if Assigned(frmCalling) then
    //  frmCalling.CallId := arg;
    //if Assigned(frmClientResult) then
    //  frmClientResult.CallId := arg;
  end
  else
  if cmd = 'callfinish' then  //в варианте c CallListener
  begin
//    if Assigned(frmCalling) and (frmCalling.CallId = arg) then
//      frmCalling.CallFinish;
//    if Assigned(frmClientResult) and (frmClientResult.CallId = arg) then
//      frmClientResult.CallFinish;
  end

  else

  if cmd = 'checkcall' then //поступил новый звонок
  begin
//    try
//      argList := TStringList.Create;
//      arglist.Delimiter := ',';
//      argList.DelimitedText := arg;
//      if argList.Count > 0 then
//      begin
//        //formMain.CallId := arglist[0];
//        //formMain.CallApiId := argList[1];
//      end;
//    finally
//      argList.free;
//    end;
//    PostMessage(formMain.Handle, WM_SHOWINCOMECALL, 0,0);
    //DM.Calls_TimerTimer(DM.Calls_Timer);
  end

  else

  if (cmd = 'startcall') then //поступил новый звонок
  begin
    if not CallObj.Ready then
      Exit;

    argList := TStringList.Create;
    try
      arglist.Delimiter := ',';
      argList.DelimitedText := arg;
      if argList.Count > 0 then
      with CallInfo do
      begin
        CallFlow     := argList[0];
        CallId       := arglist[1];
        CallApiId    := argList[2];
        Phone        := argList[3];
        ClientId     := StrToInt(argList[4]);
        ClientType   := argList[5];
        CalledNumber := argList[6];
        CallerIDNum  := argList[7];
      end;
    finally
      argList.free;
    end;

    //if CallObj.CallInfo.CallId = CallInfo.CallId then //уже завершился звонок
    //  exit;

    if CallObj.Active then
      Exit;

    if Callinfo.CallFlow = 'in' then
      PostMessage(formMain.Handle, WM_SHOWINCOMECALL, 0,0)
    else
      PostMessage(formMain.Handle, WM_SHOWOUTCOMECALL, 0,0);
    //Application.ProcessMessages;
    //DM.Calls_TimerTimer(DM.Calls_Timer);
  end

  else
  if (cmd = 'finishcall') then //завершен звонок
  begin
    argList := TStringList.Create;
    try
      s := '';
      arglist.Delimiter := ',';
      argList.DelimitedText := arg;
      if argList.Count > 2 then
       s := argList[2];
    finally
      if //CallObj.Ready and
        (CallObj.CallInfo.CallId <> argList[0]) then
        CallObj.CallInfo.CallId := argList[0];
      argList.free;
    end;

    CallObj.FinishCall(s);
  end

  else
  if (cmd = 'callaccepted') then //завершен звонок
  begin
    if CallObj.CallInfo.CallId = arg then
      CallObj.Accepted := True;
  end

  else
  if cmd = 'checksession' then //завершен звонок
  begin
//    if Assigned(frmCalling) then
//      frmCalling.CheckSession
//    else
//    if Assigned(frmIncomeCallRoot) then
//      frmIncomeCallRoot.CheckSession
//    else
//    if Assigned(frmClientResult) then
//      frmClientResult.CheckSession;

  end

  else
  if cmd = 'outcomecall' then //исходящий звонок
  begin
//    if Assigned(frmClientResult) then
//      Exit;
//    try
//      argList := TStringList.Create;
//      argList.Delimiter := ',';
//      argList.DelimitedText := arg;
//      OutCallId    := argList[0];
//      OutCallApiId := argList[1];
//      OutPhone     := argList[2];
//    finally
//      FreeAndNil(argList);
//    end;
//    PostMessage(formMain.Handle, WM_SHOWOUTCOMECALL, 0,0);
//      //Application.ProcessMessages;
  end
  
  else
  if cmd = 'checkacceptcall' then //звонок принят
  begin
    //if Assigned(frmIncomeCallRoot) then
    //  frmIncomeCallRoot.CheckSession; //.CheckAccept;
  end

  else
  if cmd = 'servertime' then
  begin
    formMain.isServerCmd := True;
    TimeShift := StrToInt(arg) - SecondOfTheDay(DM.DateStart);
    DM.DateStart := IncSecond(DM.DateStart, TimeShift);
    DM.CallS_Q.ParamByName('date_start').AsDateTime := DM.DateStart;
  end

  else
  if cmd = 'recordinfo' then
  begin
    if Assigned(frmRecordPlay) then
    begin
      argList := TStringList.Create;
      try
        s := '';
        arglist.Delimiter := ',';
        argList.DelimitedText := arg;
        if frmRecordPlay.CallApiId = argList[0] then
          frmRecordPlay.FileName := argList[1];
      finally
        argList.free;
      end;
    end;
  end

  else
  if cmd = 'recordfile' then
  begin
    if Assigned(frmRecordPlay) then
    begin
      argList := TStringList.Create;
      try
        s := '';
        arglist.Delimiter := ',';
        argList.DelimitedText := arg;
        if frmRecordPlay.recid = argList[0] then
          frmRecordPlay.FileName := argList[1];
      finally
        argList.free;
      end;
    end;
  end

  else
  if cmd = 'cmdfumigator' then
  begin
    if arg = 'updateclients' then
      PostMessage(formMain.Handle, WM_CMDFUMIGATOR, 1,0)
    else
    if arg = 'updaterights' then
      PostMessage(formMain.Handle, WM_CMDFUMIGATOR, 2,0)
  end

  else
  if cmd = 'userphonelist' then
  try
    DM.ActivePhones.Close;
    DM.ActivePhones.Open;
    argList := TStringList.Create;
    argList.Delimiter := ';';
    argList.DelimitedText := arg;
    for p := 0 to argList.Count - 1 do
    begin
      DM.ActivePhones.Append;
      DM.ActivePhones.FieldByName('Phone').AsString     := argList.Names[p];
      DM.ActivePhones.FieldByName('worker_id').AsString := argList.ValueFromIndex[p];
      DM.ActivePhones.Post;
    end;
  finally
    formMain.fPhoneListUpdated := True;
    argList.Free;
  end

  else
  if cmd = SCMD_NEEDUPDATE then  //необходимо обновление программы
  try
     formMain.NeedUpdate := True;
    //msgText := 'Ќеобходимо обновление программы до версии: ' + arg;
    //PostMessage(formMain.Handle, WM_SHOWMSG, 0,0);
    //Application.ProcessMessages;
  finally
  end

end;

{ TReadingThread }

constructor TReadingThread.Create(AConn: TIdTCPConnection);
begin
  FConn := AConn;
  inherited Create(False);
end;

procedure TReadingThread.Execute;
var
  s: string;
  //stream: TMemoryStream;
begin
  while not Terminated and FConn.Connected do
  begin
    try
      // refer to my earlier message for this code...
      if Terminated then
        Exit;

      if not FConn.IOHandler.Connected then
        Exit;

      try
        s := FConn.IOHandler.ReadLn; // UTF8ToString(FConn.IOHandler.ReadLn);
      except
        FConn.IOHandler.Close;
        if not Terminated then
          PostMessage(formMain.Handle, WM_CONNECTSOCKET, 0,0);
      end;
      //s := URLDecode(s);
      if Copy(s, 1, 9) = '#getfile:' then
      begin
        //здесь должен быть код получения файла через сокет и вызов TSocketStream.DoFile
      end;

      if not Terminated and (s <> '') then
        TServerCmd.DoCmd(s);
        Sleep(200);
    except
      s := Exception(ExceptObject).Message;
    end;
  end;

end;

{ TScocketStream }

constructor TScocketStream.Create(const AFileName: string; const AStream: TMemoryStream);
begin
  fStream := TMemoryStream.Create;
  fStream.CopyFrom(AStream, AStream.Size);
  inherited Create;
end;

class procedure TScocketStream.DoFile(const AFileName: string; const AStream: TMemoryStream);
begin
  with Create(AFileName, AStream) do
  try
    Synchronize;
  finally
    fStream.Free;
    Free;
  end;
end;

procedure TScocketStream.DoSynchronize;
begin
  fStream.SaveToFile(fFileName);
end;

//procedure FreeAndNilModal(var AForm); inline;
//var
//  Temp: TObject;
//begin
//  Temp := TObject(AForm);
//
//  if Temp is TForm then
//  begin
//    if Assigned(Temp) and (fsModal in TForm(Temp).FormState) then
//      if Temp is TBaseForm then
//        TBaseForm(Temp).CloseAbsolute
//      else
//        TForm(Temp).ModalResult := mrCancel;
//  end;
//
//  Pointer(AForm) := nil;
//  Temp.Free;
//end;

initialization
  //hMutex := CreateMutex(nil, True,
  //  Pchar(ExtractFileName((Application.ExeName))));
  CallObj := TCallProto.Create;
  CallInfo := TCallInfo.Create;

  frmCallUnknown := TfrmCallUnknown.Create(nil);

finalization
  //CloseHandle(hMutex);
  FreeAndNil(CallObj);
  FreeAndNil(CallInfo);
  FreeAndNil(UserRights);

  FreeAndNil(frmCallUnknown);
end.
