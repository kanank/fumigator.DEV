unit TelpinAPI;

interface

uses
  Vcl.ExtCtrls, System.Classes, IdHTTP, IdSSLOpenSSL, System.JSON,
  System.SysUtils, System.DateUtils;

type
  TTelphinToken = class;

  TTelphinApiBaseElement = class
  protected
    fBaseUrl: string;
    fHttp: TIdHTTP;
    fSSL: TIdSSLIOHandlerSocketOpenSSL;
  public
    property BaseUrl: string read fBaseUrl write fBaseUrl;
    constructor Create; overload;
    destructor Destroy; overload;
  end;

  TTelphinAPIElement = class(TTelphinApiBaseElement)
  private
    FTokenObject: TTelphinToken;
    fUserId: string;
    fResponse: string;
    function GetTokenObject: TTelphinToken;
  public
    property TokenObject: TTelphinToken read GetTokenObject write FTokenObject;
    property HttpResponse: string read fResponse;
    constructor Create(ATokenObject: TTelphinToken=nil); overload;
  end;

  TTelphinToken = class(TTelphinApiBaseElement)
  private
    fClientKey: string;
    fSecretKey: string;
    fToken: string;
    fTimer: TTimer;
    fAutoReGet: Boolean;
    fTimeExpires: TDateTime; //время истечения

    procedure SetAutoReGet(AValue: boolean);
    procedure GetTokenProc(Sender: TObject);
    function CheckToken: Boolean;
    function GetActiveToken: string;
  public
    property ClientKey: string read fClientKey write fClientKey;
    property SecretKey: string read fSecretKey write fSecretKey;
    property Token: string read GetActiveToken;
    property AutoReGet: Boolean read fAutoReGet write SetAutoReGet;
    property TimeExpires: TDateTime read fTimeExpires;
    property TokenIsActive: Boolean read CheckToken;

    constructor Create; overload;
    destructor Destroy; overload;
    function GetToken: Boolean;
  end;

  TPhoneCalls = class (TTelphinAPIElement)
  private
    fOnAfterCall: TNotifyEvent;
    fOnCallFinish: TNotifyEvent;
    fOnAfterChange: TNotifyEvent; // после изменения звонка
    fCallId: string;
    fExtension: string;
    function GetStatusCall: Integer;
  public
    property OnAfterCall: TNotifyEvent read fOnAfterCall write fOnAfterCall;
    property OnAfterChange: TNotifyEvent read fOnAfterChange write fOnAfterChange;
    property OnCallFinish: TNotifyEvent read fOnCallFinish write fOnCallFinish;

    property CallId: string read fCallId;
    property StatusCall: Integer read GetStatusCall;
    property Extension: string read fExtension;
    function SimpleCall(ANumberSrc, ANumberDest, AExtNumber: string): boolean;
    function TransferCall(Callid, APhone: string): Boolean;
    function PickUpCall(Callid, APhone: string): Boolean;
    function DeleteCall(ACallApiId: string; APhone: string): Boolean;
    function GetRecordInfo(ACallApiId: string; AExt: string): string;
  end;

  TThreadTimer = class(TThread)
  private
    fInterval: Integer;
    fProc: TNotifyEvent;
    fActive: Boolean;
    fStop: Boolean;
    fFirstJobOnStarting: Boolean;
    procedure DoJob;
    procedure SetActive(AValue: Boolean);
  public
    property Active: Boolean read fActive write SetActive; //перевод в активное состояние
    property Interval: Integer read fInterval write fInterval;
    property OnTimer: TNotifyEvent read fProc write fProc;
    property FirstJobOnStarting: Boolean read fFirstJobOnStarting write fFirstJobOnStarting;
    procedure Stop;
    procedure Execute; override;
    constructor Create(AActive: Boolean=False; AFirstJobOnStart: Boolean = false); overload;
  end;

  TCallListener = class (TTelphinAPIElement)
  private
    fOnCallFinish: TNotifyEvent; // событие после окончания звонка
    fOnCallAccept: TNotifyEvent; // событие после принятия звонка
    fAccepted: boolean;
    fFinished: Boolean;
    fStop: Boolean;
    fCallId: string;
    fExtension: string;
    fStatusCall: Integer;
    fTimer: TThreadTimer;
    //fTimer: TTimer;
    fExtIgnored: TStringList; //список номеров для игнорирования (очередь, автоответчик)
    fAcceptedExt: string; // номер, кто принял звонок
    fAcceptedCallId: string; // CallId принявшего звонок
    fStopOnAccept: Boolean; //останов после принятия звонка
    fTimerInterval: Integer;
    fAutoDestroy: Boolean; //автоматически уничтожаться после окончания звонка
    fStarted: Boolean; //признак запущенности
    function GetStatusCall: Integer;
    procedure TimerProc(Sender: TObject);
    function GetExtIgnored: string;
    procedure SetExtIgnored(AValue: string);
    procedure SetAccepted(AValue: boolean);
    procedure SetFinished(AValue: boolean);
  public
    property Started: Boolean read fStarted;
    property OnCallFinish: TNotifyEvent read fOnCallFinish write fOnCallFinish;
    property OnCallAccept: TNotifyEvent read fOnCallAccept write fOnCallAccept;
    property CallApiId: string read fCallId write fCallId;
    property TimerInterval: Integer read fTimerInterval write fTimerInterval;
    property ExtIgnored: string read GetExtIgnored write SetExtIgnored; //через запятую
    property Finished: Boolean read fFinished write SetFinished;
    property Accepted: Boolean read fAccepted write SetAccepted;
    property AcceptedExt: string read fAcceptedExt;
    property AcceptedCallId: string read fAcceptedCallId;
    property StopOnAccept: Boolean read fStopOnAccept write fStopOnAccept;

    property Extension: string read fExtension write fExtension;
    property AutoDestroy: Boolean read fAutoDestroy write fAutoDestroy;
    constructor Create(ATokenObject: TTelphinToken; ACallApiId, AExtension: string; AOnCallAccept: Pointer = nil; AOnCallFinish: Pointer = nil); overload;
    destructor Destroy; overload;
    procedure Start(AInterval: integer = 0); //запускает таймер
  end;

