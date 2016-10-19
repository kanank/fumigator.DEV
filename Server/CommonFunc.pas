unit CommonFunc;

interface

uses
   Windows, DB;

function FileVersion ( fName : string ) : string;
procedure DecodeVersion(const AVersion: string; var Major, Minor, Release, Build: integer);
function UrlEncode(Str: Ansistring): Ansistring;
function UrlDecode(Str: Ansistring): Ansistring;
function LockMutex(AHandle: THandle; ATimeout: integer): Boolean;
function UnlockMutex(AHandle: THandle): boolean;
function GetFileSize(FileName: String): Integer;
function CopyRecord(ASource, ADest: TDataset): boolean;
function FindFieldVisible(ADataset: TDataSet; AFieldName: string): TField;

implementation
uses
  System.SysUtils, System.Classes, Vcl.Controls;

function  FileVersion ( fName : string ) : string;
    const
        Prefix = '\StringFileInfo\040904E4\';
    var
        FData              : Pointer;
        FSize              : LongInt;
        FIHandle           : Cardinal;
        FFileName          : string;
        FFileVersion       : string;

    function GetVerValue(Value: string):string;
    var
      ItemName: string;
      Len   : Cardinal;
      vVers : Pointer;
    begin
      ItemName := Prefix + Value;
      Result := '';

      if VerQueryValue(FData, PChar(ItemName), vVers, Len) then
         if Len > 0 then begin
            if Len > 255 then
               Len := 255;
            Result := Copy(PChar(vVers), 1 , Len);
         end;{if}
    end;{func}

    function GetFileVersion: string;
    begin
      if FSize > 0 then begin
         GetMem(FData, FSize);
         try
           if GetFileVersionInfo(PChar(FFileName), FIHandle, FSize, FData) then begin
             FFileVersion:= GetVerValue('FileVersion');
           end;{if}
         finally
           FreeMem(FData, FSize);
         end;{try}
      end;{if}
      Result := FFileVersion;
    end;{func}

begin
    Result := '';
    if FileExists( fName ) then begin
       FFileName := fName;
       FSize := GetFileVersionInfoSize(PChar(FFileName), FIHandle);
       Result := GetFileVersion;
    end;
end; { function }



function UrlEncode(Str: ansistring): ansistring;

  function CharToHex(Ch: ansiChar): Integer;
  asm
    and eax, 0FFh
    mov ah, al
    shr al, 4
    and ah, 00fh
    cmp al, 00ah
    jl @@10
    sub al, 00ah
    add al, 041h
    jmp @@20
@@10:
    add al, 030h
@@20:
    cmp ah, 00ah
    jl @@30
    sub ah, 00ah
    add ah, 041h
    jmp @@40
@@30:
    add ah, 030h
@@40:
    shl eax, 8
    mov al, '%'
  end;

var
  i, Len: Integer;
  Ch: ansiChar;
  N: Integer;
  P: PansiChar;
begin
  Result := str;
  Exit;

  Len := Length(Str);
  P := PansiChar(@N);
  for i := 1 to Len do
  begin
    Ch := Str[i];
    if Ch in ['0'..'9', 'A'..'Z', 'a'..'z', '_'] then
      Result := Result + Ch
    else
    begin
      if Ch = ' ' then
        Result := Result + '+'
      else
      begin
        N := CharToHex(Ch);
        Result := Result + P;
      end;
    end;
  end;
end;

 function UrlDecode(Str: Ansistring): Ansistring;

  function HexToChar(W: word): AnsiChar;
  asm
   cmp ah, 030h
   jl @@error
   cmp ah, 039h
   jg @@10
   sub ah, 30h
   jmp @@30
@@10:
   cmp ah, 041h
   jl @@error
   cmp ah, 046h
   jg @@20
   sub ah, 041h
   add ah, 00Ah
   jmp @@30
@@20:
   cmp ah, 061h
   jl @@error
   cmp al, 066h
   jg @@error
   sub ah, 061h
   add ah, 00Ah
@@30:
   cmp al, 030h
   jl @@error
   cmp al, 039h
   jg @@40
   sub al, 030h
   jmp @@60
@@40:
   cmp al, 041h
   jl @@error
   cmp al, 046h
   jg @@50
   sub al, 041h
   add al, 00Ah
   jmp @@60
@@50:
   cmp al, 061h
   jl @@error
   cmp al, 066h
   jg @@error
   sub al, 061h
   add al, 00Ah
@@60:
   shl al, 4
   or al, ah
   ret
@@error:
   xor al, al
  end;

  function GetCh(P: PAnsiChar; var Ch: AnsiChar): AnsiChar;
  begin
    Ch := P^;
    Result := Ch;
  end;

var
  P: PAnsiChar;
  Ch: AnsiChar;
begin
  Result := str;
  Exit;


  P := @Str[1];
  while GetCh(P, Ch) <> #0 do
  begin
    case Ch of
      '+': Result := Result + ' ';
      '%':
        begin
          Inc(P);
          Result := Result + HexToChar(PWord(P)^);
          Inc(P);
        end;
    else
      Result := Result + Ch;
    end;
    Inc(P);
  end;
end;

function LockMutex(AHandle: THandle; ATimeout: integer): Boolean;
var
  res: Cardinal;
begin
  Result := False;
  try
    res := WaitForSingleObject(AHandle, ATimeout);
    Result := res = WAIT_OBJECT_0;
  except
    Result := False;
  end;

end;

function UnlockMutex(AHandle: THandle): boolean;
begin
  try
    Result := ReleaseMutex(AHandle);
  except
    result := False;
  end;
end;

function GetFileSize(FileName: String): Integer;
var
  FS: TFileStream;
begin
  try
    FS := TFileStream.Create(Filename, fmOpenRead);
  except
    Result := -1;
  end;
  if Result <> -1 then Result := FS.Size;
  FS.Free;
end;

procedure DecodeVersion(const AVersion: string; var Major, Minor, Release, Build: integer);
var
  list: TStringList;
begin
  Major := 0; Minor := 0; Release := 0; Build := 0;
  list := TStringList.Create;
  list.Delimiter := '.';
  list.DelimitedText := AVersion;

  try
    Major   := StrToInt(list[0]);
    Minor   := StrToInt(list[1]);
    Release := StrToInt(list[2]);
    Build   := StrToInt(list[3]);
  finally

  end;
end;

function CopyRecord(ASource, ADest: TDataset): boolean;
var
 i: Integer;
 fld: TField;
begin
  if not (ADest.State in [dsEdit, dsInsert]) then
    ADest.Edit;
  try
  try
    for i := 0 to ASource.FieldCount - 1 do
    begin
      //ADest.FieldByName(ASource.Fields[i].FieldName).Value :=
      fld := FindFieldVisible(ADest, ASource.Fields[i].FieldName);
      if fld <> nil then
        fld.Value := ASource.Fields[i].Value;
    end;
  except
    raise Exception.Create('Ошибка копирования записи');
  end;
  finally
    if ADest.State in [dsEdit, dsInsert] then
      ADest.Post;
  end;
  
end;

function FindFieldVisible(ADataset: TDataSet; AFieldName: string): TField;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to ADataset.FieldCount - 1 do
  begin
    if (LowerCase(ADataset.Fields[i].FieldName) = LowerCase(AFieldName)) and
        (ADataset.Fields[i].Visible) then
    begin
      Result := ADataset.Fields[i];
      Break;
    end
    else
      Continue;
  end;
    
end;

end.
