inherited frmEditPhone: TfrmEditPhone
  Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
  ClientHeight = 227
  ClientWidth = 233
  OnShow = FormShow
  ExplicitWidth = 239
  ExplicitHeight = 255
  PixelsPerInch = 96
  TextHeight = 18
  inherited lblData: TLabel
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Visible = False
  end
  object Label2: TLabel [1]
    Left = 11
    Top = 137
    Width = 26
    Height = 18
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #1058#1080#1087
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel [2]
    Left = 11
    Top = 42
    Width = 59
    Height = 18
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #1058#1077#1083'. '#1082#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [3]
    Left = 11
    Top = 104
    Width = 84
    Height = 18
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #1044#1086#1073#1072#1074#1086#1095#1085#1099#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited edtData: TcxDBMaskEdit
    Left = 9
    Top = 68
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DataBinding.DataField = 'PHONE'
    Properties.AlwaysShowBlanksAndLiterals = True
    Properties.BeepOnError = True
    Properties.EditMask = '!\(000\)000\-00\-00;0;'#9618
    ExplicitLeft = 9
    ExplicitTop = 68
    ExplicitWidth = 213
    ExplicitHeight = 26
    Width = 213
  end
  inherited btnOK: TRzButton
    Left = 9
    Top = 180
    Width = 90
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ModalResult = 0
    Anchors = [akTop]
    OnClick = btnOKClick
    ExplicitLeft = 9
    ExplicitTop = 180
    ExplicitWidth = 90
  end
  inherited bntCancel: TRzButton
    Left = 132
    Top = 180
    Width = 90
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akTop]
    ExplicitLeft = 132
    ExplicitTop = 180
    ExplicitWidth = 90
  end
  object chbkIsMain: TcxDBCheckBox [7]
    Left = 7
    Top = 3
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    AutoSize = False
    Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1085#1086#1084#1077#1088
    DataBinding.DataField = 'ISMAIN'
    DataBinding.DataSource = DS
    ParentShowHint = False
    Properties.DisplayChecked = '1'
    Properties.DisplayUnchecked = '0'
    Properties.ValueChecked = '1'
    Properties.ValueUnchecked = '0'
    ShowHint = True
    TabOrder = 3
    Transparent = True
    Height = 29
    Width = 167
  end
  object cmbPhoneType: TcxDBLookupComboBox [8]
    Left = 60
    Top = 133
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DataBinding.DataField = 'PHONE_TYPE_ID'
    DataBinding.DataSource = DS
    Properties.KeyFieldNames = 'ID'
    Properties.ListColumns = <
      item
        FieldName = 'NAME'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataModuleMain.DsDicPhoneType
    TabOrder = 4
    Width = 162
  end
  object cxDBMaskEdit1: TcxDBMaskEdit [9]
    Left = 80
    Top = 37
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DataBinding.DataField = 'CODE'
    DataBinding.DataSource = DS
    Properties.AlwaysShowBlanksAndLiterals = True
    Properties.BeepOnError = True
    Properties.EditMask = '!+09;0;'#9618
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 5
    Width = 142
  end
  object cxDBMaskEdit2: TcxDBMaskEdit [10]
    Left = 108
    Top = 100
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DataBinding.DataField = 'ADD_NUMBER'
    DataBinding.DataSource = DS
    Properties.AlwaysShowBlanksAndLiterals = True
    Properties.BeepOnError = True
    Properties.EditMask = '99999;0;'#9618
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 6
    Width = 114
  end
  inherited DS: TDataSource
    Left = 133
  end
end