implementation

{ TTelphinToken }

function TTelphinToken.CheckToken: Boolean;
begin
  Result := Assigned(Self) and ((fToken = '') or (Now < fTimeExpires));
end;

constructor TTelphinToken.Create;
begin
  inherited Create;
  fAutoReGet := True;
  fTimer := TTimer.Create(nil);
  fTimer.Interval := 0;
  fTimer.OnTimer := GetTokenProc;

end;

destructor TTelphinToken.Destroy;
begin
  if Assigned(fTimer) then
   fTimer.Free;
end;

function TTelphinToken.GetToken: Boolean;
begin
  GetTokenProc(nil);
end;

function TTelphinToken.GetActiveToken: string;
begin
  if not CheckToken then
    GetToken;
  Result := fToken;
end;

procedure TTelphinToken.GetTokenProc(Sender: TObject);
var
  sResponse: string;
  stream: TStringStream;
  json: TJSONObject;
  keep: Integer;
begin
  stream := TStringStream.Create('');
  stream.WriteString('grant_type=client_credentials&');
  stream.WriteString('redirect_uri=urn:ietf:wg:oauth:2.0:oob&');
  stream.WriteString('client_id=' + ClientKey + '&');
  stream.WriteString('client_secret=' + SecretKey + '&');
  stream.WriteString('state=0');


  try
//    fHttp.Request.URL := fBaseURL + '/oauth/token.php';
    fHttp.Request.Method := 'POST';
    fHttp.Request.ContentType := 'application/x-www-form-urlencoded';
    fhttp.Request.Accept := 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8';
    fhttp.Request.AcceptCharSet := 'windows-1251,utf-8;q=0.7,*;q=0.3';
    fhttp.Request.AcceptLanguage := 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4';
    fhttp.Request.Connection := 'keep-alive';
    fhttp.Request.Host := fBaseUrl;
    fhttp.Request.Referer := fBaseUrl;
   // fhttp.Request.UserAgent := 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.77 Safari/535.7';
    fhttp.HandleRedirects := false;
    fhttp.HTTPOptions := [hoKeepOrigProtocol];

    try
      sResponse := fHttp.Post(fBaseUrl + '/oauth/token.php', stream);
      json := TJSONObject.Create;
      json.Parse(BytesOf(sResponse), 0);
      fToken := json.Values['access_token'].ToString;
      fToken := AnsiDequotedStr(fToken, '"');
      keep   := StrToInt(json.Values['expires_in'].ToString);
      if keep > 0  then
        keep := keep - 15;
      fTimeExpires := IncSecond(Now, keep);
    except

    end;
  finally
    stream.Free;
    json.Free;
  end;
