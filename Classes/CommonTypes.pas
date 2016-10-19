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
procedure PostMessageToAll(AMsg: CArdinal; AWParam: integer = 0; ALParam:integer = 0);

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


end.
