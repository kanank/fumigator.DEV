inherited FrameKladrAdrFull: TFrameKladrAdrFull
  Width = 384
  Height = 80
  Visible = False
  ExplicitWidth = 384
  ExplicitHeight = 80
  DesignSize = (
    384
    80)
  object Label8: TLabel [0]
    Left = 3
    Top = 6
    Width = 46
    Height = 18
    Caption = #1056#1077#1075#1080#1086#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel [1]
    Left = 3
    Top = 31
    Width = 74
    Height = 18
    Caption = #1053#1072#1089'. '#1087#1091#1085#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [2]
    Left = 3
    Top = 56
    Width = 40
    Height = 18
    Caption = #1040#1076#1088#1077#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited FrameRegion: TFrameItemKLADR
    Top = 76
    ExplicitTop = 76
    inherited edtName: TcxTextEdit
      ExplicitHeight = 26
    end
    inherited edtSocr: TcxTextEdit
      ExplicitHeight = 26
    end
  end
  inherited FrameCity: TFrameItemKLADR
    Top = 109
    ExplicitTop = 109
    inherited edtName: TcxTextEdit
      ExplicitHeight = 26
    end
    inherited edtSocr: TcxTextEdit
      ExplicitHeight = 26
    end
  end
  inherited FrameSite: TFrameItemKLADR
    Top = 134
    ExplicitTop = 134
    inherited edtName: TcxTextEdit
      ExplicitHeight = 26
    end
    inherited edtSocr: TcxTextEdit
      ExplicitHeight = 26
    end
  end
  inherited FrameStreet: TFrameItemKLADR
    Top = 159
    ExplicitTop = 159
    inherited edtName: TcxTextEdit
      ExplicitHeight = 26
    end
    inherited edtSocr: TcxTextEdit
      ExplicitHeight = 26
    end
  end
  inherited FrameArea: TFrameItemKLADR
    Top = 83
    ExplicitTop = 83
    inherited edtName: TcxTextEdit
      ExplicitHeight = 26
    end
    inherited edtSocr: TcxTextEdit
      ExplicitHeight = 26
    end
  end
  object btnEdit: TRzBitBtn [9]
    Left = 353
    Top = 3
    Width = 30
    Height = 24
    Hint = #1048#1079#1084#1077#1085#1080#1090#1100
    Alignment = taLeftJustify
    Anchors = [akTop, akRight]
    TabOrder = 10
    OnClick = btnEditClick
    ImageIndex = 8
    Images = DataModuleMain.ImgList
    Spacing = 1
  end
  object edtRegion: TcxTextEdit [10]
    Left = 83
    Top = 3
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 7
    Width = 268
  end
  object edtSite: TcxTextEdit [11]
    Left = 83
    Top = 28
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 8
    Width = 268
  end
  object edtAddress: TcxTextEdit [12]
    Left = 83
    Top = 53
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 9
    Width = 269
  end
  inherited FrameDom: TFrameItemDomKLADR
    Top = 186
    ExplicitTop = 186
    inherited edtName: TcxTextEdit
      ExplicitHeight = 26
    end
    inherited edtSocr: TcxTextEdit
      ExplicitHeight = 26
    end
    inherited cmbName: TcxComboBox
      ExplicitHeight = 26
    end
  end
  inherited edtKvartira: TcxTextEdit
    Style.IsFontAssigned = True
    ExplicitHeight = 26
  end
  inherited Query_upd: TIBUpdateSQL
    Top = 114
  end
  inherited Query: TIBQuery
    Top = 74
  end
  inherited DS: TDataSource
    Top = 74
  end
end