end;

procedure TTelphinToken.SetAutoReGet(AValue: boolean);
begin
  if not AValue then
    fTimer.Interval := 0;
  fAutoReGet := AValue;
end;

{ TTelphinAPIElement }

constructor TTelphinAPIElement.Create(ATokenObject: TTelphinToken=nil) ;
begin
  inherited Create;
  if ATokenObject <> nil then
    FTokenObject := ATokenObject;
end;


function TTelphinAPIElement.GetTokenObject: TTelphinToken;
begin
  if not Assigned(FTokenObject) then
    FTokenObject := TTelphinToken.Create;
  Result := FTokenObject;
end;

{ TPhoneCalls }

function TPhoneCalls.DeleteCall(ACallApiId: string; APhone: string): Boolean;
var
  sStream: TStringStream;
  sResponse: string;
  url: string;
begin
  Result := False;

  sStream := TStringStream.Create('');
  try
    fHttp.Request.Method := 'DELETE';
    fHttp.Request.ContentType := 'application/json';
    fhttp.Request.CustomHeaders.Clear;
    fhttp.Request.CustomHeaders.Add('Authorization: Bearer '+ TokenObject.Token);

    url := fBaseUrl + Format('/uapi/phoneCalls/@me/%s/%s', [APhone, ACallApiId]);
    try
      fHttp.Delete(url, sStream);
    except

    end;

    Result := (fHttp.ResponseCode = 200);
  finally
    sStream.Free;
  end;
end;

function TPhoneCalls.GetRecordInfo(ACallApiId, AExt: string): string;
var
  sStream: TStringStream;
  url: string;
  json: TJSONObject;
  json1: TJSONArray;
begin
  sStream := TStringStream.Create;
  try
    fHttp.Request.Method := 'GET';
    //fHttp.Request.ContentType := 'application/json';
    fhttp.Request.CustomHeaders.Clear;
    fhttp.Request.CustomHeaders.Add('Authorization: Bearer '+ TokenObject.Token);

    url := Format(fBaseUrl + '/uapiext/getrecordinfo/?extension=%s&id=%s', [AExt, ACallApiId]);
    try
      fHttp.Get(url, sStream);
      json := TJSONObject.Create;
      json.Parse(BytesOf(sStream.DataString), 0);
      //json1 := TJSONObject.Create;
      if json.Values['totalResults'].ToString <> '0' then
      begin
        json1 := TJSONObject.ParseJSONValue(json.GetValue('entry').ToString) as TJSONArray;
        if json1 <> nil then
        begin
          json   := TJSONObject.ParseJSONValue(json1.Items[0].ToString) as TJSONObject;
          Result := json.GetValue('filename').Value;
          Result := AnsiDequotedStr(Result, '"');
        end;
      end;
      if Result = '' then
        Result := '#not found';
    except
      Result := '#error';
    end;

  finally
    sStream.Free;
    json.Free;
    json1.Free;
  end;

end;

function TPhoneCalls.GetStatusCall: Integer;
var
  sStream: TStringStream;
  url: string;
begin
  sStream := TStringStream.Create;
  fHttp.Request.Method := 'GET';
  //fHttp.Request.ContentType := 'application/json';
  fhttp.Request.CustomHeaders.Clear;
  fhttp.Request.CustomHeaders.Add('Authorization: Bearer '+ TokenObject.Token);

  url := fBaseUrl + '/uapi/phoneCalls/@owner/@self/' + CallId; //&accessRequestToken=' + FTokenObject.Token;
  try
    fHttp.Get(url, sStream);
  except

  end;

  sStream.Free;

end;

function TPhoneCalls.PickUpCall(Callid, APhone: string): Boolean;
var
  sStream: TStringStream;
  url: string;
