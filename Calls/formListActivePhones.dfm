inherited frmListActivePhones: TfrmListActivePhones
  BorderIcons = [biSystemMenu]
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1072#1073#1086#1085#1077#1085#1090#1072
  ClientHeight = 282
  ClientWidth = 229
  Position = poDesktopCenter
  ExplicitWidth = 245
  ExplicitHeight = 320
  PixelsPerInch = 96
  TextHeight = 18
  inherited img1: TImage
    Left = 219
    Top = -76
  end
  inherited RzPanel1: TRzPanel
    Top = 246
    Width = 229
    Height = 36
    ExplicitTop = 323
    ExplicitWidth = 229
    ExplicitHeight = 36
    inherited Image2: TImage
      Height = 32
      Visible = False
      ExplicitTop = 2
    end
    inherited Exit_bnt: TRzButton
      Left = 290
    end
    object RzButton1: TRzButton
      Left = 4
      Top = 5
      Width = 90
      Height = 28
      Default = True
      ModalResult = 1
      Caption = 'OK'
      TabOrder = 1
    end
    object RzButton2: TRzButton
      Left = 132
      Top = 5
      Width = 90
      Height = 28
      Cancel = True
      ModalResult = 2
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 2
    end
  end
  object grid: TcxGrid
    Left = 0
    Top = 0
    Width = 229
    Height = 246
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
    TabOrder = 1
    ExplicitTop = 1
    ExplicitWidth = 294
    ExplicitHeight = 165
    object gridDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GridLines = glVertical
      OptionsView.GroupByBox = False
      object gridDBTableView1Column1: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088
        DataBinding.FieldName = 'phone'
        HeaderAlignmentHorz = taCenter
        Styles.Header = DataModuleMain.cxStyle1
        Width = 68
      end
      object gridDBTableView1Column2: TcxGridDBColumn
        Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
        DataBinding.FieldName = 'worker_id'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'SHORT_NAME'
          end>
        Properties.ListSource = DataModuleMain.DSWorkers
        HeaderAlignmentHorz = taCenter
        Styles.Header = DataModuleMain.cxStyle1
        Width = 146
      end
    end
    object gridLevel1: TcxGridLevel
      GridView = gridDBTableView1
    end
  end
  object DS: TDataSource
    DataSet = DataModuleMain.ActivePhones
    Left = 344
    Top = 16
  end
end
