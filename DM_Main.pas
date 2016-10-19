unit DM_Main;

interface

uses
  System.SysUtils, System.Classes, System.UITypes, Vcl.Forms, Winapi.Windows,
  IBX.IBDatabase, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBUpdateSQL, Vcl.ImgList, Vcl.Controls, cxGraphics,
  CommonVars, CommonTypes, Vcl.ExtCtrls, dxmdaset, Vcl.Menus, cxStyles,
  cxClasses;

type
  TClientExtUr = class
  private
    fQuery: TIBQuery;
    fID: Integer;
    procedure SetId(AValue: integer);
  public
    property ID: integer read fID write SetId;
    function CF(AName: string): TField;
    constructor Create; overload;
    destructor Destroy;
end;

type TUserRights = class
  private
    data: TDataSet;
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
    destructor Destroy; overload;
    procedure Refresh;
    function Right(ACode: string): Boolean;
end;

type
  TDataModuleMain = class(TDataModule)
    DB: TIBDatabase;
    DefTr: TIBTransaction;
    DicUserTypes: TIBQuery;
    DSDicUserTypes: TDataSource;
    DicWorkerProfs: TIBQuery;
    DSDicWorkerProfs: TDataSource;
    Workers: TIBQuery;
    DSWorkers: TDataSource;
    Worker_upd: TIBUpdateSQL;
    Worker_Q: TIBQuery;
    worker_tr: TIBTransaction;
    DsWorker: TDataSource;
    ImgList: TcxImageList;
    DicServices: TIBQuery;
    DSDicServices: TDataSource;
    DSDicMaterials: TDataSource;
    DicMaterials0: TIBQuery;
    DicMaterials_upd: TIBUpdateSQL;
    DicServices_upd: TIBUpdateSQL;
    DicUserTypes_upd: TIBUpdateSQL;
    DicWorkerProfs_upd: TIBUpdateSQL;
    DicMaterialType: TIBQuery;
    DsDicMaterialType: TDataSource;
    DicMaterialType_upd: TIBUpdateSQL;
    DicMaterialSubTypes: TIBQuery;
    DsDicMaterialSubTypes: TDataSource;
    DicMaterialSubTypes_upd: TIBUpdateSQL;
    DicMaterials: TIBQuery;
    DicFormatsCli: TIBQuery;
    DsFormatsCli: TDataSource;
    Clients: TIBQuery;
    Clients_upd: TIBUpdateSQL;
    Clients_tr: TIBTransaction;
    DsClients: TDataSource;
    DicStatusCli: TIBQuery;
    DsDicStatusCli: TDataSource;
    DicUrForm: TIBQuery;
    DsDicUrForm: TDataSource;
    DicCliSfera: TIBQuery;
    DsDicCliSfera: TDataSource;
    DicRegions: TIBQuery;
    DsDicRegions: TDataSource;
    DicPhoneType: TIBQuery;
    DsDicPhoneType: TDataSource;
    DicCliProfs: TIBQuery;
    DsDicCliProfs: TDataSource;
    CallS_Q: TIBQuery;
    Calls_Tr: TIBTransaction;
    Calls_UpdQ: TIBUpdateSQL;
    Calls_Timer: TTimer;
    SocketTimer: TTimer;
    DicCallTypes: TdxMemData;
    DicCallTypesID: TIntegerField;
    DicCallTypesNAME: TStringField;
    DSDicCallTypes: TDataSource;
    WorkerTypeByDate: TIBQuery;
    DSWorkerTypeByDate: TDataSource;
    WorkerTypeByDate_upd: TIBUpdateSQL;
    QSession_Check: TIBQuery;
    QCall_Check: TIBQuery;
    QCallAcceptCheck: TIBQuery;
    QSessionCheckAct: TIBQuery;
    imgListTray: TcxImageList;
    QSession_CheckApi: TIBQuery;
    DicContactTypes: TIBQuery;
    DsDicContactTypes: TDataSource;
    DicContactTypes_upd: TIBUpdateSQL;
    mContactTypes: TPopupMenu;
    Contacts: TIBQuery;
    Contacts_upd: TIBUpdateSQL;
    DicDogTypes: TIBQuery;
    DSDicDogTypes: TDataSource;
    DicDogTypes_upd: TIBUpdateSQL;
    DicAreaVolume: TIBQuery;
    DsDicAreaVolume: TDataSource;
    DicAreaVolume_upd: TIBUpdateSQL;
    DicUnits: TIBQuery;
    DsDicUnits: TDataSource;
    DicUnits_upd: TIBUpdateSQL;
    QClientExtUR: TIBQuery;
    WorkerRegions: TIBQuery;
    DsWorkerRegions: TDataSource;
    ClientList: TdxMemData;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    ActivePhones: TdxMemData;
    ActivePhonesPhone: TStringField;
    ActivePhonesworker_id: TIntegerField;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    ClientList0: TdxMemData;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    procedure DsWorkerDataChange(Sender: TObject; Field: TField);
    procedure Calls_TimerTimer(Sender: TObject);
    procedure SocketTimerTimer(Sender: TObject);
    procedure ClientsAfterOpen(DataSet: TDataSet);
    procedure ClientsBeforeClose(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ClientListAfterScroll(DataSet: TDataSet);
    procedure ClientsAfterPost(DataSet: TDataSet);
    procedure DBAfterDisconnect(Sender: TObject);
  private
    procedure CreateContactTypesPopup(Adata: TDataset); // создаем попап менютипов клиентов
  public
    //Clients: TIBQueryFilt;
    Procedure MakeTopForm (Form :TForm); // сделать поверх всех окон.
    Procedure UnMakeTopForm (Form :TForm); // сделать обычное окно.

    function BeforeLogin: boolean;
    function AfterLogin: boolean;
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);

    //данные
    function LoadSpr: boolean; // загрузка вспомогательных справочников

    function GetCurrentUser(id: integer): CurrentUserRec; //установка текущего пользователя
    function ShowWorkerForm(DS: TDataSource; Worker_ID: integer;
      ActionStr: TActionStr; ParentForm: TForm; ShowModal: Boolean=true): FormResult;
    function GetPersonShortName(f, i, o: string): string;
    function GetPersonFullName(f, i, o: string): string;
    function isWorkersRegion(ARegion_Id: integer): Boolean; //регион пользователя или нет
    function isWorkerClient(AClient_id: integer; AWithRegion: boolean=true): boolean; // проверка клиента по сотруднику и региону

    function ShowClientFiz(AAction: TActionStr; AExtPrm: TClientParam): FormResult;
    function ShowClientFizForCall(AAction: TActionStr; AExtPrm: TClientParam): FormResult; // при звонке вместе с краткой формой

    function ShowClientUr(AAction: TActionStr; AExtPrm: TClientParam): FormResult;
    function ShowClientUrForCall(AAction: TActionStr; AExtPrm: TClientParam): FormResult;
    function ShowClientsForCall: FormResult;

    function SetReadedCall(id: integer): boolean;
    function ShowCall: Boolean;
    function ShowUnknownCallForm(APhone: string; AFreeForm: boolean=true; AOutcome: Boolean = True): FormResult;
    function ShowFizCallForm(CLP: ClientCallParams): FormResult;
    function ShowUrCallForm(CLP: ClientCallParams): FormResult;
    function ShowContact(AAction: TActionStr; AExtPrm: TClientParam): FormResult;
    function ShowContactCallForm(CLP: ClientCallParams): FormResult;

    function Calling(ATSnumber, Aphone: string; client_id: integer): string;
    function CallingWithResult(ATSnumber, Aphone: string; client_id: integer): string;
    function ShowOutcomCall(ACallId, ACallApiId: string; APhone: string): string;
    function GetClientInfoForCall(Aid: integer): TdxMemData;
    procedure miContactTypesClick(Sender: TObject); //нажатие на меню типов контактов

    function CheckCloseSession(callid: string; callapiid: string = ''): boolean; //проверка закрытия сессии
    function CheckCloseCall(callid: string): boolean; //проверка окончания непринятого звонка
    function CheckAcceptCall(callid: string): boolean; //проверка захвата звонка
    procedure CheckSession(callid: string; var finished, accepted: Boolean); //проверка сессии на окончание и приём

    function FinishSession(callapiid: string; client_id: integer; callid: string=''): string;

    function GetDataset(AQuery: TIBQuery): TIBQuery;
    function GetClientCallParams(TelNum: string): ClientCallParams;
    procedure SetFilterNonDelete(ADataset: TDataset);
    function OffFilter(ADataset: TDataset; AField: TField = nil): Variant; //сброс фильтра и установка на запись
    procedure FilterNonDelete(DataSet: TDataSet; var Accept: Boolean);
    //function CopyClientCallParams(ASource: ClientCallParams): ClientCallParams;

    function isModifiedData(Ds: TIBQuery): Boolean; overload;//проверка наличия изменений
    function isModifiedData(Ds: TDataset): Boolean; overload;
  var
    CurrentUserSets: CurrentUserRec;
    //FtpProp: FtpProps;
    //TrayView: TTrayView;
    MissCount: integer;
    DBFileName :string;
    inCalling: Boolean;
    waitCalling: Boolean; //ожидание исх.звонка
    incomeCalling: Boolean;
    incomeCallId: string;
    DateStart: TDateTime; //время запуска программы