begin
  Result := False;

  sStream := TStringStream.Create;
  sStream.WriteString('{' + #13#10);
  sStream.WriteString('"action":"PickUp",' + #13#10);
  sStream.WriteString('"sendCallTo":"' + APhone + '",' + #13#10);
  sStream.WriteString('"callerId:"Fumigator <' + APhone + '>",' + #13#10);
  sStream.WriteString('"waitForPickup":"20" ,' + #13#10);
  sStream.WriteString('"phoneCallViewId":"01"' + #13#10);
  sStream.WriteString('}' + #13#10);

  fHttp.Request.Method := 'PUT';
  fHttp.Request.ContentType := 'application/json';
  fhttp.Request.CustomHeaders.Clear;
  fhttp.Request.CustomHeaders.Add('Authorization: Bearer '+ TokenObject.Token);

  url := fBaseUrl + '/uapi/phoneCalls/@owner/@self/' + CallId; //&accessRequestToken=' + FTokenObject.Token;
  try
    fHttp.Put(url, sStream);
    Result := (fHttp.ResponseCode = 200);

    if Assigned(fOnAfterChange) then
      fOnAfterChange(Self);
  except

  end;
  sStream.Free;
end;

function TPhoneCalls.SimpleCall(ANumberSrc, ANumberDest, AExtNumber: string): boolean;
var
  sStream: TStringStream;
  sResponse: string;
  url: string;
  json: TJSONObject;
begin
  Result := False;

  sStream := TStringStream.Create('');
  try
    sStream.WriteString('{' + #13#10);
    sStream.WriteString('"extension": "' + AExtNumber + '",'+ #13#10);
    sStream.WriteString('"phoneCallView": ['+ #13#10);
    sStream.WriteString('{'+ #13#10);
    sStream.WriteString(' "source":  ["' + ANumberSrc + '" ],'+ #13#10);
    sStream.WriteString(' "destination": "' + ANumberDest + '",'+ #13#10);
    sStream.WriteString('     "callerId": "Fumigator <' + ANumberSrc + '>"'+ #13#10);
    sStream.WriteString('  }'+ #13#10);
    sStream.WriteString(']'+ #13#10);
    sStream.WriteString('}');

    fHttp.Request.Method := 'POST';
    fHttp.Request.ContentType := 'application/json';
    fhttp.Request.CustomHeaders.Clear;
    fhttp.Request.CustomHeaders.Add('Authorization: Bearer '+ TokenObject.Token);

    url := fBaseUrl + '/uapi/phoneCalls/@owner/simple?allowPublicTransfer=true' ; //&accessRequestToken=' + FTokenObject.Token;
    try
      fResponse := fHttp.Post(url, sStream);
    except

    end;

    if (fHttp.ResponseCode < 400) then
    begin
      if Copy(fResponse, 1, 1) = '[' then
      begin
        fResponse := Copy(fResponse, 2, Length(fResponse) - 2);
      end;
      json := TJSONObject.Create;
      json.Parse(BytesOf(fResponse), 0);
      fCallId    := AnsiDequotedStr(json.Values['id'].ToString, '"');
      fExtension := AnsiDequotedStr(json.Values['extension'].ToString, '"');

     // TCallListener.Create(fTokenObject, fCallId, fExtension, fOnCallFinish);

      if Assigned(fOnAfterCall) then
        fOnAfterCall(Self);
    end;

  finally
    sStream.Free;
  end;
end;

function TPhoneCalls.TransferCall(Callid, APhone: string): Boolean;
begin

end;

{ TTelphinApiBaseElement }

constructor TTelphinApiBaseElement.Create;
begin
  fHttp := TIdHTTP.Create(nil);
  fSSL:=TIdSSLIOHandlerSocketOpenSSL.Create;
  fHttp.IOHandler:=fSSL;
  fBaseUrl := 'https://office.telphin.ru';
end;

destructor TTelphinApiBaseElement.Destroy;
begin
  if Assigned(fHttp) then
    fHttp.Free;
  if Assigned(fSSL) then
    fSSL.Free;
end;

{ TCallListener }

constructor TCallListener.Create(ATokenObject: TTelphinToken; ACallApiId,
  AExtension: string; AOnCallAccept: Pointer = nil; AOnCallFinish: Pointer = nil);
begin
  inherited Create(ATokenObject);
  fCallId         := ACallApiId;
  fExtension      := AExtension;
  if AOnCallFinish <> nil then
    fOnCallFinish   := TNotifyEvent(AOnCallFinish^);
  if AOnCallAccept <> nil then
    fOnCallAccept   := TNotifyEvent(AOnCallAccept^);
  fTimer := TThreadTimer.Create(False, true);
  fTimer.Interval  := 500;
  fTimer.OnTimer := TimerProc;
  //fTimer          := TTimer.Create(nil);
  //fTimer.OnTimer  := TimerProc;
  //fTimerInterval  := 500;
  //fTimer.Interval := fTimerInterval;
  //fTimer.Enabled  := False;
  fExtIgnored := TStringList.Create;
end;

destructor TCallListener.Destroy;
begin
  FreeAndNil(fTimer);
  FreeAndNil(fExtIgnored);
  inherited;
end;

function TCallListener.GetExtIgnored: string;
begin
  Result := fExtIgnored.DelimitedText;
end;

function TCallListener.GetStatusCall: Integer;
var
  sStream: TStringStream;
  url,ext: string;
  json: TJSONObject;
  json1: TJSONArray;
  cnt, i, status: Integer;
begin
  sStream := TStringStream.Create;
  try
    //fTimer.Interval := 0;
    fHttp.Request.Method := 'GET';
    //fHttp.Request.ContentType := 'application/json';
    fhttp.Request.CustomHeaders.Clear;
    fhttp.Request.CustomHeaders.Add('Authorization: Bearer '+ TokenObject.Token);

    url := fBaseUrl + '/uapi/phoneCalls/@me/' + fExtension +'/' + fCallId;
    fHttp.Get(url, sStream);
    json := TJSONObject.Create;
    json.Parse(BytesOf(sStream.DataString), 0);
    cnt := StrToInt(AnsiDequotedStr(json.Values['totalResults'].ToString, '"'));


    if cnt > 0 then
    begin
      json1 := TJSONObject.ParseJSONValue(json.GetValue('entry').ToString) as TJSONArray;
      if json1 <> nil then
      begin
        json   := TJSONObject.ParseJSONValue(json1.Items[0].ToString) as TJSONObject;
        json1   := TJSONObject.ParseJSONValue(json.GetValue('phoneCallView').ToString) as TJSONArray;

        for i := 0 to json1.Count - 1 do
        begin
          json := TJSONObject.ParseJSONValue(json1.Items[i].ToString) as TJSONObject;

          ext := AnsiDequotedStr(json.GetValue('extension').Value, '"');
          if fExtIgnored.IndexOf(ext) > - 1 then
            Continue;
          status := StrToIntDef(AnsiDequotedStr(json.GetValue('status').Value, '"'), 0);
          if (status = 5) then
          begin
            fAcceptedExt := ext;
            fAcceptedCallId := AnsiDequotedStr(json.GetValue('id').Value, '"');
            Accepted := True;
            if fStopOnAccept then
            begin
              fStop := True;//fTimer.Enabled := False;
              fFinished := True;
              fTimer.Stop;
            end;
          end;

        end;

      end;
    end
    else
    begin
      Finished := True;
      fStop    := True;
      fTimer.Stop;
      //fTimer.Enabled := False;
    end;
  finally
    sStream.Free;
    json.Free;
    json1.free;

    if (Finished or fStop) and fAutoDestroy then
    begin
      Destroy;
    end;
//    else
//      fTimer.Interval := fTimerInterval;
  end;
end;

procedure TCallListener.SetAccepted(AValue: boolean);
begin
  if fAccepted <> AValue then
    fAccepted := AValue;
  if AValue then
  begin
    if Assigned(fOnCallAccept) then
      fOnCallAccept(Self);
  end;
end;

procedure TCallListener.SetExtIgnored(AValue: string);
begin
  fExtIgnored.DelimitedText := AValue;
end;

procedure TCallListener.SetFinished(AValue: boolean);
begin
  if fFinished <> AValue then
    fFinished := AValue;
  if AValue and Assigned(fOnCallFinish) then
    fOnCallFinish(Self);
end;

procedure TCallListener.Start(AInterval: integer = 0);
begin
  if AInterval > 0 then
    fTimer.Interval := AInterval;
  fTimer.Active := True;
  fStarted := True;
end;

procedure TCallListener.TimerProc(Sender: TObject);
begin
  GetStatusCall;
end;

{ TThreadTimer }

constructor TThreadTimer.Create(AActive, AFirstJobOnStart: Boolean);
begin
  fFirstJobOnStarting := AFirstJobOnStart;
  FreeOnTerminate := True;
  inherited Create(not AActive);
end;

procedure TThreadTimer.DoJob;
begin
  if Assigned(fProc) then
   fProc(Self);
end;

procedure TThreadTimer.Execute;
begin
  fActive := True;
  if fFirstJobOnStarting then
    DoJob;

   while not Terminated or not fStop do
   begin
     Sleep(fInterval);
     DoJob;
   end;
end;

procedure TThreadTimer.SetActive(AValue: Boolean);
begin
  if AValue and not fActive then
    Start;
end;

procedure TThreadTimer.Stop;
begin
  fStop := True;
  fActive := False;
end;

end.
