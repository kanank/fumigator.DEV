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
  private
    { Private declarations }
  public

  end;


implementation

{$R *.dfm}

{ TSimpleForm }


end.