end;


  function SetFieldValue(AField: TField; AValue: Variant; DoPost: Boolean=True): Boolean;
  function CreateRWQuery: TIBQuery;
  function ClientExtUr(Aid: integer): TClientExtUr;
var
  DM: TDataModuleMain;
  _ClientExtUr: TClientExtUr;
  UserRights: TUserRights;


implementation

//{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  frmWorker, System.StrUtils, formCallUnknown, formClientFiz,
  formClientUr, formIncomeCalls, formIncomeCallsUr, formCalling,
  frmMain, formClientsForCall, formIncomeCallRoot, formSessionResult,
  formClientResult, formContact, formLogo,
  formSmallClientFiz, formSmallClientUr, formCallEvent;

function SetFieldValue(AField: TField; AValue: Variant; DoPost: Boolean=True): Boolean;
var
  ds: TDataSet;
begin
  ds := nil;
  Result := False;
  try
    ds := AField.DataSet;
    if not(ds.State in [dsEdit, dsInsert]) then
      ds.Edit;
    AField.Value := AValue;
    if DoPost then
      ds.Post;
    Result := True;
  except
    ds.Cancel;
    Result := False;
  end;
end;
function CreateRWQuery: TIBQuery;
var
  TR: TIBTransaction;
begin
  TR := TIBTransaction.Create(nil);
  TR.DefaultDatabase := DM.DB;
  TR.DefaultAction := TACommit;
  TR.AutoStopAction := saCommit;

  TR.Params.Add('isc_tpb_read_committed');
  //TR.Params.Add('isc_tpb_no_rec_version');
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

  result := TIBQuery.Create(nil);
  result.Database := DM.DB;
  result.Transaction := TR;

end;

function ClientExtUr(Aid: integer): TClientExtUr;
begin
  if _ClientExtUr = nil then
   _ClientExtUr := TClientExtUr.Create;

  Result := _ClientExtUr;
  Result.ID := Aid;
end;

function TDataModuleMain.ShowClientFiz(AAction: TActionStr;
  AExtPrm: TClientParam): FormResult;
var
  prm: TFrmCreateParam;
begin
  if not DM.Clients.Active then
    DM.Clients.Open;

  prm :=  TFrmCreateParam.Init(AACtion, DM.Clients, @AExtPrm);  //NewFrmCreateParam(AACtion, DM.Clients, @AExtPrm);
  frmClientFiz := TfrmClientFiz.Create(nil, '', @prm);
  try
    if frmClientFiz.ShowModal = mrOk then
      DM.Clients.Refresh;
    Result.ModalRes := frmClientFiz.ModalResult;
  finally
    FreeAndNil(frmClientFiz);
  end;
end;

function TDataModuleMain.ShowClientFizForCall(AAction: TActionStr;
  AExtPrm: TClientParam): FormResult;
var
  prm: TFrmCreateParam;
begin
  if not DM.Clients.Active then
    DM.Clients.Open;

  prm :=  TFrmCreateParam.Init(AACtion, DM.Clients, @AExtPrm);  //NewFrmCreateParam(AACtion, DM.Clients, @AExtPrm);
  frmClientFiz := TfrmClientFiz.Create(nil, '', @prm);
  with frmClientFiz do
  begin
    btnHide.Visible := True;
    Exit_bnt.Visible := False;
    butOK.Visible := False;
  end;

  frmSmallCardFiz := TfrmSmallCardFiz.Create(nil);
  with frmSmallCardFiz do
  begin
    edtName.DataBinding.DataSource   := frmClientFiz.FramePerson.DS;
    edtFamily.DataBinding.DataSource := frmClientFiz.FramePerson.DS;
    edtPhone.Text          := RightStr(AExtPrm.CallParam.TelNum, 10);
    FrameUslugi.Query      := frmClientFiz.FrameUslugi.Query;
    FrameUslugi.DS.DataSet := frmClientFiz.FrameUslugi.Query;
    ShowModal;
  end;
  Result.ModalRes := frmClientFiz.ModalResult;
end;

function TDataModuleMain.ShowClientsForCall: FormResult;
begin
  frmClientsForCall := TfrmClientsForCall.Create(nil);
  try
    frmClientsForCall.QWorkerShedule.ParamByName('worker_id').AsInteger := CurrentUserSets.ID;
    frmClientsForCall.QWorkerShedule.Open;
    frmClientsForCall.ShowModal;
  finally
    FreeAndNil(frmClientsForCall);
  end;
end;

function TDataModuleMain.ShowClientUr(AAction: TActionStr;
  AExtPrm: TClientParam): FormResult;
var
  prm: TFrmCreateParam;
begin
  if not DM.Clients.Active then
    DM.Clients.Open;

  prm := NewFrmCreateParam(AACtion, DM.Clients, @AExtPrm);
  frmClientUr := TfrmClientUr.Create(nil, '', @prm);
  try
    if frmClientUr.ShowModal = mrOk then
      DM.Clients.Refresh;
    Result.ModalRes := frmClientUr.ModalResult;
  finally
    FreeAndNil(frmClientUr);
  end;
end;

function TDataModuleMain.ShowClientUrForCall(AAction: TActionStr;
  AExtPrm: TClientParam): FormResult;
var
  prm: TFrmCreateParam;
begin
  if not DM.Clients.Active then
    DM.Clients.Open;

  prm :=  TFrmCreateParam.Init(AACtion, DM.Clients, @AExtPrm);  //NewFrmCreateParam(AACtion, DM.Clients, @AExtPrm);
  frmClientUr := TfrmClientUr.Create(nil, '', @prm);
  with frmClientUr do
  begin
    btnHide.Visible := True;
    Exit_bnt.Visible := False;
    butOK.Visible := False;
  end;

  frmSmallCardUr := TfrmSmallCardUr.Create(nil);
  with frmSmallCardUr do
  begin
    edtName.DataBinding.DataSource   := frmClientUr.FramePerson.DS;
    edtFamily.DataBinding.DataSource := frmClientUr.FramePerson.DS;
    edtPhone.Text          := RightStr(AExtPrm.CallParam.TelNum, 10);
    FrameUslugi.Query      := frmClientUr.FrameUslugi.Query;
    FrameUslugi.DS.DataSet := frmClientUr.FrameUslugi.Query;
    ShowModal;
  end;
  Result.ModalRes := frmClientUr.ModalResult;
end;

function TDataModuleMain.ShowContact(AAction: TActionStr;
  AExtPrm: TClientParam): FormResult;
var
  prm: TFrmCreateParam;
