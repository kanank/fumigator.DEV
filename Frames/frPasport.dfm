inherited FramePassport: TFramePassport
  Width = 226
  Height = 140
  ExplicitWidth = 226
  ExplicitHeight = 140
  object RzGroupBox1: TRzGroupBox [0]
    Left = 0
    Top = 0
    Width = 224
    Height = 140
    Caption = #1055#1072#1089#1087#1086#1088#1090#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -13
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 19
      Width = 87
      Height = 16
      Caption = #1057#1077#1088#1080#1103' '#1080' '#1085#1086#1084#1077#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 13
      Top = 44
      Width = 74
      Height = 16
      Caption = #1050#1086#1075#1076#1072' '#1074#1099#1076#1072#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 13
      Top = 69
      Width = 115
      Height = 16
      Caption = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 13
      Top = 91
      Width = 63
      Height = 16
      Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtNomer: TcxDBMaskEdit
      Left = 130
      Top = 16
      DataBinding.DataField = 'PASS_NUM'
      DataBinding.DataSource = DS
      Properties.EditMask = '9999 999999;0;'#9618
      Properties.MaxLength = 0
      Properties.ValidationOptions = [evoShowErrorIcon]
      TabOrder = 0
      Width = 90
    end
    object cmbDate: TcxDBDateEdit
      Left = 130
      Top = 41
      DataBinding.DataField = 'PASS_DATE'
      DataBinding.DataSource = DS
      TabOrder = 1
      Width = 90
    end
    object edtKem: TcxDBMemo
      Left = 13
      Top = 106
      DataBinding.DataField = 'PASS_ORG'
      DataBinding.DataSource = DS
      Properties.MaxLength = 128
      Properties.ValidationOptions = [evoShowErrorIcon]
      TabOrder = 2
      Height = 28
      Width = 207
    end
    object edtCode: TcxDBMaskEdit
      Left = 130
      Top = 68
      DataBinding.DataField = 'PASS_CODE'
      DataBinding.DataSource = DS
      Properties.EditMask = '999\-999;0;'#9618
      Properties.MaxLength = 0
      Properties.ValidationOptions = [evoShowErrorIcon]
      TabOrder = 3
      Width = 90
    end
  end
  inherited Query_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'select * from PASSPORTS where id = :NEW_ID')
    ModifySQL.Strings = (
      'update PASSPORTS set '
      '  PASS_NUM =  :PASS_NUM ,'
      '  PASS_ORG =  :PASS_ORG ,'
      '  PASS_DATE = :PASS_DATE ,'
      '  PASS_CODE = :PASS_CODE '
      'where id = :ID')
    InsertSQL.Strings = (
      'insert into PASSPORTS('
      'ID,'
      'PASS_NUM,'
      'PASS_ORG,'
      'PASS_DATE,'
      'PASS_CODE'
      ') '
      'values('
      ':ID,'
      ':PASS_NUM,'
      ':PASS_ORG,'
      ':PASS_DATE,'
      ':PASS_CODE'
      ')')
    DeleteSQL.Strings = (
      'delete from PASSPORTS where id= :OLD_ID')
    Left = 176
    Top = 96
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'select * from passports where id = :id')
    GeneratorField.Generator = 'GEN_PASSPORTS_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 144
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  inherited DS: TDataSource
    Left = 104
    Top = 96
  end
end
