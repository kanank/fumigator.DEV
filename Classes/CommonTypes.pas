unit CommonTypes;

interface
uses
  System.UITypes, System.Classes, DB, System.SysUtils, Winapi.Messages,
  Vcl.Forms, Winapi.Windows, Vcl.ExtCtrls, IBX.IBQuery, IBX.IBDatabase;

const
  WM_SHOWMSG         = WM_USER + 100;
  WM_SHOWINCOMECALL  = WM_USER + 101;
  WM_SHOWOUTCOMECALL = WM_USER + 102;
  WM_CONNECTSOCKET   = WM_USER + 103;
  WM_CONNECTDB       = WM_USER + 104;

  WM_STARTCALL       = WM_USER + 200;
  WM_FINISHCALL      = WM_USER + 201;
  WM_ACCEPTCALL      = WM_USER + 202;
  WM_TRANSFERCALL    = WM_USER + 203;

  WM_CMDFUMIGATOR    = WM_USER + 300; //команды Фумигатора
        //wParam = 1 - обновить справочник клиентов

type TClientType = (clFiz, clUr);
type TTrayView =(trayNormal, trayMissed);

type TActionStr = (asCreate,asEdit,asShow);
type TMsgType = (mtInfo, mtWarning, mtError, mtQuestion);

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

type TUserRights = class
  private
    data: TDataSet;
    fDb: TIBDatabase;
    fUserId: Integer;
    procedure SetUserId(AValue: Integer);
    procedure GetData;
    function GetRightById(AIndex: Integer): boolean;
  public
    property UserId: integer read fUserId write SetUserId;

    property CreateLogin: boolean         index 1  read GetRightById; // Создание учетных записей
    property EditDic: boolean             index 2  read GetRightById; // Редактирование справочников
    property TuneClientList: boolean      index 3  read GetRightById; // Настройка списка клиентов
    property WorkClientCard: boolean      index 4  read GetRightById; // Работа с карточками клиента
    property WorkWorkerCard: boolean      index 5  read GetRightById; // Работа с карточками сотрудника
    property ShowWorkerList: boolean      index 6  read GetRightById; // Просмотр списка сотрудников
    property ShowClientList: boolean      index 7  read GetRightById; // Просмотр списков клиентов включая и физические и юридические лица
    property ShowClientCard: boolean      index 8  read GetRightById; // Просмотр карточек клиентов и физических и юридических лиц
    property ShowWorkerInfoSmall: boolean index 9  read GetRightById; // Просмотр общей информации карточки сотрудника
    property ShowWorkerInfoFull: boolean  index 10 read GetRightById; // Просмотр полной информации карточки сотрудника
    property DoCallIncom: boolean         index 11 read GetRightById; // Возможность принять входящий вызов
    property DoCallOutcome: boolean       index 12 read GetRightById; // Осуществление исходящего вызова
    property DoTransfer: boolean          index 13 read GetRightById; // Возможность перевести вызов
    property DoCallEnd: boolean           index 14 read GetRightById; // Возможность закончить вызов
    property DoCallLater: boolean         index 15 read GetRightById; // Доступность функции «Перезвонить позднее»
    property ShowSessions: boolean        index 16 read GetRightById; // Просмотр сессий
    property ShowSessionStat: boolean     index 17 read GetRightById; // Просмотр статистики по сессиям
    property InputSessionResult: boolean  index 18 read GetRightById; // Ввод информации в окно сессий
    property AccessSklad: boolean         index 19 read GetRightById; // Работа со «Складом»
    property MonitorZakaz: boolean        index 20 read GetRightById; // Мониторинг заказов
    property ShowDogReestr: boolean       index 21 read GetRightById; // Просмотр реестра договоров
    property WorkDogCard: boolean         index 22 read GetRightById; // Работа с карточками договоров
    property CreateTask: boolean          index 23 read GetRightById; // Создание задач
    property TuneSystem: boolean          index 24 read GetRightById; // Настройка системы

    constructor Create(AUserId: Integer = 0); overload;
    constructor Create(ADb: TIBDatabase; AUserId: Integer = 0); overload;
    destructor Destroy; overload;
    procedure Refresh;
    function Right(ACode: string): Boolean;
end;

type
  TCurrentUser = class
  private
    fID: Integer;
    fUserName :string;
    fUserType :smallint;
    fuserTypeName :string;
    fATS_Phone_Num :string;
    fDB: TIBDatabase;
    fSessionId: integer;
    fRights: TUserRights;
    procedure SetId(AValue: integer);
    function GetHasClient: Boolean;
  public
    DebugMode : Boolean;
    HideOnClose :Boolean;

    property ID: Integer read fID write SetId;
    property UserName :string read fUserName;
    property UserType :smallint read fUserType;
    property userTypeName :string read fuserTypeName;
    property ATS_Phone_Num :string read fATS_Phone_Num;
    property Session_Id: Integer read fSessionId write fSessionId;
    property HasClient: Boolean read GetHasClient;

    property Rights: TUserRights read fRights;

    constructor Create(ADb: TIBDatabase; AId: integer=0); overload;
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
procedure PostMessageToAll(AMsg: CArdinal; AWParam: integer = 0; ALParam:integer = 0);
function CreateRWQuery(DB: TIBDatabase): TIBQuery;

 implementation