begin
  prm := NewFrmCreateParam(AACtion, DM.Contacts, @AExtPrm);
  frmContact := TfrmContact.Create(nil, '', @prm);
  try
    frmContact.ShowModal;
    Result.ModalRes := frmContact.ModalResult;
  finally
    FreeAndNil(frmContact);
  end;
end;

function TDataModuleMain.ShowContactCallForm(CLP: ClientCallParams): FormResult;
var
  prm: TClientParam;
begin
  //prm := NewFrmCreateParam(asEdit, DM.Contacts);
  frmContact:= TfrmContact.Create(nil, 'Входящий звонок. Контакт');
  try
    frmContact.CloseOnCancelCall := True;
    frmContact.Caption := 'Входящий звонок. Контакт';
    frmContact.FrameContact.OpenData(CallObj.CallInfo.ClientId);
    frmContact.ShowModal;

    Result.ModalRes := frmContact.ModalResult;
  finally
    FreeAndNil(frmContact);
  end;
end;

function TDataModuleMain.ShowFizCallForm(CLP: ClientCallParams): FormResult;
var
  prm: TClientParam;
begin
  DM.GetDataset(DM.Clients);
  DM.Clients.Locate('ID', CallObj.CallInfo.ClientId, []);

  if Assigned(frmIncomeCall) then
    frmIncomeCall.CloseAbsolute;

  frmIncomeCall := TfrmIncomeCall.Create(nil);
  try
    frmIncomeCall.CloseOnCancelCall := True;
    frmIncomeCall.edtPhone.Text := RightStr(CallObj.CallInfo.Phone, 10);
    frmIncomeCall.FramePerson.OpenData(DM.Clients.FieldByName('PERSON_ID').AsInteger);
    frmIncomeCall.cmbFormat.EditValue := DM.Clients.FieldByName('FORMAT_ID').AsInteger;
    frmIncomeCall.cmbStatus.EditValue := DM.Clients.FieldByName('STATUS_ID').AsInteger;
    frmIncomeCall.lblWorker.Caption   := DM.Clients.FieldByName('WORKER_NAME').AsString;
    frmIncomeCall.ShowModal;
    if frmIncomeCall.ModalResult = mrOk then
    begin
      //if frmIncomeCall.finished and Assigned(frmIncomeCallRoot) then
      //  frmIncomeCallRoot.CallFinish
      //else
        ShowClientFiz(asEdit, prm);
    end;

    Result.ModalRes := frmIncomeCall.ModalResult;
  finally
    FreeAndNil(frmIncomeCall);
  end;
end;

function TDataModuleMain.ShowOutcomCall(ACallId, ACallApiId: string; APhone: string): string;
var Q : TIBQuery;
    ClP :ClientCallParams;
    tel :string;
    id, newHeight: integer;
    Prm: TFrmCreateParam;
    extParam: TClientParam;
    newFiz, newUr, newContact, nonClient, newClientCreated, fCancel, isClient: Boolean;
    frm: TForm;
begin
  Application.ProcessMessages;

  if Db.Connected = false then
    Exit;

  try
    FreeAndNil(frmSessionResult);
  finally
    frmSessionResult := nil;
  end;

  try
  try
     //получаем параметры звонка
     //CLP := getClientCallParams(APhone);
     //CLP.id_call := ACallid;
     ClP.TelNum  := APhone;

     extParam.Init(0, 0, @CLP);
     prm.action := asEdit;

    frmClientResult := TfrmClientResult.Create(nil);

    inCalling := True;
    DM.GetDataset(DM.Clients);
    DM.GetDataset(DM.Contacts);

    (*if CallObj.CallInfo.ClientType = '' then
      case ShowUnknownCallForm(Aphone, false).ModalRes of
       mrOk:
       begin
         // новый лид
         if frmCallUnknown.TypeBtnClick = frmCallUnknown.btnLID.Name then
         begin
           ExtParam.CallParam.Status_Id := 2; //Лид
           if frmCallUnknown.SubTypeBtnClick = 'FIZ' then
             newFiz := True//DM.ShowClientFizForCall(asCreate, ExtPrm)
           else
             newUr := True;//DM.ShowClientURForCall(asCreate, ExtPrm);
         end
         else //добавить к существующему
         if frmCallUnknown.TypeBtnClick = frmCallUnknown.btnAddToExist.Name then
         begin
           if frmCallUnknown.SelectId > 0 then
           begin
             DM.Clients.Locate('id', frmCallUnknown.SelectId, []);
             CallObj.CallInfo.ClientId := frmCallUnknown.SelectId;
             isClient := True;
             if DM.Clients.FieldByName('type_cli').AsInteger = 0 then
                CallObj.CallInfo.ClientType := 'F'
             else
                CallObj.CallInfo.ClientType := 'U';
           end;
         end;
       end;
      end *)
    if CallObj.CallInfo.ClientType = '' then
      try  // Вызываем неизвестный звонок.
       CLP.Setup;
       CLP.TelNum := CallObj.CallInfo.Phone;
       ExtParam.CallParam := @CLP;

       case DM.ShowUnknownCallForm(CallObj.CallInfo.Phone, false).ModalRes of
         mrOk:
         begin
           // новый лид
           if frmCallUnknown.TypeBtnClick = frmCallUnknown.btnLID.Name then
           begin
             ExtParam.CallParam.Status_Id := 2; //Лид
             if frmCallUnknown.SubTypeBtnClick = 'FIZ' then
             begin
               if DM.ShowClientFizForCall(asCreate, ExtParam).ModalRes = mrOK then //создан новый клиент
               begin
                 newClientCreated := True;
                 frmClientResult.ClientId :=  DM.Clients.FieldByName('id').AsInteger;
                 CallObj.CallInfo.ClientId := DM.Clients.FieldByName('id').AsInteger;
                 CallObj.CallInfo.ClientType := 'F';
               end
             end
             else
             begin
               if DM.ShowClientURForCall(asCreate, ExtParam).ModalRes = mrOk then
               begin
                 newClientCreated := True;
                 frmClientResult.ClientId :=  DM.Clients.FieldByName('id').AsInteger;
                 CallObj.CallInfo.ClientId := DM.Clients.FieldByName('id').AsInteger;
                 CallObj.CallInfo.ClientType := 'U';
               end;
             end;
             if Assigned(frmSessionResult) then
               frmSessionResult.EnableButtons;
           end
           else //добавить к существующему
           if frmCallUnknown.TypeBtnClick = frmCallUnknown.btnAddToExist.Name then
           begin
             if frmCallUnknown.SelectId > 0 then
             begin
               if DM.Clients.Locate('id', frmCallUnknown.SelectId, []) then
               begin
                 ExtParam.CallParam.Client_id := frmCallUnknown.SelectId;
                 if DM.Clients.FieldByName('type_cli').AsInteger = 0 then
                    DM.ShowClientFizForCall(asEdit, ExtParam)
                 else
                   DM.ShowClientURForCall(asEdit, ExtParam);
                 if Assigned(frmSessionResult) then
                     frmSessionResult.EnableButtons;
               end;
             end;
           end

           else  //корпоративный и др
           begin
             nonClient := True;
             frmClientResult.ClientId := -1;
    //       if not Assigned(frmSessionResult) then
    //         frmSessionResult := TfrmSessionResult.Create(nil);
    //         with frmSessionResult do
    //         begin
    //           btnBack.Visible := True;
    //           btnCardNoCreated.Enabled := False;
    //           btnConsult.Enabled := False;
    //           btnNonConsult.Enabled := False;
    //           btnOther.Enabled := False;
    //         end;
    //       end;
         end;

         (*mrYes: formRes := DM.ShowClientUr(asCreate, ExtPrm);
         mrAll:
           begin
            extPrm.ClientType := frmCallUnknown.ContactType;
            formRes := DM.ShowContact(asCreate, ExtPrm);
           end;*)
         end;

         mrCancel:
           nonClient := True;
       end;
      finally
        //frmCallUnknown.Free;
        FreeAndNil(frmClientFiz);
        FreeAndNil(frmClientUr);
        frmCallUnknown.HideAbsolute;
      end
    else
    begin
      if (CallObj.CallInfo.ClientType <> 'C') and not DM.Clients.Locate('id', CallObj.CallInfo.ClientId, []) then
        Exit;
      if (CallObj.CallInfo.ClientType = 'C') and not DM.Contacts.Locate('id', CallObj.CallInfo.ClientId, []) then
        Exit;
    end;

    if not fCancel (*and not CallObj.Cancelled*) then
    begin
      if not Assigned(frmSessionResult) or
          not frmSessionResult.Visible then
        frmClientResult.CreateFormResult;

      isClient := not(newContact or (CallObj.CallInfo.ClientType = 'C')) or newClientCreated;

      if isClient then
        DM.GetDataset(DM.Clients)
      else
        DM.GetDataset(DM.Contacts);

