inherited frmEndCalling: TfrmEndCalling
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1087#1072#1089#1080#1073#1086'!'
  ClientHeight = 114
  ClientWidth = 556
  Position = poOwnerFormCenter
  ExplicitWidth = 562
  ExplicitHeight = 142
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 513
    Top = -70
    Width = 201
    Height = 70
    Visible = False
    ExplicitLeft = 512
    ExplicitTop = -61
    ExplicitWidth = 201
    ExplicitHeight = 70
  end
  object RzLabel1: TRzLabel
    Left = 176
    Top = 8
    Width = 160
    Height = 19
    Caption = #1057#1087#1072#1089#1080#1073#1086' '#1079#1072' '#1088#1072#1073#1086#1090#1091'!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 8
    Top = 41
    Width = 78
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1086' '#1088#1072#1073#1086#1090#1099
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label1: TLabel
    Left = 103
    Top = 41
    Width = 72
    Height = 13
    Caption = #1050#1086#1085#1077#1094' '#1088#1072#1073#1086#1090#1099
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 194
    Top = 41
    Width = 73
    Height = 13
    Caption = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 398
    Top = 41
    Width = 150
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1091#1089#1087#1077#1096#1085#1099#1093' '#1089#1077#1089#1089#1080#1081
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 285
    Top = 41
    Width = 96
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1077#1089#1089#1080#1081
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Cancel_btn: TRzButton
    Left = 424
    Top = 83
    Width = 124
    Height = 29
    ModalResult = 1
    Anchors = [akTop, akRight]
    Caption = #1047#1072#1082#1086#1085#1095#1080#1090#1100' '#1088#1072#1073#1086#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 2960640
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 0
    ThemeAware = False
  end
  object edtTimeStart: TcxDateEdit
    Left = 8
    Top = 56
    Enabled = False
    Properties.DisplayFormat = 'hh:nn:ss'
    StyleDisabled.BorderColor = clBtnText
    StyleDisabled.Color = clWindow
    StyleDisabled.TextColor = clBtnText
    TabOrder = 1
    Width = 78
  end
  object edtTimeEnd: TcxDateEdit
    Left = 103
    Top = 56
    Enabled = False
    Properties.DisplayFormat = 'hh:nn:ss'
    StyleDisabled.BorderColor = clInfoText
    StyleDisabled.Color = clWindow
    StyleDisabled.TextColor = clInfoText
    TabOrder = 2
    Width = 72
  end
  object edtDlitelnost: TcxDateEdit
    Left = 194
    Top = 56
    Enabled = False
    Properties.DisplayFormat = 'hh:nn:ss'
    StyleDisabled.BorderColor = clInfoText
    StyleDisabled.Color = clWindow
    StyleDisabled.TextColor = clInfoText
    TabOrder = 3
    Width = 73
  end
  object edtSessionCount: TcxTextEdit
    Left = 285
    Top = 56
    Enabled = False
    StyleDisabled.BorderColor = clInfoText
    StyleDisabled.Color = clWindow
    StyleDisabled.TextColor = clInfoText
    TabOrder = 4
    Width = 96
  end
  object edtGoodSessionCount: TcxTextEdit
    Left = 398
    Top = 56
    Enabled = False
    StyleDisabled.BorderColor = clInfoText
    StyleDisabled.Color = clWindow
    StyleDisabled.TextColor = clInfoText
    TabOrder = 5
    Width = 150
  end
end
