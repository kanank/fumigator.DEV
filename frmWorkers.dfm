inherited frmWorkers: TfrmWorkers
  Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
  ClientHeight = 489
  ClientWidth = 660
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitWidth = 676
  ExplicitHeight = 527
  PixelsPerInch = 96
  TextHeight = 18
  inherited img1: TImage
    Left = 639
    Top = 483
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitLeft = 639
    ExplicitTop = 483
  end
  inherited RzPanel2: TRzPanel
    Width = 660
    Height = 28
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitWidth = 660
    ExplicitHeight = 28
    inherited Image1: TImage
      Left = 772
      Top = -15
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      ExplicitLeft = 772
      ExplicitTop = -15
    end
  end
  inherited RzPanel1: TRzPanel
    Top = 440
    Width = 660
    Height = 49
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitTop = 440
    ExplicitWidth = 660
    ExplicitHeight = 49
    inherited Cancel_btn: TRzButton
      Left = 718
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Font.Color = clWindowText
      ExplicitLeft = 718
    end
    inherited Edit_btn: TRzButton
      Top = 5
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Font.Color = clWindowText
      OnClick = Edit_btnClick
      ExplicitTop = 5
    end
    inherited Del_btn: TRzButton
      Left = 480
      Top = 5
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Font.Color = clWindowText
      OnClick = Del_btnClick
      ExplicitLeft = 480
      ExplicitTop = 5
    end
    inherited Add_btn: TRzButton
      Top = 5
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Font.Color = clWindowText
      OnClick = Add_btnClick
      ExplicitTop = 5
    end
  end
  inherited Grid: TcxGrid
    Top = 28
    Width = 660
    Height = 412
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alClient
    ExplicitTop = 28
    ExplicitWidth = 660
    ExplicitHeight = 412
    inherited GridView: TcxGridDBTableView
      FilterBox.CustomizeDialog = False
      DataController.DataSource = DataModuleMain.DSWorkers
      DataController.DetailKeyFieldNames = 'ID'
      Filtering.ColumnFilteredItemsList = True
      FilterRow.InfoText = #1065#1077#1083#1082#1085#1080#1090#1077' '#1089#1102#1076#1072' '#1076#1083#1103' '#1091#1090#1072#1085#1086#1074#1082#1080' '#1092#1080#1083#1100#1090#1088#1072
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = GridViewColumn2
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      Styles.Header = StyleHeader
      object GridViewColumn1: TcxGridDBColumn
        Caption = #1058#1072#1073'. '#1085#1086#1084#1077#1088
        DataBinding.FieldName = 'TABELNUM'
        HeaderAlignmentHorz = taCenter
        Styles.Header = StyleHeader
        Width = 76
      end
      object GridViewColumn2: TcxGridDBColumn
        Caption = #1060#1072#1084#1080#1083#1080#1103
        DataBinding.FieldName = 'FAMILY'
        HeaderAlignmentHorz = taCenter
        Width = 161
      end
      object GridViewColumn3: TcxGridDBColumn
        Caption = #1048#1084#1103
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        Width = 103
      end
      object GridViewColumn4: TcxGridDBColumn
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        DataBinding.FieldName = 'SURNAME'
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridViewColumn5: TcxGridDBColumn
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        DataBinding.FieldName = 'PROFESSION_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.GridMode = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListSource = DataModuleMain.DSDicWorkerProfs
        HeaderAlignmentHorz = taCenter
        Width = 118
      end
      object GridViewColumn6: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'PHONE'
        HeaderAlignmentHorz = taCenter
        Width = 78
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
    end
    object StyleHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInactiveCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
  end
end
