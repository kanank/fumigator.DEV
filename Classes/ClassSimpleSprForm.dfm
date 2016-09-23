inherited frmSimpleSpr: TfrmSimpleSpr
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = ''
  ClientHeight = 191
  ClientWidth = 448
  Position = poOwnerFormCenter
  ExplicitWidth = 454
  ExplicitHeight = 219
  DesignSize = (
    448
    191)
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 290
    Top = 90
    Width = 158
    Height = 58
    Anchors = [akTop, akRight]
    ExplicitLeft = 290
    ExplicitTop = 90
    ExplicitWidth = 158
    ExplicitHeight = 58
  end
  object Label19: TLabel [1]
    Left = 5
    Top = 34
    Width = 73
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited RzPanel1: TRzPanel
    Top = 147
    Width = 448
    ExplicitTop = 147
    ExplicitWidth = 448
    DesignSize = (
      448
      44)
    inherited Image2: TImage
      Visible = False
    end
    inherited Exit_bnt: TRzButton
      Left = 66
      Top = 7
      ModalResult = 1
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ExplicitLeft = 66
      ExplicitTop = 7
    end
    object btnCancel: TRzButton
      Left = 263
      Top = 7
      Width = 124
      Height = 30
      ModalResult = 2
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
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
  object txtName: TcxDBTextEdit
    Left = 96
    Top = 26
    DataBinding.DataField = 'NAME'
    DataBinding.DataSource = DS
    TabOrder = 1
    Width = 344
  end
  object DS: TDataSource
    Left = 600
    Top = 40
  end
end