function NewFrmCreateParam(AAction: TActionstr; ADataSet: TDataSet=nil; AExtParam: PClientParam=nil): TFrmCreateParam;
begin
  Result.action   := AAction;
  Result.Dataset  := ADataSet;
  Result.ExtParam := AExtParam;
end;

procedure PostMessageToAll(AMsg: CArdinal; AWParam: integer = 0; ALParam:integer = 0);
var
  i: Integer;
begin
  for I := 0 to Screen.FormCount - 1 do
    PostMessage(Screen.Forms[i].Handle, AMsg, AWParam, ALParam);
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
  id_call       := 0;
  Client_Type   := '';
  Client_id     := 0;
  TelNum        := '';
  ClientName    := '';
  Format_Id     := 1;
  Status_Id     := 1;
  PERSON_ID     := 0;
  FORMA_ID      := 1;
  INN           := '';
  clientContact := '';
  Author        := '';
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


{ TCurrentUserRec }

constructor TCurrentUser.Create(ADb: TIBDatabase; AId: integer);
begin
  inherited Create;
  fDB := ADb;

  fRights := TUserRights.Create(fDB, AId);

  if AId > 0 then
    ID := AId;
end;

function TCurrentUser.GetHasClient: Boolean;
var
  Q :TIBQuery;
begin
  try
    Q := CreateRWQuery(fDB);
    Q.SQL.Text := Format('SELECT COUNT(*) FROM clients where worker_id = %d', [fId]);
    Q.Open;

    Result := Q.Fields[0].AsInteger > 0;

    if Q.Transaction.Active then
      Q.Transaction.Commit;
  finally
    Q.Transaction.Free;
    FreeAndNil(Q);
  end;
end;

procedure TCurrentUser.SetId(AValue: integer);
var
  Q :TIBQuery;
begin
  if (AValue <> fId) and (AValue > 0) then
    try
      fID := AValue;
      Q := CreateRWQuery(fDB);
      Q.SQL.Text := 'SELECT * FROM GET_USER_INFO('+ intToStr(fID) +')';
      Q.Open;

      fUserName      := Q.FieldByName('NAME').AsString;
      fUserType      := Q.FieldByName('USER_TYPE').AsInteger;
      fuserTypeName  := Q.FieldByName('USERTYPENAME').AsString;
      fATS_Phone_Num := Q.FieldByName('ATS_PHONE_NUM').AsString;
      DebugMode     := true;

      if Q.Transaction.Active then
        Q.Transaction.Commit;
    finally
      Q.Transaction.Free;
      FreeAndNil(Q);
      fRights.fDb := fDB;
      fRights.UserId := fId;
    end;
end;

{ TUserRights }

constructor TUserRights.Create(AUserId: Integer);
begin
  inherited Create;
  fUserId := 0;

  data := TIBQuery.Create(nil);
  TIBQuery(data).Database := fDB;
  TIBQuery(data).SQL.Add('select * from get_rights_by_user(:user_id)');

  if AUserId > 0  then
    UserId := AUserId;
end;

constructor TUserRights.Create(ADb: TIBDatabase; AUserId: Integer = 0);
begin
  inherited Create;
  fUserId := 0;
  fDb := ADb;

  data := TIBQuery.Create(nil);
  TIBQuery(data).Database := fDB;
  TIBQuery(data).SQL.Add('select * from get_rights_by_user(:user_id)');

   if AUserId > 0  then
    UserId := AUserId;
end;

destructor TUserRights.Destroy;
begin
  if data.Active then
    data.Close;
  FreeAndNil(data);
end;

procedure TUserRights.GetData;
begin
  if fUserId = 0 then
    Exit;

  try
    try
      data.Close;
      TIBQuery(data).Params[0].AsInteger := fUserId;
      data.Open;
    except
      raise Exception.Create('Ошибка получения прав: ' + Exception(ExceptObject).Message);
    end;
  finally

  end;
end;

function TUserRights.GetRightById(AIndex: Integer): boolean;
begin
  if Data.Active then
    if data.Locate('right_id', AIndex, []) then
      Result := data.FieldByName('val').AsInteger = 1;
end;

procedure TUserRights.Refresh;
begin
  GetData;
end;

function TUserRights.Right(ACode: string): Boolean;
begin
  if Data.Active then
    if data.Locate('right_code', ACode, [loCaseInsensitive]) then
      Result := data.FieldByName('val').AsInteger = 1;
end;

procedure TUserRights.SetUserId(AValue: Integer);
begin
  if fUserId <> AValue then
  begin
    fUserId := AValue;
    if AValue > 0 then
      GetData;
  end;
end;

function CreateRWQuery(DB: TIBDatabase): TIBQuery;
var
  TR: TIBTransaction;
begin
  TR := TIBTransaction.Create(nil);
  TR.DefaultDatabase := DB;
  TR.DefaultAction := TACommit;
  TR.AutoStopAction := saCommit;

  TR.Params.Add('isc_tpb_read_committed');
  //TR.Params.Add('isc_tpb_no_rec_version');
  TR.Params.Add('isc_tpb_rec_version');
  TR.Params.Add('isc_tpb_wait');


  result := TIBQuery.Create(nil);
  result.Database := DB;
  result.Transaction := TR;

end;

end.
