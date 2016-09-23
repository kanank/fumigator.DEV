inherited FramePhones: TFramePhones
  Width = 222
  Height = 145
  ExplicitWidth = 222
  ExplicitHeight = 145
  DesignSize = (
    222
    145)
  inherited grpPhone: TRzGroupBox
    Left = 4
    Width = 214
    Height = 143
    Anchors = [akLeft, akTop, akBottom]
    ExplicitLeft = 4
    ExplicitWidth = 214
    ExplicitHeight = 143
    DesignSize = (
      214
      143)
    inherited grdPhone: TcxGrid
      Width = 177
      Height = 125
      ExplicitWidth = 177
      ExplicitHeight = 125
      object grdPhoneDBTableView2: TcxGridDBTableView [0]
        Navigator.Buttons.CustomButtons = <>
        OnCellClick = grdPhoneDBTableView2CellClick
        DataController.DataSource = DS
        DataController.KeyFieldNames = 'ID'
        DataController.MasterKeyFieldNames = 'ID'
        DataController.Options = [dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearchItem = grdPhoneDBTableView2Column2
        OptionsBehavior.ColumnHeaderHints = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.CellEndEllipsis = True
        OptionsView.NoDataToDisplayInfoText = '<'#1053#1086#1084#1077#1088#1072' '#1085#1077' '#1076#1086#1073#1072#1074#1083#1077#1085#1099' >'
        OptionsView.ScrollBars = ssVertical
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        object grdPhoneDBTableView2Column1: TcxGridDBColumn
          DataBinding.FieldName = 'ismain'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.DisplayChecked = '1'
          Properties.DisplayUnchecked = '0'
          Properties.ReadOnly = False
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Options.AutoWidthSizable = False
          Options.Moving = False
          Options.ShowCaption = False
          Width = 20
        end
        object grdPhoneDBTableView2Column4: TcxGridDBColumn
          DataBinding.FieldName = 'CODE'
          Options.ShowCaption = False
          Width = 20
        end
        object grdPhoneDBTableView2Column2: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088
          DataBinding.FieldName = 'phone'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.AlwaysShowBlanksAndLiterals = True
          Properties.BeepOnError = True
          Properties.EditMask = '\(999\)000\-00\-00;0;'#9618
          Properties.ValidateOnEnter = False
          Properties.ValidationOptions = [evoShowErrorIcon, evoAllowLoseFocus]
          Options.Editing = False
          Options.Moving = False
          Width = 75
        end
        object grdPhoneDBTableView2Column5: TcxGridDBColumn
          Caption = #1044#1086#1087'.'
          DataBinding.FieldName = 'ADD_NUMBER'
          Options.Editing = False
          Width = 27
        end
        object grdPhoneDBTableView2Column3: TcxGridDBColumn
          Caption = #1058#1080#1087
          DataBinding.FieldName = 'PHONE_TYPE_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownListStyle = lsFixedList
          Properties.GridMode = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'SHORTNAME'
            end>
          Properties.ListOptions.GridLines = glNone
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DataModuleMain.DsDicPhoneType
          Options.Editing = False
          Width = 29
        end
      end
      inherited grdPhoneLevel1: TcxGridLevel
        GridView = grdPhoneDBTableView2
      end
    end
    inherited RzPanel2: TRzPanel
      Left = 182
      Height = 123
      ExplicitLeft = 182
      ExplicitHeight = 123
      DesignSize = (
        31
        123)
      inherited btnAdd: TRzBitBtn
        Left = 0
        Top = -4
        ExplicitLeft = 0
        ExplicitTop = -4
      end
      inherited btnEdit: TRzBitBtn
        Left = 0
        Top = 30
        ExplicitLeft = 0
        ExplicitTop = 30
      end
      inherited btnDel: TRzBitBtn
        Left = 0
        Top = 93
        ExplicitLeft = 0
        ExplicitTop = 93
      end
    end
  end
  inherited Query_upd: TIBUpdateSQL
    ModifySQL.Strings = (
      'update PHONES set '
      'PHONE = :PHONE,'
      'CLIENT_ID = :CLIENT_ID,'
      'ISMAIN = :ISMAIN,'
      '"TYPE" = :TYPE,'
      'PHONE_TYPE_ID = :PHONE_TYPE_ID,'
      'CODE = :CODE,'
      'ADD_NUMBER = :ADD_NUMBER '
      'where id = :ID')
    InsertSQL.Strings = (
      'insert into phones('
      'PHONE,'
      'CLIENT_ID,'
      'ISMAIN,'
      '"TYPE",'
      'PHONE_TYPE_ID,'
      'CODE,'
      'ADD_NUMBER'
      ')'
      'values('
      ':PHONE,'
      ':CLIENT_ID,'
      ':ISMAIN,'
      ':TYPE,'
      ':PHONE_TYPE_ID,'
      ':CODE,'
      ':ADD_NUMBER'
      ')')
    DeleteSQL.Strings = (
      'delete from phones where id = :ID')
  end
  inherited Query: TIBQuery
    AfterPost = QueryAfterPost
    OnNewRecord = QueryNewRecord
    SQL.Strings = (
      'select * from phones where client_id = :client_id and type=0')
    GeneratorField.Generator = 'GEN_PHONES_ID'
    GeneratorField.ApplyEvent = gamOnPost
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'client_id'
        ParamType = ptUnknown
      end>
  end
  object Q_Check: TIBQuery
    Database = DataModuleMain.DB
    Transaction = DataModuleMain.DefTr
    AfterPost = QueryAfterPost
    OnNewRecord = QueryNewRecord
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select c.name from phones p, clients c'
      'where c.id=p.client_id and c.act = 1 and type=:typecli and'
      ' code=:code and phone=:phone')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PHONES_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 136
    Top = 27
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'typecli'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'phone'
        ParamType = ptUnknown
      end>
  end
end
