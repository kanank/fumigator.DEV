inherited frmKLADRList: TfrmKLADRList
  Caption = #1042#1099#1073#1086#1088
  ClientHeight = 377
  ClientWidth = 390
  ExplicitWidth = 396
  ExplicitHeight = 405
  PixelsPerInch = 96
  TextHeight = 18
  inherited lblData: TLabel
    Left = 432
    Top = 11
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Visible = False
    ExplicitLeft = 432
    ExplicitTop = 11
  end
  inherited edtData: TcxDBMaskEdit
    Left = 421
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Visible = False
    ExplicitLeft = 421
    ExplicitWidth = 46
    ExplicitHeight = 26
    Width = 46
  end
  inherited btnOK: TRzButton
    Left = 76
    Top = 338
    Width = 100
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitLeft = 76
    ExplicitTop = 338
    ExplicitWidth = 100
  end
  inherited bntCancel: TRzButton
    Left = 214
    Top = 338
    Width = 100
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitLeft = 214
    ExplicitTop = 338
    ExplicitWidth = 100
  end
  object grid: TcxGrid [4]
    Left = -1
    Top = 0
    Width = 391
    Height = 332
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object gridDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellDblClick = gridDBTableView1CellDblClick
      DataController.DataSource = DS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ScrollBars = ssVertical
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object gridDBTableView1Column1: TcxGridDBColumn
        DataBinding.FieldName = 'SOCR'
        Width = 40
      end
      object gridDBTableView1Column2: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        Width = 222
      end
    end
    object gridLevel1: TcxGridLevel
      GridView = gridDBTableView1
    end
  end
end
