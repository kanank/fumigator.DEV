inherited frmDbBaseForm: TfrmDbBaseForm
  Caption = 'frmDbBaseForm'
  ClientHeight = 366
  ClientWidth = 665
  ExplicitWidth = 681
  ExplicitHeight = 404
  DesignSize = (
    665
    366)
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 376
    Top = 291
    ExplicitLeft = 376
    ExplicitTop = 291
  end
  object _Query: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 72
    Top = 24
  end
  object _DS: TDataSource
    DataSet = _Query
    Left = 288
    Top = 40
  end
end