//      if isClient and (newFiz or NewUr) then
//      begin
//        prm := NewFrmCreateParam(asCreate, DM.Clients);
//      end;
      if newContact then
        prm := NewFrmCreateParam(asCreate, DM.Contacts);

      Prm.ExtParam := @ExtParam;

      if isClient then
        Prm.Dataset := DM.Clients
      else
        Prm.Dataset := DM.Contacts;

      if not nonClient then
      begin
        if isClient (*and not newUr*) and
          ((DM.Clients.FieldByName('type_cli').AsInteger = 0) or newFiz) then
        begin
          frmClientFiz := TfrmClientFiz.Create(nil, '', @prm);
          frmClientFiz.RzPanel1.Visible := False;
          frmClientFiz.Height := frmClientFiz.Height - frmClientFiz.RzPanel1.Height;
          frm := frmClientFiz;
        end
        else
        if isClient then
        begin
          frmClientUr := TfrmClientUr.Create(nil, '', @prm);
          frmClientUr.RzPanel1.Visible := False;
          frmClientUr.Height := frmClientUr.Height - frmClientUr.RzPanel1.Height;
          frm := frmClientUr;
        end
        else //контакт
        begin
          frmContact := TfrmContact.Create(nil, '', @prm);
          frmContact.RzPanel1.Visible := False;
          frmContact.Height := frmContact.Height - frmContact.RzPanel1.Height;
          frm := frmContact;
        end;

        frm.BorderIcons := [];
        frm.BorderStyle := bsNone;
        frm.Parent      := frmClientResult.pnlForm;
        frmClientResult.pnlForm.Height := frm.Height + 10;
        if frm.Width > frmClientResult.pnlForm.Width then
        begin
          frmClientResult.ClientWidth := frm.Width;
        end;

        frmClientResult.Height := frmClientResult.pnlForm.Height +
          frmClientResult.pnlResult.Height + frmClientResult.RzPanel1.Height;

        frm.Position := poDefault;
        frm.Show;
      end
      else // не было клиента
      begin
        frmClientResult.ClientSaved := True;
        newHeight := frmClientResult.Height - frmClientResult.pnlForm.Height;
        frmClientResult.pnlForm.Height := 0;
        frmClientResult.Height := newHeight;
      end;

      frmClientResult.frmCli    := frm;
      if isClient then
        frmClientResult.TypeCli := DM.Clients.FieldByName('type_cli').AsInteger
      else
        frmClientResult.TypeCli := 3;

      if frmClientResult.ClientId = 0 then //не -1
        frmClientResult.ClientId  := CallObj.CallInfo.ClientId;
    end;
    frmClientResult.CallId    := ACallId;
    frmClientResult.CallApiId := ACallApiId;
    if not CallObj.Active or frmClientResult.CallFinished then
    begin
      frmClientResult.CallFinish;
    end;

    // если карточка была создана после окончания звонка
    if (frmClientResult.ClientId <> 0) and
        Assigned(frmSessionResult) and
       (frmSessionResult.ResultType =
                  frmSessionResult.btnCardNoCreated.Name) then
    begin
      frmSessionResult.ClearResult;
    end;
  except
    MsgBoxError(Exception(ExceptObject).Message, 'Непредвиденная ошибка');
  end;
  finally
    try
      if not Assigned(frmSessionResult) or
          not frmSessionResult.Visible then
        frmClientResult.CreateFormResult;
      frmClientResult.frmResult := frmClientResult;

      try
      frmClientResult.ShowModal;
      Result := frmClientResult.CallResult;
      
      //frmClientResult.frmCli.Parent := nil;
      //if Assigned(frmClientResult) and
      //    Assigned(frmSessionResult) then
      //  frmSessionResult.Parent := nil;

      finally
      end;
    finally
      try
        inCalling      := False;
        waitCalling    := False;

        if frmCallUnknown.Visible then
           frmCallUnknown.HideAbsolute;
        FreeAndNil(frmSessionResult);
        FreeAndNil(frmClientResult);
        if Assigned(frmClientFiz) then
          FreeAndNil(frmClientFiz);
        if Assigned(frmClientUr) then
          FreeAndNil(frmClientUr);
      finally
        CallObj.Ready  := true;
      end;
    end;
  end;

end;

function TDataModuleMain.ShowUnknownCallForm(APhone: string; AFreeForm: boolean=True; AOutcome: Boolean = True): FormResult;
begin
  if not Assigned(frmCallUnknown) then
  frmCallUnknown := TfrmCallUnknown.Create(nil);
  try
    frmCallUnknown.OutcomeCall := AOutcome;
    frmCallUnknown.CloseOnCancelCall := True;
    frmCallUnknown.edtPhone.Text := RightStr(APhone, 10);
    frmCallUnknown.ShowModal;
    Result.ModalRes := frmCallUnknown.ModalResult;
  finally
    if AFreeForm then
      FreeAndNil(frmCallUnknown)
    else
      frmCallUnknown.Hide;
  end;
end;

function TDataModuleMain.ShowUrCallForm(CLP: ClientCallParams): FormResult;
var
  prm: TClientParam;
  client_id: Integer;
begin
  client_id := CallObj.CallInfo.ClientId;
  DM.GetDataset(DM.Clients);
  DM.Clients.Locate('ID', client_id, []);
  ClientExtUr(CallObj.CallInfo.ClientId);

  if Assigned(frmIncomeCallUr) then
    frmIncomeCallUr.CloseAbsolute;

  frmIncomeCallUr := TfrmIncomeCallUr.Create(nil);
  try
    frmIncomeCallUr.CloseOnCancelCall := True;
    frmIncomeCallUr.edtPhone.Text := RightStr(CallObj.CallInfo.Phone, 10);
    frmIncomeCallUr.FramePerson.OpenData(DM.Clients.FieldByName('PERSON_ID').AsInteger);
    frmIncomeCallUr.cmbForma.EditValue  := ClientExtUr(Client_Id).CF('FORMA_ID').AsInteger;
    frmIncomeCallUr.cmbFormat.EditValue := DM.Clients.FieldByName('Format_Id').AsInteger;
    frmIncomeCallUr.cmbStatus.EditValue := DM.Clients.FieldByName('Status_Id').AsInteger;
    frmIncomeCallUr.lblWorker.Caption   := DM.Clients.FieldByName('WORKER_NAME').AsString;
    frmIncomeCallUr.edtINN.Text         := ClientExtUr(Client_Id).CF('INN').AsString;
    frmIncomeCallUr.edtName.Text        := DM.Clients.FieldByName('NAME').AsString;
    frmIncomeCallUr.ShowModal;

    if frmIncomeCallUr.ModalResult = mrOk then
    begin
      //prm.CallParam := CLP;

      ShowClientUr(asEdit, prm);
    end;

    Result.ModalRes := frmIncomeCallUr.ModalResult;
  finally
    FreeAndNil(frmIncomeCallUr);
  end;
end;

