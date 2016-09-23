unit ClassSimpleSprTypeForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleSprForm, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  RzButton, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Data.DB, cxTextEdit, cxDBEdit, Vcl.ExtCtrls, RzPanel,
  Vcl.StdCtrls, dxGDIPlusClasses, ClassProc;

type
  TfrmSimpleSprType = class(TfrmSimpleSpr)
    DsLookup: TDataSource;
    Label1: TLabel;
    cmbLookup: TcxDBLookupComboBox;
    btnAdd: TRzBitBtn;
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation
uses
  IBX.IBQuery;

{$R *.dfm}

procedure TfrmSimpleSprType.btnAddClick(Sender: TObject);
var
  frm: TfrmSimpleSpr;
  sErr: string;
begin
  frm := nil;
  frm := TfrmSimpleSpr.Create(self);
  try
    frm.DS := Self.DsLookup;
    DsLookup.DataSet.Append;
    try
      frm.ShowModal;
      if frm.ModalResult = mrOk then
        if not ApplyUpdate(TIBQuery(Self.DsLookup.DataSet), sErr) then
        begin
          sErr := 'Ошибка сохранения:' + #13#10 + sErr;
          Application.MessageBox(PWideChar(sErr), 'Ошибка', MB_ICONERROR + MB_OK);
          Exit;
        end;

    except

    end;
  finally
    FreeAndNil(frm);
  end;
end;

end.
