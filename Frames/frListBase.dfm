inherited FrameListBase: TFrameListBase
  Width = 217
  Height = 122
  ExplicitWidth = 217
  ExplicitHeight = 122
  object grpPhone: TRzGroupBox [0]
    Left = 1
    Top = 0
    Width = 212
    Height = 118
    BorderSides = [sdLeft, sdTop, sdRight]
    Caption = #1058#1077#1083#1077#1092#1086#1085#1099
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -13
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    TabOrder = 0
    DesignSize = (
      212
      118)
    object grdPhone: TcxGrid
      Left = 4
      Top = 16
      Width = 172
      Height = 101
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      object grdPhoneLevel1: TcxGridLevel
      end
    end
    object RzPanel2: TRzPanel
      Left = 180
      Top = 19
      Width = 31
      Height = 98
      Align = alRight
      BorderSides = []
      TabOrder = 1
      DesignSize = (
        31
        98)
      object btnAdd: TRzBitBtn
        Left = 2
        Top = -6
        Width = 28
        Height = 28
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100
        Anchors = [akLeft, akBottom]
        TabOrder = 0
        OnClick = btnAddClick
        ImageIndex = 0
        Images = DataModuleMain.ImgList
      end
      object btnEdit: TRzBitBtn
        Left = 2
        Top = 28
        Width = 28
        Height = 28
        Hint = #1048#1079#1084#1077#1085#1080#1090#1100
        Anchors = [akLeft, akBottom]
        TabOrder = 1
        OnClick = btnEditClick
        ImageIndex = 2
        Images = DataModuleMain.ImgList
      end
      object btnDel: TRzBitBtn
        Left = 2
        Top = 69
        Width = 28
        Height = 28
        Hint = #1059#1076#1072#1083#1080#1090#1100
        Anchors = [akLeft, akBottom]
        TabOrder = 2
        OnClick = btnDelClick
        ImageIndex = 3
        Images = DataModuleMain.ImgList
      end
    end
  end
  inherited Query_upd: TIBUpdateSQL
    Left = 88
    Top = 75
  end
  inherited Query: TIBQuery
    Left = 48
    Top = 75
  end
  inherited DS: TDataSource
    OnDataChange = DSDataChange
    Left = 8
    Top = 75
  end
end
