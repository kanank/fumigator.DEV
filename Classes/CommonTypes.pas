unit CommonTypes;

interface
uses
  System.UITypes, System.Classes, DB, System.SysUtils, Winapi.Messages,
  Vcl.Forms, Winapi.Windows, Vcl.ExtCtrls, IBX.IBQuery;

const
  WM_STARTCALL    = WM_USER + 200;
  WM_FINISHCALL   = WM_USER + 201;
  WM_ACCEPTCALL   = WM_USER + 202;
  WM_TRANSFERCALL = WM_USER + 203;

  WM_CMDFUMIGATOR = WM_USER + 300; //команды Фумигатора
        //wParam = 1 - обновить справочник клиентов

type TClientType = (clFiz, clUr);
type TTrayView =(trayNormal, trayMissed);

type TActionStr = (asCreate,asEdit,asShow);

type
  TCallInfo = class
  public
    CallFlow: string;
    CallId: string;
    CallApiId: string;
    Phone:  string;
    ClientId: Integer;
    ClientType: string;
    ClientSubType: string;
    CallResult: string;
    procedure Clear;
    procedure Assign(ASource: TCallInfo);
end;

type
  TCallProto = class
  private
    fCallInfo: TCallInfo;
    fOnStartCall: TNotifyEvent;
    fOnFinishCall: TNotifyEvent;
    fOnAcceptCall: TNotifyEvent;
    fOnTransferCall: TNotifyEvent;
    fOnCheckTimer: TNotifyEvent;
    fActive: Boolean; //идет звонок
    fReady: Boolean;  // готов к звонку
    fAccepted: Boolean; //принят звонок
    fTransfered: Boolean; // звонок переведен
    fTimer: TTimer;
    procedure SetActive(AValue: boolean);
    procedure SetReady(AValue: boolean);
    function  GetAccepted: Boolean;
    procedure SetAccepted(AValue: boolean);
    function  GetCanceled: Boolean;
    procedure OnTimerProc(Sender: TObject);
    procedure DoCheckCall;
    procedure SetTransfered(const AValue: Boolean);
  protected

  public
    property Active: Boolean read fActive write SetActive;
    property Ready: Boolean read fReady write SetReady;
    property Accepted: Boolean read GetAccepted write SetAccepted;
    property Transfered: Boolean read fTransfered write SetTransfered;
    property Cancelled: Boolean read GetCanceled;
    property CallInfo: TCallInfo read fCallInfo;
    property OnStartCall: TNotifyEvent read fOnStartCall write fOnStartCall;
    property OnFinishCall: TNotifyEvent read fOnFinishCall write fOnFinishCall;
    property OnAcceptCall: TNotifyEvent read fOnAcceptCall write fOnAcceptCall;
    property OnTransferCall: TNotifyEvent read fOnTransferCall write fOnTransferCall;
    property OnCheckTimer: TNotifyEvent read fOnCheckTimer write fOnCheckTimer;
    constructor Create; overload;
    destructor Destroy; overload;
    procedure StartCall(ACallFlow, ACallId, ACallApiId, APhone, AClientId, AClientType: string);overload;
    procedure StartCall(ACallInfo: TCallInfo); overload;

    procedure FinishCall(ACallResult: string);
    procedure AcceptCall(ACallId: string);
    procedure TransferCall; virtual;

end;

type
  CurrentUserRec = record
  ID: Integer;
  UserName :string;
  UserType :smallint;
  userTypeName :string;
  ATS_Phone_Num :string;
  session_id: integer;

  DebugMode : Boolean;
  HideOnClose :Boolean;
end;

type
  FtpProps = record  //настройки фтп
  Host:     string;
  Login:    string;
  Psw:      string;
  Passive:  boolean;
  Dir:      string;
end;


 type
   ClientInfoParams = record
   clType : TClientType;
   ClientName: string;
   ClientInfo :string;
   ClientComms :string;
end;

type
  PClientCallParams = ^ClientCallParams;
  ClientCallParams = record
  id_call: integer;
  Client_Type :string;
  Client_id :Integer;
  TelNum :string;
  ClientName :string;
  Format_Id: Integer;
  Status_Id: Integer;
  PERSON_ID: Integer;
  FORMA_ID: Integer;
  INN :string;
  clientContact :string;
  Author :string;
  ClientInfoParams :ClientInfoParams;
  public
    procedure Assign(ASource: ClientCallParams);
    procedure Setup;
end;

type
  FormResult = record
  New_Id: Integer;
  ModalRes: TModalResult;
  Comments: string;
end;

