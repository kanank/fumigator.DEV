inherited FramePersonFull: TFramePersonFull
  Width = 770
  Height = 200
  ExplicitWidth = 770
  ExplicitHeight = 200
  DesignSize = (
    770
    200)
  object Label3: TLabel [0]
    Left = 306
    Top = 150
    Width = 63
    Height = 29
    Caption = 'Emal '#1083#1080#1095'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label5: TLabel [1]
    Left = 535
    Top = 148
    Width = 57
    Height = 16
    Caption = 'Emal '#1088#1072#1073'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inline FramePassport: TFramePassport [2]
    Left = 512
    Top = 0
    Width = 246
    Height = 142
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    ExplicitLeft = 512
    ExplicitWidth = 246
    ExplicitHeight = 142
    inherited RzGroupBox1: TRzGroupBox
      Left = 10
      Width = 226
      ExplicitLeft = 10
      ExplicitWidth = 226
      inherited edtNomer: TcxDBMaskEdit
        ExplicitHeight = 26
      end
      inherited cmbDate: TcxDBDateEdit
        ExplicitHeight = 26
      end
      inherited edtCode: TcxDBMaskEdit
        ExplicitHeight = 26
      end
    end
  end
  inline FramePhones: TFramePhones [3]
    Left = 298
    Top = 0
    Width = 218
    Height = 144
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 298
    ExplicitWidth = 218
    ExplicitHeight = 144
    inherited grpPhone: TRzGroupBox
      Height = 142
      ExplicitHeight = 142
      inherited grdPhone: TcxGrid
        Height = 119
        ExplicitHeight = 119
      end
      inherited RzPanel2: TRzPanel
        Height = 122
        ExplicitHeight = 122
        inherited btnAdd: TRzBitBtn
          Top = -3
          OnClick = FramePhonesbtnAddClick
          ExplicitTop = -3
        end
        inherited btnEdit: TRzBitBtn
          Top = 31
          ExplicitTop = 31
        end
        inherited btnDel: TRzBitBtn
          Top = 88
          ExplicitTop = 88
        end
      end
    end
  end
  inherited RzPanel1: TRzPanel [4]
    Left = 3
    Width = 288
    Height = 169
    Anchors = [akLeft, akTop, akRight]
    ExplicitLeft = 3
    ExplicitWidth = 288
    ExplicitHeight = 169
    DesignSize = (
      288
      169)
    inherited Label11: TLabel
      Left = 2
      Width = 53
      Height = 16
      Font.Height = -13
      ExplicitLeft = 2
      ExplicitWidth = 53
      ExplicitHeight = 16
    end
    inherited Label10: TLabel
      Left = 2
      Top = 35
      Width = 23
      Height = 16
      Font.Height = -13
      ExplicitLeft = 2
      ExplicitTop = 35
      ExplicitWidth = 23
      ExplicitHeight = 16
    end
    inherited Label9: TLabel
      Left = 2
      Top = 62
      Width = 55
      Height = 16
      Font.Height = -13
      ExplicitLeft = 2
      ExplicitTop = 62
      ExplicitWidth = 55
      ExplicitHeight = 16
    end
    inherited Label8: TLabel
      Left = 2
      Top = 91
      Width = 92
      Height = 16
      Font.Height = -13
      ExplicitLeft = 2
      ExplicitTop = 91
      ExplicitWidth = 92
      ExplicitHeight = 16
    end
    inherited Label2: TLabel
      Left = 2
      Top = 143
      Width = 78
      Height = 16
      Font.Height = -13
      ExplicitLeft = 2
      ExplicitTop = 143
      ExplicitWidth = 78
      ExplicitHeight = 16
    end
    inherited Label1: TLabel
      Top = 91
      Width = 22
      Height = 16
      Font.Height = -13
      ExplicitTop = 91
      ExplicitWidth = 22
      ExplicitHeight = 16
    end
    inherited Label4: TLabel
      Left = 3
      Top = 116
      Width = 66
      Height = 16
      Font.Height = -13
      ExplicitLeft = 3
      ExplicitTop = 116
      ExplicitWidth = 66
      ExplicitHeight = 16
    end
    inherited edtCitizen: TcxDBTextEdit
      Left = 72
      Top = 140
      ExplicitLeft = 72
      ExplicitTop = 140
      ExplicitWidth = 214
      ExplicitHeight = 26
      Width = 214
    end
    inherited cmbDateBirth: TcxDBDateEdit
      Left = 100
      Top = 86
      ParentFont = False
      Style.Font.Height = -13
      Style.IsFontAssigned = True
      ExplicitLeft = 100
      ExplicitTop = 86
      ExplicitWidth = 98
      ExplicitHeight = 24
      Width = 98
    end
    inherited edtSurName: TcxDBTextEdit
      Left = 72
      Top = 59
      ExplicitLeft = 72
      ExplicitTop = 59
      ExplicitWidth = 214
      ExplicitHeight = 26
      Width = 214
    end
    inherited edtName: TcxDBTextEdit
      Left = 72
      Top = 32
      ExplicitLeft = 72
      ExplicitTop = 32
      ExplicitWidth = 214
      ExplicitHeight = 26
      Width = 214
    end
    inherited edtFamily: TcxDBTextEdit
      Left = 72
      ExplicitLeft = 72
      ExplicitWidth = 214
      ExplicitHeight = 26
      Width = 214
    end
    inherited cmbSex: TcxDBComboBox
      Top = 86
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Style.Font.Height = -13
      Style.IsFontAssigned = True
      ExplicitTop = 86
      ExplicitWidth = 57
      ExplicitHeight = 24
      Width = 57
    end
    inherited cmbProf: TcxDBLookupComboBox
      Left = 72
      Top = 113
      ExplicitLeft = 72
      ExplicitTop = 113
      ExplicitWidth = 214
      ExplicitHeight = 26
      Width = 214
    end
  end
  inline FrameAddress: TFrameKladrAdrFull [5]
    Left = 5
    Top = 169
    Width = 356
    Height = 27
    TabOrder = 2
    Visible = False
    ExplicitLeft = 5
    ExplicitTop = 169
    ExplicitWidth = 356
    ExplicitHeight = 27
    inherited Label8: TLabel
      Visible = False
    end
    inherited Label1: TLabel
      Visible = False
    end
    inherited Label2: TLabel
      Left = 1
      Top = 9
      ExplicitLeft = 1
      ExplicitTop = 9
    end
    inherited FrameRegion: TFrameItemKLADR
      inherited edtName: TcxTextEdit
        ExplicitHeight = 26
      end
      inherited edtSocr: TcxTextEdit
        ExplicitHeight = 26
      end
    end
    inherited FrameCity: TFrameItemKLADR
      inherited edtName: TcxTextEdit
        ExplicitHeight = 26
      end
      inherited edtSocr: TcxTextEdit
        ExplicitHeight = 26
      end
    end
    inherited FrameSite: TFrameItemKLADR
      inherited edtName: TcxTextEdit
        ExplicitHeight = 26
      end
      inherited edtSocr: TcxTextEdit
        ExplicitHeight = 26
      end
    end
    inherited FrameStreet: TFrameItemKLADR
      inherited edtName: TcxTextEdit
        ExplicitHeight = 26
      end
      inherited edtSocr: TcxTextEdit
        ExplicitHeight = 26
      end
    end
    inherited FrameArea: TFrameItemKLADR
      inherited edtName: TcxTextEdit
        ExplicitHeight = 26
      end
      inherited edtSocr: TcxTextEdit
        ExplicitHeight = 26
      end
    end
    inherited btnEdit: TRzBitBtn
      Left = 325
      Top = 5
      ExplicitLeft = 325
      ExplicitTop = 5
    end
    inherited edtRegion: TcxTextEdit
      Left = 72
      Style.IsFontAssigned = True
      Visible = False
      ExplicitLeft = 72
      ExplicitWidth = 210
      ExplicitHeight = 24
      Width = 210
    end
    inherited edtSite: TcxTextEdit
      Style.IsFontAssigned = True
      Visible = False
      ExplicitHeight = 24
    end
    inherited edtAddress: TcxTextEdit
      Left = 70
      Top = 6
      Style.IsFontAssigned = True
      ExplicitLeft = 70
      ExplicitTop = 6
      ExplicitWidth = 253
      ExplicitHeight = 24
      Width = 253
    end
    inherited FrameDom: TFrameItemDomKLADR
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
  end
  object edtEmailPrivate: TcxDBTextEdit
    Left = 375
    Top = 145
    Anchors = [akLeft, akTop, akRight]
    BeepOnEnter = False
    DataBinding.DataField = 'EMAIL_PRIVATE'
    DataBinding.DataSource = DS
    ParentFont = False
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    Style.TransparentBorder = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 4
    Width = 143
  end
  object edtEmailWork: TcxDBTextEdit
    Left = 598
    Top = 145
    Anchors = [akLeft, akTop, akRight]
    BeepOnEnter = False
    DataBinding.DataField = 'EMAIL_WORK'
    DataBinding.DataSource = DS
    ParentFont = False
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    Style.TransparentBorder = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 5
    Width = 160
  end
  inherited Query_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'select * from PERSONS where id = :NEW_ID')
    ModifySQL.Strings = (
      'update PERSONS set '
      'FAMILY = :FAMILY,'
      'NAME = :NAME,'
      'SURNAME = :SURNAME,'
      'ADR_ID = :ADR_ID,'
      'PASS_ID = :PASS_ID,'
      'DATE_BIRTH = :DATE_BIRTH,'
      'SEX = :SEX,'
      'CITIZEN = :CITIZEN,'
      'PROF_ID = :PROF_ID,'
      'EMAIL_PRIVATE = :EMAIL_PRIVATE,'
      'EMAIL_WORK = :EMAIL_WORK'
      'where id = :ID')
    InsertSQL.Strings = (
      'insert into PERSONS('
      'ID,'
      'FAMILY,'
      'NAME,'
      'SURNAME,'
      'ADR_ID,'
      'PASS_ID,'
      'DATE_BIRTH,'
      'SEX,'
      'CITIZEN,'
      'PROF_ID,'
      'EMAIL_PRIVATE,'
      'EMAIL_WORK'
      ') '
      'values('
      ':ID,'
      ':FAMILY,'
      ':NAME,'
      ':SURNAME,'
      ':ADR_ID,'
      ':PASS_ID,'
      ':DATE_BIRTH,'
      ':SEX,'
      ':CITIZEN,'
      ':PROF_ID,'
      ':EMAIL_PRIVATE,'
      ':EMAIL_WORK'
      ')')
    Left = 240
    Top = 11
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'select * '
      'from persons where id = :person_id')
    Left = 216
    Top = 11
  end
  inherited DS: TDataSource
    Left = 184
    Top = 19
  end
end
