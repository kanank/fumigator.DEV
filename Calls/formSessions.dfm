inherited frmSessions: TfrmSessions
  Caption = #1057#1077#1089#1089#1080#1080
  ClientHeight = 660
  ClientWidth = 1284
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitLeft = -548
  ExplicitTop = -84
  ExplicitWidth = 1300
  ExplicitHeight = 698
  PixelsPerInch = 96
  TextHeight = 18
  inherited img1: TImage
    Left = 1017
    Top = 516
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitLeft = 1012
    ExplicitTop = 572
  end
  inherited RzPanel2: TRzPanel
    Width = 1284
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Transparent = True
    ExplicitWidth = 1284
    inherited Image1: TImage
      Left = 1157
      Top = 2
      Height = 42
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alRight
      ExplicitLeft = 1145
      ExplicitTop = 2
      ExplicitHeight = 42
    end
    object Label11: TLabel
      Left = 12
      Top = 11
      Width = 173
      Height = 18
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1086#1090
      Color = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 349
      Top = 11
      Width = 16
      Height = 18
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #1076#1086
      Color = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object edtTimeStart: TcxDateEdit
      Left = 212
      Top = 7
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Properties.DisplayFormat = 'dd.mm.yyyy'
      TabOrder = 0
      Width = 122
    end
    object RzButton1: TRzButton
      Left = 508
      Top = 4
      Width = 115
      Height = 29
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
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
    object cmbFilter: TcxComboBox
      Left = 669
      Top = 7
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Properties.Items.Strings = (
        #1042#1089#1077
        #1055#1088#1080#1085#1103#1090#1099#1077
        #1048#1089#1093#1086#1076#1103#1097#1080#1077
        #1055#1088#1086#1087#1091#1097#1077#1085#1085#1099#1077
        #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100#1102' '#1073#1086#1083#1077#1077' 40 '#1089#1077#1082
        #1042#1089#1077' '#1088#1072#1079#1075#1086#1074#1086#1088#1099
        #1055#1088#1086#1087#1091#1097#1077#1085#1085#1099#1077' '#1076#1083#1103' '#1082#1086#1084#1087#1072#1085#1080#1080)
      Properties.OnChange = cmbFilterPropertiesChange
      TabOrder = 2
      Width = 188
    end
    object chkWorkerClients: TcxCheckBox
      Left = 875
      Top = 0
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #1058#1086#1083#1100#1082#1086' '#1082#1083#1080#1077#1085#1090#1099' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      State = cbsChecked
      TabOrder = 3
      Transparent = True
      OnClick = chkWorkerClientsClick
      Width = 235
    end
    object chkExtCallOnly: TcxCheckBox
      Left = 875
      Top = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #1058#1086#1083#1100#1082#1086' '#1074#1085#1077#1096#1085#1080#1077' '#1079#1074#1086#1085#1082#1080
      State = cbsChecked
      TabOrder = 4
      Transparent = True
      OnClick = chkWorkerClientsClick
      Width = 235
    end
  end
  inherited RzPanel1: TRzPanel
    Top = 607
    Width = 1284
    Height = 53
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitTop = 607
    ExplicitWidth = 1284
    ExplicitHeight = 53
    inherited Cancel_btn: TRzButton
      Left = 1096
      Top = 6
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      ExplicitLeft = 1096
      ExplicitTop = 6
    end
    inherited Del_btn: TRzButton [1]
      Top = 6
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Visible = False
      ExplicitTop = 6
    end
    inherited Add_btn: TRzButton [2]
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Visible = False
    end
    inherited Edit_btn: TRzButton [3]
      Left = 13
      Top = 6
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      OnClick = Edit_btnClick
      ExplicitLeft = 13
      ExplicitTop = 6
    end
    object btnExport: TRzButton
      Left = 750
      Top = 6
      Width = 168
      Height = 40
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' '#1092#1072#1081#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 4
      ThemeAware = False
      OnClick = btnExportClick
    end
  end
  inherited Grid: TcxGrid
    Top = 119
    Width = 1284
    Height = 488
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alClient
    PopupMenu = GridPopup
    ExplicitTop = 119
    ExplicitWidth = 1284
    ExplicitHeight = 488
    inherited GridView: TcxGridDBTableView
      OnCustomDrawCell = GridViewCustomDrawCell
      OnFocusedRecordChanged = GridViewFocusedRecordChanged
      DataController.DataSource = DS
      DataController.Filter.OnChanged = GridViewDataControllerFilterChanged
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.HideSelection = True
      OptionsSelection.InvertSelect = False
      OptionsView.GridLines = glVertical
      OptionsView.HeaderHeight = 40
      object GridViewColumn1: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1074#1099#1079#1086#1074#1072
        DataBinding.FieldName = 'CALLTYPE'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.GridMode = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = DataModuleMain.DSDicCallTypes
        Properties.ValidateOnEnter = False
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
      end
      object GridViewColumn2: TcxGridDBColumn
        Caption = #8470' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
        DataBinding.FieldName = 'CALLERNUM'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 127
      end
      object GridViewColumn8: TcxGridDBColumn
        Caption = #1050#1083#1080#1077#1085#1090
        DataBinding.FieldName = 'CLIENT_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.GridMode = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListSource = DataModuleMain.DsClients
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 90
      end
      object GridViewColumn16: TcxGridDBColumn
        Caption = #1056#1077#1075#1080#1086#1085
        DataBinding.FieldName = 'Region_id'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.HideSelection = False
        Properties.KeyFieldNames = 'REGION_ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = DataModuleMain.DsDicRegions
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 74
      end
      object GridViewColumn15: TcxGridDBColumn
        Caption = #1059#1089#1083#1091#1075#1080
        DataBinding.FieldName = 'USLUGI'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Styles.Header = cxStyle1
        Width = 65
      end
      object GridViewColumn3: TcxGridDBColumn
        Caption = #8470' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
        DataBinding.FieldName = 'CALLEDN'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 95
      end
      object GridViewColumn7: TcxGridDBColumn
        Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
        DataBinding.FieldName = 'WORKER_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.GridMode = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'SHORT_NAME'
          end>
        Properties.ListSource = DataModuleMain.DSWorkers
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 116
      end
      object GridViewColumn9: TcxGridDBColumn
        Caption = #1048#1089#1093#1086#1076
        DataBinding.FieldName = 'ISHOD'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 110
      end
      object GridViewColumn10: TcxGridDBColumn
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1089#1077#1089#1089#1080#1080
        DataBinding.FieldName = 'RESULT'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 169
      end
      object GridViewColumn6: TcxGridDBColumn
        Caption = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
        DataBinding.FieldName = 'DATESTRING'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 92
      end
      object GridViewColumn4: TcxGridDBColumn
        Caption = #1053#1072#1095#1072#1083#1086
        DataBinding.FieldName = 'STARTTIME'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.DisplayFormat = 'dd.mm.yy hh:nn:ss.zzz'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 101
      end
      object GridViewColumn5: TcxGridDBColumn
        Caption = #1050#1086#1085#1077#1094
        DataBinding.FieldName = 'ENDTIME'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.DisplayFormat = 'dd.mm.yy hh:nn:ss.zzz'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 106
      end
      object GridViewColumn11: TcxGridDBColumn
        DataBinding.FieldName = 'DURATION'
        Visible = False
        Options.AutoWidthSizable = False
        Width = 20
        IsCaptionAssigned = True
      end
      object RecColumn: TcxGridDBColumn
        Caption = #1047#1072#1087#1080#1089#1100
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 57
      end
      object GridViewColumn12: TcxGridDBColumn
        DataBinding.FieldName = 'CALLAPIID'
        Visible = False
      end
      object GridViewColumn13: TcxGridDBColumn
        DataBinding.FieldName = 'LOCALNUM'
        Visible = False
      end
      object GridViewColumn14: TcxGridDBColumn
        DataBinding.FieldName = 'RecAPIID'
        Visible = False
      end
    end
  end
  object edtTimeEnd: TcxDateEdit
    Left = 378
    Top = 7
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Properties.DisplayFormat = 'dd.mm.yyyy'
    TabOrder = 3
    Width = 122
  end
  object RzPanel3: TRzPanel
    Left = 0
    Top = 46
    Width = 1284
    Height = 73
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    BorderSides = []
    TabOrder = 4
    DesignSize = (
      1284
      73)
    object cxGrid1: TcxGrid
      Left = 0
      Top = 0
      Width = 1284
      Height = 73
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      TabOrder = 0
      object cxGridDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.InfoPanel.Visible = True
        OnCellDblClick = GridViewCellDblClick
        DataController.DataModeController.GridMode = True
        DataController.DataModeController.SyncMode = False
        DataController.DataSource = DsHeader
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnGrouping = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.NoDataToDisplayInfoText = '<'#1057#1087#1080#1089#1086#1082' '#1087#1091#1089#1090'>'
        OptionsView.ScrollBars = ssNone
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 45
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = #1054#1073#1097#1072#1103' '#1076#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
          DataBinding.FieldName = 'SUM_DURATION'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.DisplayFormat = 'hh:nn:ss.zzz'
          HeaderAlignmentHorz = taCenter
          Width = 143
        end
        object cxGridDBColumn2: TcxGridDBColumn
          Caption = #1057#1088#1077#1076#1085#1103#1103' '#1087#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
          DataBinding.FieldName = 'AVG_DURATION'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.DisplayFormat = 'hh:nn:ss.zzz'
          HeaderAlignmentHorz = taCenter
          Width = 157
        end
        object cxGridDBColumn3: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086' '#1089#1077#1089#1089#1080#1081
          DataBinding.FieldName = 'CNT_SESSION'
          HeaderAlignmentHorz = taCenter
          Width = 114
        end
        object cxGridDBColumn4: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086' '#1091#1089#1087#1077#1096#1085#1099#1093' '#1089#1077#1089#1089#1080#1081
          DataBinding.FieldName = 'CNT_GOOD_SESSION'
          HeaderAlignmentHorz = taCenter
          Width = 158
        end
        object cxGridDBColumn5: TcxGridDBColumn
          Caption = #1047#1072#1082#1086#1085#1095#1080#1083' '#1082#1083#1080#1077#1085#1090
          DataBinding.FieldName = 'END_BY_CLIENT'
          HeaderAlignmentHorz = taCenter
          Width = 105
        end
        object cxGridDBColumn6: TcxGridDBColumn
          Caption = #1047#1072#1082#1086#1085#1095#1080#1083' '#1086#1087#1077#1088#1072#1090#1086#1088
          DataBinding.FieldName = 'END_BY_USER'
          HeaderAlignmentHorz = taCenter
          Width = 197
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
    object pnlFiltered: TPanel
      Left = 944
      Top = 41
      Width = 339
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akLeft, akRight, akBottom]
      BevelEdges = []
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clCream
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      ShowCaption = False
      TabOrder = 1
      Visible = False
      DesignSize = (
        337
        29)
      object Label2: TLabel
        Left = 3
        Top = 5
        Width = 190
        Height = 18
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        AutoSize = False
        Caption = #1054#1090#1092#1080#1083#1100#1090#1088#1086#1074#1072#1085#1086' '#1089#1090#1088#1086#1082': '
        Color = clBtnShadow
        EllipsisPosition = epPathEllipsis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        GlowSize = 10
        ParentColor = False
        ParentFont = False
      end
      object lblCount: TLabel
        Left = 209
        Top = -1
        Width = 24
        Height = 38
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Anchors = [akLeft, akBottom]
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        GlowSize = 10
        ParentColor = False
        ParentFont = False
      end
    end
  end
  object pnlForm: TPanel
    Left = 650
    Top = 161
    Width = 190
    Height = 34
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    AutoSize = True
    BevelEdges = []
    TabOrder = 5
    Visible = False
  end
  object Q: TIBQuery
    Database = DataModuleMain.DB
    Transaction = DataModuleMain.Calls_Tr
    AutoCalcFields = False
    AfterRefresh = QAfterRefresh
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select s.*, case when calltype=0 then localnum else CALLEDNUM en' +
        'd CALLEDN,'
      ' (select datestring from diffdatestr(starttime, endtime)),'
      
        ' (select count(*)from sessions where callapiid=s.callapiid  and ' +
        'accepted=1) answer,'
      ' recid as recapiid,'
      ' (select str from get_services_client(s.client_id)) uslugi,'
      ' c.region_id'
      'from sessions s left join clients c on c.id = s.client_id'
      
        'where starttime >=:date1 and  starttime <:date2 and endtime is n' +
        'ot null'
      'order by starttime')
    UpdateObject = updQ
    Left = 72
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'date1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'date2'
        ParamType = ptUnknown
      end>
  end
  object DS: TDataSource
    AutoEdit = False
    DataSet = MemQ
    Left = 24
    Top = 88
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 40
    Top = 184
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object MemHeader: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 560
    Top = 304
    object MemHeaderSUM_DURATION: TDateTimeField
      FieldName = 'SUM_DURATION'
    end
    object MemHeaderAVG_DURATION: TDateTimeField
      FieldName = 'AVG_DURATION'
    end
    object MemHeaderCNT_SESSION: TIntegerField
      FieldName = 'CNT_SESSION'
    end
    object MemHeaderCNT_GOOD_SESSION: TIntegerField
      FieldName = 'CNT_GOOD_SESSION'
    end
    object MemHeaderEND_BY_CLIENT: TIntegerField
      FieldName = 'END_BY_CLIENT'
    end
    object MemHeaderEND_BY_USER: TIntegerField
      FieldName = 'END_BY_USER'
    end
  end
  object DsHeader: TDataSource
    DataSet = MemHeader
    Left = 496
    Top = 304
  end
  object GridPopup: TPopupMenu
    Left = 352
    Top = 256
    object N1: TMenuItem
      Caption = #1060#1080#1083#1100#1090#1088#1099
      object miFilterAccepted: TMenuItem
        Caption = #1058#1086#1083#1100#1082#1086' '#1086#1090#1074#1077#1090#1080#1074#1096#1080#1077
        OnClick = miFilterDurationClick
      end
      object miFilterDuration: TMenuItem
        Caption = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100#1102' '#1073#1086#1083#1077#1077' 40'#1089#1077#1082
        OnClick = miFilterDurationClick
      end
      object miFilterOff: TMenuItem
        Caption = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1092#1080#1083#1100#1090#1088#1099
        OnClick = miFilterOffClick
      end
    end
  end
  object MemQ: TdxMemData
    Indexes = <>
    SortOptions = []
    OnFilterRecord = QFilterRecord
    Left = 144
    Top = 80
  end
  object updQ: TIBUpdateSQL
    RefreshSQL.Strings = (
      
        'select s.*, case when calltype=0 then localnum else CALLEDNUM en' +
        'd CALLEDN,'
      ' (select datestring from diffdatestr(starttime, endtime)),'
      
        ' (select count(*)from sessions where callapiid=s.callapiid  and ' +
        'accepted=1) answer,'
      ' recid as recapiid,'
      ' (select str from get_services_client(s.client_id)) uslugi,'
      ' c.region_id'
      'from sessions s left join clients c on c.id = s.client_id'
      'where s.id = :id')
    ModifySQL.Strings = (
      'update sessions'
      'set client_id = :client_id'
      'where id = :id')
    Left = 72
    Top = 128
  end
  object FileSaveDialog: TFileSaveDialog
    DefaultExtension = 'xls'
    FavoriteLinks = <>
    FileTypes = <>
    OkButtonLabel = #1069#1082#1089#1087#1086#1088#1090
    Options = [fdoOverWritePrompt]
    Title = #1042#1099#1073#1086#1088' '#1092#1072#1081#1083#1072' '#1076#1083#1103' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
    Left = 952
    Top = 328
  end
end
