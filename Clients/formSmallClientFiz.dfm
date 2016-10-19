inherited frmSmallCardFiz: TfrmSmallCardFiz
  Caption = #1050#1088#1072#1090#1082#1072#1103' '#1082#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072
  ClientHeight = 363
  ClientWidth = 634
  ExplicitWidth = 650
  ExplicitHeight = 401
  PixelsPerInch = 96
  TextHeight = 18
  inherited img1: TImage
    Left = 331
    Top = -133
    Width = 235
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    ExplicitLeft = 331
    ExplicitTop = -133
    ExplicitWidth = 235
  end
  inherited Label7: TLabel
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
  end
  inherited Label1: TLabel
    Left = 10
    Top = 104
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitLeft = 10
    ExplicitTop = 104
  end
  object Label10: TLabel [3]
    Left = 10
    Top = 50
    Width = 28
    Height = 18
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #1048#1084#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel [4]
    Left = 10
    Top = 15
    Width = 60
    Height = 18
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #1060#1072#1084#1080#1083#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited Label8: TLabel
    Top = 15
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitTop = 15
  end
  inherited Label4: TLabel
    Left = 350
    Top = 204
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitLeft = 350
    ExplicitTop = 204
  end
  inherited RzPanel1: TRzPanel
    Top = 312
    Width = 634
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    ExplicitTop = 312
    ExplicitWidth = 634
    inherited Image2: TImage
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      ExplicitLeft = -245
    end
    inherited Exit_bnt: TRzButton
      Left = 449
      Top = 7
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Default = True
      ModalResult = 0
      OnClick = Exit_bntClick
      ExplicitLeft = 449
      ExplicitTop = 7
    end
    inherited btnTransferCall: TRzButton
      Left = 267
      Top = 6
      Height = 40
      Visible = True
      ExplicitLeft = 267
      ExplicitTop = 6
      ExplicitHeight = 40
    end
    inherited RzBitBtn1: TRzBitBtn
      Top = 6
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      OnClick = RzBitBtn1Click
      Margin = 4
      Spacing = 8
      ExplicitTop = 6
    end
  end
  inherited cxDBLookupComboBox2: TcxDBLookupComboBox
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    DataBinding.DataSource = frmClientFiz.DS
    TabOrder = 3
    ExplicitHeight = 26
  end
  inherited cxDBLookupComboBox3: TcxDBLookupComboBox
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    DataBinding.DataSource = frmClientFiz.DS
    TabOrder = 4
    ExplicitWidth = 94
    ExplicitHeight = 26
    Width = 94
  end
  inherited edtPhone: TcxMaskEdit
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Style.IsFontAssigned = True
    TabOrder = 5
    ExplicitWidth = 224
    ExplicitHeight = 30
    Height = 30
    Width = 224
  end
  object edtName: TcxDBTextEdit [11]
    Left = 93
    Top = 48
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akTop, akRight]
    BeepOnEnter = False
    DataBinding.DataField = 'NAME'
    Style.BorderStyle = ebsFlat
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    Style.TransparentBorder = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 1
    Width = 224
  end
  inherited cmbRegion: TcxDBLookupComboBox
    Left = 415
    Top = 10
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    DataBinding.DataSource = frmClientFiz.DS
    TabOrder = 2
    ExplicitLeft = 415
    ExplicitTop = 10
    ExplicitWidth = 207
    ExplicitHeight = 26
    Width = 207
  end
  inherited FrameUslugi: TFrameUslugi
    Left = 350
    Width = 272
    Height = 154
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    TabOrder = 7
    ExplicitLeft = 350
    ExplicitWidth = 272
    ExplicitHeight = 154
    inherited grpPhone: TRzGroupBox
      Left = 1
      Width = 268
      Height = 148
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      ExplicitLeft = 1
      ExplicitWidth = 268
      ExplicitHeight = 148
      inherited grdPhone: TcxGrid
        Width = 253
        Height = 83
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        ExplicitWidth = 253
        ExplicitHeight = 83
        inherited grdPhoneDBTableView1: TcxGridDBTableView
          inherited grdPhoneDBTableView1Column1: TcxGridDBColumn
            IsCaptionAssigned = True
          end
        end
      end
      inherited RzPanel2: TRzPanel
        Top = 105
        Width = 266
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        ExplicitTop = 105
        ExplicitWidth = 266
        inherited btnAdd: TRzBitBtn
          Height = 34
          Margins.Left = 6
          Margins.Top = 6
          Margins.Right = 6
          Margins.Bottom = 6
          Margin = 4
          Spacing = 8
          ExplicitHeight = 34
        end
        inherited btnEdit: TRzBitBtn
          Top = 0
          Height = 35
          Margins.Left = 6
          Margins.Top = 6
          Margins.Right = 6
          Margins.Bottom = 6
          Margin = 4
          Spacing = 8
          ExplicitTop = 0
          ExplicitHeight = 35
        end
        inherited btnDel: TRzBitBtn
          Left = 221
          Height = 34
          Margins.Left = 6
          Margins.Top = 6
          Margins.Right = 6
          Margins.Bottom = 6
          Margin = 4
          Spacing = 8
          ExplicitLeft = 221
          ExplicitHeight = 34
        end
      end
    end
    inherited Query_upd: TIBUpdateSQL
      Left = 72
      Top = 43
    end
    inherited Query: TIBQuery
      Left = 32
      Top = 43
    end
    inherited DS: TDataSource
      Top = 43
    end
  end
  inherited cxDBMemo1: TcxDBMemo
    Left = 350
    Top = 223
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    DataBinding.DataSource = frmClientFiz.DS
    ExplicitLeft = 350
    ExplicitTop = 223
    ExplicitWidth = 272
    ExplicitHeight = 71
    Height = 71
    Width = 272
  end
  object edtFamily: TcxDBTextEdit
    Left = 93
    Top = 11
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akTop, akRight]
    BeepOnEnter = False
    DataBinding.DataField = 'FAMILY'
    Style.HotTrack = False
    Style.LookAndFeel.NativeStyle = True
    Style.TransparentBorder = True
    StyleDisabled.Color = clBtnFace
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 8
    Width = 224
  end
end
