inherited frmClients: TfrmClients
  Caption = #1050#1083#1080#1077#1085#1090#1099
  ClientHeight = 602
  ClientWidth = 1255
  Position = poDesktopCenter
  OnShow = FormShow
  ExplicitWidth = 1271
  ExplicitHeight = 640
  PixelsPerInch = 96
  TextHeight = 18
  inherited img1: TImage
    Left = 987
    Top = 458
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Visible = False
    ExplicitLeft = 1009
    ExplicitTop = 458
  end
  inherited RzPanel2: TRzPanel
    Width = 1255
    Height = 42
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitWidth = 1277
    ExplicitHeight = 42
    inherited Image1: TImage
      Left = 104
      Top = 1
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      ExplicitLeft = 126
      ExplicitTop = 1
    end
    object Fiz_btn: TRzButton
      Left = 877
      Top = 1
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
      Color = 15332600
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 0
      ThemeAware = False
      OnClick = Fiz_btnClick
      ExplicitLeft = 899
    end
    object Ur_btn: TRzButton
      Left = 1065
      Top = 1
      Width = 180
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
      TabOrder = 1
      ThemeAware = False
      OnClick = Ur_btnClick
      ExplicitLeft = 1087
    end
    object btnAll: TRzButton
      Left = 666
      Top = 1
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
      Caption = #1054#1073#1097#1080#1081' '#1089#1087#1080#1089#1086#1082
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
      OnClick = btnAllClick
      ExplicitLeft = 688
    end
    object chkDeleted: TcxCheckBox
      Left = 448
      Top = 7
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1091#1076#1072#1083#1077#1085#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      Properties.Alignment = taRightJustify
      TabOrder = 3
      OnClick = chkDeletedClick
      Width = 220
    end
  end
  inherited RzPanel1: TRzPanel
    Top = 534
    Width = 1255
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitTop = 534
    ExplicitWidth = 1277
    inherited Cancel_btn: TRzButton
      Left = 1065
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = #1042#1099#1093#1086#1076
      ExplicitLeft = 1087
    end
    inherited Edit_btn: TRzButton
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Visible = False
      OnClick = Edit_btnClick
    end
    inherited Del_btn: TRzButton
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      OnClick = Del_btnClick
    end
    inherited Add_btn: TRzButton
      Top = 7
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Visible = False
      OnClick = Add_btnClick
      ExplicitTop = 7
    end
    object RzButton1: TRzButton
      Left = 212
      Top = 10
      Width = 167
      Height = 40
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
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
      Visible = False
      OnClick = RzButton1Click
    end
    object Add_btn1: TRzMenuButton
      Left = 11
      Top = 11
      Width = 169
      Height = 40
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #1057#1086#1079#1076#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 5
      ThemeAware = False
      OnClick = Add_btn1Click
      Margin = 3
      Spacing = 6
      DropDownMenu = NewClientBtn_PUM
    end
    object Edit_btn_mnu: TRzMenuButton
      Left = 212
      Top = 8
      Width = 167
      Height = 42
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      LightTextStyle = True
      ParentFont = False
      TabOrder = 6
      ThemeAware = False
      OnClick = Edit_btnClick
      Layout = blGlyphRight
      DropDownMenu = mnuEdit
    end
    object btnSelect: TRzButton
      Left = 890
      Top = 11
      Width = 168
      Height = 40
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = #1054#1050
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 7
      ThemeAware = False
      OnClick = btnSelectClick
    end
  end
  inherited Grid: TcxGrid
    Top = 66
    Width = 1255
    Height = 467
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Anchors = [akLeft, akTop, akRight, akBottom]
    ParentFont = False
    ExplicitTop = 66
    ExplicitWidth = 1277
    ExplicitHeight = 467
    inherited GridView: TcxGridDBTableView
      OnCellClick = GridViewCellClick
      OnCellDblClick = GridViewUrCellDblClick
      OnCustomDrawCell = GridViewCustomDrawCell
      OnFocusedRecordChanged = GridViewFocusedRecordChanged
      DataController.DataSource = DS
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = GridViewColumn2
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GridLines = glVertical
      OptionsView.HeaderAutoHeight = True
      Styles.Header = cxStyle1
      object GridViewColumn1: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        HeaderAlignmentHorz = taCenter
        Width = 48
      end
      object GridViewColumn2: TcxGridDBColumn
        Caption = #1050#1083#1080#1077#1085#1090
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 268
      end
      object GridViewColumn7: TcxGridDBColumn
        Caption = #1056#1077#1075#1080#1086#1085
        DataBinding.FieldName = 'region'
        HeaderAlignmentHorz = taCenter
        Width = 158
      end
      object GridViewColumn8: TcxGridDBColumn
        Caption = #1059#1089#1083#1091#1075#1080
        DataBinding.FieldName = 'uslugi'
        HeaderAlignmentHorz = taCenter
        Width = 249
      end
      object GridViewColumn3: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'PHONE'
        HeaderAlignmentHorz = taCenter
        Width = 126
      end
      object GridViewColumn5: TcxGridDBColumn
        Caption = #1054#1090#1074'. '#1089#1086#1090#1088#1091#1076#1085#1080#1082
        DataBinding.FieldName = 'WORKER_NAME'
        HeaderAlignmentHorz = taCenter
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 121
      end
      object GridViewColumn4: TcxGridDBColumn
        DataBinding.FieldName = 'Email'
        HeaderAlignmentHorz = taCenter
        MinWidth = 120
        Options.Editing = False
        Options.AutoWidthSizable = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 120
      end
      object GridViewColumn6: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086' '#1074#1099#1087'. '#1079#1072#1103#1074#1086#1082
        DataBinding.FieldName = 'CNT_DOG'
        HeaderAlignmentHorz = taCenter
      end
      object GridViewColumn9: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
        DataBinding.FieldName = 'DATE_CREATE'
        HeaderAlignmentHorz = taCenter
        Width = 82
      end
      object GridViewColumn10: TcxGridDBColumn
        DataBinding.FieldName = 'act'
        Visible = False
      end
    end
    object GridViewUr: TcxGridDBTableView [1]
      Navigator.Buttons.CustomButtons = <>
      OnCellClick = GridViewCellClick
      OnCellDblClick = GridViewUrCellDblClick
      OnCustomDrawCell = GridViewUrCustomDrawCell
      OnFocusedRecordChanged = GridViewUrFocusedRecordChanged
      DataController.DataSource = DS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = GridViewUrColumn2
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GridLines = glVertical
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.Header = cxStyle1
      object GridViewUrColumn1: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        HeaderAlignmentHorz = taCenter
        Width = 48
      end
      object GridViewUrColumn2: TcxGridDBColumn
        Caption = #1050#1083#1080#1077#1085#1090
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 280
      end
      object GridViewUrColumn7: TcxGridDBColumn
        Caption = #1056#1077#1075#1080#1086#1085
        DataBinding.FieldName = 'region'
        HeaderAlignmentHorz = taCenter
        Width = 127
      end
      object GridViewUrColumn8: TcxGridDBColumn
        Caption = #1059#1089#1083#1091#1075#1080
        DataBinding.FieldName = 'uslugi'
        HeaderAlignmentHorz = taCenter
        Width = 200
      end
      object GridViewUrColumn5: TcxGridDBColumn
        Caption = #1054#1090#1074'. '#1089#1086#1090#1088#1091#1076#1085#1080#1082
        DataBinding.FieldName = 'WORKER_NAME'
        HeaderAlignmentHorz = taCenter
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 191
      end
      object GridViewUrColumn3: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'PHONE'
        HeaderAlignmentHorz = taCenter
        Width = 148
      end
      object GridViewUrColumn4: TcxGridDBColumn
        DataBinding.FieldName = 'Email'
        HeaderAlignmentHorz = taCenter
        MinWidth = 112
        Options.Editing = False
        Options.AutoWidthSizable = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 112
      end
      object GridViewUrColumn6: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086' '#1074#1099#1087'. '#1079#1072#1103#1074#1086#1082
        DataBinding.FieldName = 'CNT_DOG'
        HeaderAlignmentHorz = taCenter
      end
      object GridViewUrColumn9: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
        DataBinding.FieldName = 'DATE_CREATE'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.DisplayFormat = 'dd.mm.yy'
        HeaderAlignmentHorz = taCenter
        Width = 80
      end
      object GridViewUrColumn10: TcxGridDBColumn
        DataBinding.FieldName = 'act'
        Visible = False
      end
    end
    object GridViewAll: TcxGridDBTableView [2]
      Navigator.Buttons.CustomButtons = <>
      OnCellClick = GridViewCellClick
      OnCellDblClick = GridViewUrCellDblClick
      OnCustomDrawCell = GridViewAllCustomDrawCell
      OnFocusedRecordChanged = GridViewAllFocusedRecordChanged
      DataController.DataSource = DS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = GridViewAllColumn3
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GridLines = glVertical
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.HeaderHeight = 32
      Styles.Header = cxStyle1
      object GridViewAllColumn1: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'id'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
      end
      object GridViewAllColumn2: TcxGridDBColumn
        Caption = #1060#1086#1088#1084#1072' '#1082#1083#1080#1077#1085#1090#1072
        DataBinding.FieldName = 'type_clis'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 94
      end
      object GridViewAllColumn3: TcxGridDBColumn
        Caption = #1050#1083#1080#1077#1085#1090
        DataBinding.FieldName = 'name'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 181
      end
      object GridViewAllColumn4: TcxGridDBColumn
        Caption = #1056#1077#1075#1080#1086#1085
        DataBinding.FieldName = 'region'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 173
      end
      object GridViewAllColumn5: TcxGridDBColumn
        Caption = #1059#1089#1083#1091#1075#1080
        DataBinding.FieldName = 'uslugi'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 234
      end
      object GridViewAllColumn6: TcxGridDBColumn
        Caption = #1054#1090#1074'. '#1089#1086#1090#1088#1091#1076#1085#1080#1082
        DataBinding.FieldName = 'WORKER_NAME'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 150
      end
      object GridViewAllColumn7: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'PHONE'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 102
      end
      object GridViewAllColumn8: TcxGridDBColumn
        Caption = 'Email'
        DataBinding.FieldName = 'email'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 101
      end
      object GridViewAllColumn9: TcxGridDBColumn
        DataBinding.FieldName = #1050#1086#1083'-'#1074#1086' '#1074#1099#1087'. '#1079#1072#1103#1074#1086#1082
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Styles.Header = cxStyle1
        Width = 80
      end
      object GridViewAllColumn10: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
        DataBinding.FieldName = 'DATE_CREATE'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.DisplayFormat = 'dd.mm.yy'
        HeaderAlignmentHorz = taCenter
        Width = 76
      end
      object GridViewAllColumn11: TcxGridDBColumn
        DataBinding.FieldName = 'act'
        Visible = False
      end
    end
  end
  object btnCli: TRzButton
    Left = 0
    Top = 42
    Width = 90
    Height = 24
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    GroupIndex = 1
    FrameColor = clGray
    ShowDownPattern = False
    Caption = #1050#1083#1080#1077#1085#1090#1099
    Color = 16444638
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 3
    ThemeAware = False
    OnClick = btnCliClick
  end
  object btnLid: TRzButton
    Left = 90
    Top = 42
    Width = 90
    Height = 24
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    GroupIndex = 1
    FrameColor = clGray
    ShowDownPattern = False
    Caption = #1051#1080#1076#1099
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
    TabOrder = 4
    ThemeAware = False
    OnClick = btnLidClick
  end
  object btnFavCli: TRzButton
    Left = 180
    Top = 42
    Width = 189
    Height = 24
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    GroupIndex = 1
    FrameColor = clGray
    ShowDownPattern = False
    Caption = #1055#1086#1089#1090#1086#1103#1085#1085#1099#1077' '#1082#1083#1080#1077#1085#1090#1099
    Color = 15332600
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 5
    ThemeAware = False
    OnClick = btnFavCliClick
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 184
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
  object DS: TDataSource
    AutoEdit = False
    Left = 453
    Top = 312
  end
  object NewClientBtn_PUM: TPopupMenu
    Left = 296
    Top = 8
    object NewFizClnt_mi: TMenuItem
      Caption = #1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
      OnClick = NewFizClnt_miClick
    end
    object NewURClnt_mi: TMenuItem
      Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
      OnClick = NewFizClnt_miClick
    end
  end
  object PropStore: TcxPropertiesStore
    Active = False
    Components = <
      item
        Component = Owner
        Properties.Strings = (
          'Height'
          'Width')
      end
      item
        Component = Grid
        Properties.Strings = (
          'Height'
          'Width')
      end
      item
        Component = GridViewAllColumn1
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewAllColumn2
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewAllColumn3
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewAllColumn4
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewAllColumn5
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewAllColumn6
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewAllColumn7
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewAllColumn8
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewAllColumn9
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewColumn1
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewColumn2
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewColumn3
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewColumn4
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewColumn5
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewColumn6
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewColumn7
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewColumn8
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewUrColumn1
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewUrColumn2
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewUrColumn3
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewUrColumn4
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewUrColumn5
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewUrColumn6
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewUrColumn7
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewUrColumn8
        Properties.Strings = (
          'Width')
      end
      item
        Component = Image1
        Properties.Strings = (
          'Height'
          'Width')
      end
      item
        Component = img1
        Properties.Strings = (
          'Height'
          'Width')
      end
      item
        Component = RzButton1
        Properties.Strings = (
          'Height'
          'Width')
      end
      item
        Component = RzPanel1
        Properties.Strings = (
          'Height'
          'Width')
      end
      item
        Component = RzPanel2
        Properties.Strings = (
          'Height'
          'Width')
      end
      item
        Component = Ur_btn
        Properties.Strings = (
          'Height'
          'Width')
      end>
    StorageName = 'fumigator.prop'
    Left = 376
    Top = 104
  end
  object mnuEdit: TPopupMenu
    Left = 616
    Top = 520
    object miEditCli: TMenuItem
      Caption = #1050#1083#1080#1077#1085#1090#1072
      OnClick = miEditCliClick
    end
    object miChangeTypeCli: TMenuItem
      Caption = #1058#1080#1087' '#1082#1083#1080#1077#1085#1090#1072
      OnClick = miChangeTypeCliClick
    end
  end
end
