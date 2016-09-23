unit MappedFunc;

interface
uses
  classes, windows, sysutils, forms,
  CommonFunc;

function CheckStartRepeat(key:string):boolean;
function ReadMappedFile(var L:TStringList):integer;
function WriteToMapped(key, val:string):boolean;
function DelFromMapped(key:string):integer;
function GetAntiRepeatName:string;

const
  CheckAppName = 'fumigator';

  var
  hFile: THandle; // хендл memory-mapped файла
  pFileContent: pointer; // указатель на отображение memory-mapped файла в памяти
  hMutex: THandle;
  ArName: string; //имя для поиска повтороного запуска

implementation
function ReadMappedFile(var L:TStringList):integer;
var
  s:string;
begin
 try
  if L=nil then L:=TStringList.Create
  else L.Clear;

  Result:=0;
  while 1=1 do
  begin
   s:= string(pchar(pFileContent)+Result);
   Result:=Result+Length(s)+1;
   If Length(s)=0 then break;
   L.Add(s);
  end;

 except
   Raise ExceptObject;
 end;
end;


function CheckStartRepeat(key:string):boolean;
var
  isDump:boolean;
  GL: Cardinal;
  i:integer;
  ML:TStringList;
begin
 try
  Result:=false;
 isDump:=false;
  ML:=TStringList.Create;

  hFile:= CreateFileMapping(INVALID_HANDLE_VALUE, nil,
          PAGE_READWRITE, 0, 1024, CheckAppName);
  GL := GetLastError;
  // memory-mapped файл открыт?
  if(hFile=0) then
  begin
    // нет, открыть memory-mapped файл не удалось
    Raise Exception.Create('Error! MapViewOfFile returns nil.');
    exit;
  end;
  if GL=ERROR_ALREADY_EXISTS then isDump := True;

  // отобразим memory-mapped файл с полным доступом
  pFileContent:= MapViewOfFile(hFile,FILE_MAP_ALL_ACCESS, 0, 0, 0);

  // memory-mapped файл отображен?
  if pFileContent=nil then
  begin
    // нет, открыть memory-mapped файл не удалось
    Raise Exception.Create('Error! MapViewOfFile returns nil.');
    // закрываем хендл memory-mapped файла и выходим
    CloseHandle(hFile);
    exit;
  end;

  if not isDump then //если файла не было, пишем строку
  begin
    Result:=false; //надо записать строку в файл
    {s:='docexch_tunes='+IntToStr(handle);
    CopyMemory(pFileContent, pchar(s), length(s));
    i:=Length(s)+1;
    s:='docexch_tunes1='+IntToStr(handle);
    CopyMemory(pchar(pFileContent)+i, pchar(s), length(s));}
  end
  else //иначе читаем
  begin
    ReadMappedFile(ML);
    {i:=0;
    while 1=1 do
    begin
     s:= string(pchar(pFileContent)+i);
     i:=i+Length(s)+1;
     If Length(s)=0 then break;
     ML.Add(s);
    end;}
  end;

  if ML.IndexOfName(key)>-1 then
  begin
    //MessageBox(Application.handle, pchar('программа уже запущена!'),pchar('Внимание'),MB_OK);
    //SendMessage(StrToInt(ML.Values['docexch_tunes']),WM_SHOWWINDOW,1,sw_ParentOpening);
    i:=StrToInt(ML.Values[key]);

    //BringWindowToTop(i);
    if IsWindow(i) then //если окно существует
    begin
      ShowWindow(i,SW_SHOW);
      SetForegroundWindow(i);
      Result:=true;
    end
    else
    begin
      DelFromMapped(key);
      Result:=false;
    end;
    //Application.Terminate;
  end;

 finally
  FreeAndNil(ML);
 end;
end;


function WriteToMapped(key, val:string):boolean;
var
  SL:TStringList;
  i, len:integer;
  s:string;
  p: pAnsiChar;
begin
 try
  SL := nil;
  Result := false;
  ReadMappedFile(SL);
  i := SL.IndexOfName(key);
  if i = -1 then
  begin
    len := 0;
    i := Sl.Count - 1;
    while i > -1 do
    begin
      len := len + Length(SL[i]) + 1;
      Dec(i)
    end;
    s := key + '=' + val;
    //CopyMemory(pFileContent, p, Length(s));
    StrPCopy(pFileContent, s);
  end;
  Result := true;
 finally
   FreeAndNil(SL);
 end;
end;


function DelFromMapped(key:string):integer;
var
  SL:TStringList;
  i, len:integer;
  //s:string;
begin
 try
  LockMutex(hMutex, 1000);
  SL:=nil;
  Result:=0;

  ReadMappedFile(SL);
  i:=SL.IndexOfName(key);
  if i>-1 then
  begin
    len:=Length(SL.Text);
    FillMemory(pFileContent,len,0);
    Sl.Delete(i);
    for i:=0 to SL.Count-1 do
      WriteToMapped(SL.Names[i],SL.Values[SL.Names[i]]);
    Result:=SL.Count;
  end;
  Result:=SL.Count;
 finally
   UnLockMutex(hMutex);
   FreeAndNil(SL);
 end;

end;


function GetAntiRepeatName:string;
//var
//  Ini: TIniFile;
begin
 Result := CheckAppName;
 Exit;

 (*try
  try
    Ini:= TIniFile.Create(ChangeFileExt(Paramstr(0),'.ini'));
    Result:=Ini.ReadString('general', 'NameAntiRepeat', 'docexchm_bde');
  except
    Result:='docexchm_bde';
  end;
 finally
   FreeAndNil(Ini);
 end;*)
end;

initialization
  hMutex := CreateMutex(nil, True,
    Pchar(ExtractFileName((Application.ExeName))));

finalization
  CloseHandle(hMutex);
  UnmapViewOfFile(pFileContent);
  CloseHandle(hFile);

end.
