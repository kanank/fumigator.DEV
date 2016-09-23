inherited FramePersonFullFoto: TFramePersonFullFoto
  Width = 764
  Height = 221
  ExplicitWidth = 764
  ExplicitHeight = 221
  DesignSize = (
    764
    221)
  object Label3: TLabel [0]
    Left = 189
    Top = 59
    Width = 47
    Height = 13
    Caption = 'Emal '#1088#1072#1073'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited RzPanel1: TRzPanel
    Top = 1
    Width = 758
    Height = 215
    ExplicitTop = 1
    ExplicitWidth = 758
    ExplicitHeight = 215
    DesignSize = (
      758
      215)
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
      Left = 179
      Top = 8
      Width = 23
      Height = 16
      Font.Height = -13
      ExplicitLeft = 179
      ExplicitTop = 8
      ExplicitWidth = 23
      ExplicitHeight = 16
    end
    inherited Label9: TLabel
      Left = 328
      Top = 8
      Width = 55
      Height = 16
      Font.Height = -13
      ExplicitLeft = 328
      ExplicitTop = 8
      ExplicitWidth = 55
      ExplicitHeight = 16
    end
    inherited Label8: TLabel
      Left = 512
      Width = 92
      Height = 16
      Font.Height = -13
      ExplicitLeft = 512
      ExplicitWidth = 92
      ExplicitHeight = 16
    end
    inherited Label2: TLabel
      Left = 5
      Top = 71
      ExplicitLeft = 5
      ExplicitTop = 71
    end
    inherited Label1: TLabel
      Left = 54
      Top = 70
      ExplicitLeft = 54
      ExplicitTop = 70
    end
    inherited Label4: TLabel
      Left = 186
      Top = 95
      Width = 66
      Height = 16
      Font.Height = -13
      ExplicitLeft = 186
      ExplicitTop = 95
      ExplicitWidth = 66
      ExplicitHeight = 16
    end
    inherited Label5: TLabel
      Left = 186
      Top = 36
      Width = 41
      Height = 16
      Caption = 'E-mail:'
      Font.Height = -13
      ExplicitLeft = 186
      ExplicitTop = 36
      ExplicitWidth = 41
      ExplicitHeight = 16
    end
    object Label6: TLabel [8]
      Left = 232
      Top = 57
      Width = 44
      Height = 16
      Caption = #1083#1080#1095#1085#1099#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel [9]
      Left = 232
      Top = 36
      Width = 49
      Height = 16
      Caption = #1088#1072#1073#1086#1095#1080#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inherited edtCitizen: TcxDBTextEdit
      Left = 33
      Top = 67
      ExplicitLeft = 33
      ExplicitTop = 67
      ExplicitWidth = 77
      ExplicitHeight = 26
      Width = 77
    end
    inherited edtSurName: TcxDBTextEdit
      Left = 386
      Top = 5
      ExplicitLeft = 386
      ExplicitTop = 5
      ExplicitWidth = 120
      ExplicitHeight = 19
      Height = 19
      Width = 120
    end
    inherited edtName: TcxDBTextEdit
      Left = 203
      Top = 5
      ExplicitLeft = 203
      ExplicitTop = 5
      ExplicitWidth = 120
      ExplicitHeight = 19
      Height = 19
      Width = 120
    end
    inherited edtFamily: TcxDBTextEdit
      Left = 56
      ExplicitLeft = 56
      ExplicitWidth = 120
      ExplicitHeight = 19
      Height = 19
      Width = 120
    end
    inherited cmbSex: TcxDBComboBox
      Left = 54
      Top = 66
      ExplicitLeft = 54
      ExplicitTop = 66
      ExplicitHeight = 26
    end
    inherited cmbProf: TcxDBLookupComboBox
      Left = 253
      Top = 91
      ExplicitLeft = 253
      ExplicitTop = 91
    end
    inherited FrameFoto: TFrameFoto
      Left = 670
      Top = 3
      Width = 88
      Height = 135
      ExplicitLeft = 670
      ExplicitTop = 3
      ExplicitWidth = 88
      ExplicitHeight = 135
      inherited RzPanel4: TRzPanel
        Left = 2
        Width = 85
        Height = 133
        ExplicitLeft = 2
        ExplicitWidth = 85
        ExplicitHeight = 133
        inherited btnLoad: TRzBitBtn
          Left = 6
          Width = 75
          Visible = True
          ExplicitLeft = 6
          ExplicitWidth = 75
        end
        inherited btnClear: TRzBitBtn
          Left = 6
          Top = 114
          Width = 75
          Height = 16
          Visible = True
          ExplicitLeft = 6
          ExplicitTop = 114
          ExplicitWidth = 75
          ExplicitHeight = 16
        end
        inherited imgFoto: TcxDBImage
          Top = 2
          ExplicitTop = 2
          ExplicitWidth = 77
          ExplicitHeight = 92
          Height = 92
          Width = 77
        end
      end
      inherited Query_upd: TIBUpdateSQL
        Left = 16
        Top = 22
      end
    end
    inherited cmbDateBirth: TcxDBDateEdit
      Left = 602
      ExplicitLeft = 602
      ExplicitWidth = 69
      ExplicitHeight = 26
      Width = 69
    end
    inherited FramePhones: TFramePhones
      Left = 1
      Width = 176
      Height = 90
      ExplicitLeft = 1
      ExplicitWidth = 176
      ExplicitHeight = 90
      inherited grpPhone: TRzGroupBox
        Left = 1
        Width = 174
        Height = 89
        ExplicitLeft = 1
        ExplicitWidth = 174
        ExplicitHeight = 89
        inherited RzPanel2: TRzPanel
          Left = 142
          Height = 69
          Align = alRight
          Visible = True
          ExplicitLeft = 142
          ExplicitHeight = 69
          inherited btnDel: TRzBitBtn
            Top = 46
            Visible = True
            ExplicitTop = 46
          end
          inherited btnAdd: TRzBitBtn
            Top = -5
            Height = 25
            Visible = True
            ExplicitTop = -5
            ExplicitHeight = 25
          end
          inherited btnEdit: TRzBitBtn
            Top = 20
            Height = 25
            Visible = True
            ExplicitTop = 20
            ExplicitHeight = 25
          end
        end
        inherited grdPhone: TcxGrid
          Left = 3
          Top = 14
          Width = 138
          Height = 71
          ExplicitLeft = 3
          ExplicitTop = 14
          ExplicitWidth = 138
          ExplicitHeight = 71
          inherited grdPhoneDBTableView2: TcxGridDBTableView
            inherited grdPhoneDBTableView2Column2: TcxGridDBColumn
              Width = 80
            end
            inherited grdPhoneDBTableView2Column3: TcxGridDBColumn
              Width = 27
            end
          end
        end
      end
    end
    inherited edtEmailWork: TcxDBTextEdit
      Left = 282
      Top = 32
      ExplicitLeft = 282
      ExplicitTop = 32
    end
    inline FramePassport: TFramePassport
      Left = 0
      Top = 121
      Width = 427
      Height = 100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      ExplicitTop = 121
      ExplicitWidth = 427
      ExplicitHeight = 100
      inherited RzGroupBox1: TRzGroupBox
        Left = 1
        Width = 422
        Height = 94
        ExplicitLeft = 1
        ExplicitWidth = 422
        ExplicitHeight = 94
        inherited Label2: TLabel
          Left = 231
          Top = 19
          ExplicitLeft = 231
          ExplicitTop = 19
        end
        inherited Label3: TLabel
          Left = 231
          Top = 38
          Width = 90
          Height = 32
          WordWrap = True
          ExplicitLeft = 231
          ExplicitTop = 38
          ExplicitWidth = 90
          ExplicitHeight = 32
        end
        inherited Label4: TLabel
          Top = 38
          ExplicitTop = 38
        end
        inherited edtNomer: TcxDBMaskEdit
          ExplicitHeight = 26
        end
        inherited cmbDate: TcxDBDateEdit
          Left = 325
          Top = 16
          ExplicitLeft = 325
          ExplicitTop = 16
          ExplicitHeight = 26
        end
        inherited edtKem: TcxDBMemo
          Top = 53
          ExplicitTop = 53
          ExplicitHeight = 38
          Height = 38
        end
        inherited edtCode: TcxDBMaskEdit
          Left = 325
          Top = 43
          ExplicitLeft = 325
          ExplicitTop = 43
          ExplicitHeight = 26
        end
      end
      inherited Query_upd: TIBUpdateSQL
        Left = 160
        Top = 48
      end
      inherited Query: TIBQuery
        Left = 120
        Top = 48
      end
      inherited DS: TDataSource
        Left = 88
        Top = 48
      end
    end
  end
  object edtEmailPrivate: TcxDBTextEdit [2]
    Left = 285
    Top = 55
    AutoSize = False
    BeepOnEnter = False
    DataBinding.DataField = 'EMAIL_PRIVATE'
    DataBinding.DataSource = DS
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
    Height = 21
    Width = 143
  end
  inherited Query_upd: TIBUpdateSQL
    ModifySQL.Strings = (
      'update PERSONS set '
      'NAME = :NAME, '
      'SURNAME = :SURNAME , '
      'FAMILY = :FAMILY , '
      'DATE_BIRTH = :DATE_BIRTH , '
      'SEX = :SEX,'
      'PASS_ID = :PASS_ID,'
      'PROF_ID = :PROF_ID,'
      'PHOTO_ID = :PHOTO_ID,'
      'EMAIL_WORK = :EMAIL_WORK '
      'where id = :ID')
    InsertSQL.Strings = (
      
        'insert into PERSONS(id, name, surname, family, date_birth, sex,p' +
        'ass_id, prof_id, photo_id, email_work) '
      
        'values(:id, :name, :surname, :family, :date_birth, :sex, :pass_i' +
        'd, :prof_id, :photo_id, :email_work)')
    Left = 88
    Top = 3
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'select *'
      'from persons'
      'where id = :person_id')
    Left = 56
    Top = 3
  end
  inherited DS: TDataSource
    Left = 120
    Top = 3
  end
end
