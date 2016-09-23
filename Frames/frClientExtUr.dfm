inherited FrameClientExtUr: TFrameClientExtUr
  Width = 601
  Height = 245
  ExplicitWidth = 601
  ExplicitHeight = 245
  object Label1: TLabel [0]
    Left = 3
    Top = 10
    Width = 117
    Height = 18
    Caption = #1055#1088#1072#1074#1086#1074#1072#1103' '#1092#1086#1088#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 201
    Top = 10
    Width = 45
    Height = 18
    Caption = #1057#1092#1077#1088#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 378
    Top = 163
    Width = 24
    Height = 16
    Caption = #1048#1053#1053
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel [3]
    Left = 378
    Top = 190
    Width = 23
    Height = 16
    Caption = #1050#1055#1055
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel [4]
    Left = 378
    Top = 217
    Width = 31
    Height = 16
    Caption = #1054#1043#1056#1053
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object cxDBMaskEdit1: TcxDBMaskEdit [5]
    Left = 410
    Top = 160
    DataBinding.DataField = 'INN'
    DataBinding.DataSource = DS
    Properties.MaskKind = emkRegExprEx
    Properties.EditMask = '\d\d\d\d '#39' '#39' \d\d\d\d\d\d'
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 0
    Width = 178
  end
  object cxDBMaskEdit3: TcxDBMaskEdit [6]
    Left = 410
    Top = 187
    DataBinding.DataField = 'KPP'
    DataBinding.DataSource = DS
    Properties.MaskKind = emkRegExprEx
    Properties.EditMask = '\d\d\d\d '#39' '#39' \d\d\d\d\d\d'
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 1
    Width = 178
  end
  object cxDBMaskEdit4: TcxDBMaskEdit [7]
    Left = 410
    Top = 214
    DataBinding.DataField = 'OGRN'
    DataBinding.DataSource = DS
    Properties.MaskKind = emkRegExprEx
    Properties.EditMask = '\d\d\d\d '#39' '#39' \d\d\d\d\d\d'
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 2
    Width = 178
  end
  object cmbForma: TcxDBLookupComboBox [8]
    Left = 124
    Top = 7
    DataBinding.DataField = 'FORMA_ID'
    DataBinding.DataSource = DS
    Properties.KeyFieldNames = 'ID'
    Properties.ListColumns = <
      item
        FieldName = 'NAME'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataModuleMain.DsDicUrForm
    Properties.ReadOnly = False
    TabOrder = 3
    Width = 68
  end
  object cmbSfera: TcxDBLookupComboBox [9]
    Left = 249
    Top = 7
    DataBinding.DataField = 'SPHERA_ID'
    DataBinding.DataSource = DS
    Properties.KeyFieldNames = 'ID'
    Properties.ListColumns = <
      item
        FieldName = 'NAME'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataModuleMain.DsDicCliSfera
    TabOrder = 4
    Width = 68
  end
  inline FrameRekvizits: TFrameRekvizits [10]
    Left = 378
    Top = 3
    Width = 220
    Height = 151
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    ExplicitLeft = 378
    ExplicitTop = 3
    ExplicitHeight = 151
    inherited RzGroupBox1: TRzGroupBox
      Height = 152
      ExplicitHeight = 152
      inherited cxDBMaskEdit1: TcxDBMaskEdit
        ExplicitHeight = 26
      end
      inherited cxDBTextEdit1: TcxDBTextEdit
        ExplicitHeight = 26
      end
      inherited cxDBMaskEdit2: TcxDBMaskEdit
        Left = 32
        ExplicitLeft = 32
        ExplicitHeight = 26
      end
    end
    inherited cxDBMaskEdit3: TcxDBMaskEdit
      ExplicitHeight = 26
    end
  end
  inherited Query_upd: TIBUpdateSQL [11]
    RefreshSQL.Strings = (
      'select * from CLIENTS_EXT_UR where id = :id')
    ModifySQL.Strings = (
      'update CLIENTS_EXT_UR set '
      'CLIENT_ID = :CLIENT_ID,'
      'REKVIZIT_ID = :REKVIZIT_ID,'
      'FORMA_ID = :FORMA_ID,'
      'SPHERA_ID = :SPHERA_ID,'
      'INN = :INN,'
      'KPP = :KPP,'
      'OGRN = :OGRN'
      'where id = :ID')
    InsertSQL.Strings = (
      'insert into CLIENTS_EXT_UR('
      'CLIENT_ID,'
      'REKVIZIT_ID,'
      'FORMA_ID,'
      'SPHERA_ID,'
      'INN,'
      'KPP,'
      'OGRN)'
      'values('
      ':CLIENT_ID,'
      ':REKVIZIT_ID,'
      ':FORMA_ID,'
      ':SPHERA_ID,'
      ':INN,'
      ':KPP,'
      ':OGRN'
      ')')
    DeleteSQL.Strings = (
      'delete from CLIENTS_EXT_UR where id = :id ')
    Top = 72
  end
  inherited Query: TIBQuery [12]
    SQL.Strings = (
      'select * from CLIENTS_EXT_UR where client_id = :client_id')
    GeneratorField.Generator = 'GEN_CLIENTS_EXT_UR_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'client_id'
        ParamType = ptUnknown
      end>
  end
  inherited DS: TDataSource
    Top = 32
  end
end
