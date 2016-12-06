unit CallClasses;

interface
uses
  System.UITypes, System.Classes, DB, System.SysUtils, Winapi.Messages,
  Vcl.Forms, Winapi.Windows, Vcl.ExtCtrls, IBX.IBQuery, dxmdaset;

type
  TCallInfo = class
  private
    FOnClientChange: TNotifyEvent;
    FClientId: Integer;
    procedure SetClientId(AValue: integer);
  public
    CallFlow: string;
    CallId: string;
    CallApiId: string;
    Phone:  string;
    ClientType: string;
    ClientSubType: string;
    CallResult: string;
    CalledNumber: string; //телфин сменил идентификацию звонков на CallApiId + CalledNumber + CallerIDNum
    CallerIDNum: string;
    property ClientId: Integer read FClientId write SetClientId;

    procedure Clear;
    procedure Assign(ASource: TCallInfo);

    property OnClientChange: TNotifyEvent read FOnClientChange write FOnClientChange;
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

    fFrmCall: TForm;  //форма-индикатор звонка
    FMainClientData: TDataset; // ссылка на источник
    FClientData: TdxMemData; //запись Clients

    procedure SetActive(AValue: boolean);
    procedure SetReady(AValue: boolean);
    function  GetAccepted: Boolean;
    procedure SetAccepted(AValue: boolean);
    function  GetCanceled: Boolean;
    procedure OnTimerProc(Sender: TObject);
    procedure DoCheckCall;
    procedure SetTransfered(const AValue: Boolean);
    procedure SetMainClientData(AValue: TDataset);
  protected
    procedure ClientIdChange(Sender: TObject); virtual;
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

    property MainClientData: TDataset read FMainClientData write SetMainClientData;

    constructor Create(AMainDataSet: TDataset=nil); overload;
    destructor Destroy; overload;
    procedure StartCall(ACallFlow, ACallId, ACallApiId, APhone, AClientId, AClientType, ACalledNumber, ACallIdNum: string);overload;
    procedure StartCall(ACallInfo: TCallInfo); overload;

    procedure FinishCall(ACallResult: string);
    procedure AcceptCall(ACallId: string);
    procedure TransferCall; virtual;

    procedure SetClient(AId: integer); //установка датасета по клиенту
    function CF(AFieldName: string): TField; // поле из локального датасета
end;

implementation
uses
  formCallEvent, CommonTypes, CommonFunc;

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

procedure TCallInfo.SetClientId(AValue: integer);
begin
  if AValue = FClientId then
    Exit;
  FClientId := AValue;
  if Assigned(FOnClientChange) then
    FOnClientChange(Self);
end;

{ TCallPcroto }
procedure TCallProto.AcceptCall(ACallId: string);
begin
  if ACallId <> Self.CallInfo.CallId then
    Exit;
end;

function TCallProto.CF(AFieldName: string): TField;
begin
  if not (Assigned(FClientData) and FClientData.Active) then
    Exit;

  Result := FClientData.FindField(AFieldName);
end;

procedure TCallProto.ClientIdChange(Sender: TObject);
begin
  SetClient(fCallInfo.ClientId);
end;

constructor TCallProto.Create(AMainDataSet: TDataSet);
begin
  inherited Create;
  fCallInfo := TCallInfo.Create;
  fCallInfo.FOnClientChange := ClientIdChange;

  if AMainDataSet <> nil then
    MainClientData := AMainDataSet;

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

procedure TCallProto.SetClient(AId: integer);
var
  BeforePost, AfterPost: TDataSetNotifyEvent;
begin
  if not Assigned(FClientData) then
    Exit;
  ClearDataset(FClientData);

  if not FMainClientData.Locate('id', AId, []) then
    Exit;

  FClientData.Append;
  BeforePost := FClientData.BeforePost;
  AfterPost  := FClientData.AfterPost;
  BeforePost := nil;
  AfterPost  := nil;
  try
    CopyRecord(FMainClientData, FClientData);
  finally
    FClientData.BeforePost := BeforePost;
    FClientData.AfterPost  := AfterPost;
  end;
end;

procedure TCallProto.SetMainClientData(AValue: TDataset);
begin
  FMainClientData := AValue;
  if not Assigned(FClientData) then
  begin
    FClientData := TdxMemData.Create(nil);
    FClientData.CreateFieldsFromDataSet(FMainClientData);
    FClientData.Open;
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
