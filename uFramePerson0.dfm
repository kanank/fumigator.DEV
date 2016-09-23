object FramePerson0: TFramePerson0
  Left = 0
  Top = 0
  Width = 291
  Height = 129
  TabOrder = 0
  DesignSize = (
    291
    129)
  object Label11: TLabel
    Left = 7
    Top = 8
    Width = 44
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 7
    Top = 32
    Width = 19
    Height = 13
    Caption = #1048#1084#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 7
    Top = 56
    Width = 49
    Height = 13
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 6
    Top = 81
    Width = 80
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 203
    Top = 81
    Width = 19
    Height = 13
    Caption = #1055#1086#1083
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 7
    Top = 106
    Width = 68
    Height = 13
    Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtSurName: TcxDBTextEdit
    Left = 63
    Top = 53
    Anchors = [akLeft, akTop, akRight]
    BeepOnEnter = False
    DataBinding.DataField = 'SURNAME'
    DataBinding.DataSource = DS
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    Style.TransparentBorder = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 0
    Width = 218
  end
  object edtName: TcxDBTextEdit
    Left = 63
    Top = 29
    Anchors = [akLeft, akTop, akRight]
    BeepOnEnter = False
    DataBinding.DataField = 'NAME'
    DataBinding.DataSource = DS
    Style.BorderStyle = ebsFlat
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    Style.TransparentBorder = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 1
    Width = 218
  end
  object edtFamily: TcxDBTextEdit
    Left = 63
    Top = 5
    Anchors = [akLeft, akTop, akRight]
    BeepOnEnter = False
    DataBinding.DataField = 'FAMILY'
    DataBinding.DataSource = DS
    Style.HotTrack = False
    Style.LookAndFeel.NativeStyle = True
    Style.TransparentBorder = True
    StyleDisabled.Color = clBtnFace
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 2
    Width = 218
  end
  object cmbDateBirth: TcxDBDateEdit
    Left = 92
    Top = 78
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'DATE_BIRTH'
    DataBinding.DataSource = DS
    TabOrder = 3
    Width = 64
  end
  object cmbSex: TcxDBComboBox
    Left = 228
    Top = 78
    DataBinding.DataField = 'SEX'
    DataBinding.DataSource = DS
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      #1046
      #1052)
    Properties.ReadOnly = False
    TabOrder = 4
    Width = 53
  end
  object edtCitizen: TcxDBTextEdit
    Left = 80
    Top = 103
    Anchors = [akLeft, akTop, akRight]
    BeepOnEnter = False
    DataBinding.DataField = 'CITIZEN'
    DataBinding.DataSource = DS
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    Style.TransparentBorder = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 5
    Width = 76
  end
  object DS: TDataSource
    Left = 232
    Top = 96
  end
  object Query: TIBQuery
    Database = DataModuleMain.DB
    Transaction = DataModuleMain.DefTr
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select id, name, surname, family, date_birth, sex '
      'from persons where id = :id')
    UpdateObject = Query_upd
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PERSONS_ID'
    GeneratorField.ApplyEvent = gamOnServer
    Left = 176
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object Query_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      
        'select name, surname, family, date_birth, sex from PERSONS where' +
        ' id = :NEW_ID')
    ModifySQL.Strings = (
      'update PERSONS set '
      'NAME = NAME :, '
      'SURNAME = :SURNAME , '
      'FAMILY = :FAMILY , '
      'DATE_BIRTH = :DATE_BIRTH , '
      'SEX = :SEX'
      'where id = :ID')
    InsertSQL.Strings = (
      'insert into PERSONS(name, surname, family, date_birth, sex) '
      'values(:name, :surname, :family, ;date_birth, :sex)')
    DeleteSQL.Strings = (
      'delete from PERSONS where id= :OLD_ID')
    Left = 128
    Top = 96
  end
end