function TDataModuleMain.ShowWorkerForm(DS: TDataSource; Worker_ID: integer;
  ActionStr: TActionStr; ParentForm: TForm; ShowModal: Boolean): FormResult;
var
  Form :TfrmWorker;
begin
  Try
    if ActionStr = asCreate then
    begin
      DS.Dataset.Append;
    end;

    if ActionStr = asEdit then
      DS.Dataset.Edit;

    form := TfrmWorker.Create(self);
    form.DS.DataSet := Worker_q;

    if ActionStr = asCreate then
    begin
      form.Caption := form.Caption + '.Новый';
      //Worker_q.FieldByName('USER_BLOCKED').AsInteger := 0;
      Worker_q.FieldByName('IS_DELETED').AsInteger := 0;
    end
    else
      form.Caption := form.Caption + '.Редактирование';

    // not form.ListsLoaded then //загружаем списки
    //  form.LoadLists;

    if  ShowModal = true then
    begin
      ParentForm.AlphaBlendValue := FormAlphaBlend;
      ParentForm.AlphaBlend := True;
      try
        Result.ModalRes := form.ShowModal;
      except
        Result.ModalRes := mrNone;
      end;
    end;
  finally
    //if
    //  Result.New_Id := StrToInt(form.ID_edt.Text);
    ParentForm.AlphaBlend := false;
     if result.ModalRes = mrOk then
     begin
       DS.DataSet.Post;

       DS.DataSet.Refresh;
       Workers.Close;
       Workers.Open;
     end;

     if ShowModal then
     begin
        FreeAndNil(form);
        form.DisposeOf;
     end;
  end;
end;

procedure TDataModuleMain.SocketTimerTimer(Sender: TObject);
begin
  formMain.DoSocketConnect;
end;

function TDataModuleMain.LoadSpr: boolean;
begin
  Result := false;
  try
    //DicContrJobs.Open;
    //DicContrStates.Open;
    //DicContrStatuses.Open;
    //DicTaskStatuses.Open;
    //DicUserRight.Open;
    DicUserTypes.Open;
    DicWorkerProfs.Open;
    DicServices.Open;
    DicMaterialType.Open;
    DicMaterialSubTypes.Open;
    DicMaterials.Open;
    DicFormatsCli.Open;
    DicStatusCli.Open;
    DicUrForm.Open;
    DicCliSfera.Open;
    DicCliProfs.Open;
    DicRegions.Open;
    DicPhoneType.Open;
    DicDogTypes.Open;
    DicAreaVolume.Open;
    DicUnits.Open;
   // DicWorkerStatus.Open;
    Workers.Open;
    WorkerRegions.ParamByName('worker_id').AsInteger := CurrentUserSets.ID;
    WorkerRegions.Open;

    with DicCallTypes do
    begin
      Open;
      Append;
      FieldByName('ID').AsInteger := 0;
      FieldByName('NAME').AsString := 'Входящий';
      Post;
      Append;
      FieldByName('ID').AsInteger := 1;
      FieldByName('NAME').AsString := 'Исходящий';
      Post;
    end;

    DicContactTypes.Open;
    CreateContactTypesPopup(DicContactTypes);

    Result := True;
  except
  end;
end;

function TDataModuleMain.AfterLogin: boolean;
begin
  Result := False;
  //TrayView := TrayNormal;
  frmLogo.InfoText := 'Загрузка справочников...';
  if not LoadSpr then //загрузка справочников
  begin
    Application.MessageBox('Ошибка загрузки справочников','Ошибка', MB_ICONERROR);
    Application.Terminate;
    Exit;
  end;
  Result := true;


// Инициализация приложения
  // Пользователь
  // CurrentUserSets := GetCurrentUser(1);
  //  CurrentUserSets.ATS_Phone_Num := debug_atsnum;

   //Session_timer.Interval := session_timer_interval * 1000;

   Application.OnMessage := AppMessage;

   //if CurrentUserSets.ATS_Phone_Num = '' then
   //   CurrentUserSets.ATS_Phone_Num := '112';

   (*CurrentUserSets.id := 1;
   CurrentUserSets.UserName := 'Иванов И.И.';
   CurrentUserSets.UserType := 1;
   CurrentUserSets.userTypeName := 'Администратор';
   CurrentUserSets.DebugMode := true;
   CurrentUserSets.ATS_Phone_Num := '112'; *)
end;


procedure TDataModuleMain.AppMessage(var Msg: TMsg; var Handled: Boolean);
begin
 {if Assigned(MF) and Assigned(MF.TrayIcon) then
   case DM.TrayView of
     trayNormal:
       begin
         MF.TrayIcon.Animate := false;
         MF.TrayIcon.IconIndex := 0;
         MF.TrayIcon.Hint := DM.ProgName;
       end;
     trayMissed:
       begin
         MF.TrayIcon.Animate := true;
         MF.TrayIcon.Hint := DM.ProgName + Format(' Имеются пропущенные звонки(%d)!', [DM.MissCount]);
       end;
   end;}
end;

function TDataModuleMain.BeforeLogin: boolean;
var
  answer: integer;
  DBFileName0: string;
begin
  {Result := false;

  DBFileName := ReadConfig('General', 'Database', DBFileName);
  DBFileName0 := DBFileName;
  DB.DatabaseName := DBFileName;

  answer := IdYes;
  while answer = IdYes do
    try
      DB.Open;
      answer := IdNo;
      Result := true;
      if DBFileName0 <> DBFileName then
        Writeconfig('General', 'Database', DB.DatabaseName);
    except
      answer := MessageBox(0, 'Ошибка подключения к базе данных. Изменить путь?', 'Ошибка соединения с БД', MB_ICONQUESTION + MB_YESNO);
      //Application.MessageBox('Ошибка подключения к базе данных. Обратитесь к разработчику','Ошибка', MB_ICONERROR);
      if answer = IdYes then
      begin
        dbPath := InputBox('Путь к БД', 'Ведите путь к БД', dbPath);
        if dbPath = '' then
          answer := IdNo
        else
          DB.DatabaseName := dbPath;
      end;

      if answer <> IdYes then
      begin
        Application.Terminate;
        Exit;
      end;
    end;}
end;

function TDataModuleMain.Calling(ATSnumber, Aphone: string; client_id: integer): string;
var
  CliInfo: TDataSet;
begin
  CliInfo := nil;
  try
    if not formMain.TCPClient.Connected then
    begin
      MessageBox(0, 'Нет соединения с сервером. Вызовы невозможны',
        'Исходящие вызовы', MB_ICONWARNING);
      exit;
    end;

    CliInfo := GetClientInfoForCall(client_id);

    //inCalling := True;
    //formMain.ClientSocket.Socket.SendText('#call:' + ATSnumber + ',' + Aphone);

    frmCalling := TfrmCalling.Create(nil);
    with frmCalling do
    begin
      DS.DataSet     := CliInfo;
      AtsPhone       := ATSnumber;
      Phone          := Aphone;
      edtPhone.Text  := Aphone;
      pnlFiz.Visible := (CliInfo.FieldByName('tip').AsInteger = 0);
      pnlUr.Visible  := not frmCalling.pnlFiz.Visible;
      ShowModal;
      Result := frmCalling.CallResult;
    end;

  finally
    CliInfo.Free;
    FreeAndNil(frmCalling);
  end;
end;

function TDataModuleMain.CallingWithResult(ATSnumber, Aphone: string; client_id: integer): string;
var
  prm: TFrmCreateParam;
  mres: TModalResult;
  frm: TForm;
  cnt: Integer;
