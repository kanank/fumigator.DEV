inherited frmSmallCardUr: TfrmSmallCardUr
  Caption = #1050#1088#1072#1090#1082#1072#1103' '#1082#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072
  ClientHeight = 417
  ClientWidth = 800
  ExplicitWidth = 816
  ExplicitHeight = 455
  PixelsPerInch = 96
  TextHeight = 18
  inherited img1: TImage
    Left = 544
    Top = -79
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    ExplicitLeft = 544
    ExplicitTop = -79
  end
  inherited Label7: TLabel
    Left = 17
    Top = 278
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitLeft = 17
    ExplicitTop = 278
  end
  inherited Label1: TLabel
    Left = 17
    Top = 223
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitLeft = 17
    ExplicitTop = 223
  end
  inherited Label8: TLabel
    Left = 497
    Top = 18
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitLeft = 497
    ExplicitTop = 18
  end
  inherited Label4: TLabel
    Left = 503
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitLeft = 503
  end
  object Label3: TLabel [5]
    Left = 17
    Top = 7
    Width = 105
    Height = 36
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  inherited RzPanel1: TRzPanel
    Top = 366
    Width = 800
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    ExplicitTop = 366
    ExplicitWidth = 800
    inherited Image2: TImage
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      ExplicitLeft = -79
    end
    inherited Exit_bnt: TRzButton
      Left = 615
      Top = 6
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      ModalResult = 0
      OnClick = Exit_bntClick
      ExplicitLeft = 615
      ExplicitTop = 6
    end
    inherited btnTransferCall: TRzButton
      Left = 353
      Top = 6
      Height = 40
      Visible = True
      ExplicitLeft = 353
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
    Left = 104
    Top = 282
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    DataBinding.DataSource = frmClientUr.DS
    ExplicitLeft = 104
    ExplicitTop = 282
    ExplicitHeight = 26
  end
  inherited cxDBLookupComboBox3: TcxDBLookupComboBox
    Left = 238
    Top = 282
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    DataBinding.DataSource = frmClientUr.DS
    ExplicitLeft = 238
    ExplicitTop = 282
    ExplicitHeight = 26
  end
  inherited edtPhone: TcxMaskEdit
    Left = 104
    Top = 216
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Style.IsFontAssigned = True
    ExplicitLeft = 104
    ExplicitTop = 216
  end
  inherited cmbRegion: TcxDBLookupComboBox
    Left = 554
    Top = 14
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    DataBinding.DataSource = frmClientUr.DS
    ExplicitLeft = 554
    ExplicitTop = 14
    ExplicitWidth = 227
    ExplicitHeight = 26
    Width = 227
  end
  inherited FrameUslugi: TFrameUslugi
    Left = 498
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitLeft = 498
    inherited grpPhone: TRzGroupBox
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      inherited grdPhone: TcxGrid
        Top = 20
        Height = 108
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        ExplicitTop = 20
        ExplicitHeight = 108
        inherited grdPhoneDBTableView1: TcxGridDBTableView
          inherited grdPhoneDBTableView1Column1: TcxGridDBColumn
            IsCaptionAssigned = True
          end
        end
      end
      inherited RzPanel2: TRzPanel
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        inherited btnAdd: TRzBitBtn
          Top = 5
          Height = 34
          Margins.Left = 6
          Margins.Top = 6
          Margins.Right = 6
          Margins.Bottom = 6
          Margin = 4
          Spacing = 8
          ExplicitTop = 5
          ExplicitHeight = 34
        end
        inherited btnEdit: TRzBitBtn
          Top = 5
          Height = 34
          Margins.Left = 6
          Margins.Top = 6
          Margins.Right = 6
          Margins.Bottom = 6
          Margin = 4
          Spacing = 8
          ExplicitTop = 5
          ExplicitHeight = 34
        end
        inherited btnDel: TRzBitBtn
          Left = 230
          Top = 5
          Width = 40
          Height = 34
          Margins.Left = 6
          Margins.Top = 6
          Margins.Right = 6
          Margins.Bottom = 6
          Margin = 4
          Spacing = 8
          ExplicitLeft = 230
          ExplicitTop = 5
          ExplicitWidth = 40
          ExplicitHeight = 34
        end
      end
    end
  end
  inherited cxDBMemo1: TcxDBMemo
    Left = 503
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    DataBinding.DataSource = frmClientUr.DS
    ExplicitLeft = 503
  end
  object txtName: TcxDBTextEdit
    Left = 143
    Top = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    BeepOnEnter = False
    DataBinding.DataField = 'NAME'
    DataBinding.DataSource = frmClientUr.DS
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
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
    TabOrder = 7
    Width = 322
  end
  object GroupBox1: TGroupBox
    Left = 7
    Top = 72
    Width = 471
    Height = 114
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
    TabOrder = 8
    DesignSize = (
      471
      114)
    object Label11: TLabel
      Left = 10
      Top = 32
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
    object Label10: TLabel
      Left = 10
      Top = 72
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
    object edtFamily: TcxDBTextEdit
      Left = 136
      Top = 28
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
      TabOrder = 0
      Width = 322
    end
    object edtName: TcxDBTextEdit
      Left = 136
      Top = 68
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
      Width = 322
    end
  end
end
