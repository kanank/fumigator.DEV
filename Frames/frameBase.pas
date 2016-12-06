unit frameBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  IBX.IBCustomDataSet, IBX.IBDatabase, IBX.IBQuery, IBX.IBUpdateSQL;

type
  TDbFrameBase = class(TFrame)
    Query_upd: TIBUpdateSQL;
    Query: TIBQuery;
    DS: TDataSource;
  private
    FParams: TStringList;
    FFieldId: string;
    FId: Integer;
    fTransaction: TIBTransaction;
    fNonValidateList: TStringList; // не нужно проверять при валидации
    function QuerySetParams: Boolean;
  protected
    fErr: string;
    fReadOnly: boolean;
    fAutoAppend: Boolean;
    procedure SetTransaction(AValue: TIBTransaction); virtual;
    procedure SetReadOnly(AValue: boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function OpenData(Aid: integer = 0): Boolean; virtual;
    function SaveData: Boolean;  virtual;
    function AddParam(Aname: string; Afield: TField): integer;
    procedure SetComponentProp(AComponent: TComponent; Aproperty: string; AValue: Variant);
    function ValidateData: boolean; virtual;
    function Cancel: boolean; //отмена изменений
    procedure SetNonValidate(Alist: string); //установка непроверяемых полей

    property NonValidateList: TStringList read fNonValidateList;
    property ReadOnly: boolean read fReadOnly write SetReadOnly;
    property QueryParams:TStringList read FParams write FParams;
    property FieldId: string read FFieldId write FFieldId;
    property Id: Integer read FId write FId;
    property Err: string read fErr;
    property Transaction: TIBTransaction read fTransaction write SetTransaction;
    property AllowAutoAppend: Boolean read fAutoAppend write fAutoAppend;
  end;

implementation

{$R *.dfm}
uses
  DM_Main, System.TypInfo, ClassFrmBase;

function TDbFrameBase.Cancel: boolean;
var
  i: integer;
begin
  Result := False;
  try
    if Assigned(DS.DataSet) then
    begin
      DS.DataSet.Cancel;
      TIBQuery(DS.DataSet).CancelUpdates;
    end;
    Result := True;
  except
    Result := False;
  end;

  if Result then

  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDbFrameBase then
    begin
      Result := TDbFrameBase(Components[i]).Cancel;
      if not Result then
        Break;
    end;
end;

constructor TDbFrameBase.Create(AOwner: TComponent);
begin
  inherited;
  FParams := TStringList.Create;
  fNonValidateList := TStringList.Create;

  FFieldId := 'ID';
  fAutoAppend := True;
end;

destructor TDbFrameBase.Destroy;
begin
  FParams.Free;
  fNonValidateList.Free;
  inherited;
end;

function TDbFrameBase.OpenData(Aid: integer): Boolean;
begin
  result:= False;
  Query.Close;
  try
    //Query.ParamByName('id').AsInteger := Aid;
    if Aid > 0 then
      Query.Params[0].AsInteger := Aid
    else
      QuerySetParams;
    Query.Open;
    if (Query.RecordCount = 0) and fAutoAppend then
      Query.Append;
    DS.DataSet := Query;
    Result := True;
    FId := Query.FieldByName(FieldId).AsInteger;
  except
    Result := false;
    fErr := 'OpenData error:'+ #13#10 + Exception(ExceptObject).Message;
  end;

end;

function TDbFrameBase.SaveData: Boolean;
begin
  Result := false;
  if Query.Modified then
    Query.Post;

  if not (Query.Modified or Query.UpdatesPending) then
  begin
    Result := True;
    Exit;
  end;

  try
    Query.ApplyUpdates;
    Id := Query.FieldByName(FieldId).AsInteger;
    Result := True;
  except
    Result := false;
    fErr := 'SaveData error:'+ #13#10 + Exception(ExceptObject).Message;
  end;
end;

procedure TDbFrameBase.SetComponentProp(AComponent: TComponent; Aproperty: string; AValue: Variant);
var
  pi: PPropInfo;
begin
  pi := GetPropInfo(AComponent, AProperty);
  if pi <> nil then
    SetVariantProp(AComponent, pi, AValue);
end;

procedure TDbFrameBase.SetNonValidate(Alist: string);
begin
  fNonValidateList.DelimitedText := Alist;
end;

procedure TDbFrameBase.SetReadOnly(AValue: boolean);
var
  i:integer;
begin
  for I := 0 to self.ComponentCount -  1 do
  begin
    SetComponentProp(self.Components[i], 'readonly', AValue);
    SetComponentProp(self.Components[i], 'enabled',  AValue)
  end;
end;

procedure TDbFrameBase.SetTransaction(AValue: TIBTransaction);
begin
  if fTransaction <> AValue then
  begin
    fTransaction := AValue;
    Query.Transaction := AValue;
  end
end;

function TDbFrameBase.ValidateData: boolean;
begin
  Result := TBaseForm.ValidateData(self.DS, self, fNonValidateList);
end;

function TDbFrameBase.AddParam(Aname: string; Afield: TField): integer;
begin
  Result := FParams.AddObject(Aname, AField);
end;

function TDbFrameBase.QuerySetParams: Boolean;
var
  i, ind: Integer;
  prm: TParam;
begin
  result := false;
  try
    for I := 0 to Query.ParamCount - 1 do
    begin
      prm := Query.Params[i];
      ind := FParams.IndexOf(prm.Name);
      prm.Clear;
      if ind > - 1 then
        prm.Value := TField(FParams.Objects[ind]).Value;
    end;
    Result := True;
  Except
    result := False;
  end;
end;
end.



