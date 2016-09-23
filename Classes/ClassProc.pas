unit ClassProc;


interface

uses
  System.SysUtils, IBX.IBQuery;

  function ApplyUpdate(Data: TIBQuery; var err: string): boolean;

implementation

function ApplyUpdate(Data: TIBQuery; var err: string): boolean;
begin
  Result := False;
  try
    if not Data.UpdatesPending then
    begin
      Result := True;
      Exit;
    end;

    data.Post;
    data.ApplyUpdates;
    if data.Transaction.InTransaction then
      data.Transaction.CommitRetaining;
    Result := True;
  except
    Result := False;
    err := Exception(ExceptObject).Message;
  end;
end;

end.
