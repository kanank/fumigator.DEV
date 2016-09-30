unit commonSocketCmd;
//константы сокетных комманд
interface

const
  SCMD_NEEDUPDATE = 'needupdate';

  function GetSocketCmdSrv(ACommand: string): string;

implementation
uses
  System.Classes, System.SysUtils;

var
  SocketCmd: TStringList;

function GetSocketCmdSrv(ACommand: string): string;
var
  ind: Integer;
begin
  ind := SocketCmd.IndexOfName(ACommand);
  if ind > -1 then
    Result := '#' + ACommand + ':' + SocketCmd.ValueFromIndex[ind];
end;

initialization
  SocketCmd := TStringList.Create;
  SocketCmd.Add(SCMD_NEEDUPDATE + '=%s');

finalization
  FreeAndNil(SocketCmd);

end.
