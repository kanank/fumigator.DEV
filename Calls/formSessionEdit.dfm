inherited frmSessionEdit: TfrmSessionEdit
  Width = 1043
  Height = 639
  VertScrollBar.ButtonSize = 10
  VertScrollBar.Size = 100
  AutoScroll = True
  Caption = #1057#1077#1089#1089#1080#1103' ['#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077']'
  Position = poDesktopCenter
  OnShow = FormShow
  ExplicitLeft = -326
  ExplicitTop = -11
  ExplicitWidth = 1043
  ExplicitHeight = 639
  PixelsPerInch = 96
  TextHeight = 18
  inherited img1: TImage
    Left = 1090
    Top = 336
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitLeft = 893
    ExplicitTop = 336
  end
  inherited RzPanel1: TRzPanel
    Top = 550
    Width = 1027
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitTop = 550
    ExplicitWidth = 1027
    inherited Image2: TImage
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      ExplicitLeft = 6
      ExplicitTop = 8
    end
    inherited Exit_bnt: TRzButton
      Left = 1161
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      ExplicitLeft = 1161
    end
    object RzButton1: TRzButton
      Left = 846
      Top = 5
      Width = 172
      Height = 41
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akTop, akRight]
      Caption = #1054#1050
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2960640
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 1
      ThemeAware = False
      OnClick = RzButton1Click
    end
    object btnClientEdit: TRzButton
      Left = 438
      Top = 5
      Width = 189
      Height = 41
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akTop, akRight]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091' '#1082#1083#1080#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2960640
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 2
      ThemeAware = False
      OnClick = btnClientEditClick
    end
  end
  object pnlResult: TRzPanel
    Left = 0
    Top = 0
    Width = 1027
    Height = 226
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    BorderOuter = fsFlat
    BorderSides = [sdBottom]
    TabOrder = 1
  end
  object pnlCalls: TRzPanel
    Left = 0
    Top = 300
    Width = 1027
    Height = 250
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    inline frameClientCalls: TframeClientCalls
      Left = -3
      Top = 0
      Width = 1059
      Height = 263
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = -3
      ExplicitWidth = 1059
      ExplicitHeight = 263
      inherited grpPhone: TRzGroupBox
        Width = 1058
        Height = 256
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitWidth = 1058
        ExplicitHeight = 256
        inherited RzPanel2: TRzPanel
          Left = 1015
          Width = 42
          Height = 236
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitLeft = 1015
          ExplicitWidth = 42
          ExplicitHeight = 236
          inherited btnAdd: TRzBitBtn
            Left = 3
            Top = 91
            Width = 39
            Height = 39
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Margin = 3
            Spacing = 6
            ExplicitLeft = 3
            ExplicitTop = 91
            ExplicitWidth = 39
            ExplicitHeight = 39
          end
          inherited btnEdit: TRzBitBtn
            Left = 3
            Top = 139
            Width = 39
            Height = 38
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Margin = 3
            Spacing = 6
            ExplicitLeft = 3
            ExplicitTop = 139
            ExplicitWidth = 39
            ExplicitHeight = 38
          end
          inherited btnDel: TRzBitBtn
            Left = 3
            Top = 195
            Width = 39
            Height = 39
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Margin = 3
            Spacing = 6
            ExplicitLeft = 3
            ExplicitTop = 195
            ExplicitWidth = 39
            ExplicitHeight = 39
          end
        end
        inherited grdPhone: TcxGrid
          Left = 7
          Top = 24
          Width = 1049
          Height = 227
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Font.Height = -15
          ExplicitLeft = 7
          ExplicitTop = 24
          ExplicitWidth = 1049
          ExplicitHeight = 227
          inherited GridView: TcxGridDBTableView
            inherited GridViewColumn1: TcxGridDBColumn
              Width = 93
            end
            inherited GridViewColumn6: TcxGridDBColumn
              Width = 106
            end
            inherited GridViewColumn7: TcxGridDBColumn
              Width = 164
            end
            inherited GridViewColumn9: TcxGridDBColumn
              Width = 209
            end
            inherited GridViewColumn10: TcxGridDBColumn
              Width = 195
            end
            inherited GridViewColumn11: TcxGridDBColumn
              IsCaptionAssigned = True
            end
            inherited ColumnRecord: TcxGridDBColumn
              Width = 148
            end
          end
        end
        inherited pnlForm: TPanel
          Left = 710
          Top = 66
          Width = 190
          Height = 35
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitLeft = 710
          ExplicitTop = 66
          ExplicitWidth = 190
          ExplicitHeight = 35
        end
      end
    end
  end
  object pnlClient: TRzPanel
    Left = 0
    Top = 226
    Width = 1027
    Height = 74
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    AutoSize = True
    BorderOuter = fsFlat
    BorderSides = [sdBottom]
    TabOrder = 3
  end
end
