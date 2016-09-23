unit Srr_MF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.Samples.Spin, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdCustomHTTPServer, IdHTTPServer, IdContext, Data.DB, IBX.IBDatabase,
  IBX.IBCustomDataSet, IBX.IBQuery, SyncObjs, System.Win.ScktComp,
  TelpinRingMeAPI, IBX.IBEvents, IdTCPServer, idSync, IdGlobal, IdAntiFreezeBase,
  Vcl.IdAntiFreeze, IBX.IBSQL, RzCommon, RzSelDir, ATBinHex, Vcl.ComCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxListBox;

const
  WM_REOPEN_PHONES = WM_USER + 1;

type
  TLogger = class
  private
    h: THandle;
  public
    constructor Create(AFileName: string);
    destructor Destroy; override;
    procedure Write(s: Ansistring);
  end;

type
  TDbWriter = class(TThread)
  protected
    fDb: TIBDatabase;
    fSql: string;
    fIBSQL: TIBSQL;
    fParams: TStringList;
    fMess: string;
    fMessLock: Boolean;
    procedure Execute; override;
    procedure Log;
    procedure WriteLog(Amess: string; Ablock: Boolean = True);
    function CreateIBSql(ADb: TIBDatabase): TIBSQL;
  public
    constructor Create(ADb: TIBDatabase; AParam: TStrings; ASql: string); overload;
    destructor Destroy; override;
  end;
//                 http://127.0.0.1:45455/calls?callflow=in&CallStatus=CALLING&callid=9467988721.test2&callapiid=5nl3euxysfbpiqavs2zj&CalledExtension=9738*755&CallerIdNum=%2B79104579648
  TCallSession = class(TThread)
  protected
    fStartTime: TDateTime;
    fStarted: Boolean;
    fAccepted: Boolean;
    fTransfered: Boolean; // звонок переведен
    fFinished: Boolean;
    fSeconds: Integer; // макс. время работы
    fList: TStringList;
    fCallIdList: TStringList;
    fCallId: string;
    fAts: string;
    fMess: string;
    fMessLock: Boolean;
    fWorkTime: integer; //время работы в сек
    fStopTime: Integer; // пауза для проверки окончания
    //fNeedCheckStatus: Boolean; //нужно поверять статус
    //fListener: TCallListener;

    procedure Log;
    procedure WriteLog(Amess: string; Ablock: Boolean = True);
    procedure Execute; override;
    procedure DeleteSession;
    procedure StartCall(CallApiId: string; ats: string);
    procedure EndCall(CallApiId, CallStatus: string);
    procedure TransferCall(CallId: string; ats: string);
    procedure AcceptCall(CallId: string);
    procedure SendMess;
  public
    //CallApiId: string;
    CallID: string; // в новом API общий ID - в CALLID
    Str: string;
    property Transfered: boolean read fTransfered write fTransfered;
    property Accepted: boolean read fAccepted write fAccepted;
    property Finished: boolean read fFinished write fFinished;
    constructor Create(ACallId, AStr: string; AList: TStringList; ASecond: integer); overload;
    destructor Destroy; override;
  end;

  TEventWriter = class(TThread)
  protected
    fParams: TStringList;
    fUri: string;
    fUserId: string;
    fSql: string;
    fMess: string;
    fMessLock: Boolean;
    fAts: string;
    fMsg: string;
    procedure Execute; override;
    procedure Log;
    procedure SendCommand;
    procedure WriteLog(Amess: string; Ablock: Boolean = True);
    procedure SendCommandToUser(ats, msg: string);

    function FindClientByPhone(ACallFlow, ACallId, ACallApiId: string; APhone: string; Aats: string; var AclientIdType: string): Integer;
    function FindSession(ACallId:string; ALock: boolean = true): TCallSession;
    procedure StartCall(CallId: string; ats: string);
    function EndCall(ACallApiId, ACallId, ACallStatus: string): boolean;
    procedure AcceptCall(ACallId: string);
  public
    constructor Create(AParam: TStrings; AURI, AUserId, ASql: string); overload;
    destructor Destroy; override;
  end;
  //TCallWriter = class(TThread)
   // protected
  //end;

  TMyContext = class(TIdServerContext)
    public
      IP: String;
      Nick: String;
      UserId: Integer;
      Con: TDateTime;
      function SendMsg(const ANick: String; const AMsg: String) : Boolean;
      procedure BroadcastMsg(const bmsg: String);
      procedure BroadcastMsgAll(const ANick: String; const bmsg: String);
  end;

  TMF = class(TForm)
    Log_memo: TMemo;
    Tel_SRV: TIdHTTPServer;
    DefTr: TIBTransaction;
    DB: TIBDatabase;
    CallEnent_Q: TIBQuery;
    IBEvents: TIBEvents;
    TCPServer: TIdTCPServer;
    QPhones: TIBQuery;
    RzSelDirDialog1: TRzSelDirDialog;
    LogText: TATBinHex;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label9: TLabel;
    Button2: TButton;
    edtSocketPort: TSpinEdit;
    Edit1: TEdit;
    Button4: TButton;
    Button6: TButton;
    DebugMode_cb: TCheckBox;
    Button8: TButton;
    Button9: TButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    TelStatus_lbl: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Button1: TButton;
    TelPort_spin: TSpinEdit;
    TelIP_edt: TEdit;
    TelURI_edt: TEdit;
    edtUserId: TEdit;
    btnPhone: TButton;
    edtRecordPath: TEdit;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBStatus_lbl: TLabel;
    Label10: TLabel;
    TestDb_btn: TButton;
    DBPath_edt: TEdit;
    DBUser_edt: TEdit;
    DBPass_edt: TEdit;
    Button3: TButton;
    Button7: TButton;
    lstPhones: TcxListBox;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Tel_SRVCommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure TestDb_btnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnPhoneClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure IBEventsEventAlert(Sender: TObject; EventName: string;
      EventCount: Integer; var CancelAlerts: Boolean);
    procedure Button6Click(Sender: TObject);
    procedure TCPServerConnect(AContext: TIdContext);
    procedure TCPServerDisconnect(AContext: TIdContext);
    procedure TCPServerExecute(AContext: TIdContext);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure QPhonesBeforeOpen(DataSet: TDataSet);
  private
    fSessions: TStringList;

    procedure AddLog (Logstr :string; ALock: boolean=True);
    //Function AddCallEvent(Params :TStrings) :Boolean;
    Function FumigatorCommand(ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo) :Boolean; //выполнение комманд от клиентов прокадо
    function SocketCommand(AContext: TIdContext; cmd, arg: string): Boolean;
    function CreateRWQuery :TIBQuery;
    function CreateRWSql :TIBSQL;

    procedure AfterOutcomCall(Sender: TObject);
    procedure CallFinished(Sender: TObject);
    function SendCommandToUser(atsnum, command: string; ALock: Boolean=true): Boolean;
    function UpdateSession(ACallId: string): Boolean;
    //function AcceptCall(ACallId, APhone: string): boolean;
    //function FindClientByPhone(ACallFlow, ACallId, ACallApiId: string; APhone: string; Aats: string; var AclientIdType: string): Integer;
    //function EndCall(ACallApiId, ACallId, ACallStatus: string): boolean;

    procedure ReopenPhones;
    procedure WmReopenPhones(var Msg: TMessage); message WM_REOPEN_PHONES;

    function GetRecordFile(ARecord_uuid: string): string;
  public
    CSection: TCriticalSection;
    CSectionFumigator: TCriticalSection;
    CSectionSocket:  TCriticalSection;
    CSectionCommand: TCriticalSection;
    CSectionLog: TCriticalSection;

    AccessToken: TTelphinRingMeToken;
   // Caller: TPhoneCalls;

    AtsUserPrefix: string;

    LogName: string;
    Logger: TLogger;

    procedure AddLogMemo(Logstr :string; ALock: Boolean=True);
    function SendMsg(const ANick: String; const AMsg: String) : Boolean;
    function BroadcastMsg(const bmsg: String): boolean;
    procedure WriteLog(s: string);
    procedure AppException(Sender: TObject; E: Exception);
    function GetUserList(Exclude: string): string; //список подключенных пользователей

  end;

