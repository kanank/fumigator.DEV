inherited frmSimpleSprType: TfrmSimpleSprType
  Caption = 'frmSimpleSprType'
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [2]
    Left = 5
    Top = 72
    Width = 18
    Height = 13
    Caption = #1058#1080#1087
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited RzPanel1: TRzPanel
    inherited Image2: TImage
      Visible = False
    end
    inherited Exit_bnt: TRzButton
      Caption = 'OK'
      ExplicitLeft = 66
    end
    inherited btnCancel: TRzButton
      ExplicitLeft = 263
    end
  end
  object cmbLookup: TcxDBLookupComboBox [5]
    Left = 96
    Top = 69
    DataBinding.DataField = 'TYPE_ID'
    DataBinding.DataSource = DS
    Properties.KeyFieldNames = 'ID'
    Properties.ListColumns = <
      item
        FieldName = 'NAME'
      end>
    Properties.ListOptions.AnsiSort = True
    Properties.ListOptions.CaseInsensitive = True
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DsLookup
    TabOrder = 2
    Width = 188
  end
  object btnAdd: TRzBitBtn [6]
    Left = 285
    Top = 68
    Width = 29
    Height = 21
    Hint = #1044#1086#1073#1072#1074#1080#1090#1100
    Margins.Left = 0
    Margins.Right = 0
    Caption = ' '
    TabOrder = 3
    OnClick = btnAddClick
    ImageIndex = 0
    Images = DataModuleMain.ImgList
    Spacing = 0
  end
  object DsLookup: TDataSource
    AutoEdit = False
    Left = 16
    Top = 112
  end
end
