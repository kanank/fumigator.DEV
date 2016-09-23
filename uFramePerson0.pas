unit uFramePerson0;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, cxTextEdit, Vcl.StdCtrls, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL;

type
  TFramePerson0 = class(TFrame)
    Label11: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    edtSurName: TcxDBTextEdit;
    edtName: TcxDBTextEdit;
    edtFamily: TcxDBTextEdit;
    Label8: TLabel;
    cmbDateBirth: TcxDBDateEdit;
    cmbSex: TcxDBComboBox;
    Label1: TLabel;
    Label2: TLabel;
    edtCitizen: TcxDBTextEdit;
    DS: TDataSource;
    Query: TIBQuery;
    Query_upd: TIBUpdateSQL;
  private
    FId: Integer;
  public
    Err: string;
    function OpenData(Aid: integer = 0): Boolean;
    function SaveData: Boolean;
    property Id: Integer read FId write FId;
  end;

implementation

{$R *.dfm}

uses
  DM_Main;

{ TFramePerson }

function TFramePerson0.OpenData(Aid: integer): Boolean;
begin
  result:= False;
  Query.Close;
  try
    Query.ParamByName('id').AsInteger := Aid;
    Query.Open;
    Result := True;
    FId := Aid;
  except
    Result := false;
  end;

end;

function TFramePerson0.SaveData: Boolean;
begin
  Result := false;
  if not (Query.Modified or Query.UpdatesPending) then
  begin
    Result := True;
    Exit;
  end;

  try
    Query.ApplyUpdates;
    Id := Query.FieldByName('id').AsInteger;
    Result := True;
  except

  end;

end;

end.