const
   LogFile = 'Srv_Log.txt';
   MutexDelay = 500;
var
  MF: TMF;
  LogMutex: THandle;
  MsgMutex: THandle;
  EventsMutex: THandle;
  CallMutex: THandle;
  CSectionMsg: TCriticalSection;

implementation

{$R *.dfm}
uses
  System.DateUtils, CommonFunc, System.StrUtils;


procedure TMF.AddLog(Logstr: string; ALock: Boolean=true);
 var
  F : TextFile;
  LogStr2 :string;
  FileName : String;
begin
  WriteLog(Logstr);
  exit;

  LogStr2 :=  DateTimeToStr(Now) + ' - '+LogStr;

  FileName := ExtractFilePath(Application.ExeName) +   LogFile;
  if (ALock and LockMutex(LogMutex, MutexDelay)) or not ALock then
  try
    //CSectionLog.Enter;
    AssignFile(F, FileName);
    if FileExists(FileName) then
      Append(F)
    else
      Rewrite(F);

   if LogStr[1] = '#' then
     WriteLn(F,  ' ');

    WriteLn(F,  LogStr2);


    try CloseFile(F); except end;
    //CSectionLog.Leave;

    if DebugMode_cb.Checked then
    begin
       AddLogMemo(LogStr2, false);
       //if LogStr[1] = '#' then Log_memo.Lines.Add('');
       //Log_memo.Lines.Add(LogStr2);
    end;
  finally
    if ALock then
      UnlockMutex(LogMutex);
  end;
end;


procedure TMF.AddLogMemo(Logstr: string; ALock: Boolean=true);
begin
   WriteLog(Logstr);
  exit;

  if (ALock and LockMutex(LogMutex, MutexDelay)) or not ALock then
  try
    Log_memo.Lines.BeginUpdate;
    if LogStr[1] = '#' then
      Log_memo.Lines.Add('');
    Log_memo.Lines.Add(Logstr);
  finally
    Log_memo.Lines.EndUpdate;
    if ALock then
      UnLockMutex(LogMutex);
    if not Log_memo.Focused then
      SendMessage(Log_memo.Handle, WM_VSCROLL, SB_BOTTOM, 0);
  end;
end;

procedure TMF.AfterOutcomCall(Sender: TObject);
begin
  //SendCommandToUser(TPhoneCalls(Sender).Extension, '#callid:' + TPhoneCalls(Sender).CallId);
end;


procedure TMF.AppException(Sender: TObject; E: Exception);
begin
  WriteLog('Ошибка приложения: ' + E.Message);
end;

function TMF.BroadcastMsg(const bmsg: String): boolean;
var
  i: Integer;
  Context: TMyContext;
  List: TList;
begin
  if not Assigned(TCPServer.Contexts) then
    Exit;
   try
   List := TCPServer.Contexts.LockList;
   for I := 0 to List.Count-1 do
    begin
      Context := TMyContext(List[I]);
      try
        Context.Connection.IOHandler.WriteLn(bmsg);
      except
         AddLogMemo('Ошибка отправки сообщения: ' +
          Context.Nick + ': ' + bmsg + #13#10 +
          Exception(ExceptObject).Message);
          Context.Connection.IOHandler.Close;
      end;
      AddLogMemo('Послали сообщение для ' + Context.Nick + ': ' + bmsg);
    end;
   finally
     TCPServer.Contexts.UnLockList;
   end;
end;

procedure TMF.btnPhoneClick(Sender: TObject);
begin
  AtsUserPrefix := Trim(edtUserId.Text) + '*';
  AccessToken.GetToken;
  AddLogMemo('Получен токен доступа');
end;

procedure TMF.Button1Click(Sender: TObject);
begin
  Tel_SRV.Active := false;
  Tel_srv.Bindings.Clear;

  try
    Tel_SRV.Bindings.Add.IP                                  := TelIP_edt.Text;
    Tel_SRV.Bindings[Tel_SRV.Bindings.Count - 1].Port        := TelPort_spin.Value ;
    Tel_SRV.Bindings.DefaultPort := TelPort_spin.Value;
    Tel_SRV.Active := true;
    AtsUserPrefix := Trim(edtUserId.Text) + '*';
  Except
     on  E: Exception do begin
        AddLog('Ошибка запуска службы Call_Events : "' +e.Message+'"');

          TelStatus_lbl.Caption := 'Не активен!';
          TelStatus_lbl.Font.Color := clMaroon;
     end;

  end;

  if Tel_SRV.Active = true then
  begin
  AddLog('#Служба Call_Events запущена на интерфейсе '
          + TelIP_edt.Text+':' + IntToStr(TelPort_spin.Value)+ TelURI_edt.Text);

          TelStatus_lbl.Caption := 'Работает';
          TelStatus_lbl.Font.Color := $00408000;
  end;
end;

procedure TMF.Button2Click(Sender: TObject);
begin
  try
  TCPServer.Active := False;
  TCPServer.DefaultPort := edtSocketPort.Value;
  TCPServer.Active := true;

  //MsgThread := TMsgThread.Create(TCPServer);
  //MsgThread.Start;

  AddLog('#Сервер сокетов запущен. Порт: ' + IntToStr(TCPServer.DefaultPort));
  except
    AddLogMemo('#Ошибка при запуске сервер сокетов: ' +
      Exception(ExceptObject).Message);
  end;

end;

procedure TMF.Button4Click(Sender: TObject);
var
  i: Integer;
begin
 //BroadcastMsg('#msg:' + Edit1.Text);
 SendCommandToUser('*', '#msg:' + Edit1.Text);
end;

procedure TMF.Button5Click(Sender: TObject);
var
  i: Integer;
  s: string;
  tInfo: TTelphinRingMeTool;
  lCaller: TPhoneCalls;
begin
   //cl := TCallListener.Create(AccessToken, Edit1.Text, '@self');
   //cl.ExtIgnored := '099,200';
   //cl.OnCallAccept := AfterOutcomCall;
   //cl.Start;
  lCaller := TPhoneCalls.Create(AccessToken);
  //Caller.DeleteCall(Edit1.Text, '755');
  //lCaller.SimpleCall('755', '+79104579648', '755');
  lCaller.TransferCall(Edit1.Text, '757', '755');
  lCaller.Free;
end;

procedure TMF.Button6Click(Sender: TObject);
begin
  SendCommandToUser('*', Edit1.Text);
end;

procedure TMF.Button7Click(Sender: TObject);
begin
  ReopenPhones;
end;

procedure TMF.Button8Click(Sender: TObject);
begin
  ShowMessage('Кол-во соединений: ' + IntToStr(TCPServer.Contexts.Count));
end;

procedure TMF.Button9Click(Sender: TObject);
begin
  Log_memo.Clear;
end;

procedure TMF.CallFinished(Sender: TObject);
begin
  //UpdateSession(TCallListener(Sender).CallId);
  //SendCommandToUser(TCallListener(Sender).Extension, '#callfinish:' + TCallListener(Sender).CallApiId);
end;

function TMF.CreateRWQuery: TIBQuery;
var
  TR :TIBTransaction;
