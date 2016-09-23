inherited FramePersonSmallFoto: TFramePersonSmallFoto
  Width = 579
  Height = 128
  ExplicitWidth = 579
  ExplicitHeight = 128
  DesignSize = (
    579
    128)
  inherited RzPanel1: TRzPanel
    Left = 3
    Top = 0
    Width = 573
    Height = 125
    Anchors = [akLeft, akTop, akRight]
    ExplicitLeft = 3
    ExplicitTop = 0
    ExplicitWidth = 573
    ExplicitHeight = 125
    DesignSize = (
      573
      125)
    inherited Label10: TLabel
      Top = 40
      ExplicitTop = 40
    end
    inherited Label9: TLabel
      Top = 72
      ExplicitTop = 72
    end
    inherited Label8: TLabel
      Left = 254
      Top = 8
      ExplicitLeft = 254
      ExplicitTop = 8
    end
    inherited Label2: TLabel
      Top = 106
      Visible = False
      ExplicitTop = 106
    end
    inherited Label1: TLabel
      Left = 151
      Top = 107
      ExplicitLeft = 151
      ExplicitTop = 107
    end
    inherited Label4: TLabel
      Top = 106
      ExplicitTop = 106
    end
    object Label5: TLabel [7]
      Left = 254
      Top = 106
      Width = 60
      Height = 16
      Caption = 'Email '#1088#1072#1073'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inherited edtCitizen: TcxDBTextEdit
      Top = 102
      Visible = False
      ExplicitTop = 102
      ExplicitWidth = 0
      Width = 0
    end
    inherited edtSurName: TcxDBTextEdit [9]
      Top = 69
      AutoSize = False
      ExplicitTop = 69
      ExplicitWidth = 182
      ExplicitHeight = 21
      Height = 21
      Width = 182
    end
    inherited edtName: TcxDBTextEdit [10]
      Top = 37
      AutoSize = False
      ExplicitTop = 37
      ExplicitWidth = 182
      ExplicitHeight = 21
      Height = 21
      Width = 182
    end
    inherited edtFamily: TcxDBTextEdit [11]
      AutoSize = False
      ExplicitWidth = 182
      ExplicitHeight = 21
      Height = 21
      Width = 182
    end
    inherited cmbSex: TcxDBComboBox [12]
      Left = 176
      Top = 102
      Style.IsFontAssigned = True
      Visible = False
      ExplicitLeft = 176
      ExplicitTop = 102
    end
    inherited cmbProf: TcxDBLookupComboBox [13]
      Top = 102
      AutoSize = False
      ExplicitTop = 102
      ExplicitWidth = 162
      ExplicitHeight = 21
      Height = 21
      Width = 162
    end
    inline FrameFoto: TFrameFoto [14]
      Left = 458
      Top = 2
      Width = 116
      Height = 124
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      ExplicitLeft = 458
      ExplicitTop = 2
      ExplicitWidth = 116
      ExplicitHeight = 124
      inherited RzPanel4: TRzPanel
        Left = 0
        Top = 2
        Width = 112
        Height = 119
        ExplicitLeft = 0
        ExplicitTop = 2
        ExplicitWidth = 112
        ExplicitHeight = 119
        inherited btnLoad: TRzBitBtn
          Top = 95
          Visible = False
          OnClick = FrameFotobtnLoadClick
          ExplicitTop = 95
        end
        inherited btnClear: TRzBitBtn
          Left = 10
          Top = 95
          Visible = False
          OnClick = FrameFotobtnClearClick
          ExplicitLeft = 10
          ExplicitTop = 95
        end
        inherited imgFoto: TcxDBImage
          Top = 3
          ExplicitTop = 3
          ExplicitWidth = 106
          ExplicitHeight = 112
          Height = 112
          Width = 106
        end
      end
      inherited Query_upd: TIBUpdateSQL
        Left = 40
        Top = 70
      end
      inherited Query: TIBQuery
        Left = 56
        Top = 32
      end
      inherited DS: TDataSource
        Left = 32
        Top = 32
      end
    end
    inherited cmbDateBirth: TcxDBDateEdit
      Left = 349
      Top = 5
      Style.IsFontAssigned = True
      ExplicitLeft = 349
      ExplicitTop = 5
      ExplicitWidth = 100
      Width = 100
    end
    inline FramePhones: TFramePhones
      Left = 253
      Top = 26
      Width = 201
      Height = 70
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      ExplicitLeft = 253
      ExplicitTop = 26
      ExplicitWidth = 201
      ExplicitHeight = 70
      inherited grpPhone: TRzGroupBox
        Left = 0
        Width = 199
        Height = 69
        ExplicitLeft = 0
        ExplicitWidth = 199
        ExplicitHeight = 69
        inherited RzPanel2: TRzPanel [0]
          Left = 141
          Height = 43
          Align = alCustom
          Visible = False
          ExplicitLeft = 141
          ExplicitHeight = 43
          inherited btnDel: TRzBitBtn [0]
            Top = 13
            Height = 20
            Visible = False
            ExplicitTop = 13
            ExplicitHeight = 20
          end
          inherited btnAdd: TRzBitBtn [1]
            Top = -84
            Visible = False
            ExplicitTop = -84
          end
          inherited btnEdit: TRzBitBtn [2]
            Top = -50
            Visible = False
            ExplicitTop = -50
          end
        end
        inherited grdPhone: TcxGrid [1]
          Top = 13
          Width = 192
          Height = 51
          ExplicitTop = 13
          ExplicitWidth = 192
          ExplicitHeight = 51
        end
      end
    end
    object edtEmailWork: TcxDBTextEdit
      Left = 320
      Top = 102
      AutoSize = False
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
      TabOrder = 9
      Height = 21
      Width = 129
    end
  end
  inherited Query_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      
        'select name, surname, family, date_birth, sex, prof_id, photo_id' +
        ', email_work from PERSONS where id = :NEW_ID')
    ModifySQL.Strings = (
      'update PERSONS set '
      'NAME = :NAME, '
      'SURNAME = :SURNAME , '
      'FAMILY = :FAMILY , '
      'DATE_BIRTH = :DATE_BIRTH , '
      'SEX = :SEX,'
      'PROF_ID = :PROF_ID,'
      'PHOTO_ID = :PHOTO_ID,'
      'EMAIL_WORK = :EMAIL_WORK '
      'where id = :ID')
    InsertSQL.Strings = (
      
        'insert into PERSONS(id, name, surname, family, date_birth, sex, ' +
        'prof_id, photo_id, email_work) '
      
        'values(:id, :name, :surname, :family, :date_birth, :sex, :prof_i' +
        'd, :photo_id, :email_work)')
    Left = 200
    Top = 11
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      
        'select id, name, surname, family, date_birth, sex, prof_id, phot' +
        'o_id, email_work '
      'from persons where id = :person_id')
    Left = 168
    Top = 11
  end
  inherited DS: TDataSource
    Left = 136
    Top = 11
  end
end
