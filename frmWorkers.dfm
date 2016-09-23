inherited frmWorkers: TfrmWorkers
  Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited RzPanel1: TRzPanel
    inherited Cancel_btn: TRzButton
      Font.Color = clWindowText
    end
    inherited Edit_btn: TRzButton
      Font.Color = clWindowText
      OnClick = Edit_btnClick
    end
    inherited Del_btn: TRzButton
      Font.Color = clWindowText
      OnClick = Del_btnClick
    end
    inherited Add_btn: TRzButton
      Font.Color = clWindowText
      OnClick = Add_btnClick
    end
  end
  inherited Grid: TcxGrid
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
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
  end
end