begin
  TR := TIBTransaction.Create(self);
  TR.DefaultDatabase := DB;
  TR.DefaultAction := TACommit;
  TR.AutoStopAction := saCommit;

  TR.Params.Add('isc_tpb_read_committed');
  TR.Params.Add('isc_tpb_rec_version');
  TR.Params.Add('isc_tpb_wait');

  // Только для чтения
  //TR.Params.Add('read');
  //TR.Params.Add('nowait');
  //TR.Params.Add('rec_version');
  //TR.Params.Add('read_committed');

  // Для записи
  //TR.AllowAutoStart := False;
  //TR.DefaultDatabase := DB;
  //TR.DefaultAction := TACommit;
  //TR.Params.Add('write');
  //TR.Params.Add('nowait');
  //TR.Params.Add('read_committed');
  //TR.Params.Add('rec_version');

  result := TIBQuery.Create(self);
  result.Database := DB;
  result.Transaction := TR;

end;

function TMF.CreateRWSQL: TIBSQL;
var
  TR :TIBTransaction;
begin
  TR := TIBTransaction.Create(self);
  TR.DefaultDatabase := DB;
  TR.DefaultAction := TACommit;
  TR.AutoStopAction := saCommit;

  TR.Params.Add('isc_tpb_read_committed');
  TR.Params.Add('isc_tpb_rec_version');
  TR.Params.Add('isc_tpb_wait');

  result := TIBSQL.Create(self);
  result.Database := DB;
  result.Transaction := TR;

end;

(*function TMF.EndCall(ACallApiId, ACallId, ACallStatus: string): boolean;
var
  ind: Integer;
begin
 if LockMutex(EventsMutex, 1000) then
  try
    ind := fSessions.IndexOf(ACallApiId);
    if ind > -1 then
    begin
      TCallSession(fSessions.Objects[ind]).EndCall(ACallId, AcallStatus);
      Exit;
    end;
  finally
    UnLockMutex(EventsMutex);
  end;
end;

function TMF.FindClientByPhone(ACallFlow, ACallId, ACallApiId: string; APhone: string; Aats: string; var AclientIdType: string): Integer;
var
  ind: Integer;
  CallObj: TCallSession;
  fIn: Boolean;
  lMutex: boolean;
begin
  fIn := ACallFlow = 'in';
  if fIn then
    lMutex := LockMutex(EventsMutex, 2000);

  if (fIn and lMutex) or not fIn then
  try
    if fIn then
    begin
      ind := fSessions.IndexOf(ACallApiId);
      if ind > -1 then
      begin
        CallObj := TCallSession(fSessions.Objects[ind]);
        AclientIDType := CallObj.Str;
        //Exit;
      end
    end
    else
      ind := -1;

    if ind = -1 then
    begin
      if QPhones.Locate('phone', Aphone, []) then
      begin
        AClientIDType   := //QPhones.FieldByName('client_id').AsString + ',' +
          QPhones.FieldByName('type_cli').AsString;
        //fSessions.AddObject(ACallApiId, TCallSession.Create(ACallApiId, AClientIDType, fSessions, 30));
      end
      else
        AClientIDType := '0,';

      if fIn then
      begin
        CallObj := TCallSession.Create(ACallApiId, AclientIdType, fSessions, 60);
        fSessions.AddObject(ACallApiId, CallObj);
        CallObj.StartCall(ACallId, Aats);
      end;
    end;
  finally
    if lMutex then
      UnlockMutex(EventsMutex);
  end;
end;*)

procedure TMF.FormCreate(Sender: TObject);
begin
  CSection          := TCriticalSection.Create;
  CSectionFumigator := TCriticalSection.Create;
  CSectionSocket    := TCriticalSection.Create;
  CSectionCommand   := TCriticalSection.Create;
  CSectionLog       := TCriticalSection.Create;
  CSectionMsg       := TCriticalSection.Create;
  fSessions         := TStringList.Create;

  AccessToken := TTelphinRingMeToken.Create;
  AccessToken.AppId := 'f6444c4e28b14529bfcbf2cdfaff00ae';
  AccessToken.AppSecret := '363999ae34484bef86c4831aa5e9e89f';

  TCPServer.ContextClass := TMyContext;

  AtsUserPrefix := Trim(edtUserId.Text) + '*';

  LogName := ExtractFilePath(Application.ExeName) +   LogFile;

  Logger := TLogger.Create(LogName);

  LogText.Open(LogName, True);
  LogText.PosPercent := 100;
end;

procedure TMF.FormDestroy(Sender: TObject);
begin
  //MsgThread.Terminate;
  //MsgThread.WaitFor;
  //MsgThread.Free;
  //FileClose(LogHandle);
  Logger.Free;

  FreeAndNil(fSessions);
  CSection.Release;
  CSectionFumigator.Release;
  CSectionSocket.Release;
  CSectionCommand.Release;
  CSectionLog.Release;
  CSectionMsg.Release;

  FreeAndNil(AccessToken);
  //FreeAndNil(Caller);
end;


procedure TMF.IBEventsEventAlert(Sender: TObject; EventName: string;
  EventCount: Integer; var CancelAlerts: Boolean);
begin
  try
    //LockMutex(EventsMutex, MutexDelay);
    EventName := Copy(EventName,1,Length(EventName) - 1); //избавляемся от #0 на конце
    AddLogMemo('#IBEvent: ' + EventName);
    (*if Copy(EventName,1,11) = 'INCOME_CALL' then
    begin
      //SendCommandToUser('*', '#checkcall:', false);
    end
    else

    if Copy(EventName,1,13) = 'SESSION_CLOSE' then
      //SendCommandToUser('*', '#checksession:', false)
    else

    if Copy(EventName,1,12) = 'ACCEPT_PHONE' then
      SendCommandToUser('*', '#checkacceptcall:', false)*)
    if EventName = 'CLIENTS_CHANGED' then
      PostMessage(Self.Handle, WM_REOPEN_PHONES, 0, 0)
    else
    if EventName = 'PHONES_CHANGED' then
      PostMessage(Self.Handle, WM_REOPEN_PHONES, 0, 1)


  finally
    //UnLockMutex(EventsMutex);
    //CancelAlerts := True;
  end;
end;

procedure TMF.QPhonesBeforeOpen(DataSet: TDataSet);
begin
  if not DB.Connected then
    DB.Open;
end;

procedure TMF.ReopenPhones;
begin
  if LockMutex(EventsMutex, 2000) then
  try
    QPhones.Close;
    QPhones.Open;
    AddLogMemo('#Обновлен список телефонов');
  finally
    UnLockMutex(EventsMutex);
  end;
end;

function TMF.FumigatorCommand(ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo): Boolean;
var
  s: string;
  fumigatorFileName: string;
  Stream: TMemoryStream;
