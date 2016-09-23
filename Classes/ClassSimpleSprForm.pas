unit ClassSimpleSprForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxDBEdit, Vcl.StdCtrls, Data.DB, RzButton, Vcl.ExtCtrls, RzPanel,
  dxGDIPlusClasses,
  ClassProc;

type
  TfrmSimpleSpr = class(TSimpleForm)
    DS: TDataSource;
    Label19: TLabel;
    txtName: TcxDBTextEdit;
    btnCancel: TRzButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

end.
