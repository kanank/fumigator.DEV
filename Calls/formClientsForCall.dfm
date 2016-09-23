inherited frmClientsForCall: TfrmClientsForCall
  Caption = #1057#1087#1080#1089#1086#1082' '#1082#1083#1080#1077#1085#1090#1086#1074' '#1076#1083#1103' '#1086#1073#1079#1074#1086#1085#1072
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited RzPanel1: TRzPanel
    inherited Cancel_btn: TRzButton
      Caption = #1047#1072#1082#1086#1085#1095#1080#1090#1100' '#1088#1072#1073#1086#1090#1091
    end
    inherited Edit_btn: TRzButton
      Left = 210
      Width = 152
      Caption = #1047#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1090#1100' '#1087#1077#1088#1077#1088#1099#1074
      OnClick = Edit_btnClick
      ExplicitLeft = 210
      ExplicitWidth = 152
    end
    inherited Del_btn: TRzButton
      Left = 363
      Visible = False
      ExplicitLeft = 363
    end
    inherited Add_btn: TRzButton
      Caption = #1053#1072#1095#1072#1090#1100' '#1088#1072#1073#1086#1090#1091
      OnClick = Add_btnClick
    end
  end
  inherited Grid: TcxGrid
    Anchors = [akLeft, akTop, akRight, akBottom]
    Enabled = False
    inherited GridView: TcxGridDBTableView
      OnCellDblClick = nil
      DataController.DataSource = DS
      DataController.Options = []
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.GridLines = glVertical
      OptionsView.HeaderHeight = 31
      object GridViewColumn1: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 133
      end
      object GridViewColumn2: TcxGridDBColumn
        Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
        DataBinding.FieldName = 'RUKOVODITEL'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 117
      end
      object GridViewColumn3: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'PHONE'
        GroupSummaryAlignment = taCenter
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 93
      end
      object GridViewColumn4: TcxGridDBColumn
        Caption = 'Email'
        DataBinding.FieldName = 'EMAIL'
        BestFitMaxWidth = 65
        GroupSummaryAlignment = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.AutoWidthSizable = False
        Styles.Header = cxStyle1
        Width = 65
      end
      object GridViewColumn5: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1091#1089
        DataBinding.FieldName = 'STATUS_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.GridMode = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = DataModuleMain.DsDicStatusCli
        GroupSummaryAlignment = taCenter
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 73
      end
      object GridViewColumn6: TcxGridDBColumn
        Caption = #1060#1086#1088#1084#1072#1090
        DataBinding.FieldName = 'FORMAT_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.GridMode = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = DataModuleMain.DsFormatsCli
        GroupSummaryAlignment = taCenter
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 71
      end
      object GridViewColumn7: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086' '#1076#1086#1075#1086#1074#1086#1088#1086#1074
        DataBinding.FieldName = 'CNT_DOG'
        GroupSummaryAlignment = taCenter
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 70
      end
    end
  end
  object pnlPause: TRzPanel
    Left = 178
    Top = 152
    Width = 295
    Height = 41
    BorderOuter = fsFlatRounded
    TabOrder = 3
    Visible = False
    object lblPause: TRzLabel
      Left = 2
      Top = 8
      Width = 289
      Height = 23
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Caption = #1055#1077#1088#1077#1088#1099#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      BlinkIntervalOff = 1000
      BlinkIntervalOn = 1000
    end
  end
  object QWorkerShedule: TIBQuery
    Database = DataModuleMain.DB
    Transaction = DataModuleMain.DefTr
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      
        'select s.id, finished, s.client_id, c.name, p.shortname as rukov' +
        'oditel,'
      
        '(select phone from get_client_phones(s.client_id, 1, 1)) phone, ' +
        'p.email_work email,'
      'c.status_id, c.format_id, 0 cnt_dog'
      'from worker_shedule s join clients c on c.id = s.client_id'
      'left join persons p on p.id = c.person_id'
      'where s.worker_id=:worker_id and dateshedule =current_date')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_WORKER_SHEDULE_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 320
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WORKER_ID'
        ParamType = ptUnknown
      end>
  end
  object QWorkerShedule_upd: TIBUpdateSQL
    Left = 408
    Top = 216
  end
  object DS: TDataSource
    DataSet = QWorkerShedule
    Left = 360
    Top = 200
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 8
    Top = 280
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
  object TimerPause: TTimer
    Enabled = False
    OnTimer = TimerPauseTimer
    Left = 176
    Top = 200
  end
end