begin
  CSectionFumigator.Enter;
  try
    //обязательный параметр action
    if ARequestInfo.Params.IndexOfName('action') < 0 then
      exit;

    fumigatorFileName := ExtractFilePath(Application.ExeName) + 'fumigator.exe';
    // получить версию fumigator.exe
    if ARequestInfo.Params.Values['action'] = 'getlastversion' then
    begin
      if not FileExists(fumigatorFileName) then
      begin
        AResponseInfo.ResponseNo := 404;
        Exit;
      end;

      s := FileVersion(fumigatorFileName);
      AResponseInfo.ContentText := s;
      AResponseInfo.ResponseNo := 200;
    end

    else
    // получить файл fumigator.exe
    if ARequestInfo.Params.Values['action'] = 'getlastfile' then
    begin
      if not FileExists(fumigatorFileName) then
      begin
        AResponseInfo.ResponseNo := 404;
        Exit;
      end;

      Stream := TMemoryStream.Create;
      try
        Stream.LoadFromFile(fumigatorFileName);
        Stream.Position := 0;
        AResponseInfo.ContentStream := Stream;
        AResponseInfo.ContentLength := Stream.Size;
        AResponseInfo.ContentDisposition := 'attachment; filename=' + ExtractFileName(fumigatorFileName);
        AResponseInfo.ContentType   := 'application/octet-stream';
        AResponseInfo.ResponseNo    := 200;

        AResponseInfo.WriteHeader;
        AResponseInfo.WriteContent;
      finally
        //Stream.Free;
      end;
    end

    else // получить файл записи
    if ARequestInfo.Params.Values['action'] = 'getrecfile' then
    try
      WriteLog(ARequestInfo.UnparsedParams);
      s := ARequestInfo.Params.Values['recid'];
      s := GetRecordFile(s);
      if s <> '' then
      begin
        Stream := TMemoryStream.Create;
        try
        try
          Stream.LoadFromFile(s);
          Stream.Position := 0;
          AResponseInfo.ContentStream := Stream;
          AResponseInfo.ContentLength := Stream.Size;
          AResponseInfo.ContentDisposition := 'attachment; filename=' + ExtractFileName(s);
          AResponseInfo.ContentType   := 'application/octet-stream';
          AResponseInfo.ResponseNo    := 200;

          AResponseInfo.WriteHeader;
          AResponseInfo.WriteContent;
        except
          WriteLog('Ошибка: ' + Exception(ExceptObject).Message);
          AResponseInfo.ResponseNo    := 403;
          AResponseInfo.WriteHeader;
        end;
        finally

        end;
      end
      else //не найден
      begin
        AResponseInfo.ResponseNo    := 404;
        AResponseInfo.WriteHeader;
      end;
  finally
    WriteLog(IntToStr(AResponseInfo.ResponseNo)+ ' | ' + s);
  end;
  finally
    CSectionFumigator.Leave;
    //if Assigned(stream) then
    //  Stream.Free;
  end;

end;

function TMF.GetRecordFile(ARecord_uuid: string): string;
var
  fn: string;
  mStream: TMemoryStream;
  lCaller: TPhoneCalls;
begin
  mStream := TMemoryStream.Create;
  try
    if not DirectoryExists(edtRecordPath.Text) then
      CreateDir(edtRecordPath.Text);
    fn := edtRecordPath.Text + '\' + ARecord_uuid + '.mp3';

    if FileExists(fn) then
    begin //файл уже есть
      Result := fn;
    end

    else //получаем от Телфина
    begin
      lCaller := TPhoneCalls.Create(AccessToken);
      try
      mStream := lcaller.GetRecord(ARecord_uuid) as TMemoryStream;
      if mStream.Size > 0 then
      begin
        mStream.Position := 0;
        try
          mStream.SaveToFile(fn);
          Result := fn;
        except
          Result := '';
        end;
      end;
      finally
            lCaller.Free;
      end;
    end;

  finally
    mStream.Free;
  end;

end;

function TMF.GetUserList(Exclude: string): string;
var
  List: TList;
  ListOut: TStringList;
  Context: TMyContext;
  I, ind: Integer;
begin
  Result := '';
  ListOut := TStringList.Create;
  ListOut.Delimiter := ';';

  List := TCPServer.Contexts.LockList;
  try
    for I := 0 to lstPhones.Items.Count - 1 do
      ListOut.Add(lstPhones.Items[i] + '=');

    for I := 0 to List.Count-1 do
    begin
      Context := TMyContext(List[I]);
      //if lowercase(Context.Nick) <> lowercase(Exclude) then
      ind := ListOut.IndexOfName(Context.Nick);
      if ind > - 1 then
        ListOut.ValueFromIndex[ind] := IntToStr(Context.UserId);
    end;

  finally
    if Assigned(ListOut) then
    begin
      Result := ListOut.DelimitedText;
      ListOut.Free;
    end;
    TCPServer.Contexts.UnlockList;
  end;
end;

function TMF.SendCommandToUser(atsnum, command: string; ALock: Boolean=true): Boolean;
var
  i, p: Integer;
  List: TList;
  Context: TMyContext;
begin
  (*Result := False;
  if Assigned(MF.MsgThread) then
  begin
    MF.MsgThread.AddMsg(atsnum, command);
    Result := False;
  end;
  Exit;*)

  try
    if ALock then
     CSectionCommand.Enter;
    if atsnum <> '*' then
    begin
      p := Pos('*', atsnum);
      if p > 0 then
        atsnum := Copy(atsnum, p + 1, Length(atsnum));
      AddLogMemo('#' + command +' atsnum = ' + atsnum);

      //Log_memo.Lines.Add('#Посылаем сообщение: ' + command);
      try
        (*if TCPServer.Contexts.Count > 0 then
          with TCPServer.Contexts.LockList do
          try
            TMyContext(Items[0]).SendMsg(atsnum, command);
          finally
            TCPServer.Contexts.UnlockList;
          end;*)

        SendMsg(atsnum, command);
        //Application.ProcessMessages;
      except
        AddLogMemo('#Ошибка сообщения: ' + command + #13#10 +
        Exception(ExceptObject).Message);
      end;

    end

    else   //всем
    begin
        AddLogMemo('#Посылаем всем сообщение: ' + command);
        if TCPServer.Contexts.Count > 0 then
          (*with TCPServer.Contexts.LockList do
          try
            TMyContext(Items[0]).BroadcastMsg(command);
          finally
            TCPServer.Contexts.UnlockList;
          end; *)
          BroadcastMsg(command);
        //BroadcastMsg(command);
        // Application.ProcessMessages;
      (*except

      end; *)
    end;
  finally
    if ALock then
      CSectionCommand.Leave;
  end;
end;

function TMF.SendMsg(const ANick, AMsg: String): Boolean;
var
  List: TList;
  Context: TMyContext;
  I: Integer;
begin
  Result := False;
  //FContextList is inherited from TIdContext
  List := TCPServer.Contexts.LockList;
  try
    for I := 0 to List.Count-1 do
    begin
      Context := TMyContext(List[I]);
      if lowercase(Context.Nick) = lowercase(ANick) then
      begin
        try
          Context.Connection.IOHandler.WriteLn(AMsg);
          Result := True;
        except
          Context.Connection.IOHandler.Close;
           Exit;
        end;
      end;
    end;
  finally
    TCPServer.Contexts.UnlockList;
  end;
end;

function TMF.SocketCommand(AContext: TIdContext; cmd, arg: string): Boolean;
var
  p: Integer;
  argList: TStringList;
  answer: string;
  lCaller: TPhoneCalls;
