inherited FrameWorkerRegions: TFrameWorkerRegions
  inherited grpPhone: TRzGroupBox
    Caption = #1056#1077#1075#1080#1086#1085#1099' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
    inherited grdPhone: TcxGrid
      object grdPhoneDBTableView1: TcxGridDBTableView [0]
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DS
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        object grdPhoneDBTableView1Column1: TcxGridDBColumn
          DataBinding.FieldName = 'REGION_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.GridMode = True
          Properties.KeyFieldNames = 'REGION_ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListSource = DataModuleMain.DsDicRegions
          Width = 155
        end
      end
      inherited grdPhoneLevel1: TcxGridLevel
        GridView = grdPhoneDBTableView1
      end
    end
    inherited RzPanel2: TRzPanel
      inherited btnAdd: TRzBitBtn
        Left = -1
        Top = -3
        ExplicitLeft = -1
        ExplicitTop = -3
      end
      inherited btnEdit: TRzBitBtn
        Left = -1
        ExplicitLeft = -1
      end
      inherited btnDel: TRzBitBtn
        Left = -1
        Top = 70
        ExplicitLeft = -1
        ExplicitTop = 70
      end
    end
  end
  inherited Query_upd: TIBUpdateSQL
    ModifySQL.Strings = (
      'update worker_regions'
      'set '
      'region_id = :region_id'
      'where id = :id')
    InsertSQL.Strings = (
      'insert into worker_regions(worker_id, region_id) '
      'values(:worker_id, :region_id)')
    DeleteSQL.Strings = (
      'delete from worker_regions where id = :id')
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'select * from worker_regions where worker_id=:worker_id')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'worker_id'
        ParamType = ptUnknown
      end>
  end
end
