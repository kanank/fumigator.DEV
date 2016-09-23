unit formEndCalling;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  RzButton, Vcl.StdCtrls, RzLabel, dxGDIPlusClasses, Vcl.ExtCtrls;

type
  TfrmEndCalling = class(TBaseForm)
    RzLabel1: TRzLabel;
    Cancel_btn: TRzButton;
    Label11: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtTimeStart: TcxDateEdit;
    edtTimeEnd: TcxDateEdit;
    edtDlitelnost: TcxDateEdit;
    edtSessionCount: TcxTextEdit;
    edtGoodSessionCount: TcxTextEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEndCalling: TfrmEndCalling;

implementation

{$R *.dfm}

end.