begin
  argList := TStringList.Create;
  try
     argList.DelimitedText := arg;
    if cmd = 'call' then
    begin
      if not Assigned(lCaller) then
      begin
        lCaller := TPhoneCalls.Create(AccessToken);
        lCaller.OnAfterCall  := AfterOutcomCall;
        //Caller.OnCallFinish := CallFinished;
      end;
      lCaller.SimpleCall(argList[0], argList[1], argList[2]);
    end

    else
    if cmd = 'calldelete' then
    begin
      if not Assigned(lCaller) then
      begin
        lCaller := TPhoneCalls.Create(AccessToken);
        //lCaller.OnAfterCall  := AfterOutcomCall;
       // Caller.OnCallFinish := CallFinished;
      end;
      answer := argList[1];
      p := pos('*', answer);
      if (Length(answer) > 0) and (p > 0) then
        answer := Copy(answer, p + 1, Length(answer));
      lCaller.DeleteCall(argList[0], answer);
    end

    else
    if cmd = 'calltransfer' then // перевод звонка
    begin
      if not Assigned(lCaller) then
      begin
        lCaller := TPhoneCalls.Create(AccessToken);
        //lCaller.OnAfterCall  := AfterOutcomCall;
       // Caller.OnCallFinish := CallFinished;
      end;
      answer := argList[1];
      p := pos('*', answer);
      if (Length(answer) > 0) and (p > 0) then
        answer := Copy(answer, p + 1, Length(answer));
      lCaller.TransferCall(argList[0], answer, TMyContext(AContext).Nick);
    end

    else
    if cmd = 'callaccept' then  // взяли звонок
    begin
      (*AddLogMemo('callaccept');
      AcceptCall(argList[0], argList[1]);

      if not Assigned(Caller) then
      begin
        Caller := TPhoneCalls.Create(AccessToken);
        Caller.OnAfterCall  := AfterOutcomCall;
       // Caller.OnCallFinish := CallFinished;
      end;
      Caller.PickUpCall(argList[0], argList[1]); *)
    end

    else
    if cmd = 'getrecordinfo' then
    begin
      if not Assigned(lCaller) then
        lCaller := TPhoneCalls.Create(AccessToken);
        answer := argList[1];
        if answer = '' then
          answer := AtsUserPrefix + TMyContext(AContext).Nick;
        if (Length(answer) > 0) and (pos('*', answer) = 0) then
          answer := AtsUserPrefix + answer;

      answer := lCaller.GetRecordInfo(argList[0], answer);
      AContext.Connection.IOHandler.WriteLn(Format('#RecordInfo:%s,%s', [argList[0], Answer])); //номера атс может не быть, поэтому  не SendCommandToUser
      //SendCommandToUser(TMyContext(AContext).Nick, Format('#RecordInfo:argList[0], %s', [Answer]));
    end

    else
    if cmd = 'getuserlist' then
    begin
      answer := GetUserList(TMyContext(AContext).Nick);
      AContext.Connection.IOHandler.WriteLn(Format('#userphonelist:%s', [Answer]));
      //SendCommandToUser(TMyContext(AContext).Nick, Format('#RecordInfo:argList[0], %s', [Answer]));
    end

    else
    if cmd = 'getrecord' then //получение записи по-новому
    begin
      answer := GetRecordFile(argList[0]);
//      p := CommonFunc.GetFileSize(answer);
      AContext.Connection.IOHandler.WriteLn(Format('#RecordFile:%s', [answer])); //номера атс может не быть, поэтому  не SendCommandToUser
//      AContext.Connection.IOHandler.WriteLn(Format('#getfile:%d',[p]);
//      AContext.Connection.IOHandler.WriteFile(answer);
    end;

  finally
    argList.Free;
    if Assigned(lCaller) then
      lCaller.Free;
  end;
end;



procedure TMF.TCPServerConnect(AContext: TIdContext);
begin
  AContext.Connection.IOHandler.DefStringEncoding := IndyTextEncoding_UTF8;
  with TMyContext(AContext) do
  begin
    Con := Now;
    if (Connection.Socket <> nil) then
    begin
      IP := Connection.Socket.Binding.PeerIP;
      MF.AddLogMemo('#Присоединение клиента');
    end;
    //Nick := Connection.IOHandler.ReadLn;
    //BroadcastMsg('addlist|' + Nick);
  end;
end;

procedure TMF.TCPServerDisconnect(AContext: TIdContext);
begin
//tmycontext(acontext).broadcastMsg('deletelist|' + tmycontext(acontext).Nick);
  AddLogMemo('#Отсоединение клиента: ' + TMyContext(AContext).Nick);
end;

procedure TMF.TCPServerExecute(AContext: TIdContext);
var
  p: Integer;
  s, cmd, arg: string;
  arglist: TStringList;
begin
  try
    if not AContext.Connection.Connected then
      Exit;

    try
      s := AContext.Connection.IOHandler.ReadLn;
    except
      AContext.Connection.IOHandler.Close;
    end;

    if s = '' then
      Exit;

    AddLogMemo('#Клиент прислал сообщение: ' + s);
    if Copy(s, 1, 1) = '#' then
    begin
      p := Pos(':', s);
      cmd := Copy(s, 2, p - 2);
      arg := Copy(s, p + 1, Length(s));

      if cmd = 'setphone' then
      try
        arglist := TStringList.Create;
        arglist.Delimiter := ',';
        arglist.DelimitedText := arg;

        TMyContext(AContext).Nick := arglist[0];
        if arglist.Count > 1 then
          TMyContext(AContext).UserId := StrToInt(arglist[1]);
        try
          AContext.Connection.IOHandler.WriteLn('#servertime:' + IntToStr(SecondOfTheDay(Now)));
        except
          try AContext.Connection.IOHandler.Close; except end;
          AddLogMemo('#Ошибка записи: ' +Exception(ExceptObject).Message);
        end;
      finally
        arglist.Free;
      end
      else

      if cmd = 'terminate' then
        Application.Terminate

      else
        SocketCommand(AContext, cmd, arg);

    end;


  except

  end;

end;

procedure TMF.Tel_SRVCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  LogList: TStringList;
begin
  if ARequestInfo.URI = '/fumigator' then
    FumigatorCommand(ARequestInfo, AResponseInfo);

// новое Вхождение
if ARequestInfo.URI = Trim(TelURI_edt.Text) then
   TEventWriter.Create(ARequestInfo.Params, ARequestInfo.URI,
     edtUserId.Text, CallEnent_Q.SQL.Text);

    //Addlog('#Поступление события на службы Call_Events');
    //AddLogMemo(ARequestInfo.URI);
    //AddLogMemo(ARequestInfo.Params.Text);
    (*try
      CSection.Enter;
    if (ARequestInfo.URI = Trim(TelURI_edt.Text)) then

      try
        LogList := TStringList.Create;
        LogList.Add('#Поступление события на службы Call_Events');
        LogList.Add(ARequestInfo.URI);
        LogList.Add(ARequestInfo.Params.Text);
        AddLog(LogList.Text);
      finally
        AddCallEvent(ARequestInfo.Params);
        //if (ServerSocket.Socket.ActiveConnections > 0) then
//          if AddCallEvent(ARequestInfo.Params) = true then
//            AddLog('Записан Call Events с ID: '+ ARequestInfo.Params.Values['CallID']+ ' - '
//               + ARequestInfo.Params.Values['CallStatus']);
        LogList.Free;
      end
    else
      Addlog('Запрос не содержит данных Call_Events, либо неверный URI.');
  finally
    CSection.Leave;
  end;*)

end;

procedure TMF.TestDb_btnClick(Sender: TObject);
begin

  try
    DB.Close;
    DB.Params.Clear;
    DB.DatabaseName := DBPath_edt.Text;
    DB.Params.Add('USER_NAME='+DBUser_edt.Text );
    DB.Params.Add('PASSWORD=' + DBPass_edt.Text);
    DB.Open;
  except
    on E: Exception do begin
       AddLog('#Не удалось подключиться к БД. Проверьте настройки. Текст ошибки "'+E.Message+'"');

    DBStatus_lbl.Caption := 'Не установлено';
    DBStatus_lbl.Font.Color := clMaroon;
    end;
  end;

  if Db.Connected then
  begin
    AddLog('#Соединение с БД установлено.');

    DBStatus_lbl.Caption := 'Установлено';
    DBStatus_lbl.Font.Color := $00408000;

    IBEvents.RegisterEvents;
    QPhones.Open;
  end;

end;

function TMF.UpdateSession(ACallId: string): Boolean;
var Q :TIBQuery;
begin
  try
    if not DB.Connected then
      Exit;

    Q := CreateRWQuery;
    Q.SQL.Text := Format('update sessions set endtime=current_timestamp(3) where callid=''%s''', [ACallId]);

    Try
      Q.ExecSQL;
      Result := true;
    Except
      on E : Exception do
      begin
        AddLog('#Ошибка обновления сессии: "' +E.Message + '". SQL: '+Q.SQL.Text+'.');
        Result := false;
      end;

    End;

    if Q.Transaction.Active then
      Q.Transaction.Commit;

  finally
    Q.Transaction.Free;
    FreeAndNil(Q);
  end;
end;

procedure TMF.WmReopenPhones(var Msg: TMessage);
begin
  try
    ReopenPhones;
  finally
    if Msg.LParam = 0 then
      SendCommandToUser('*', '#cmdfumigator:updateclients');
  end;
