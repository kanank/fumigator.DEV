inherited frmEditRegion: TfrmEditRegion
  Caption = #1042#1099#1073#1086#1088' '#1088#1077#1075#1080#1086#1085#1072
  ClientHeight = 116
  ClientWidth = 268
  OnShow = FormShow
  ExplicitWidth = 274
  ExplicitHeight = 144
  PixelsPerInch = 96
  TextHeight = 18
  inherited lblData: TLabel
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Visible = False
  end
  inherited edtData: TcxDBMaskEdit
    Top = 44
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DataBinding.DataField = 'PHONE'
    Properties.AlwaysShowBlanksAndLiterals = True
    Properties.BeepOnError = True
    Properties.EditMask = '!\(000\)000\-00\-00;0;'#9618
    Visible = False
    ExplicitTop = 44
    ExplicitWidth = 251
    ExplicitHeight = 26
    Width = 251
  end
  inherited btnOK: TRzButton
    Left = 8
    Top = 78
    Width = 100
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ModalResult = 0
    Anchors = [akTop]
    OnClick = btnOKClick
    ExplicitLeft = 8
    ExplicitTop = 78
    ExplicitWidth = 100
  end
  inherited bntCancel: TRzButton
    Left = 159
    Top = 78
    Width = 100
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akTop]
    ExplicitLeft = 159
    ExplicitTop = 78
    ExplicitWidth = 100
  end
  object cmbPhoneType: TcxDBLookupComboBox [4]
    Left = 8
    Top = 11
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DataBinding.DataField = 'REGION_ID'
    DataBinding.DataSource = DS
    Properties.KeyFieldNames = 'REGION_ID'
    Properties.ListColumns = <
      item
        FieldName = 'NAME'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataModuleMain.DsDicRegions
    TabOrder = 3
    Width = 251
  end
  inherited DS: TDataSource
    Left = 133
  end
end
