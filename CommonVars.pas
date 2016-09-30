unit CommonVars;

interface
uses
  CommonTypes;

const
  FormAlphaBlend :byte = 100;

var
  CfgFileName :string ='Fumigator.cfg';
  MsgTitle: string = 'Фумигатор';
  TempFolder :string = 'Temp';
  PrintTempsFolder :string = 'Шаблоны';

  InitBirthYear: integer = 30;

  ServerHost: string  = '81.177.48.139'; //'localhost';  // 'localhost';  //''81.177.48.139'; //;
  ServerPort: integer = 1026;
  ServerHttpPort: integer = 45456;

  CallObj:  TCallProto;
  CallInfo: TCallInfo;

 function  MsgBox(AMsg, ATitle: string; AType: integer): integer;
 procedure MsgBoxError(AMsg: string; ATitle: string = '');
 procedure MsgBoxWarning(AMsg: string; ATitle: string = '');
 procedure MsgBoxInformation(AMsg: string; ATitle: string = '');
 function  MsgBoxQuestion(AMsg: string; ATitle: string = ''): integer;

implementation

uses
   Winapi.Windows;

function MsgBox(AMsg, ATitle: string; AType: integer): integer;
begin
  if ATitle = '' then
    ATitle := MsgTitle;
  Result :=
    MessageBox(0, PChar(AMsg), PChar(ATitle), AType + MB_TOPMOST);
end;

procedure MsgBoxError(AMsg: string; ATitle: string = '');
begin
  MsgBox(AMsg, ATitle, MB_ICONERROR);
end;

procedure MsgBoxWarning(AMsg: string; ATitle: string = '');
begin
  MsgBox(AMsg, ATitle, MB_ICONWARNING);
end;

function  MsgBoxQuestion(AMsg: string; ATitle: string = ''): integer;
begin
  Result := MsgBox(AMsg, ATitle, MB_ICONQUESTION + MB_YESNO);
end;

procedure MsgBoxInformation(AMsg: string; ATitle: string = '');
begin
  MsgBox(AMsg, ATitle, MB_ICONINFORMATION);
end;

end.
