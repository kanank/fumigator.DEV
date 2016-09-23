inherited frmDictionaries: TfrmDictionaries
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
  ClientHeight = 480
  ClientWidth = 1070
  Position = poDesktopCenter
  OnShow = FormShow
  ExplicitLeft = -204
  ExplicitWidth = 1086
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 18
  inherited img1: TImage
    Left = 855
    Top = 122
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Visible = False
    ExplicitLeft = 1069
    ExplicitTop = -7
  end
  inherited RzPanel1: TRzPanel
    Top = 429
    Width = 1070
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitWidth = 1284
    inherited Image2: TImage
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      ExplicitLeft = 79
      ExplicitTop = 2
      ExplicitHeight = 47
    end
    inherited Exit_bnt: TRzButton
      Left = 897
      Top = 5
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      ExplicitLeft = 897
      ExplicitTop = 5
    end
  end
  object GridUserTypes: TcxGrid
    Left = 9
    Top = 9
    Width = 250
    Height = 367
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 1
    OnEnter = GridUserTypesEnter
    object cxGridDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.InfoPanel.Visible = True
      DataController.DataSource = DataModuleMain.DSDicUserTypes
      DataController.Options = [dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.FocusRect = False
      OptionsView.NoDataToDisplayInfoText = '<'#1057#1087#1080#1089#1086#1082' '#1087#1091#1089#1090'>'
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      object cxGridDBColumn1: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.IgnoreTimeForFiltering = False
        Options.ShowEditButtons = isebNever
        Options.AutoWidthSizable = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.Moving = False
        Styles.Header = cxStyle1
        Width = 224
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object pnlEdit: TRzPanel
    Left = 9
    Top = 377
    Width = 250
    Height = 42
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alCustom
    BorderInner = fsStatus
    BorderOuter = fsPopup
    TabOrder = 2
    DesignSize = (
      250
      42)
    object btnAdd: TRzBitBtn
      Left = 3
      Top = 2
      Width = 38
      Height = 39
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 0
      OnClick = btnAddClick
      ImageIndex = 0
      Images = DataModuleMain.ImgList
      Margin = 3
      Spacing = 6
    end
    object btnEdit: TRzBitBtn
      Left = 46
      Top = 3
      Width = 39
      Height = 39
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 1
      OnClick = btnEditClick
      ImageIndex = 2
      Images = DataModuleMain.ImgList
      Margin = 3
      Spacing = 6
    end
    object btnDel: TRzBitBtn
      Left = 206
      Top = 2
      Width = 39
      Height = 39
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akTop, akRight]
      TabOrder = 2
      OnClick = btnDelClick
      ImageIndex = 3
      Images = DataModuleMain.ImgList
      Margin = 3
      Spacing = 6
    end
  end
  object GridProfs: TcxGrid
    Left = 277
    Top = 9
    Width = 250
    Height = 367
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 3
    OnEnter = GridUserTypesEnter
    object cxGridDBTableView2: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.InfoPanel.Visible = True
      DataController.DataSource = DataModuleMain.DSDicWorkerProfs
      DataController.Options = [dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.FocusRect = False
      OptionsView.NoDataToDisplayInfoText = '<'#1057#1087#1080#1089#1086#1082' '#1087#1091#1089#1090'>'
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      object cxGridDBColumn2: TcxGridDBColumn
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1080
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.IgnoreTimeForFiltering = False
        Options.ShowEditButtons = isebNever
        Options.AutoWidthSizable = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.Moving = False
        Styles.Header = cxStyle1
        Width = 224
      end
    end
    object cxGridLevel2: TcxGridLevel
      GridView = cxGridDBTableView2
    end
  end
  object GridMaterials: TcxGrid
    Left = 545
    Top = 9
    Width = 250
    Height = 367
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 4
    OnEnter = GridUserTypesEnter
    object cxGridDBTableView3: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.InfoPanel.Visible = True
      DataController.DataSource = DataModuleMain.DSDicMaterials
      DataController.Options = [dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.FocusRect = False
      OptionsView.NoDataToDisplayInfoText = '<'#1057#1087#1080#1089#1086#1082' '#1087#1091#1089#1090'>'
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      object cxGridDBColumn3: TcxGridDBColumn
        Caption = #1056#1072#1089#1093#1086#1076#1085#1099#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1099
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.IgnoreTimeForFiltering = False
        Options.ShowEditButtons = isebNever
        Options.AutoWidthSizable = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.Moving = False
        Styles.Header = cxStyle1
        Width = 205
      end
    end
    object cxGridLevel3: TcxGridLevel
      GridView = cxGridDBTableView3
    end
  end
  object GridServices: TcxGrid
    Left = 812
    Top = 9
    Width = 250
    Height = 367
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 5
    OnEnter = GridUserTypesEnter
    object cxGridDBTableView4: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.InfoPanel.Visible = True
      DataController.DataSource = DataModuleMain.DSDicServices
      DataController.Options = [dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.FocusRect = False
      OptionsView.NoDataToDisplayInfoText = '<'#1057#1087#1080#1089#1086#1082' '#1087#1091#1089#1090'>'
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      object cxGridDBColumn4: TcxGridDBColumn
        Caption = #1059#1089#1083#1091#1075#1080
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.IgnoreTimeForFiltering = False
        Options.ShowEditButtons = isebNever
        Options.AutoWidthSizable = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.Moving = False
        Styles.Header = cxStyle1
        Width = 205
      end
    end
    object cxGridLevel4: TcxGridLevel
      GridView = cxGridDBTableView4
    end
  end
  object tvMaterials: TdxDBTreeView
    Left = 545
    Top = 28
    Width = 250
    Height = 348
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ShowNodeHint = True
    RowSelect = True
    DataSource = DataModuleMain.DSDicMaterials
    DisplayField = 'NAME'
    KeyField = 'ID'
    ListField = 'NAME'
    ParentField = 'PARENT'
    RootValue = 0
    SeparatedSt = ' - '
    RaiseOnError = True
    ReadOnly = True
    HideSelection = False
    Indent = 19
    ParentColor = False
    Options = [trDBConfirmDelete, trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
    SelectedIndex = -1
    TabOrder = 6
    OnEnter = tvMaterialsEnter
  end
  object cxStyleRepository1: TcxStyleRepository
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
end
