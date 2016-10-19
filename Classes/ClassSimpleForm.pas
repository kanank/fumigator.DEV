unit ClassSimpleForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, RzButton, Vcl.ExtCtrls,
  RzPanel, dxGDIPlusClasses, CommonTypes;

type
  TSimpleForm = class(TBaseForm)
    RzPanel1: TRzPanel;
    Exit_bnt: TRzButton;
    Image2: TImage;
    btnTransferCall: TRzButton;
    procedure btnTransferCallClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure DoAcceptCall; override;
    procedure DoTransferCall; override;
    procedure ClickTransferCall; virtual;
  public

  end;


implementation

{$R *.dfm}

uses
  CommonVars;


{ TSimpleForm }

procedure TSimpleForm.btnTransferCallClick(Sender: TObject);
begin
  ClickTransferCall;
end;

procedure TSimpleForm.DoAcceptCall;
begin
  inherited;
  btnTransferCall.Enabled := True;
end;

procedure TSimpleForm.DoTransferCall;
begin
  fTransfered := True;
  Self.ModalResult := mrCancel;
end;

procedure TSimpleForm.ClickTransferCall;
begin
  CallObj.TransferCall;
end;

end.
