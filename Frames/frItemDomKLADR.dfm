inherited FrameItemDomKLADR: TFrameItemDomKLADR
  Width = 217
  ExplicitWidth = 217
  DesignSize = (
    217
    30)
  inherited lblName: TLabel
    Width = 24
    Height = 16
    Caption = #1044#1086#1084
    Font.Height = -13
    ExplicitWidth = 24
    ExplicitHeight = 16
  end
  inherited btnEdit: TRzBitBtn
    Left = 182
    Height = 26
    ExplicitLeft = 182
    ExplicitHeight = 26
  end
  inherited edtName: TcxTextEdit
    ExplicitWidth = 80
    ExplicitHeight = 26
    Width = 80
  end
  inherited edtSocr: TcxTextEdit
    ExplicitHeight = 26
  end
  object cmbName: TcxComboBox [4]
    Left = 102
    Top = 4
    TabOrder = 3
    Text = 'cmbName'
    Width = 80
  end
  inherited Query_upd: TIBUpdateSQL
    Left = 57
  end
  inherited Query: TIBQuery
    Left = 25
  end
  inherited DS: TDataSource
    Left = 110
  end
  inherited QuerySearch: TIBQuery
    Left = 144
    Top = 0
  end
end
