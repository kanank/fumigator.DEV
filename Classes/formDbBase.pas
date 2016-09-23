unit formDbBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, dxGDIPlusClasses,
  Vcl.ExtCtrls, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TfrmDbBaseForm = class(TBaseForm)
    _Query: TIBQuery;
    _DS: TDataSource;
  protected
    function ReadSql: string; virtual;
    procedure SetSql(AValue: string); virtual;
  public
    property Sql: string read ReadSql write SetSql;
  end;

var
  frmDbBaseForm: TfrmDbBaseForm;

implementation

{$R *.dfm}

{ TfrmDbBaseForm }

function TfrmDbBaseForm.ReadSql: string;
begin
  Result := _Query.SQL.Text;
end;

procedure TfrmDbBaseForm.SetSql(AValue: string);
begin
  _Query.SQL.Text := AValue;
end;

end.
