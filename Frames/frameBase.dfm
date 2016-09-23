object DbFrameBase: TDbFrameBase
  Left = 0
  Top = 0
  Width = 289
  Height = 127
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object Query_upd: TIBUpdateSQL
    ModifySQL.Strings = (
      'update PERSONS set '
      'NAME = NAME :, '
      'SURNAME = :SURNAME , '
      'FAMILY = :FAMILY , '
      'DATE_BIRTH = :DATE_BIRTH , '
      'SEX = :SEX'
      'where id = :ID')
    InsertSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      '')
    Left = 256
    Top = 64
  end
  object Query: TIBQuery
    Database = DataModuleMain.DB
    Transaction = DataModuleMain.DefTr
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    UpdateObject = Query_upd
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PERSONS_ID'
    GeneratorField.ApplyEvent = gamOnServer
    Left = 256
    Top = 24
  end
  object DS: TDataSource
    Left = 224
    Top = 24
  end
end