type
  PClientParam = ^TClientParam;
  TClientParam = record
  Status: Integer;
  ClientType: Integer;
  CallParam: PClientCallParams;
  public
    constructor Init(Astatus: integer; AClientType: Integer; ACallParam: PClientCallParams);
    procedure Setup;
end;

 type
 PFrmCreateParam = ^TFrmCreateParam;
 TFrmCreateParam = record
   action: TActionstr;
   Dataset: TDataset;
   ExtParam: PClientParam;
 public
   constructor Init(Aaction: TActionstr; ADataset: TDataset; AExtParam: PClientParam);
 end;


//type
//  TIBQueryFilt = class(TIBQuery)// !!!Filtered переоткрывает датасет
//  protected
//    fFiltered: Boolean;
//    FFilterBuffer: TRecBuf;
//  protected
//    procedure SetFiltered(Value: Boolean); override;
//    function InternalGetRecord(Buffer: TRecBuf; GetMode: TGetMode;
//                       DoCheck: Boolean): TGetResult;
//    function GetRecord(Buffer: TRecBuf; GetMode: TGetMode; DoCheck: Boolean): TGetResult; override;
//  end;

function NewFrmCreateParam(AAction: TActionstr; ADataSet: TDataSet=nil; AExtParam: PClientParam=nil): TFrmCreateParam;
procedure PostMessageToAll(AMsg: CArdinal);

 implementation

function NewFrmCreateParam(AAction: TActionstr; ADataSet: TDataSet=nil; AExtParam: PClientParam=nil): TFrmCreateParam;
begin
  Result.action := AAction;
  Result.Dataset := ADataSet;
  Result.ExtParam := AExtParam;
end;

procedure PostMessageToAll(AMsg: Cardinal);
var
  i: Integer;
begin
  for I := 0 to Screen.FormCount - 1 do
    PostMessage(Screen.Forms[i].Handle, AMsg, 0, 0);
end;

{ ClientCallParams }

procedure ClientCallParams.Assign(ASource: ClientCallParams);
begin
  self.id_call       := ASource.id_call;
  self.Client_Type   := ASource.Client_Type;
  self.Client_id     := ASource.Client_id;
  self.TelNum        := ASource.TelNum;
  self.ClientName    := ASource.ClientName;
  self.Format_Id     := ASource.Format_Id;
  self.Status_Id     := ASource.Status_Id;
  self.PERSON_ID     := ASource.PERSON_ID;
  self.FORMA_ID      := ASource.FORMA_ID;
  self.Author        := ASource.Author;
  self.INN           := ASource.INN;
  self.clientContact := ASource.clientContact;
  self.ClientInfoParams.ClientInfo  := ASource.ClientInfoParams.ClientInfo;
  self.ClientInfoParams.ClientComms := ASource.ClientInfoParams.ClientComms;

end;

procedure ClientCallParams.Setup;
begin
  id_call := 0;
  Client_Type := '';
  Client_id := 0;
  TelNum := '';
  ClientName := '';
  Format_Id := 1;
  Status_Id := 1;
  PERSON_ID := 0;
  FORMA_ID := 1;
  INN := '';
  clientContact := '';
  Author := '';
end;

{ TClientParam }

constructor TClientParam.Init(AStatus: integer; AClientType: Integer; ACallParam: PClientCallParams);
begin
  Self.Status     := AStatus;
  Self.ClientType := AClientType;
  CallParam       := ACallParam;
end;

procedure TClientParam.Setup;
begin
  Status := 1;
  ClientType := 0;
  CallParam := nil;
end;

{ TFrmCreateParam }

constructor TFrmCreateParam.Init(Aaction: TActionstr; ADataset: TDataset;
  AExtParam: PClientParam);
begin
  Self.action   := Aaction;
  Self.Dataset  := ADataset;
  Self.ExtParam := AExtParam;
end;

{ TCallPcroto }
procedure TCallProto.AcceptCall(ACallId: string);
begin
  if ACallId <> Self.CallInfo.CallId then
    Exit;

end;

constructor TCallProto.Create;
begin
  inherited Create;
  fCallInfo := TCallInfo.Create;
  //fTimer := TTimer.Create;
  //fTimer.Enabled  := False;
  //fTimer.Interval := 1000;
  //fTimer.OnTimer  := onTimerProc;
  fReady := True;
end;

destructor TCallProto.Destroy;
begin
  fCallInfo.Free;
  //fTimer.Free;
  inherited;
end;

procedure TCallProto.DoCheckCall;
begin

end;

procedure TCallProto.FinishCall(ACallResult: string);
begin
  CallInfo.CallResult := ACallResult;
  fActive := false;

  if Assigned(fOnFinishCall) then
    fOnFinishCall(Self);

  PostMessageToAll(WM_FINISHCALL);
