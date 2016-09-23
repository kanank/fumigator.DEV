inherited frmCallPause: TfrmCallPause
  BorderIcons = [biSystemMenu]
  Caption = #1047#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1090#1100' '#1087#1077#1088#1077#1088#1099#1074
  ClientHeight = 112
  ClientWidth = 423
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitWidth = 439
  ExplicitHeight = 150
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 238
    Top = -246
    Visible = False
  end
  object Label11: TLabel [1]
    Left = 43
    Top = 24
    Width = 6
    Height = 16
    Caption = #1089
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label1: TLabel [2]
    Left = 210
    Top = 24
    Width = 14
    Height = 16
    Caption = #1087#1086
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  inherited RzPanel1: TRzPanel
    Top = 68
    Width = 423
    BorderOuter = fsFlat
    inherited Image2: TImage
      Left = -212
    end
    inherited Exit_bnt: TRzButton
      Left = 274
      Width = 101
      Caption = #1054#1090#1084#1077#1085#1072
      ExplicitLeft = 274
      ExplicitWidth = 101
    end
    object RzButton1: TRzButton
      Left = 43
      Top = 9
      Width = 164
      Height = 29
      ModalResult = 1
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1090#1100' '#1087#1077#1088#1077#1088#1099#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2960640
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 1
      ThemeAware = False
    end
  end
  object edtTime1: TcxTimeEdit
    Left = 59
    Top = 21
    EditValue = 0
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    Width = 130
  end
  object edtTime2: TcxTimeEdit
    Left = 245
    Top = 21
    EditValue = 0d
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 2
    Width = 130
  end
end