begin
  try
    if not formMain.TCPClient.Connected then
    begin
      MessageBox(0, 'Нет соединения с сервером. Вызовы невозможны',
        'Исходящие вызовы', MB_ICONWARNING);
      exit;
    end;

   // DM.GetDataset(DM.Clients);

   // if not DM.Clients.Locate('id', client_id, []) then
   //   Exit;

    //inCalling := True;
    formMain.TCPClient.Socket.WriteLn('#call:' + AtsNumber + ',' + APhone + ',' + AtsNumber);
    WaitCalling := true;
    while waitCalling and (cnt < 60) do
    begin
      Application.ProcessMessages;
      Sleep(500);
      Inc(cnt);
    end;
    Exit;


    frmClientResult := TfrmClientResult.Create(self);

    prm := NewFrmCreateParam(asEdit, DM.Clients);
    if DM.Clients.FieldByName('type_cli').AsInteger = 0 then
    begin
      frmClientFiz := TfrmClientFiz.Create(frmClientResult, '', @prm);
      frmClientFiz.RzPanel1.Visible := False;
      frmClientFiz.Height := frmClientFiz.Height - frmClientFiz.RzPanel1.Height;
      frm := frmClientFiz;
    end
    else
    begin
      frmClientUr := TfrmClientUr.Create(frmClientResult, '', @prm);
      frmClientUr.RzPanel1.Visible := False;
      frmClientUr.Height := frmClientUr.Height - frmClientUr.RzPanel1.Height;
      frm := frmClientUr;
    end;

    frm.BorderIcons := [];
    frm.BorderStyle := bsNone;
    frm.Parent      := frmClientResult.pnlForm;
    frmClientResult.pnlForm.Height := frm.Height + 10;
    frmClientResult.pnlForm.Width  := frm.Width;
    frmClientResult.Height := frmClientResult.pnlForm.Height +
      frmClientResult.pnlResult.Height + frmClientResult.RzPanel1.Height;

    frm.Position := poDefault;
    frm.Show;

    frmClientResult.frmCli := frm;
    frmClientResult.TypeCli := DM.Clients.FieldByName('type_cli').AsInteger;
    frmClientResult.ClientId := client_id;
    frmClientResult.ShowModal;
    Result := frmClientResult.CallResult;
    frmClientResult.Free;
  finally
    inCalling := False;
  end;
end;

procedure TDataModuleMain.Calls_TimerTimer(Sender: TObject);
var Q : TIBQuery;
    ClP :ClientCallParams;
    tel :string;
    id: integer;
    extPrm: TClientParam;
begin

  if Db.Connected = false then  Exit;

  Calls_Timer.Enabled := false;
  try
    with CallS_Q do
    begin
         Close;
         if Transaction.InTransaction then
           Transaction.CommitRetaining;
         ParamByName('ATS_Num').AsString := CurrentUserSets.ATS_Phone_Num;
         Open;

         if FieldByName('ID').IsNull = false then
         begin //если звонок есть.
           tel := FieldByName('CALL_NUM').AsString;
           id  := FieldByName('ID').AsInteger;
           //Delete;
           if Transaction.InTransaction then
              Transaction.CommitRetaining;

           //получаем параметры звонка
           CLP := getClientCallParams(tel);
           CLP.id_call := id;
           ClP.TelNum  := tel;

           ExtPrm.CallParam := @CLP;

           //берем звонок в обработку
           if not SetReadedCall(id) then
           begin
             // ошибка
             exit;
           end;

           frmIncomeCallRoot := TfrmIncomeCallRoot.Create(nil);
           frmIncomeCallRoot.Show;

           incomeCalling := True;
           incomeCallId := FieldByName('CALLAPIID').AsString;

           if clp.Client_Type = '' then
           begin  // Вызываем неизвестный звонок.
             case ShowUnknownCallForm(tel).ModalRes of
               mrOk: ShowClientFiz(asCreate, ExtPrm);
               mrYes: ShowClientUr(asCreate, ExtPrm);
               mrContinue:
               begin
                 //extPrm.ClientType := frmCallUnknown.
               end;
             end;
           end
           else
           begin
             if ClP.Client_Type = 'F' then
             begin
               ShowFizCallForm(clp);
             end;

             if ClP.Client_Type = 'U' then
             begin
               ShowUrCallForm(clp);
             end;
           end;
         end;

         if Transaction.Active then
           Transaction.CommitRetaining;

    end;

  //  with Miss_CallS_Count do
  //  begin
  //    Close;
  //    ParamByName('ATS_Num').AsString :=  CurrentUserSets.ATS_Phone_Num;
  //    Open;
  //
  //    MissCount := Fields[0].asInteger;
  //
  //    if MissCount > 0 then //есть пропущенные звонки
  //      trayView := trayMissed;
  //
  //    if Transaction.InTransaction then
  //      Transaction.Commit;
  //  end;

  finally
    incomeCalling := False;
   ////// calls_timer.enabled := true;
  end;
end;

function TDataModuleMain.CheckCloseSession(callid: string; callapiid: string = ''): boolean;
begin
  Result := false;
  if callapiid = '' then
  begin
    QSession_Check.Close;
    QSession_Check.ParamByName('callid').AsString := CallId;
    if QSession_Check.Transaction.Active then
      QSession_Check.Transaction.CommitRetaining;
    try
      QSession_Check.Open;
      Result := (QSession_Check.RecordCount > 0);
      if QSession_Check.Transaction.Active then
        QSession_Check.Transaction.CommitRetaining;
    except
      if QSession_Check.Transaction.Active then
       QSession_Check.Transaction.RollbackRetaining;
    end;
  end

  else //CALLAPIID
  begin
    QSession_CheckApi.Close;
    QSession_CheckApi.ParamByName('callapiid').AsString := CallapiId;
    if QSession_CheckApi.Transaction.Active then
      QSession_CheckApi.Transaction.CommitRetaining;
    try
      QSession_CheckApi.Open;
      Result := (QSession_CheckApi.RecordCount > 0);
      if QSession_CheckApi.Transaction.Active then
        QSession_CheckApi.Transaction.CommitRetaining;
    except
      if QSession_CheckApi.Transaction.Active then
       QSession_CheckApi.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TDataModuleMain.CheckSession(callid: string; var finished, accepted: Boolean);
begin
  QSessionCheckAct.Close;
  QSessionCheckAct.ParamByName('callid').AsString := CallId;
  if QSessionCheckAct.Transaction.Active then
    QSessionCheckAct.Transaction.CommitRetaining;
  try
    QSessionCheckAct.Open;
    if QSessionCheckAct.RecordCount > 0 then
    begin
      finished := (QSessionCheckAct.FieldByName('finished').AsInteger = 1);
      accepted := (QSessionCheckAct.FieldByName('accept').AsInteger = 1);
    end;
    if QSessionCheckAct.Transaction.Active then
      QSessionCheckAct.Transaction.CommitRetaining;
  except
    if QSessionCheckAct.Transaction.Active then
     QSessionCheckAct.Transaction.RollbackRetaining;
  end;
end;

procedure TDataModuleMain.ClientListAfterScroll(DataSet: TDataSet);
begin
  if Clients.FieldByName('id').AsInteger <>
             ClientList.FieldByName('id').AsInteger then
    Clients.Locate('id', DataSet.FieldByName('id').AsInteger, []);
end;

procedure TDataModuleMain.ClientsAfterOpen(DataSet: TDataSet);
begin
  ClientList.AfterScroll := nil;
  try
    ClientList.Close;
    ClientList.CopyFromDataSet(Dataset);
    if DataSet.Tag > 0 then
    begin
      DataSet.Locate('id', DataSet.Tag, []);
      if ClientList.Active then
        ClientList.Locate('id', DataSet.Tag, []);
    end;
  finally
    ClientList.AfterScroll := ClientListAfterScroll;
    ClientList0.Close;
    ClientList0.CopyFromDataSet(Dataset);
    ClientList0.Open;
  end;
end;

procedure TDataModuleMain.ClientsAfterPost(DataSet: TDataSet);
var
  i: Integer;
