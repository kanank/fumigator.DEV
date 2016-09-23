inherited frmSelectService: TfrmSelectService
  Left = 253
  Top = 27
  Caption = #1042#1099#1073#1086#1088' '#1091#1089#1083#1091#1075
  ClientHeight = 440
  ClientWidth = 284
  OnShow = FormShow
  ExplicitWidth = 290
  ExplicitHeight = 468
  PixelsPerInch = 96
  TextHeight = 18
  inherited lblData: TLabel
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Visible = False
  end
  inherited edtData: TcxDBMaskEdit
    Top = 30
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DataBinding.DataField = ''
    DataBinding.DataSource = nil
    Visible = False
    ExplicitTop = 30
    ExplicitHeight = 26
  end
  inherited btnOK: TRzButton
    Left = 1
    Top = 399
    Width = 100
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akBottom]
    ExplicitLeft = 1
    ExplicitTop = 399
    ExplicitWidth = 100
  end
  inherited bntCancel: TRzButton
    Left = 182
    Top = 402
    Width = 100
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akRight, akBottom]
    ExplicitLeft = 182
    ExplicitTop = 402
    ExplicitWidth = 100
  end
  object grdService: TcxGrid [4]
    Left = 1
    Top = -1
    Width = 281
    Height = 394
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object grdServiceDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ScrollBars = ssVertical
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object grdServiceDBTableView1Column1: TcxGridDBColumn
        DataBinding.FieldName = 'sel'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = '1'
        Properties.DisplayUnchecked = '0'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Options.Grouping = False
        Options.Moving = False
        Options.ShowCaption = False
        Width = 25
      end
      object grdServiceDBTableView1Column2: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        Options.Editing = False
        Width = 174
      end
    end
    object grdServiceLevel1: TcxGridLevel
      GridView = grdServiceDBTableView1
    end
  end
  object MemServices: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 86
    Top = 290
  end
end
