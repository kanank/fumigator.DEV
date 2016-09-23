inherited FrameFoto: TFrameFoto
  Width = 169
  Height = 217
  ExplicitWidth = 169
  ExplicitHeight = 217
  object RzPanel4: TRzPanel [0]
    Left = 1
    Top = 1
    Width = 167
    Height = 213
    Align = alCustom
    Anchors = [akTop]
    BorderInner = fsBump
    BorderOuter = fsFlatRounded
    TabOrder = 0
    DesignSize = (
      167
      213)
    object btnLoad: TRzBitBtn
      Left = 8
      Top = 189
      Width = 73
      Height = 20
      Anchors = [akLeft, akBottom]
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 10811858
      ParentFont = False
      TabOrder = 0
      ThemeAware = False
      OnClick = btnLoadClick
    end
    object btnClear: TRzBitBtn
      Left = 88
      Top = 189
      Width = 73
      Height = 20
      Anchors = [akLeft, akBottom]
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 10811858
      ParentFont = False
      TabOrder = 1
      ThemeAware = False
      OnClick = btnClearClick
    end
    object imgFoto: TcxDBImage
      Left = 4
      Top = 5
      DataBinding.DataField = 'PHOTO'
      DataBinding.DataSource = DS
      Properties.CustomFilter = #1060#1086#1090#1086' (*.jpg)|*.jpg'
      Properties.GraphicClassName = 'TdxSmartImage'
      Properties.PopupMenuLayout.MenuItems = [pmiCopy, pmiPaste, pmiDelete, pmiLoad]
      TabOrder = 2
      Transparent = True
      Height = 183
      Width = 158
    end
  end
  inherited Query_upd: TIBUpdateSQL
    ModifySQL.Strings = (
      'update PHOTOS set '
      'NAME = NAME :, '
      'PHOTO = :PHOTO'
      'where id = :ID')
    InsertSQL.Strings = (
      'insert into photos (id, name, photo)'
      'values(:id, :name, :photo)')
    DeleteSQL.Strings = (
      'delete from photos where id = :id')
    Left = 120
    Top = 136
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'select * from photos where id = :id')
    GeneratorField.Generator = 'GEN_PHOTOS_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 120
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  inherited DS: TDataSource
    Left = 88
    Top = 96
  end
end