begin
  if not ClientList.Active then
    Exit;

  if ClientList.Locate('id', DataSet.FieldByName('id').AsInteger, []) then
  try
    ClientList.Edit;
    for i := 0 to DataSet.FieldCount - 1 do
      ClientList.FieldByName(Dataset.Fields[i].FieldName).Value := Dataset.Fields[i].Value;
  finally
    if ClientList.State <> dsBrowse then
      ClientList.Post;
  end
  else
  try
    ClientList.Append;
    for i := 0 to DataSet.FieldCount - 1 do
      ClientList.FieldByName(Dataset.Fields[i].FieldName).Value := Dataset.Fields[i].Value;
  finally
    if ClientList.State <> dsBrowse then
      ClientList.Post;
  end
end;

procedure TDataModuleMain.ClientsBeforeClose(DataSet: TDataSet);
begin
  if DataSet.Active then
    DataSet.Tag := DataSet.FieldByName('id').AsInteger;
end;

function TDataModuleMain.CheckAcceptCall(callid: string): boolean;
begin
  Result := false;
  QCallAcceptCheck.Close;
  QCallAcceptCheck.ParamByName('callid').AsString := CallId;
  QCallAcceptCheck.ParamByName('phone').AsString := CurrentUserSets.ATS_Phone_Num;
  if QCallAcceptCheck.Transaction.Active then
    QCallAcceptCheck.Transaction.CommitRetaining;
  try
    QCallAcceptCheck.Open;
    Result := (QCallAcceptCheck.RecordCount > 0);
    if QCallAcceptCheck.Transaction.Active then
      QCallAcceptCheck.Transaction.CommitRetaining;
  except
    if QCallAcceptCheck.Transaction.Active then
     QCallAcceptCheck.Transaction.RollbackRetaining;
  end;
end;

function TDataModuleMain.CheckCloseCall(callid: string): boolean;
begin
  Result := false;
  QCall_Check.Close;
  QCall_Check.ParamByName('callid').AsString := CallId;
  if QCall_Check.Transaction.Active then
    QCall_Check.Transaction.CommitRetaining;
  try
    QCall_Check.Open;
    Result := (QCall_Check.RecordCount > 0);
    if QCall_Check.Transaction.Active then
      QCall_Check.Transaction.CommitRetaining;
  except
    if QCall_Check.Transaction.Active then
     QCall_Check.Transaction.RollbackRetaining;
  end;
end;

function TDataModuleMain.FinishSession(callapiid: string; client_id: integer; callid: string=''): string;
var
  f: boolean;
begin
  f := Assigned(frmSessionResult);
  if not f then
    frmSessionResult := TfrmSessionResult.Create(nil);

  with frmSessionResult do
  try
    try
      Q.ParamByName('callapiid').AsString := callapiid;
      Q.ParamByName('callednum').AsString := CallObj.CallInfo.CalledNumber;
      Q.ParamByName('callernum').AsString := CallObj.CallInfo.CallerIDNum;

      if Q.Active then
       Q.Close;

      if Assigned(Q.Transaction) and Q.Transaction.Active then
        Q.Transaction.CommitRetaining;

      Q.Open;
      if Q.RecordCount = 0 then
        Exception.Create(
          Format('Запрос сессии для CALLAPIID=%s вернул пустое значение',
            [callid]));

      Q.Edit;
      Q.FieldByName('worker_id').AsInteger := DM.CurrentUserSets.ID;
      Q.FieldByName('client_id').AsInteger := client_id;
      if client_id = 0 then //клиент не был создан
        //_Q.FieldByName('ishod').AsString := 'Карточка клиента не создана';
        btnCardNoCreated.Click;

      Result := Q.FieldByName('callresult').AsString;
      if not f then
      begin
        //FormStyle := fsStayOnTop;
        frmSessionResult.ShowModal;
      end;

      if Q.Modified then
      try
      Q.FieldByName('localnum').AsString := DM.CurrentUserSets.ATS_Phone_Num;
        Q.Post;
        if Q.Transaction.Active then
        Q.Transaction.CommitRetaining;
      except
         if Q.Transaction.Active then
           Q.Transaction.RollbackRetaining;
      end;
    except
       MsgBoxError(Exception(ExceptObject).Message, 'Результат сессии');
    end;
  finally
    //if not f then
    //  frmSessionResult);
  end;
end;

procedure TDataModuleMain.CreateContactTypesPopup(Adata: TDataset);
var
  mi: TMenuItem;
begin
  with Adata do
  begin
   First;
   while not Eof do
   begin
     mi := TMenuItem.Create(mContactTypes);
     mi.Caption := FieldByName('NAME').AsString;
     mi.Tag     := FieldByName('ID').AsInteger;
     mi.OnClick := miContactTypesClick;
     mContactTypes.Items.Add(mi);
     Next;
   end;
  end;
end;

procedure TDataModuleMain.DataModuleDestroy(Sender: TObject);
begin
  Clients.Free;
end;

procedure TDataModuleMain.DBAfterDisconnect(Sender: TObject);
begin
  if DB.Tag = 0 then
  begin
    try
      DB.Open;
      MsgBoxInformation('Соединение с БД было восстановлено после несанкционированного отключения');
    Except
      MsgBoxError('Соединение с БД не было восстановлено после несанкционированного отключения!' + #13#10 +
        'Проверьте сетевое подключение');
    end;

  end;
end;

procedure TDataModuleMain.DsWorkerDataChange(Sender: TObject; Field: TField);
var
  ds: TDataset;
  f, i, o, fio, sfio: string;
begin
  if (Field <> nil) and
     ((Field.FieldName = 'W_FAMILY') or
      (Field.FieldName = 'W_NAME') or
      (Field.FieldName = 'W_OTCH')) then
  begin
    ds := Field.DataSet;
    f := ds.FieldByName('W_FAMILY').AsString;
    i := ds.FieldByName('W_NAME').AsString;
    o := ds.FieldByName('W_OTCH').AsString;
    fio := f; sfio := f;

    if (fio <> '') and (i <> '') then
    begin
      fio  := fio + ' ' + i;
      sfio := sfio + ' ' + LeftStr(i, 1) + '. ';
      if o <> '' then
      begin
        fio  := fio + ' ' + o;
        sfio := sfio + ' ' + LeftStr(o, 1) + '. ';
      end;
    end;

    if fio <> '' then
    begin
      ds.FieldByName('FULL_NAME').AsString  := fio;
      ds.FieldByName('SHORT_NAME').AsString := sfio;
    end;
  end
end;

function TDataModuleMain.GetClientInfoForCall(Aid: integer): TdxMemData;
var
  Q :TIBQuery;
begin
  try
    Q := CreateRWQuery;
    Q.SQL.Text := 'SELECT * FROM get_clientinfo_for_call('+ intToStr(AID) +')';
    Q.Open;

    Result := TdxMemData.Create(nil);
    Result.LoadFromDataSet(Q);

    if Q.Transaction.Active then
      Q.Transaction.Commit;
  finally
    Q.Transaction.Free;
    FreeAndNil(Q);
  end;
end;

function TDataModuleMain.GetCurrentUser(id: integer): CurrentUserRec;
var
  Q :TIBQuery;
begin
  try
    Q := CreateRWQuery;
    Q.SQL.Text := 'SELECT * FROM GET_USER_INFO('+ intToStr(ID) +')';
    Q.Open;

    Result.id            := Q.FieldByName('ID').AsInteger;
    Result.UserName      := Q.FieldByName('NAME').AsString;
    Result.UserType      := Q.FieldByName('USER_TYPE').AsInteger;
    Result.userTypeName  := Q.FieldByName('USERTYPENAME').AsString;
    Result.DebugMode     := true;
    Result.ATS_Phone_Num := Q.FieldByName('ATS_PHONE_NUM').AsString;

    if Q.Transaction.Active then
      Q.Transaction.Commit;
  finally
    Q.Transaction.Free;
    FreeAndNil(Q);
  end;
end;

function TDataModuleMain.GetDataset(AQuery: TIBQuery): TIBQuery;
begin
  result := AQuery;
  if not DB.Connected then
    DB.Open;

  if not AQuery.Active then
  try
    try
      Screen.Cursor := crSQLWait;
      AQuery.Open;
    finally
       Screen.Cursor := crDefault;
    end;
  except
    result := nil;
  end;