end;

function TCallProto.GetAccepted: Boolean;
begin
  Result := (CallInfo.CallFlow = 'in') and fAccepted;
    //(CallInfo.CallResult = 'ANSWER');
end;

function TCallProto.GetCanceled: Boolean;
begin
  Result := (CallInfo.CallResult = 'CANCEL');
end;

procedure TCallProto.OnTimerProc(Sender: TObject);
begin
  if Assigned(fOnCheckTimer) then
    fOnCheckTimer(self);
end;

procedure TCallProto.SetAccepted(AValue: boolean);
begin
  if AValue <> fAccepted then
    fAccepted := AValue;

  if AValue then
  begin
    if Assigned(fOnAcceptCall) then
      fOnAcceptCall(self);
      PostMessageToAll(WM_ACCEPTCALL);
  end;

end;

procedure TCallProto.SetActive(AValue: boolean);
begin
  if AValue <> fActive then
  begin
    fActive := AValue;
    if not AValue then
      fCallInfo.Clear;
  end;
end;

procedure TCallProto.SetReady(AValue: boolean);
begin
  if AValue <> fReady then
  begin
    fReady := AValue;
  end;
end;

procedure TCallProto.SetTransfered(const AValue: boolean);
begin
  if Avalue <> AValue then
    fTransfered := AValue;

  if fTransfered then
    PostMessageToAll(WM_TRANSFERCALL);
end;

procedure TCallProto.StartCall(ACallInfo: TCallInfo);
begin
  StartCall(ACallInfo.CallFlow, ACallInfo.CallId, ACallInfo.CallApiId,
    ACallInfo.Phone, IntToStr(ACallInfo.ClientId), ACallInfo.ClientType);
end;

procedure TCallProto.TransferCall;
var
  i: Integer;
begin
  if Assigned(fOnTransferCall) then
    fOnTransferCall(Self);

  i := 0;
  while i < 20 do
  begin
    if not fActive then
      Break;

    Sleep(250);
    Application.ProcessMessages;
    Inc(i);
  end;

  if i < 20 then
    Transfered := True;
end;

procedure TCallProto.StartCall(ACallFlow, ACallId, ACallApiId, APhone, AClientId, AClientType: string);
begin
  if CallInfo <> nil then

  with fCallInfo do
  begin
    CallId     := ACallId;
    CallApiId  := ACallApiId;
    CallFlow   := ACallFlow;
    Phone      := APhone;
    ClientId   := StrToInt(AClientId);
    ClientType := AClientType;
    CallResult :='';
    Accepted   := false;
  end;

  fActive := True;
  fReady  := False;

  //PostMessage()
  //ftimer.Enabled := true;

  if Assigned(fOnStartCall) then
    fOnStartCall(Self);

  PostMessageToAll(WM_STARTCALL);
end;

{ TCallInfo }

procedure TCallInfo.Assign(ASource: TCallInfo);
begin
    CallId     := ASource.CallId;
    CallApiId  := ASource.CallApiId;
    CallFlow   := ASource.CallFlow;
    ClientId   := ASource.ClientId;
    ClientType := ASource.ClientType;
    ClientSubType := ASource.ClientSubType;
end;

procedure TCallInfo.Clear;
begin
  CallId := '';
  CallApiId := '';
  CallFlow := '';
  ClientId := -1;
  ClientType := '';
  ClientSubType := '';
end;

{ TIBQueryFilt }

//function TIBQueryFilt.GetRecord(Buffer: TRecBuf; GetMode: TGetMode;
//  DoCheck: Boolean): TGetResult;
//var
//  Accept: Boolean;
//  SaveState: TDataSetState;
//begin
//  Result := grOK;
//  if fFiltered and Assigned(OnFilterRecord) then
//  begin
//    Accept := False;
//    SaveState := SetTempState(dsFilter);
//    while not Accept do
//    begin
//      Result := InternalGetRecord(Buffer, GetMode, DoCheck);
//      if Result <> grOK then
//        break;
//      FFilterBuffer := Buffer;
//      Accept := True;
//      OnFilterRecord(Self, Accept);
//      if not Accept and (GetMode = gmCurrent) then
//        GetMode := gmPrior;
//    end;
//    RestoreState(SaveState);
//  end
//  else
//    Result := InternalGetRecord(Buffer, GetMode, DoCheck);
//end;
//
//procedure TIBQueryFilt.SetFiltered(Value: Boolean);
//begin
//   //inherited SetFiltered(Value);
//   fFiltered := Value;
//end;

end.
