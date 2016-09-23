inherited frmWorkerShedule: TfrmWorkerShedule
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1087#1080#1089#1082#1072' '#1082#1083#1080#1077#1085#1090#1086#1074
  ClientHeight = 462
  ClientWidth = 1069
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitLeft = -246
  ExplicitWidth = 1085
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 18
  inherited img1: TImage
    Left = 979
    Top = -114
    Width = 90
    Height = 35
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Visible = False
    ExplicitLeft = 979
    ExplicitTop = -114
    ExplicitWidth = 90
    ExplicitHeight = 35
  end
  object Label11: TLabel [1]
    Left = 572
    Top = 18
    Width = 72
    Height = 18
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel [2]
    Left = 897
    Top = 18
    Width = 34
    Height = 18
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #1044#1072#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited RzPanel1: TRzPanel
    Top = 411
    Width = 1069
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitTop = 411
    ExplicitWidth = 1069
    inherited Image2: TImage
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
    end
    inherited Exit_bnt: TRzButton
      Left = 883
      Top = 6
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      ExplicitLeft = 883
      ExplicitTop = 6
    end
    object butOk: TRzButton
      Left = 695
      Top = 6
      Width = 172
      Height = 41
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ModalResult = 1
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
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
      OnClick = butOkClick
    end
  end
  object GridCli: TcxGrid
    Left = 3
    Top = 43
    Width = 511
    Height = 356
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 1
    object GridCliUrView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.InfoPanel.Visible = True
      DataController.DataSource = DsCli
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.ImmediateEditor = False
      OptionsCustomize.ColumnGrouping = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.NoDataToDisplayInfoText = '<'#1057#1087#1080#1089#1086#1082' '#1087#1091#1089#1090'>'
      OptionsView.GridLines = glVertical
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      object GridCliUrViewColumn1: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'NAME'
        Width = 148
      end
      object GridCliUrViewColumn2: TcxGridDBColumn
        Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
        DataBinding.FieldName = 'PERSON_NAME'
        Width = 107
      end
      object GridCliUrViewColumn3: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'PHONE'
        Width = 89
      end
      object GridCliUrViewColumn4: TcxGridDBColumn
        Caption = #1054#1090#1074'. '#1089#1086#1090#1088#1091#1076#1085#1080#1082
        DataBinding.FieldName = 'WORKER_NAME'
        Width = 138
      end
      object GridCliUrViewColumn5: TcxGridDBColumn
        DataBinding.FieldName = 'id'
        Visible = False
      end
    end
    object GridCliLevel1: TcxGridLevel
      GridView = GridCliUrView
    end
  end
  object Fiz_btn: TRzButton
    Left = 3
    Top = 4
    Width = 180
    Height = 38
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    GroupIndex = 2
    FrameColor = clGray
    ShowDownPattern = False
    Anchors = [akTop, akRight]
    Caption = #1060#1080#1079#1080#1095#1077#1089#1082#1080#1077' '#1083#1080#1094#1072
    Color = 16444638
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 2
    ThemeAware = False
    OnClick = Fiz_btnClick
  end
  object Ur_btn: TRzButton
    Left = 187
    Top = 4
    Width = 174
    Height = 38
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    GroupIndex = 2
    Down = True
    FrameColor = clGray
    ShowDownPattern = False
    Anchors = [akTop, akRight]
    Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1080#1077' '#1083#1080#1094#1072
    Color = 15332600
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    ThemeAware = False
    OnClick = Ur_btnClick
  end
  object GridShedule: TcxGrid
    Left = 569
    Top = 43
    Width = 485
    Height = 356
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 4
    object GridSheduleView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.InfoPanel.Visible = True
      DataController.DataSource = DS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnGrouping = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = '<'#1057#1087#1080#1089#1086#1082' '#1087#1091#1089#1090'>'
      OptionsView.GridLines = glVertical
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      object cxGridDBColumn1: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'CLIENT_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.GridMode = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListSource = DataModuleMain.DsClients
        Width = 208
      end
      object cxGridDBColumn3: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'CLIENT_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.GridMode = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'PHONE'
          end>
        Properties.ListSource = DataModuleMain.DsClients
        Width = 102
      end
      object cxGridDBColumn4: TcxGridDBColumn
        Caption = #1054#1090#1074'. '#1089#1086#1090#1088#1091#1076#1085#1080#1082
        DataBinding.FieldName = 'CLIENT_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.GridMode = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'WORKER_NAME'
          end>
        Properties.ListSource = DataModuleMain.DsClients
        Width = 144
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = GridSheduleView
    end
  end
  object btnAdd: TRzBitBtn
    Left = 522
    Top = 93
    Width = 39
    Height = 39
    Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1089#1087#1080#1089#1086#1082
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Enabled = False
    TabOrder = 5
    OnClick = btnAddClick
    ImageIndex = 10
    Images = DataModuleMain.ImgList
    Margin = 3
    Spacing = 6
  end
  object btnDel: TRzBitBtn
    Left = 522
    Top = 181
    Width = 39
    Height = 39
    Hint = #1059#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1089#1087#1080#1089#1082#1072
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Enabled = False
    TabOrder = 6
    OnClick = btnDelClick
    ImageIndex = 11
    Images = DataModuleMain.ImgList
    Margin = 3
    Spacing = 6
  end
  object cxDBDateEdit1: TcxDBDateEdit
    Left = 937
    Top = 11
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DataBinding.DataField = 'DATESHEDULE'
    DataBinding.DataSource = DsMem
    Properties.ImmediatePost = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 7
    Width = 117
  end
  object cmbWorker: TcxDBLookupComboBox
    Left = 658
    Top = 11
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DataBinding.DataField = 'WORKER_ID'
    DataBinding.DataSource = DsMem
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'ID'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT_NAME'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataModuleMain.DSWorkers
    TabOrder = 8
    Width = 200
  end
  object DS: TDataSource
    AutoEdit = False
    DataSet = QWorkerShedule
    Left = 381
    Top = 362
  end
  object DsCli: TDataSource
    AutoEdit = False
    DataSet = MemCli
    Left = 285
    Top = 364
  end
  object memData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 352
    Top = 288
    object memDataWORKER_ID: TIntegerField
      FieldName = 'WORKER_ID'
    end
    object memDataDATESHEDULE: TDateField
      FieldName = 'DATESHEDULE'
    end
  end
  object DsMem: TDataSource
    DataSet = memData
    Left = 400
    Top = 288
  end
  object QWorkerShedule: TIBQuery
    Database = DataModuleMain.DB
    Transaction = DataModuleMain.DefTr
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from WORKER_SHEDULE'
      'where WORKER_ID = :WORKER_ID and '
      'DATESHEDULE = :DATESHEDULE')
    UpdateObject = QWorkerShedule_upd
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_WORKER_SHEDULE_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 184
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WORKER_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATESHEDULE'
        ParamType = ptUnknown
      end>
  end
  object QWorkerShedule_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select * from clientslist(:id, null)')
    ModifySQL.Strings = (
      'update worker_shedule set'
      'WORKER_ID = :WORKER_ID,'
      'CLIENT_ID = :CLIENT_ID,'
      'DATESHEDULE = :DATESHEDULE'
      'where id = :id')
    InsertSQL.Strings = (
      'insert into WORKER_SHEDULE('
      'id,'
      'WORKER_ID,'
      'CLIENT_ID,'
      'DATESHEDULE'
      ')'
      'values'
      '('
      ':ID,'
      ':WORKER_ID,'
      ':CLIENT_ID,'
      ':DATESHEDULE'
      ')')
    DeleteSQL.Strings = (
      'delete from worker_shedule where id = :id')
    Left = 248
    Top = 288
  end
  object MemCli: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 96
    Top = 240
  end
end