end;

function TDataModuleMain.GetPersonFullName(f, i, o: string): string;
begin
  Result := f;

  if (i <> '') then
  begin
    if Result <> '' then
      Result := Result + ' ';

    Result  := Result + i;

    if o <> '' then
    begin
      Result  := Result + ' ' + o;
    end;
  end;
end;

function TDataModuleMain.GetPersonShortName(f, i, o: string): string;
var
  fio: string;
begin
  fio := f; result := f;

  if (fio <> '') and (i <> '') then
  begin
    fio  := fio + ' ' + i;
    result := result + ' ' + LeftStr(i, 1) + '. ';
    if o <> '' then
    begin
      fio  := fio + ' ' + o;
      result := result + ' ' + LeftStr(o, 1) + '. ';
    end;
  end;
end;

function TDataModuleMain.isModifiedData(Ds: TIBQuery): Boolean;
begin
  if Ds.CachedUpdates then
    Result := Ds.UpdatesPending or ds.Modified
  else
    result := ds.Modified;
end;

function TDataModuleMain.isModifiedData(Ds: TDataset): Boolean;
begin
  if Ds is TIBQuery then
    Result := isModifiedData(TIBQuery(Ds))
  else
    Result := ds.Modified;
end;

function TDataModuleMain.isWorkerClient(AClient_id: integer; AWithRegion: boolean=true): boolean;
begin
   if Clients.Locate('id', AClient_id, []) then
   begin
     result := (Clients.FieldByName('worker_id').AsInteger =
                   DM.CurrentUserSets.ID);
     if Result and AWithRegion then
       Result := (DM.isWorkersRegion(Clients.FieldByName('region_id').AsInteger));
   end;
end;

function TDataModuleMain.isWorkersRegion(ARegion_Id: integer): Boolean;
begin
  Result := (WorkerRegions.RecordCount = 0 );
  if not Result then
    result := WorkerRegions.Locate('REGION_ID', ARegion_Id, []);
end;

procedure TDataModuleMain.MakeTopForm(Form: TForm);
begin
with Form do
  SetWindowPos(Handle,
    HWND_TOPMOST,
    Left,
    Top,
    Width,
    Height,
    SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

procedure TDataModuleMain.miContactTypesClick(Sender: TObject);
begin
  frmCallUnknown.ContactType := TComponent(Sender).Tag;
  frmCallUnknown.CloseEnable := True;
  frmCallUnknown.ModalResult := mrAll;
end;

procedure TDataModuleMain.UnMakeTopForm(Form: TForm);
begin

with Form do
  SetWindowPos(Handle,
    HWND_NOTOPMOST,
    Left,
    Top,
    Width,
    Height,
    SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);

end;

procedure TDataModuleMain.SetFilterNonDelete(ADataset: TDataset);
begin
  ADataset.Filtered := False;
  ADataset.OnFilterRecord := FilterNonDelete;
  ADataset.Filtered := true;
end;

procedure TDataModuleMain.FilterNonDelete(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := (DataSet.FieldByName('is_deleted').AsInteger = 0);
end;

function TDataModuleMain.OffFilter(ADataset: TDataset; AField: TField = nil): Variant;
var
  val: Variant;
begin
  if not ADataset.Filtered then
    exit;

  if AField = nil then
    AField := ADataset.FindField('id');
  if AField <> nil then
    val := AField.AsVariant;
  ADataset.Filtered := False;

  ADataset.Locate(AField.FieldName, val, []);

  Result := AField.AsVariant;

end;

function TDataModuleMain.SetReadedCall(id: integer): boolean;
var Q :TIBQuery;
begin
    try
      Q := CreateRWQuery;
      Q.SQL.Text := Format('Update CURRENT_CALLS set readed = 1 where id = %d', [Id]);
      try
        Q.ExecSQL;
        if Q.Transaction.InTransaction then
          Q.Transaction.Commit;
        Result := true;
      except
        Result := false;
      end;
    finally
      FreeAndNil(Q);
    end;
end;

function TDataModuleMain.getClientCallParams(TelNum: string): ClientCallParams;
var Q :TIBQuery;
begin
  Result.Setup;

  try
    Q := CreateRWQuery;
    Q.SQL.Text := 'SELECT * FROM FINDCLIENT_BYTEL('+ QuotedStr(TelNum) +')';
    Q.open;

    Result.TelNum := TelNum;
    if q.FieldByName('Client_ID').IsNull = false  then
    begin
       Result.Client_Type   := q.FieldByName('CLIENT_TYPE').AsString;
       Result.Client_id     := q.FieldByName('CLIENT_ID').Asinteger;
       Result.ClientName    := q.FieldByName('FULL_NAME').AsString;
       Result.Format_Id     := q.FieldByName('FORMAT_ID').Asinteger;
       Result.Status_Id     := q.FieldByName('STATUS_ID').Asinteger;
       Result.PERSON_ID     := q.FieldByName('PERSON_ID').Asinteger;
       Result.FORMA_ID      := q.FieldByName('FORMA_ID').Asinteger;
       Result.Author        := q.FieldByName('AUTHOR').AsString;
       Result.INN           := q.FieldByName('INN').AsString;
       //Result.clientContact := q.FieldByName('CONTACT_FIO').AsString;
       Result.ClientInfoParams.ClientInfo := q.FieldByName('CLIENTINFO').AsString;
       Result.ClientInfoParams.ClientComms := q.FieldByName('CLIENTCOMMS').AsString;
    end
    else
      result.Client_Type := '';

    if Q.Transaction.Active then
         Q.Transaction.Commit;
  finally
      Q.Transaction.Free;
      FreeAndNil(Q);
  end;

end;

function TDataModuleMain.ShowCall: Boolean;
begin
 if DM.Db.Connected = false then
    Exit;
  try
    FreeAndNil(frmSessionResult);
  finally
    frmSessionResult := nil;
  end;

  try
  try
    DM.incomeCalling  := True;
    frmIncomeCallRoot := TfrmIncomeCallRoot.Create(nil);

    frmIncomeCallRoot.ClientId := CallObj.CallInfo.ClientId;
    //frmIncomeCallRoot.ClientClose       := true;
    frmIncomeCallRoot.CloseOnCancelCall := true;
    frmIncomeCallRoot.ModalResult := mrNone;
    if CallObj.Active then
      frmIncomeCallRoot.ShowModal;
  except
    MsgBoxError(Exception(ExceptObject).Message, 'Непредвиденная ошибка');
  end;

  finally
    //CallObj.Active := False;
    try
      FreeAndNil(frmCallEvent);
      FreeAndNil(frmSessionResult);
      FreeAndNil(frmIncomeCallRoot);
      FreeAndNil(frmIncomeCall);
      FreeAndNil(frmIncomeCallUr);
      FreeAndNil(frmClientFiz);
      FreeAndNil(frmClientUr);
    finally
      CallObj.Ready := True;
    end;
  end;
end;


{ TClientExtUr }

function TClientExtUr.CF(AName: string): TField;
begin
  Result := fQuery.FindField(Aname);
end;

constructor TClientExtUr.Create;
begin
  inherited Create;
  fQuery := CreateRWQuery;
  fQuery.SQL.Text := 'select* from clients_ext_ur where  id = :id'

end;

destructor TClientExtUr.Destroy;
begin
  fQuery.Free;
end;

procedure TClientExtUr.SetId(AValue: integer);
begin
  if fID = AValue then
    exit;
  fID := AValue;
  fQuery.Close;
  fQuery.ParamByName('id').AsInteger := fId;
  fQuery.Open;
end;

{ TUserRights }

constructor TUserRights.Create(AUserId: Integer);
begin
  inherited Create;
  fUserId := 0;

  data := TIBQuery.Create(nil);
  TIBQuery(data).Database := DM.DB;
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

end.