end;

procedure TMF.WriteLog(s: string);
var
  StringLen, i: integer;
  d: string;
  buffer: PChar;
begin
  Logger.Write(s);
  Exit;

//    if Length(S)>0 then
//      DateTimeToString(d,'dd.mm.yy hh:nn:ss:zzz', now());
//
//    d := '[' + d + '] ' + s + #13#10;
//  if LockMutex(LogMutex, MutexDelay) then
//  try
//    FileSeek(LogHandle,0,2);
//
//    StringLen := Length(d);
//    GetMem(Buffer, StringLen); { allocate the buffer }
//
//    StrCopy(buffer, PChar(d));
//    FileWrite(LogHandle, buffer , StringLen);
//  finally
//    UnLockMutex(LogMutex);
//    FreeMem(Buffer, StringLen);
//    FlushFileBuffers()
//  end;
end;

Function TMyContext.SendMsg(const ANick: String; const AMsg:String) : Boolean;
var
  List: TList;
  Context: TMyContext;
  I: Integer;
begin
  Result := False;
  //FContextList is inherited from TIdContext
  List := FContextList.LockList;
  try
    for I := 0 to List.Count-1 do
    begin
      Context := TMyContext(List[I]);
      if lowercase(Context.Nick) = lowercase(ANick) then
      begin
        try
          Context.Connection.IOHandler.WriteLn(AMsg);
          Result := True;
        except
          Context.Connection.IOHandler.Close;
        end;
        Exit;
      end;
    end;
  finally
    FContextList.UnlockList;
  end;
end;


//******broadcast procedures *******//
procedure TMycontext.BroadcastMsgAll(const ANick: String; const bmsg: String);
var
    List: TList;
    Context: TMyContext;
    I: Integer;
begin
    // FContextList is inherited from TIdContext
    List := FContextList.LockList;
    try
        for I := 0 to List.Count-1 do
        begin
            Context := TMyContext(List[I]);
            if Context <> Self  then try
                Context.Connection.IOHandler.WriteLn(ANick + '> ' + bmsg);

            except end;
        end;
    finally
        FContextList.UnlockList;
    end;
end;

procedure TMyContext.BroadcastMsg(const bmsg: String);
var
  List: TList;
  Context: TMyContext;
  I: Integer;
begin
  // FContextList is inherited from TIdContext
  List := FContextList.LockList;
  try
    for I := 0 to List.Count-1 do
    begin
      Context := TMyContext(List[I]);
      //if Context <> Self then
      try
        Context.Connection.IOHandler.WriteLn(bmsg);
      except
        Context.Connection.IOHandler.Close;
      end;
    end;
  finally
    FContextList.UnlockList;
  end;
end;


{ TDbWriter }

constructor TDbWriter.Create(ADb: TIBDatabase; AParam: TStrings;
  ASql: string);
begin
  inherited Create(true);
  fParams := TStringList.Create;
  fParams.Assign(AParam);

  fDb := ADb;
  fIBSQL := CreateIBSql(ADb);
  fSql := ASql;
 // fIBSQL.SQL.Text := ASql;

  FreeOnTerminate := True;
  //Resume;
end;

function TDbWriter.CreateIBSql(ADB: TIBDatabase): TIBSQL;
var
  TR :TIBTransaction;
begin
  TR := TIBTransaction.Create(nil);
  TR.DefaultDatabase := ADB;
  TR.DefaultAction := TACommit;
  TR.AutoStopAction := saCommit;

  TR.Params.Add('isc_tpb_read_committed');
  TR.Params.Add('isc_tpb_rec_version');
  TR.Params.Add('isc_tpb_wait');

  result := TIBSQL.Create(nil);
  result.Database := ADB;
  result.Transaction := TR;
end;

destructor TDbWriter.Destroy;
begin
  fParams.Free;
  if Assigned(fIBSQL) then
  begin
    fIBSQL.Transaction.Free;
    fIBSQL.Free;
  end;
  inherited;
end;

procedure TDbWriter.Execute;
var
  Cf :Byte;
  p, step: Integer;
  fOk: Boolean;
