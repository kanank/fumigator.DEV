inherited frmSessionEdit: TfrmSessionEdit
  Width = 1043
  Height = 639
  VertScrollBar.ButtonSize = 10
  VertScrollBar.Size = 100
  AutoScroll = True
  Caption = #1057#1077#1089#1089#1080#1103' ['#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077']'
  Position = poDesktopCenter
  OnShow = FormShow
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
    inherited btnTransferCall: TRzButton
      TabOrder = 3
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
    object RzPanel2: TRzPanel
      Left = 88
      Top = -512
      Width = 185
      Height = 41
      TabOrder = 4
    end
  end
  object ScrollBox: TScrollBox
    Left = 0
    Top = 0
    Width = 1027
    Height = 550
    Align = alClient
    AutoScroll = False
    AutoSize = True
    BevelInner = bvNone
    TabOrder = 1
    object pnlCalls: TRzPanel
      Left = 0
      Top = 333
      Width = 1023
      Height = 213
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      BorderOuter = fsNone
      TabOrder = 0
      inline frameClientCalls: TframeClientCalls
        Left = 0
        Top = 0
        Width = 1023
        Height = 213
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 1023
        ExplicitHeight = 213
        inherited grpPhone: TRzGroupBox
          Left = 0
          Top = 8
          Width = 1058
          Height = 209
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitLeft = 0
          ExplicitTop = 8
          ExplicitWidth = 1058
          ExplicitHeight = 209
          inherited RzPanel2: TRzPanel
            Left = 1015
            Width = 42
            Height = 189
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 1015
            ExplicitWidth = 42
            ExplicitHeight = 189
            inherited btnAdd: TRzBitBtn
              Left = 3
              Top = 85
              Width = 39
              Height = 39
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Margin = 3
              Spacing = 6
              ExplicitLeft = 3
              ExplicitTop = 85
              ExplicitWidth = 39
              ExplicitHeight = 39
            end
            inherited btnEdit: TRzBitBtn
              Left = 3
              Top = 119
              Width = 39
              Height = 38
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Margin = 3
              Spacing = 6
              ExplicitLeft = 3
              ExplicitTop = 119
              ExplicitWidth = 39
              ExplicitHeight = 38
            end
            inherited btnDel: TRzBitBtn
              Left = 3
              Top = 160
              Width = 39
              Height = 39
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Margin = 3
              Spacing = 6
              ExplicitLeft = 3
              ExplicitTop = 160
              ExplicitWidth = 39
              ExplicitHeight = 39
            end
          end
          inherited grdPhone: TcxGrid
            Left = 7
            Top = 24
            Width = 1052
            Height = 180
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Font.Height = -15
            ExplicitLeft = 7
            ExplicitTop = 24
            ExplicitWidth = 1052
            ExplicitHeight = 180
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
    object pnlClientResult: TRzPanel
      Left = 0
      Top = 0
      Width = 1023
      Height = 333
      Align = alClient
      AutoSize = True
      BorderOuter = fsPopup
      BorderSides = [sdBottom]
      TabOrder = 1
      object pnlClient: TScrollBox
        Left = 305
        Top = 0
        Width = 718
        Height = 332
        Align = alClient
        Anchors = []
        AutoScroll = False
        BevelEdges = []
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnResize = pnlClientResize
      end
      object pnlResult: TRzPanel
        Left = 0
        Top = 0
        Width = 305
        Height = 332
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alLeft
        BorderOuter = fsFlat
        BorderSides = [sdRight]
        TabOrder = 1
        OnResize = pnlClientResize
      end
    end
  end
end
