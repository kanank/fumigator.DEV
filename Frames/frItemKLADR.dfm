inherited FrameItemKLADR: TFrameItemKLADR
  Width = 334
  Height = 30
  ExplicitWidth = 334
  ExplicitHeight = 30
  DesignSize = (
    334
    30)
  object lblName: TLabel [0]
    Left = 2
    Top = 9
    Width = 35
    Height = 16
    Caption = #1040#1076#1088#1077#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnEdit: TRzBitBtn [1]
    Left = 301
    Top = 3
    Width = 30
    Height = 26
    Hint = #1048#1079#1084#1077#1085#1080#1090#1100
    Alignment = taLeftJustify
    Anchors = [akTop, akRight]
    TabOrder = 0
    OnClick = btnEditClick
    ImageIndex = 9
    Images = DataModuleMain.ImgList
    Spacing = 1
  end
  object edtName: TcxTextEdit [2]
    Left = 102
    Top = 3
    TabOrder = 1
    OnKeyPress = edtNameKeyPress
    Width = 199
  end
  object edtSocr: TcxTextEdit [3]
    Left = 67
    Top = 3
    Enabled = False
    Style.BorderStyle = ebsNone
    Style.Color = clBtnFace
    Style.HotTrack = False
    Style.Shadow = False
    StyleDisabled.TextColor = clCaptionText
    TabOrder = 2
    Width = 33
  end
  inherited Query_upd: TIBUpdateSQL
    Left = 153
    Top = 0
  end
  inherited Query: TIBQuery
    BeforeOpen = QueryBeforeOpen
    UpdateObject = nil
    Left = 121
    Top = 0
  end
  inherited DS: TDataSource
    Left = 193
    Top = 0
  end
  object QuerySearch: TIBQuery
    Database = DataModuleMain.DB
    Transaction = DataModuleMain.DefTr
    BeforeOpen = QuerySearchBeforeOpen
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    Left = 233
    Top = 2
  end
end
