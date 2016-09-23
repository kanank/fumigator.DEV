unit formLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, RzButton, Vcl.StdCtrls,
  Vcl.Mask, RzEdit, dxGDIPlusClasses, Vcl.ExtCtrls, RzLabel, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    Edt1: TRzEdit;
    Label2: TLabel;
    Edt2: TRzEdit;
    btnOK: TRzButton;
    btnCancel: TRzButton;
    lblMess: TRzLabel;
    img1: TImage;
    Label3: TLabel;
    Shape1: TShape;
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    fShowNewVersion: Boolean;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses
  DM_Main,
  IBX.IBQuery, formLogo, frmMain, CommonFunc, CommonVars;

procedure TfrmLogin.btnOKClick(Sender: TObject);
var
  Q :TIBQuery;
  cancel: boolean;
begin
  cancel := false;

  try
    try
      Q := CreateRWQuery;
      Q.SQL.Text := 'SELECT * from login('
        + QuotedStr(Edt1.Text) + ', ' + QuotedStr(Edt2.Text) + ')';
      Q.Open;
    except
      lblMess.Caption := 'Ошибка запроса к БД';
      exit;
    end;
  finally
    if Assigned(Q) and Q.Active and (Q.RecordCount > 0)
       and not Q.Fields[0].isNull then
    begin
      DM.CurrentUserSets := DM.GetCurrentUser(Q.Fieldbyname('ID').asInteger);
      DM.CurrentUserSets.session_id := Q.Fieldbyname('SESSION_ID').asInteger;
    end
    else
    begin
      lblMess.Caption := 'Вход с указанными данными невозможен';
      cancel := true;;
    end;

    FreeAndNil(Q);
    //DM.UnMakeTopForm(self);
  end;

  if not cancel then
  begin
    self.ModalResult := mrOk;
    //Edt1.Text := '';
    Edt2.Text := '';
  end;
end;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  Shape1.Height := self.Height;
  Shape1.Width := self.Width;

  if not DM.DB.Connected then
  begin
    DM.BeforeLogin;
    //DM.MakeTopForm(self);
    self.FormStyle := fsNormal;
    BringWindowToTop(Self.Handle);
  end;

  if FindParam('NEWVERSION') and not fShowNewVersion then
  begin
    Application.MessageBox(PChar('Программа была обновлена до версии: ' +
      FileVersion(Application.ExeName)), 'Обновление', MB_ICONINFORMATION);
    fShowNewVersion := True;
  end;

  Edt1.Text := ReadLogin(ExtractFilePath(Application.ExeName) + CfgFileName);
  if Edt1.Text <> '' then
    Edt2.SetFocus;
end;


procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  fShowNewVersion := False;
end;

end.
