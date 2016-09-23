inherited FrameGoods: TFrameGoods
  Width = 179
  Height = 152
  ExplicitWidth = 179
  ExplicitHeight = 152
  DesignSize = (
    179
    152)
  inherited grpPhone: TRzGroupBox
    Width = 176
    Height = 148
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    Caption = #1058#1086#1074#1072#1088#1099
    ExplicitWidth = 176
    ExplicitHeight = 148
    DesignSize = (
      176
      148)
    inherited grdPhone: TcxGrid
      Width = 166
      Height = 95
      Anchors = [akLeft, akTop, akRight, akBottom]
      ExplicitWidth = 166
      ExplicitHeight = 95
      object grdPhoneDBTableView1: TcxGridDBTableView [0]
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DS
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = grdPhoneDBTableView1Column1
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = '<'#1059#1089#1083#1091#1075#1080' '#1085#1077' '#1074#1099#1073#1088#1072#1085#1099'>'
        OptionsView.ScrollBars = ssVertical
        OptionsView.GridLines = glNone
        OptionsView.GroupByBox = False
        object grdPhoneDBTableView1Column1: TcxGridDBColumn
          DataBinding.FieldName = 'SERVICE_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.GridMode = True
          Properties.HideSelection = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListSource = DataModuleMain.DSDicServices
          Options.Editing = False
          Width = 160
          IsCaptionAssigned = True
        end
      end
      inherited grdPhoneLevel1: TcxGridLevel
        GridView = grdPhoneDBTableView1
      end
    end
    inherited RzPanel2: TRzPanel
      Left = 1
      Top = 116
      Width = 174
      Height = 31
      Align = alBottom
      ExplicitLeft = 1
      ExplicitTop = 116
      ExplicitWidth = 174
      ExplicitHeight = 31
      DesignSize = (
        174
        31)
      inherited btnAdd: TRzBitBtn
        Top = 1
        Width = 39
        Align = alCustom
        OnClick = btnEditClick
        ImageIndex = 6
        Layout = blGlyphTop
        ExplicitTop = 1
        ExplicitWidth = 39
      end
      inherited btnEdit: TRzBitBtn
        Left = 85
        Top = 2
        Width = 46
        Align = alCustom
        Visible = False
        Layout = blGlyphTop
        ExplicitLeft = 85
        ExplicitTop = 2
        ExplicitWidth = 46
      end
      inherited btnDel: TRzBitBtn
        Left = 137
        Top = 1
        Anchors = [akTop, akRight]
        ExplicitLeft = 137
        ExplicitTop = 1
      end
    end
  end
  inherited Query_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'select * from services_client where id = :id')
    ModifySQL.Strings = (
      '')
    InsertSQL.Strings = (
      'insert into services_client ('
      'id, '
      'service_id, '
      'client_id'
      ') '
      'values('
      ':id, '
      ':service_id, '
      ':client_id'
      ')')
    DeleteSQL.Strings = (
      'delete from id, service_id, client_id where id = :id')
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'select * from  services_client where client_id = :client_id')
    GeneratorField.Generator = 'GEN_CLIENT_SERVICES_ID'
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'client_id'
        ParamType = ptUnknown
      end>
  end
end
