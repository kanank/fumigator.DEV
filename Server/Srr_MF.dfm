object MF: TMF
  Left = 0
  Top = 0
  Caption = #1057#1077#1088#1074#1077#1088' "'#1060#1091#1084#1080#1075#1072#1090#1086#1088'" v.0.01b'
  ClientHeight = 583
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Log_memo: TMemo
    Left = 0
    Top = 369
    Width = 627
    Height = 214
    Align = alClient
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object LogText: TATBinHex
    Left = 0
    Top = 369
    Width = 627
    Height = 214
    Cursor = crIBeam
    Align = alClient
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Caption = 'LogText'
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    FontOEM.Charset = OEM_CHARSET
    FontOEM.Color = clWindowText
    FontOEM.Height = -12
    FontOEM.Name = 'Terminal'
    FontOEM.Style = []
    FontFooter.Charset = DEFAULT_CHARSET
    FontFooter.Color = clBlack
    FontFooter.Height = -12
    FontFooter.Name = 'Arial'
    FontFooter.Style = []
    FontGutter.Charset = DEFAULT_CHARSET
    FontGutter.Color = clBlack
    FontGutter.Height = -12
    FontGutter.Name = 'Courier New'
    FontGutter.Style = []
    TextWrap = True
    AutoReload = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 627
    Height = 369
    Align = alTop
    BevelKind = bkFlat
    TabOrder = 2
    object PgMain: TPageControl
      Left = 1
      Top = 1
      Width = 621
      Height = 363
      ActivePage = TabMain
      Align = alClient
      TabOrder = 0
      object TabMain: TTabSheet
        Caption = #1054#1089#1085#1086#1074#1085#1099#1077
        object GroupBox1: TGroupBox
          Left = 0
          Top = 251
          Width = 613
          Height = 84
          Align = alBottom
          Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1089#1086#1089#1090#1086#1103#1085#1080#1080' '#1089#1077#1088#1074#1077#1088#1072
          TabOrder = 0
          DesignSize = (
            613
            84)
          object Label2: TLabel
            Left = 11
            Top = 19
            Width = 45
            Height = 13
            Caption = #1057#1086#1082#1077#1090#1099
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 10
            Top = 41
            Width = 29
            Height = 13
            Caption = #1055#1086#1088#1090':'
          end
          object Button2: TButton
            Left = 441
            Top = 7
            Width = 169
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #1057#1077#1088#1074#1077#1088' '#1089#1086#1082#1077#1090#1086#1074
            TabOrder = 0
            OnClick = Button2Click
          end
          object edtSocketPort: TSpinEdit
            Left = 45
            Top = 38
            Width = 68
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxValue = 0
            MinValue = 0
            ParentFont = False
            TabOrder = 1
            Value = 1025
          end
          object Edit1: TEdit
            Left = 154
            Top = 38
            Width = 159
            Height = 21
            Anchors = [akLeft, akRight, akBottom]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Text = #1089#1077#1088#1074#1077#1088
          end
          object Button4: TButton
            Left = 314
            Top = 36
            Width = 106
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
            TabOrder = 3
            OnClick = Button4Click
          end
          object Button6: TButton
            Left = 314
            Top = 7
            Width = 106
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #1050#1086#1084#1072#1085#1076#1072
            TabOrder = 4
            OnClick = Button6Click
          end
          object DebugMode_cb: TCheckBox
            Left = 441
            Top = 63
            Width = 121
            Height = 17
            Anchors = [akRight, akBottom]
            Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            State = cbChecked
            TabOrder = 5
          end
          object Button8: TButton
            Left = 184
            Top = 7
            Width = 106
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #1050#1083#1080#1077#1085#1090#1099
            TabOrder = 6
            OnClick = Button8Click
          end
          object Button9: TButton
            Left = 441
            Top = 36
            Width = 169
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #1054#1095#1080#1089#1090#1080#1090#1100
            TabOrder = 7
            OnClick = Button9Click
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 126
          Width = 613
          Height = 126
          Align = alTop
          Caption = #1057#1083#1091#1078#1073#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1090#1077#1083#1077#1092#1086#1085#1085#1099#1093' '#1074#1099#1079#1086#1074#1086#1074#1086' (Call Events)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          DesignSize = (
            613
            126)
          object Label3: TLabel
            Left = 11
            Top = 69
            Width = 183
            Height = 13
            Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1089#1083#1091#1078#1073#1099' Call_Events:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4868682
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 11
            Top = 26
            Width = 17
            Height = 13
            Caption = 'IP: '
          end
          object Label4: TLabel
            Left = 142
            Top = 26
            Width = 29
            Height = 13
            Caption = #1055#1086#1088#1090':'
          end
          object Label5: TLabel
            Left = 251
            Top = 26
            Width = 22
            Height = 13
            Caption = 'URI:'
          end
          object TelStatus_lbl: TLabel
            Left = 200
            Top = 69
            Width = 69
            Height = 13
            Caption = #1053#1077' '#1072#1082#1090#1080#1074#1077#1085'!'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 237
            Top = 52
            Width = 36
            Height = 13
            Caption = 'UserId:'
          end
          object Label12: TLabel
            Left = 11
            Top = 97
            Width = 107
            Height = 13
            Caption = #1050#1072#1090#1072#1083#1086#1075' '#1076#1083#1103' '#1079#1072#1087#1080#1089#1077#1081
          end
          object Button1: TButton
            Left = 441
            Top = 21
            Width = 169
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1089#1083#1091#1078#1073#1091' Call Events'
            TabOrder = 0
            OnClick = Button1Click
          end
          object TelPort_spin: TSpinEdit
            Left = 177
            Top = 23
            Width = 68
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxValue = 0
            MinValue = 0
            ParentFont = False
            TabOrder = 1
            Value = 45455
          end
          object TelIP_edt: TEdit
            Left = 34
            Top = 23
            Width = 102
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Text = '81.177.48.139'
          end
          object TelURI_edt: TEdit
            Left = 279
            Top = 23
            Width = 130
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Text = '/calls'
          end
          object edtUserId: TEdit
            Left = 279
            Top = 49
            Width = 130
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Text = '9738'
          end
          object btnPhone: TButton
            Left = 441
            Top = 52
            Width = 169
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1090#1077#1083#1077#1092#1086#1085#1080#1102
            TabOrder = 5
            OnClick = btnPhoneClick
          end
          object edtRecordPath: TEdit
            Left = 128
            Top = 94
            Width = 217
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            Text = 'Records'
          end
          object Button5: TButton
            Left = 441
            Top = 101
            Width = 169
            Height = 18
            Anchors = [akTop, akRight]
            Caption = #1047#1074#1086#1085#1086#1082
            TabOrder = 7
            OnClick = Button5Click
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 0
          Width = 613
          Height = 126
          Align = alTop
          Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1089#1086#1089#1090#1086#1103#1085#1080#1080' '#1089#1077#1088#1074#1077#1088#1072
          TabOrder = 2
          DesignSize = (
            613
            126)
          object Label6: TLabel
            Left = 7
            Top = 24
            Width = 55
            Height = 13
            Caption = #1055#1091#1090#1100' '#1082' '#1041#1044':'
          end
          object Label7: TLabel
            Left = 24
            Top = 51
            Width = 38
            Height = 13
            Caption = 'LOGIN: '
          end
          object Label8: TLabel
            Left = 184
            Top = 51
            Width = 32
            Height = 13
            Caption = 'PASS: '
          end
          object DBStatus_lbl: TLabel
            Left = 119
            Top = 84
            Width = 97
            Height = 13
            Caption = #1053#1077' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086'!'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 11
            Top = 84
            Width = 102
            Height = 13
            Caption = #1057#1086#1077#1076#1080#1085#1077#1085#1080#1077' '#1089' '#1041#1044':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4868682
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object TestDb_btn: TButton
            Left = 441
            Top = 51
            Width = 169
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1077' '#1089' '#1041#1044
            TabOrder = 0
            OnClick = TestDb_btnClick
          end
          object DBPath_edt: TEdit
            Left = 68
            Top = 21
            Width = 542
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = '81.177.48.139:C:\Projects\Fumigator\Db\fumigator.fdb'
          end
          object DBUser_edt: TEdit
            Left = 69
            Top = 48
            Width = 102
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Text = 'SYSDBA'
          end
          object DBPass_edt: TEdit
            Left = 229
            Top = 48
            Width = 102
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            PasswordChar = '*'
            TabOrder = 3
            Text = 'masterkey'
          end
          object Button3: TButton
            Left = 441
            Top = 84
            Width = 169
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1082#1083#1080#1077#1085#1090#1072
            TabOrder = 4
            OnClick = TestDb_btnClick
          end
          object Button7: TButton
            Left = 47
            Top = 98
            Width = 169
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1090#1077#1083#1077#1092#1086#1085#1086#1074
            TabOrder = 5
            OnClick = Button7Click
          end
        end
      end
      object TabPhones: TTabSheet
        Caption = #1058#1077#1083#1077#1092#1086#1085#1099
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label13: TLabel
          Left = 3
          Top = 3
          Width = 37
          Height = 13
          Caption = #1053#1086#1084#1077#1088#1072
        end
        object lstPhones: TcxListBox
          Left = 3
          Top = 16
          Width = 57
          Height = 137
          ItemHeight = 13
          Items.Strings = (
            '101'
            '102'
            '103'
            '104'
            '105'
            '106'
            '107'
            '755'
            '757')
          TabOrder = 0
        end
      end
      object TabVersion: TTabSheet
        Caption = #1042#1077#1088#1089#1080#1080
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          613
          335)
        object Label14: TLabel
          Left = 3
          Top = 10
          Width = 87
          Height = 13
          Caption = #1056#1072#1073#1086#1095#1072#1103' '#1074#1077#1088#1089#1080#1103': '
        end
        object edtVersion: TEdit
          Left = 91
          Top = 6
          Width = 126
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object btnVersion: TButton
          Left = 218
          Top = 4
          Width = 106
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          TabOrder = 1
          OnClick = btnVersionClick
        end
      end
    end
  end
  object Tel_SRV: TIdHTTPServer
    Bindings = <>
    TerminateWaitTime = 30000
    AutoStartSession = True
    OnCommandGet = Tel_SRVCommandGet
    Left = 345
    Top = 145
  end
  object DefTr: TIBTransaction
    Active = True
    Params.Strings = (
      'isc_tpb_read_committed'
      'isc_tpb_rec_version'
      'isc_tpb_wait')
    AutoStopAction = saCommitRetaining
    Left = 272
    Top = 80
  end
  object DB: TIBDatabase
    Connected = True
    DatabaseName = '81.177.48.139:C:\Projects\Fumigator\Db\fumigator.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = DefTr
    ServerType = 'IBServer'
    AllowStreamedConnected = False
    Left = 232
    Top = 80
  end
  object CallEnent_Q: TIBQuery
    Database = DB
    Transaction = DefTr
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure CALL_EVENT_CREATE(:CALLFLOW, :CALLID, :CALLERI' +
        'DNUM, :CALLERIDNAME,'
      
        '     :CALLEDDID, :CALLEDEXTENSION, :CALLSTATUS, :CALLEREXTENSION' +
        ','
      '     :CALLEDNUMBER, :CALLAPIID,'
      '     :EVENTTYPE        ,'
      '     :CALLEDEXTENSIONID,'
      '     :CALLEREXTENSIONID,'
      '     :RECID            ,'
      '     :EVENTTIME        ,'
      '     :DURATION,'
      '     :CLIENT_ID,'
      '    :CLIENT_TYPE);'
      '')
    Left = 393
    Top = 143
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CALLFLOW'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLERIDNUM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLERIDNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLEDDID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLEDEXTENSION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLSTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLEREXTENSION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLEDNUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLAPIID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EVENTTYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLEDEXTENSIONID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLEREXTENSIONID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RECID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EVENTTIME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DURATION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CLIENT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CLIENT_TYPE'
        ParamType = ptUnknown
      end>
  end
  object IBEvents: TIBEvents
    AutoRegister = False
    Database = DB
    Events.Strings = (
      'ACCEPT_PHONE'
      'CLIENTS_CHANGED'
      'INCOME_CALL'
      'PHONES_CHANGED'
      'RIGHTS_CHANGED'
      'SESSION_CLOSE'
      'SESSION_OPEN')
    Registered = False
    OnEventAlert = IBEventsEventAlert
    Left = 457
    Top = 73
  end
  object TCPServer: TIdTCPServer
    Bindings = <>
    DefaultPort = 0
    OnConnect = TCPServerConnect
    OnDisconnect = TCPServerDisconnect
    OnExecute = TCPServerExecute
    Left = 424
    Top = 208
  end
  object QPhones: TIBQuery
    Database = DB
    Transaction = DefTr
    BeforeOpen = QPhonesBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select phone phone,  cast(p.client_id as varchar(11)) || '#39','#39' ||'
      'case when c.type_cli = 0 then '#39'F'#39' else '#39'U'#39' end type_cli'
      
        'from phones p join clients c on c.id = p.client_id and p."TYPE"=' +
        '0'
      'where c.act = 1'
      'union all'
      'select phone,  cast(p.client_id as varchar(11)) || '#39','#39' || '#39'C'#39
      
        'from phones p join contacts c on c.id = p.client_id and p."TYPE"' +
        '=3')
    Left = 313
    Top = 81
  end
  object RzSelDirDialog1: TRzSelDirDialog
    DriveTypes = [dtFloppy, dtFixed, dtNetwork, dtCDROM, dtRAM]
    Prompt = 'Folder Name'
    PromptFolders = 'Folders'
    PromptDrives = 'Drives'
    Caption = 'Rfnfkju lkz pfgbctq pdjyrjd'
    CaptionOK = 'OK'
    CaptionCancel = 'Cancel'
    CaptionHelp = '&Help'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 353
    Top = 215
  end
end
