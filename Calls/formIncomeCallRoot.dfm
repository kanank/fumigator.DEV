inherited frmIncomeCallRoot: TfrmIncomeCallRoot
  BorderIcons = []
  BorderStyle = bsNone
  Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1079#1074#1086#1085#1086#1082
  ClientHeight = 181
  ClientWidth = 382
  TransparentColor = True
  TransparentColorValue = clBtnFace
  WindowState = wsMinimized
  OnShow = FormShow
  ExplicitWidth = 382
  ExplicitHeight = 181
  PixelsPerInch = 96
  TextHeight = 18
  inherited img1: TImage
    Left = 33
    Top = 177
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Visible = False
    ExplicitLeft = 33
    ExplicitTop = 177
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer1Timer
    Left = 120
    Top = 24
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer2Timer
    Left = 168
    Top = 24
  end
  object CheckTimer: TTimer
    Enabled = False
    OnTimer = CheckTimerTimer
    Left = 224
    Top = 24
  end
end
