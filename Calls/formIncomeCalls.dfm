inherited frmIncomeCall: TfrmIncomeCall
  BorderIcons = [biSystemMenu]
  Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1079#1074#1086#1085#1086#1082'. '#1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
  ClientHeight = 312
  ClientWidth = 884
  FormStyle = fsStayOnTop
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitLeft = -166
  ExplicitWidth = 900
  ExplicitHeight = 350
  DesignSize = (
    884
    312)
  PixelsPerInch = 96
  TextHeight = 18
  inherited img1: TImage
    Left = 1029
    Top = -184
    Width = 102
    Height = 34
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Visible = False
    ExplicitLeft = 786
    ExplicitTop = -184
    ExplicitWidth = 102
    ExplicitHeight = 34
  end
  object Label11: TLabel [1]
    Left = 568
    Top = 12
    Width = 122
    Height = 18
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited RzPanel1: TRzPanel
    Top = 261
    Width = 884
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitTop = 261
    ExplicitWidth = 884
    inherited Image2: TImage
      Left = 5
      Top = 3
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akBottom]
      ExplicitLeft = 5
      ExplicitTop = 3
    end
    inherited Exit_bnt: TRzButton
      Left = 413
      Top = 4
      Height = 46
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      ModalResult = 1
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091' '#1082#1083#1080#1077#1085#1090#1072
      OnClick = Exit_bntClick
      ExplicitLeft = 413
      ExplicitTop = 4
      ExplicitHeight = 46
    end
    object btnTransfer: TRzButton
      Left = 963
      Top = 8
      Width = 156
      Height = 46
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ModalResult = 2
      Anchors = [akTop, akRight]
      Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1074#1099#1079#1086#1074
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
      OnClick = btnTransferClick
    end
    object btnOk: TRzButton
      Left = 720
      Top = 4
      Width = 156
      Height = 46
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akRight, akBottom]
      Caption = #1054#1050
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
      OnClick = btnOkClick
    end
  end
  object grpBox: TRzGroupBox
    Left = 11
    Top = 37
    Width = 865
    Height = 208
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1082#1083#1080#1077#1085#1090#1077
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -15
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    TabOrder = 1
    object Label1: TLabel
      Left = 14
      Top = 138
      Width = 112
      Height = 18
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #1060#1086#1088#1084#1072#1090' '#1082#1083#1080#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 14
      Top = 172
      Width = 108
      Height = 18
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #1057#1090#1072#1090#1091#1089' '#1082#1083#1080#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 349
      Top = 11
      Width = 131
      Height = 18
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #1044#1086#1075#1086#1074#1086#1088#1099' '#1082#1083#1080#1077#1085#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 407
      Top = 170
      Width = 183
      Height = 18
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081' '#1089#1086#1090#1088#1091#1076#1085#1080#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inline FramePerson: TFramePersonSmall
      Left = 1
      Top = 21
      Width = 315
      Height = 113
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
      ExplicitLeft = 1
      ExplicitTop = 21
      ExplicitWidth = 315
      ExplicitHeight = 113
      inherited RzPanel1: TRzPanel
        Left = 3
        Top = 4
        Width = 483
        Height = 121
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitLeft = 3
        ExplicitTop = 4
        ExplicitWidth = 483
        ExplicitHeight = 121
        inherited Label11: TLabel
          Left = 10
          Top = 11
          Width = 60
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Font.Height = -15
          ExplicitLeft = 10
          ExplicitTop = 11
          ExplicitWidth = 60
          ExplicitHeight = 18
        end
        inherited Label10: TLabel
          Left = 10
          Top = 48
          Width = 28
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Font.Height = -15
          ExplicitLeft = 10
          ExplicitTop = 48
          ExplicitWidth = 28
          ExplicitHeight = 18
        end
        inherited Label9: TLabel
          Left = 10
          Top = 86
          Width = 66
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Font.Height = -15
          ExplicitLeft = 10
          ExplicitTop = 86
          ExplicitWidth = 66
          ExplicitHeight = 18
        end
        inherited Label8: TLabel
          Left = 8
          Top = 123
          Width = 136
          Height = 23
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Font.Height = -19
          ExplicitLeft = 8
          ExplicitTop = 123
          ExplicitWidth = 136
          ExplicitHeight = 23
        end
        inherited Label2: TLabel
          Left = 10
          Top = 195
          Width = 115
          Height = 23
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Font.Height = -19
          ExplicitLeft = 10
          ExplicitTop = 195
          ExplicitWidth = 115
          ExplicitHeight = 23
        end
        inherited Label1: TLabel
          Left = 281
          Top = 123
          Width = 34
          Height = 23
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Font.Height = -19
          ExplicitLeft = 281
          ExplicitTop = 123
          ExplicitWidth = 34
          ExplicitHeight = 23
        end
        inherited Label4: TLabel
          Left = 8
          Top = 159
          Width = 97
          Height = 23
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Font.Height = -19
          ExplicitLeft = 8
          ExplicitTop = 159
          ExplicitWidth = 97
          ExplicitHeight = 23
        end
        inherited edtCitizen: TcxDBTextEdit
          Left = 119
          Top = 191
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitLeft = 119
          ExplicitTop = 191
          ExplicitWidth = 294
          ExplicitHeight = 26
          Width = 294
        end
        inherited cmbDateBirth: TcxDBDateEdit
          Left = 140
          Top = 119
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Style.Font.Height = -19
          Style.IsFontAssigned = True
          ExplicitLeft = 140
          ExplicitTop = 119
          ExplicitWidth = 177
          ExplicitHeight = 31
          Width = 177
        end
        inherited edtSurName: TcxDBTextEdit
          Left = 134
          Top = 82
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitLeft = 134
          ExplicitTop = 82
          ExplicitWidth = 391
          ExplicitHeight = 26
          Width = 391
        end
        inherited edtName: TcxDBTextEdit
          Left = 134
          Top = 44
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitLeft = 134
          ExplicitTop = 44
          ExplicitWidth = 391
          ExplicitHeight = 26
          Width = 391
        end
        inherited edtFamily: TcxDBTextEdit
          Left = 134
          Top = 7
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitLeft = 134
          ExplicitTop = 7
          ExplicitWidth = 391
          ExplicitHeight = 26
          Width = 391
        end
        inherited cmbSex: TcxDBComboBox
          Left = 320
          Top = 119
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Style.Font.Height = -19
          Style.IsFontAssigned = True
          ExplicitLeft = 320
          ExplicitTop = 119
          ExplicitWidth = 73
          ExplicitHeight = 31
          Width = 73
        end
        inherited cmbProf: TcxDBLookupComboBox
          Left = 119
          Top = 154
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitLeft = 119
          ExplicitTop = 154
          ExplicitWidth = 274
          ExplicitHeight = 26
          Width = 274
        end
      end
    end
    object grdDog: TcxGrid
      Left = 349
      Top = 30
      Width = 505
      Height = 132
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 1
      object grdDogDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = grdDogDBTableView1Column1
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = '<'#1059#1089#1083#1091#1075#1080' '#1085#1077' '#1074#1099#1073#1088#1072#1085#1099'>'
        OptionsView.ScrollBars = ssVertical
        OptionsView.GridLines = glNone
        OptionsView.GroupByBox = False
        object grdDogDBTableView1Column1: TcxGridDBColumn
          Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1072
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.GridMode = True
          Properties.HideSelection = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListSource = DataModuleMain.DSDicServices
          Options.Editing = False
          Width = 92
        end
        object grdDogDBTableView1Column2: TcxGridDBColumn
          Caption = #1057#1090#1072#1090#1091#1089' '#1076#1086#1075#1086#1074#1086#1088#1072
          Width = 121
        end
        object grdDogDBTableView1Column3: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1103
          Width = 133
        end
        object grdDogDBTableView1Column4: TcxGridDBColumn
          Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081
          Width = 133
        end
      end
      object grdDogLevel1: TcxGridLevel
        GridView = grdDogDBTableView1
      end
    end
    object cmbFormat: TcxLookupComboBox
      Left = 138
      Top = 134
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DataModuleMain.DsFormatsCli
      TabOrder = 2
      Width = 178
    end
    object cmbStatus: TcxLookupComboBox
      Left = 138
      Top = 168
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DataModuleMain.DsDicStatusCli
      TabOrder = 3
      Width = 178
    end
    object lblWorker: TcxLabel
      Left = 613
      Top = 168
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AutoSize = False
      Caption = 'lblWorker'
      Height = 23
      Width = 241
    end
  end
  object edtPhone: TcxMaskEdit
    Left = 698
    Top = 8
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ParentFont = False
    Properties.AlwaysShowBlanksAndLiterals = True
    Properties.EditMask = '\(999\)000\-00\-00;0;'#9618
    Properties.ReadOnly = True
    Properties.ValidationOptions = [evoShowErrorIcon, evoAllowLoseFocus]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 2
    Text = '          '
    Width = 178
  end
  object DS: TDataSource
    Left = 392
    Top = 306
  end
end