begin
  try
    //WriteLog('Execute', False);
    fIBSQL.Transaction.Active := True;
    //fIBSQL.SQL.Text := fSQL;
    if fParams.Values['CALLFLOW'] = 'in' then
      cf := 0
    else
      cf := 1;

    if fParams.Values['CALLEDEXTENSIONID'] = '' then
      fParams.Values['CALLEDEXTENSIONID'] := 'null';
    if fParams.Values['CALLEREXTENSIONID'] = '' then
      fParams.Values['CALLEREXTENSIONID'] := 'null';
    if fParams.Values['DURATION'] = '' then
      fParams.Values['DURATION'] := 'null';

    if (fParams.IndexOfName('CLIENT_ID') = -1) or
       (fParams.Values['CLIENT_ID'] = '0') then
    begin
      fParams.Values['CLIENT_ID'] := 'null';
      fParams.Values['CLIENT_TYPE'] := 'null';
    end;

    fSql := StringReplace(fSql, ':CALLFLOW', IntToStr(Cf), [rfReplaceAll, rfIgnoreCase]);
    fSql := StringReplace(fSql, ':CALLID', AnsiQuotedStr(fParams.Values['CallID'], ''''), [rfReplaceAll, rfIgnoreCase]);
    fSql := StringReplace(fSql, ':CALLERIDNUM', AnsiQuotedStr(fParams.Values['CALLERIDNUM'], ''''), [rfReplaceAll, rfIgnoreCase]);
    fSql := StringReplace(fSql, ':CALLERIDNAME', AnsiQuotedStr(fParams.Values['CALLERIDNAME'], ''''), [rfReplaceAll, rfIgnoreCase]);
    fSql := StringReplace(fSql, ':CALLEDDID', AnsiQuotedStr(fParams.Values['CALLEDDID'], ''''), [rfReplaceAll, rfIgnoreCase]);
    fSql := StringReplace(fSql, ':CALLEREXTENSIONID', fParams.Values['CALLEREXTENSIONID'], [rfReplaceAll, rfIgnoreCase]);
    fSql := StringReplace(fSql, ':CALLEREXTENSION', AnsiQuotedStr(fParams.Values['CALLEREXTENSION'], ''''), [rfReplaceAll, rfIgnoreCase]);
    fSql := StringReplace(fSql, ':CALLSTATUS', AnsiQuotedStr(fParams.Values['CALLSTATUS'], ''''), [rfReplaceAll, rfIgnoreCase]);
    fSql := StringReplace(fSql, ':CALLEDEXTENSIONID', fParams.Values['CALLEDEXTENSIONID'], [rfReplaceAll, rfIgnoreCase]);
    fSql := StringReplace(fSql, ':CALLEDEXTENSION', AnsiQuotedStr(fParams.Values['CALLEDEXTENSION'], ''''), [rfReplaceAll, rfIgnoreCase]);
    fSql := StringReplace(fSql, ':CALLEDNUMBER', AnsiQuotedStr(fParams.Values['CALLEDNUMBER'], ''''), [rfReplaceAll, rfIgnoreCase]);
    fSql := StringReplace(fSql, ':CALLAPIID', AnsiQuotedStr(fParams.Values['CALLAPIID'], ''''), [rfReplaceAll, rfIgnoreCase]);
    fSql := StringReplace(fSql, ':EVENTTYPE', AnsiQuotedStr(fParams.Values['EVENTTYPE'], ''''), [rfReplaceAll, rfIgnoreCase]);
    fSql := StringReplace(fSql, ':DURATION', fParams.Values['DURATION'], [rfReplaceAll, rfIgnoreCase]);
    fSql := StringReplace(fSql, ':RECID', AnsiQuotedStr(fParams.Values['RECID'], ''''), [rfReplaceAll, rfIgnoreCase]);
    fSql := StringReplace(fSql, ':EVENTTIME', fParams.Values['EVENTTIME'], [rfReplaceAll, rfIgnoreCase]);
    fSql := StringReplace(fSql, ':CLIENT_ID', fParams.Values['CLIENT_ID'], [rfReplaceAll, rfIgnoreCase]);
    fSql := StringReplace(fSql, ':CLIENT_TYPE', fParams.Values['CLIENT_TYPE'], [rfReplaceAll, rfIgnoreCase]);
    //WriteLog('Sql: ' + fSql, false);

    with fIBSQL do
    try
      SQL.Text := fSql;

      //ParamByName('CALLFLOW').AsInteger       := cf;
      //ParamByName('CALLID').AsString          := fParams.Values['CallID'];
      //ParamByName('CALLERIDNUM').AsString     := fParams.Values['CallerIDNum'];
      //ParamByName('CALLERIDNAME').AsString    := fParams.Values['CallerIDName'];
      //ParamByName('CALLEDDID').AsString       := fParams.Values['CalledDID'];
      //ParamByName('CALLEREXTENSION').AsString := fParams.Values['CallerExtension'];
      //ParamByName('CALLSTATUS').AsString      := fParams.Values['CallStatus'];
      //ParamByName('CALLEDEXTENSION').AsString := fParams.Values['CalledExtension'];
      //ParamByName('CALLEDNUMBER').AsString    := fParams.Values['CalledNumber'];
      //ParamByName('CALLAPIID').AsString       := fParams.Values['CallAPIID'];

      Sleep(100);
      // WriteLog('Установили Params', False);
      fOk := False; step := 0;
      while not fOk and (step < 10) do
      Try
        //WriteLog('Исполняем ' + fibSql.SQL.Text + #13#10 + fParams.Text);
        Transaction. Active := True;
        ExecQuery;
        if Transaction.Active then
           Transaction.Commit;
        //WriteLog('Записан Call Events с ID: '+ fParams.Values['CallID']+ ' - '
        //     + fParams.Values['CallStatus'], False);
        fOk := True;
      Except
        on E : Exception do
        begin
          if Transaction.Active then
             Transaction.Rollback;
          WriteLog('#Ошибка записи Call_Events! Ошибка: "' +E.Message + '". SQL: '+ SQL.Text+'.', false);

          fOk := Pos('deadlock', LowerCase(E.Message)) = 0;
          if not fOk then
          begin
            Inc(Step);
            Sleep(200);
          end;
        end;
      End;

    except
      WriteLog('Ошибка:' + Exception(ExceptObject).Message, false);
      //Synchronize(Log);

    end;
  finally
    Terminate;
  end;

end;

procedure TDbWriter.Log;
begin
  MF.AddLogMemo(fMess, fMessLock);
end;

procedure TDbWriter.WriteLog(Amess: string; Ablock: Boolean);
begin
  fMess := Amess;
  fMessLock := Ablock;
  Synchronize(Log);
end;

{ TCallSession }

procedure TCallSession.AcceptCall(CallId: string);
begin
  fAccepted := True;
end;

constructor TCallSession.Create(ACallId, AStr: string; AList: TStringList; ASecond: integer);
begin
  inherited Create(false);
  CallId := ACallId;
  Str := AStr;
  fList := AList;
  fSeconds := ASecond;
  FreeOnTerminate := True;
  fCallIdList := TStringList.Create;
  fStartTime := Now;

  //fListener := TCallListener.Create(MF.AccessToken, aCallApiId, '@self');
  //fListener.ExtIgnored := '099,200';
  //fListener.StopOnAccept := True;
  //fListener.AutoDestroy := True;
end;

procedure TCallSession.DeleteSession;
var
  ind: Integer;
begin
  if LockMutex(EventsMutex, 2000) then
  try
    fList.BeginUpdate;
    ind := fList.IndexOf(CallId);
    if ind > - 1 then
      fList.Delete(ind);
  finally
    fList.EndUpdate;
    UnLockMutex(EventsMutex);
  end;

end;

destructor TCallSession.Destroy;
begin

  inherited;
end;

procedure TCallSession.EndCall(CallApiId, CallStatus: string);
var
  ind: Integer;
  ats: string;
begin
  //fFinished := True;
  if LockMutex(CallMutex, 2000) then
  try
    ind := fCallIdList.IndexOf(CallApiId);
    if ind = -1 then
      Exit;
    fCallIdList.Delete(ind);
  finally
    UnlockMutex(CallMutex);
  end;
end;

procedure TCallSession.Execute;
//var

begin
  fWorkTime := 0;
  while not Terminated do
  begin
    Sleep(300);
    Inc(fWorkTime, 300);

    if fWorkTime/1000 > fSeconds then
      fFinished := true;

    if (fCallIdList.Count = 0) and (fStopTime = 0) then
      fStopTime := fWorkTime + 5000;

    if (fStopTime > 0) and (fWorkTime >= fStopTime) then
      fFinished := True;

    if fFinished then
    begin
      DeleteSession;
      Terminate;
      WriteLog('Уничтожен TCallSession: ' + CallId);
    end;
  end;
  Terminate;
end;

procedure TCallSession.SendMess;
begin
   WriteLog(Format('Accepted: %s %s', [fCallId, fats]), false);
   MF.SendCommandToUser(fAts, Format('#callaccepted:%s', [fCallId]), false);
end;

procedure TCallSession.StartCall(CallApiId, ats: string);
begin
  if LockMutex(CallMutex, 1000) then
  try
    fCallIdList.Add(CallApiId );
    fStopTime := 0;
  finally
    UnlockMutex(CallMutex);
  end;
end;

procedure TCallSession.TransferCall(CallId, ats: string);
begin

end;

procedure TCallSession.Log;
begin
  MF.AddLogMemo(fMess, fMessLock);
end;

procedure TCallSession.WriteLog(Amess: string; Ablock: Boolean);
begin
  fMess := Amess;
  fMessLock := Ablock;
  Synchronize(Log);
end;

{ TEventWriter }

procedure TEventWriter.AcceptCall(ACallId: string);
var
  ind: Integer;
begin
 if LockMutex(EventsMutex, 1000) then
  try
    ind := MF.fSessions.IndexOf(ACallId);
    if ind > -1 then
    begin
      TCallSession(MF.fSessions.Objects[ind]).Accepted := True; //AcceptCall(ACallId);
      Exit;
    end;
  finally
    UnLockMutex(EventsMutex);
  end;
end;

constructor TEventWriter.Create(AParam: TStrings; AURI, AUserId, ASql: string);
begin
  inherited Create(False);
  fParams := TStringList.Create;
  fParams.Assign(AParam);
  fUri := AUri;
  fUserId := AUserId;
  fSql := ASql;
  FreeOnTerminate := True;
end;

destructor TEventWriter.Destroy;
begin
  fParams.Free;
  inherited;
end;

function TEventWriter.EndCall(ACallApiId, ACallId, ACallStatus: string): boolean;
var
  ind: Integer;
begin
 if LockMutex(EventsMutex, 1000) then
  try
    ind := MF.fSessions.IndexOf(ACallId);
    if ind > -1 then
    begin
      TCallSession(MF.fSessions.Objects[ind]).EndCall(ACallApiId, ACallStatus);
      Exit;
    end;
  finally
    UnLockMutex(EventsMutex);
  end;
end;

procedure TEventWriter.Execute;
var
  s: string;
  Cf :Byte;
  userid, ats, tel, client_type: string;
  p, client_id: Integer;
  CallObj: TCallSession;
begin
  s := '#Поступление события на службы Call_Events' + #13#10 +
       fUri + #13#10 +
       fParams.Text;
  WriteLog(s);

  begin
    if fParams.indexOfName('CALLFLOW') = -1 then
      Exit;

    if fParams.Values['CALLFLOW'] = 'in' then
    begin
      userid := fParams.Values['CalledExtension'];
      tel    := fParams.Values['CallerIdNum'];
      cf := 0;
    end
    else
    begin
      userid := fParams.Values['CallerExtension'];
      tel    := fParams.Values['CalledNumber'];
      Cf := 1
    end;
    p := Pos('*', userid);
    if p > 0 then
    begin
      ats := Copy(userid, p + 1, Length(userid));
      userid := Copy(userid, 1, p - 1);
    end;
    p := Pos('@', ats);
    if p > 0  then
      ats := Copy(ats, 1, p - 1);

    WriteLog('user_id = ' + userid);

    if userid <> fUserId then //только нужную АТС отсекаем
      Exit;

    if fParams.Values['CallStatus'] <> 'CALLING' then // при звонке отдельна запись
      with TDbWriter.Create(MF.DB, fParams, fSql) do
        Start;

    if fParams.Values['CallStatus'] = 'CALLING' then
    begin
      client_id := 0; client_type := '';
      if pos(fUserId + '*', tel) = 0 then
         FindClientByPhone(fParams.Values['CALLFLOW'], fParams.Values['CALLID'], fParams.Values['CALLAPIID'], tel, ats, client_type)
      else
      begin
         CallObj := nil;
         CallObj := FindSession(fParams.Values['CALLID']);
         if Assigned(CallObj) then
         begin
           CallObj.Transfered := True;
           client_type := CallObj.Str;
         end;
      end;
         p := Pos(',', client_type);
         if p > 0 then
         begin
           fParams.Add('CLIENT_ID=' + Copy(client_type, 1, p - 1));
           fParams.Add('CLIENT_TYPE=' + AnsiQuotedStr(Copy(client_type, p + 1, Length(client_type)),''''));
         end;
         with TDbWriter.Create(MF.DB, fParams, fSql) do
           Start;

         SendCommandToUser(ats, '#startcall:' +
           fParams.Values['CALLFLOW'] + ',' +
           fParams.Values['CallID'] + ',' +
           fParams.Values['CallAPIID'] + ',' +
           tel + ',' +
           //IntToStr(client_id) + ',' +
           client_type)
    end
    //end

    else  //окончание звонка
    if fParams.Values['EVENTTYPE'] = 'hangup' then
    begin
      //if (Cf = 0) or ((Cf = 1) and (pos(fUserId + '*', tel) = 0)) then
      begin
        SendCommandToUser(ats, '#finishcall:' +
          fParams.Values['CallID'] + ',' +
          fParams.Values['CallAPIID'] + ',' +
          fParams.Values['CallStatus']);
        //if cf = 0 then
        EndCall(fParams.Values['CallAPIID'], fParams.Values['CallID'], fParams.Values['CallStatus']);
      end;
    end

    else //звонок принят
    if fParams.Values['EVENTTYPE'] = 'answer' then
    begin
      SendCommandToUser(ats, Format('#callaccepted:%s', [fParams.Values['CallID']]));
      AcceptCall(fParams.Values['CallID']);
    end;
  end;
end;

function TEventWriter.FindClientByPhone(ACallFlow, ACallId, ACallApiId, APhone,
  Aats: string; var AclientIdType: string): Integer;
var
  ind: Integer;
  CallObj: TCallSession;
  fIn: Boolean;
  lMutex: boolean;
begin
  fIn := ACallFlow = 'in';
  APhone := RightStr(APhone, 10);
  //if fIn then
    lMutex := LockMutex(EventsMutex, 1000);

  if lMutex then//(fIn and lMutex) or not fIn then
  try
    //нужно для всех звонков для перевода if fIn then
    begin
      ind := MF.fSessions.IndexOf(ACallId);
      if ind > -1 then
      begin
        CallObj := TCallSession(MF.fSessions.Objects[ind]);
        AclientIDType := CallObj.Str;
        CallObj.StartCall(ACallApiId, Aats);
      end
    end;
    //else
    //  ind := -1;

    if ind = -1 then
    begin
      if MF.QPhones.Locate('phone', Aphone, []) then
      begin
        AClientIDType   := //QPhones.FieldByName('client_id').AsString + ',' +
          MF.QPhones.FieldByName('type_cli').AsString;
        //fSessions.AddObject(ACallApiId, TCallSession.Create(ACallApiId, AClientIDType, fSessions, 30));
      end
      else
        AClientIDType := '0,';

      //if fIn then
      begin
        CallObj := TCallSession.Create(ACallId, AclientIdType, MF.fSessions, 3600);
        MF.fSessions.AddObject(ACallId, CallObj);
        CallObj.StartCall(ACallApiId, Aats);
      end;
    end;
  finally
    if lMutex then
      UnlockMutex(EventsMutex);
  end;
end;

function TEventWriter.FindSession(ACallId: string; ALock: boolean): TCallSession;
var
  lMutex: Boolean;
  ind: Integer;
begin
  Result := nil;
  lMutex := not ALock;
  if not lMutex then
    lMutex := LockMutex(EventsMutex, 1000);

  if lMutex then//(fIn and lMutex) or not fIn then
  try
    //нужно для всех звонков для перевода if fIn then
    begin
      ind := MF.fSessions.IndexOf(ACallId);
      if ind > -1 then
        result := TCallSession(MF.fSessions.Objects[ind]);
    end;
  finally
    if ALock and lMutex then
      UnlockMutex(EventsMutex);
  end;
end;

procedure TEventWriter.Log;
begin
  MF.AddLog(fMess, fMessLock);
end;

procedure TEventWriter.SendCommand;
begin
  MF.SendCommandToUser(fAts, fMsg, false);
end;

procedure TEventWriter.SendCommandToUser(ats, msg: string);
begin
  fAts := ats;
  fMsg := msg;
  Synchronize(SendCommand);
end;

procedure TEventWriter.StartCall(CallId, ats: string);
begin

end;

procedure TEventWriter.WriteLog(Amess: string; Ablock: Boolean);
begin
  fMess := Amess;
  fMessLock := Ablock;
  Synchronize(Log);
end;

{ TLogger }

constructor TLogger.Create(AFileName: string);
begin
  h := CreateFile(PWideChar(AFileName), GENERIC_WRITE, FILE_SHARE_READ, nil, OPEN_ALWAYS,
  FILE_ATTRIBUTE_ARCHIVE, FILE_FLAG_NO_BUFFERING);
  SetFilePointer(h, 0, 0, FILE_END);
end;

destructor TLogger.Destroy;
begin
  CloseHandle(h);
  inherited;
end;

procedure TLogger.Write(s: Ansistring);
var
  i: Cardinal;
  d: string;
begin
  if Length(S) > 0 then
    DateTimeToString(d,'dd.mm.yy hh:nn:ss:zzz', now());

  s := '[' + d+ '] ' + s + #13#10;
  if LockMutex(LogMutex, MutexDelay) then
  try
    WriteFile(h, s[1], Length(s), i, nil);
    FlushFileBuffers(h);
  finally
    UnLockMutex(LogMutex);
  end;
end;

initialization
  LogMutex := CreateMutex(nil, False,
    Pchar(ExtractFileName((Application.ExeName))));
  MsgMutex := CreateMutex(nil, False,
    Pchar(ExtractFileName((Application.ExeName)) + '_' + 'msg'));
  EventsMutex := CreateMutex(nil, False,
    Pchar(ExtractFileName((Application.ExeName)) + '_' + 'events'));
  CallMutex := CreateMutex(nil, False,
    Pchar(ExtractFileName((Application.ExeName)) + '_' + 'calls'));

finalization
  CloseHandle(LogMutex);
  CloseHandle(MsgMutex);
  CloseHandle(EventsMutex);
  CloseHandle(CallMutex);
end.
