unit CallClasses;

interface
uses
  System.UITypes, System.Classes, DB, System.SysUtils, Winapi.Messages,
  Vcl.Forms, Winapi.Windows, Vcl.ExtCtrls, IBX.IBQuery;

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
    CalledNumber: string; //телфин сменил идентификацию звонков на CallApiId + CalledNumber + CallerIDNum
    CallerIDNum: string;
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

    fFrmCall: TForm;  //форма-нидикатор звонка

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
    procedure StartCall(ACallFlow, ACallId, ACallApiId, APhone, AClientId, AClientType, ACalledNumber, ACallIdNum: string);overload;
    procedure StartCall(ACallInfo: TCallInfo); overload;

    procedure FinishCall(ACallResult: string);
    procedure AcceptCall(ACallId: string);
    procedure TransferCall; virtual;

end;

implementation
uses
  formCallEvent, CommonTypes;

{ TCallInfo }

procedure TCallInfo.Assign(ASource: TCallInfo);
begin
    CallId        := ASource.CallId;
    CallApiId     := ASource.CallApiId;
    CallFlow      := ASource.CallFlow;
    ClientId      := ASource.ClientId;
    ClientType    := ASource.ClientType;
    ClientSubType := ASource.ClientSubType;
    CalledNumber  := ASource.CalledNumber;
    CallerIDNum   := ASource.CallerIDNum;
end;

procedure TCallInfo.Clear;
begin
  CallId        := '';
  CallApiId     := '';
  CallFlow      := '';
  ClientId      := -1;
  ClientType    := '';
  ClientSubType := '';
  CalledNumber  := '';
  CallerIDNum   := '';
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

  PostMessageToAll(WM_FINISHCALL, Integer(Self));
end;

function TCallProto.GetAccepted: Boolean;
begin
  Result := fAccepted;
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
      PostMessageToAll(WM_ACCEPTCALL, Integer(Self));
  end;

  //пока отключено fFrmCall.Close;
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
  fTransfered := AValue;

  if fTransfered then
    PostMessageToAll(WM_TRANSFERCALL, Integer(Self));
end;

procedure TCallProto.StartCall(ACallInfo: TCallInfo);
begin
  StartCall(ACallInfo.CallFlow, ACallInfo.CallId, ACallInfo.CallApiId,
    ACallInfo.Phone, IntToStr(ACallInfo.ClientId), ACallInfo.ClientType,
    ACallInfo.CalledNumber, ACallInfo.CallerIDNum);
  (* пока отключено fFrmCall := TfrmCallEvent.Create(nil);
  TfrmCallEvent(fFrmCall).CallObject := Self;
  fFrmCall.Show;
  TfrmCallEvent(fFrmCall).SetTopMost;*)
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

procedure TCallProto.StartCall(ACallFlow, ACallId, ACallApiId, APhone, AClientId, AClientType, ACalledNumber, ACallIdNum: string);
begin
  if CallInfo <> nil then

  with fCallInfo do
  begin
    CallId       := ACallId;
    CallApiId    := ACallApiId;
    CallFlow     := ACallFlow;
    Phone        := APhone;
    ClientId     := StrToInt(AClientId);
    ClientType   := AClientType;
    CalledNumber := ACalledNumber;
    CallerIDNum  := ACallIdNum;
    CallResult   := '';
    Accepted     := False;
  end;

  fActive := True;
  fReady  := False;

  if Assigned(fOnStartCall) then
    fOnStartCall(Self);

  PostMessageToAll(WM_STARTCALL, Integer(Self));
end;

end.
