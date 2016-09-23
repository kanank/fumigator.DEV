unit formClientsForCall;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSprForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzButton, Vcl.ExtCtrls, RzPanel, dxGDIPlusClasses,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL, cxDBLookupComboBox,
  Vcl.StdCtrls, RzLabel;

type
  TfrmClientsForCall = class(TSprForm)
    QWorkerShedule: TIBQuery;
    QWorkerShedule_upd: TIBUpdateSQL;
    GridViewColumn1: TcxGridDBColumn;
    DS: TDataSource;
    GridViewColumn2: TcxGridDBColumn;
    GridViewColumn3: TcxGridDBColumn;
    GridViewColumn4: TcxGridDBColumn;
    GridViewColumn5: TcxGridDBColumn;
    GridViewColumn6: TcxGridDBColumn;
    GridViewColumn7: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    TimerPause: TTimer;
    pnlPause: TRzPanel;
    lblPause: TRzLabel;
    procedure Add_btnClick(Sender: TObject);
    procedure Edit_btnClick(Sender: TObject);
    procedure TimerPauseTimer(Sender: TObject);

  private
    fTimeStart: TDateTime;
    fTimeEnd: TDateTime;
    fDlitel: TDateTime;
    fSessionCount: Integer;
    fGoodSessionCount: Integer;

    fPauseTime1: TTime;
    fPauseTime2: TTime;
    fInPause: Boolean;
    procedure SetPause(AValue: Boolean);
  public
    property InPause: Boolean read fInPause write SetPause;
  end;

var
  frmClientsForCall: TfrmClientsForCall;

implementation

{$R *.dfm}
uses
  DM_Main, formEndCalling, formCallPause, System.DateUtils;

procedure TfrmClientsForCall.Add_btnClick(Sender: TObject);
begin
  fTimeStart := Now();
  fSessionCount     := 0;
  fGoodSessionCount := 0;
  Add_btn.Enabled := False;

  try
  while not QWorkerShedule.Eof do
  begin
    while inPause do
      Sleep(2000);

    Inc(fSessionCount);
    if DM.CallingWithResult(DM.CurrentUserSets.ATS_Phone_Num,
               QWorkerShedule.FieldByName('phone').AsString,
               QWorkerShedule.FieldByName('client_id').AsInteger) = 'ANSWER' then
      Inc(fGoodSessionCount);

    QWorkerShedule.Next;
  end;
  fTimeEnd := Now;

  frmEndCalling := TfrmEndCalling.Create(self);
  try
    frmEndCalling.edtTimeStart.Date        := fTimeStart;
    frmEndCalling.edtTimeEnd.Date          := fTimeEnd;
    frmEndCalling.edtDlitelnost.Date       := fTimeEnd - fTimeStart;
    frmEndCalling.edtSessionCount.Text     := IntToStr(fSessionCount);
    frmEndCalling.edtGoodSessionCount.Text := IntToStr(fGoodSessionCount);
    frmEndCalling.ShowModal;
  finally
    FreeAndNil(frmEndCalling);
  end;

  finally
    Add_btn.Enabled := True;
  end;
end;

procedure TfrmClientsForCall.Edit_btnClick(Sender: TObject);
begin
  frmCallPause := TfrmCallPause.Create(nil);

  try
    if frmCallPause.ShowModal = mrCancel then
      Exit;

    fPauseTime1 := frmCallPause.edtTime1.Time;
    fPauseTime2 := frmCallPause.edtTime2.Time;
    TimerPause.Interval := 1000;
    TimerPause.Enabled := True;
  finally
    FreeAndNil(frmCallPause);
  end;

end;

procedure TfrmClientsForCall.SetPause(AValue: Boolean);
begin
  if AValue <> fInPause then
  begin
    fInPause := AValue;
  end;
end;

procedure TfrmClientsForCall.TimerPauseTimer(Sender: TObject);
begin
  if not fInPause then
  begin
    if Time >= fPauseTime1 then
    begin
      InPause := True;
      pnlPause.Visible := True;
      Self.Enabled := False;
      TimerPause.Interval := MilliSecondsBetween(Time, fPauseTime2);
      lblPause.Caption := 'Перерыв до ' + TimeToStr(fPauseTime2);
      lblPause.Blinking := True;
    end;
  end
  else
  begin
    TimerPause.Enabled := False;
    InPause := false;
    pnlPause.Visible := false;
    Self.Enabled := True;
    lblPause.Blinking := false;
  end;


end;

end.
