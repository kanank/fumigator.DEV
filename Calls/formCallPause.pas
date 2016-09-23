unit formCallPause;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxTimeEdit, Vcl.StdCtrls, RzButton, Vcl.ExtCtrls,
  RzPanel, dxGDIPlusClasses;

type
  TfrmCallPause = class(TSimpleForm)
    Label11: TLabel;
    Label1: TLabel;
    edtTime1: TcxTimeEdit;
    edtTime2: TcxTimeEdit;
    RzButton1: TRzButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCallPause: TfrmCallPause;

implementation

{$R *.dfm}
uses
  System.DateUtils;

procedure TfrmCallPause.FormCreate(Sender: TObject);
begin
  edtTime1.Time := Now();
  edtTime2.Time := IncMinute(edtTime1.Time, 30);
end;

end.
