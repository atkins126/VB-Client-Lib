inherited ReportDM: TReportDM
  OldCreateOrder = True
  Height = 735
  Width = 1178
  object cdsBillableSummary: TFDMemTable
    ActiveStoredUsage = [auDesignTime]
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    Indexes = <
      item
        Active = True
        Selected = True
        Name = 'idxBillablePeriod'
        Fields = 'THE_PERIOD;NAME'
        CaseInsFields = 'NAME'
        Options = [soNoCase]
        FilterOptions = [ekNoCase]
      end
      item
        Active = True
        Name = 'idxBillableCustomer'
        Fields = 'NAME;THE_PERIOD'
        CaseInsFields = 'NAME'
        Options = [soNoCase]
        FilterOptions = [ekNoCase]
      end>
    IndexName = 'idxBillablePeriod'
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvDataSnapCompatibility]
    FormatOptions.DataSnapCompatibility = True
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode, rvStorePrettyPrint]
    ResourceOptions.Persistent = True
    ResourceOptions.StorePrettyPrint = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    UpdateOptions.UpdateTableName = 'BILLABLE_SUMMARY'
    StoreDefs = True
    Left = 160
    Top = 270
    object cdsBillableSummaryCUSTOMER_ID: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'C ID'
      FieldName = 'CUSTOMER_ID'
    end
    object cdsBillableSummaryTHE_PERIOD: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Period'
      FieldName = 'THE_PERIOD'
    end
    object cdsBillableSummaryNAME: TStringField
      DisplayLabel = 'Customer'
      FieldName = 'NAME'
      Size = 100
    end
    object cdsBillableSummaryTOTAL_BILLABLE_HOURS: TFloatField
      DisplayLabel = 'Bill Hrs'
      FieldName = 'TOTAL_BILLABLE_HOURS'
    end
    object cdsBillableSummaryTOTAL_BILLABLE: TFloatField
      DisplayLabel = 'Bill Value'
      FieldName = 'TOTAL_BILLABLE'
    end
    object cdsBillableSummaryTOTAL_NON_BILLABLE_HOURS: TFloatField
      DisplayLabel = 'Non B Hrs'
      FieldName = 'TOTAL_NON_BILLABLE_HOURS'
    end
    object cdsBillableSummaryTOTAL_NON_BILLABLE: TFloatField
      DisplayLabel = 'Non  B Value'
      FieldName = 'TOTAL_NON_BILLABLE'
    end
    object cdsBillableSummaryTOTAL_CARRY_FORWARD: TFloatField
      DisplayLabel = 'C/Fwd'
      FieldName = 'TOTAL_CARRY_FORWARD'
    end
  end
  object dtsBillableSummary: TDataSource
    DataSet = cdsBillableSummary
    Left = 160
    Top = 320
  end
  object cdsPeriod: TFDMemTable
    ActiveStoredUsage = [auDesignTime]
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    Indexes = <
      item
        Active = True
        Selected = True
        Name = 'idxFromPeriod'
        Fields = 'THE_PERIOD'
      end>
    IndexName = 'idxFromPeriod'
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvDataSnapCompatibility]
    FormatOptions.DataSnapCompatibility = True
    ResourceOptions.AssignedValues = [rvSilentMode, rvStorePrettyPrint]
    ResourceOptions.StorePrettyPrint = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 240
    Top = 10
    object cdsPeriodTHE_PERIOD: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Period'
      FieldName = 'THE_PERIOD'
    end
  end
  object cdsToPeriod: TFDMemTable
    ActiveStoredUsage = [auDesignTime]
    CachedUpdates = True
    Indexes = <
      item
        Active = True
        Selected = True
        Name = 'idxToperiod'
        Fields = 'THE_PERIOD'
      end>
    IndexName = 'idxToperiod'
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvDataSnapCompatibility]
    FormatOptions.DataSnapCompatibility = True
    ResourceOptions.AssignedValues = [rvSilentMode, rvStorePrettyPrint]
    ResourceOptions.StorePrettyPrint = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvGeneratorName, uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.GeneratorName = 'PERIOD_ID_GEN'
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    UpdateOptions.UpdateTableName = 'PERIOD'
    Left = 315
    Top = 10
    object cdsToPeriodTHE_PERIOD: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Period'
      FieldName = 'THE_PERIOD'
    end
  end
  object dtsPeriod: TDataSource
    DataSet = cdsPeriod
    Left = 235
    Top = 60
  end
  object dtsToPeriod: TDataSource
    DataSet = cdsToPeriod
    Left = 320
    Top = 60
  end
  object conSQLLite: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 35
    Top = 135
  end
  object qryPeriod: TFDQuery
    LocalSQL = locSQL
    Connection = conSQLLite
    SQL.Strings = (
      'SELECT'
      ' THE_PERIOD'
      'FROM'
      ' SourcePeriod')
    Left = 100
    Top = 135
  end
  object locSQL: TFDLocalSQL
    Connection = conSQLLite
    Active = True
    DataSets = <
      item
        DataSet = cdsPeriod
        Name = 'SourcePeriod'
      end
      item
        DataSet = qryPeriod
        Name = 'BillableSummaryPeriod'
      end>
    Left = 165
    Top = 135
  end
  object cdsTSBillable: TFDMemTable
    ActiveStoredUsage = [auDesignTime]
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvDataSnapCompatibility]
    FormatOptions.DataSnapCompatibility = True
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode, rvStorePrettyPrint]
    ResourceOptions.Persistent = True
    ResourceOptions.StorePrettyPrint = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 565
    Top = 275
    object cdsTSBillableID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ID'
      Origin = 'ID'
    end
    object cdsTSBillableFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Origin = 'FIRST_NAME'
      Size = 30
    end
    object cdsTSBillableLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LAST_NAME'
      Origin = 'LAST_NAME'
      Size = 30
    end
    object cdsTSBillableLOGIN_NAME: TStringField
      DisplayLabel = 'User Name'
      FieldName = 'LOGIN_NAME'
      Origin = 'LOGIN_NAME'
    end
    object cdsTSBillableACTIVITY_DATE: TDateField
      DisplayLabel = 'Date'
      FieldName = 'ACTIVITY_DATE'
      Origin = 'ACTIVITY_DATE'
    end
    object cdsTSBillableCUSTOMER_TYPE: TStringField
      DisplayLabel = 'Customer Type'
      FieldName = 'CUSTOMER_TYPE'
      Origin = 'CUSTOMER_TYPE'
      Size = 30
    end
    object cdsTSBillableCUSTOMER_NAME: TStringField
      DisplayLabel = 'Customer'
      FieldName = 'CUSTOMER_NAME'
      Origin = 'CUSTOMER_NAME'
      Size = 100
    end
    object cdsTSBillableACTIVITY_TYPE: TStringField
      DisplayLabel = 'Activity Type'
      FieldName = 'ACTIVITY_TYPE'
      Origin = 'ACTIVITY_TYPE'
      Size = 50
    end
    object cdsTSBillableACTIVITY: TStringField
      DisplayLabel = 'Activity'
      FieldName = 'ACTIVITY'
      Origin = 'ACTIVITY'
      Size = 500
    end
    object cdsTSBillablePRICE_LIST_ITEM: TStringField
      DisplayLabel = 'Item Type'
      FieldName = 'PRICE_LIST_ITEM'
      Origin = 'PRICE_LIST_ITEM'
      Size = 200
    end
    object cdsTSBillableTIME_SPENT: TFloatField
      DisplayLabel = 'Mins'
      FieldName = 'TIME_SPENT'
      Origin = 'TIME_SPENT'
    end
    object cdsTSBillableTIME_HOURS: TFloatField
      DisplayLabel = 'Hours'
      FieldName = 'TIME_HOURS'
      Origin = 'TIME_HOURS'
    end
    object cdsTSBillableACTUAL_RATE: TFloatField
      DisplayLabel = 'Rate'
      FieldName = 'ACTUAL_RATE'
      Origin = 'ACTUAL_RATE'
    end
    object cdsTSBillableSTD_RATE: TFloatField
      DisplayLabel = 'Std Rate'
      FieldName = 'STD_RATE'
      Origin = 'STD_RATE'
    end
    object cdsTSBillableITEM_VALUE: TFloatField
      DisplayLabel = 'Value'
      FieldName = 'ITEM_VALUE'
      Origin = 'ITEM_VALUE'
    end
    object cdsTSBillableTHE_PERIOD: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Period'
      FieldName = 'THE_PERIOD'
      Origin = 'THE_PERIOD'
    end
    object cdsTSBillableWEEK_ENDING: TDateField
      DisplayLabel = 'Wk Ending'
      FieldName = 'WEEK_ENDING'
      Origin = 'WEEK_ENDING'
    end
    object cdsTSBillableBILLABLE: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Bill'
      FieldName = 'BILLABLE'
      Origin = 'BILLABLE'
    end
    object cdsTSBillableBILLABLE_STR: TStringField
      Alignment = taCenter
      DisplayLabel = 'Bill'
      FieldName = 'BILLABLE_STR'
      Origin = 'BILLABLE_STR'
      FixedChar = True
      Size = 1
    end
    object cdsTSBillableINVOICE_ID: TIntegerField
      DisplayLabel = 'Inv No'
      FieldName = 'INVOICE_ID'
      Origin = 'INVOICE_ID'
    end
    object cdsTSBillableCN_ID: TIntegerField
      DisplayLabel = 'CN No'
      FieldName = 'CN_ID'
      Origin = 'CN_ID'
    end
    object cdsTSBillableLOCKED: TIntegerField
      DisplayLabel = 'Lock'
      FieldName = 'LOCKED'
      Origin = 'LOCKED'
    end
    object cdsTSBillableLOCKED_STR: TStringField
      DisplayLabel = 'Lock'
      FieldName = 'LOCKED_STR'
      Size = 1
    end
    object cdsTSBillableINVOICE_DATE: TDateField
      DisplayLabel = 'Inv Date'
      FieldName = 'INVOICE_DATE'
      Origin = 'INVOICE_DATE'
    end
    object cdsTSBillableCARRY_FORWARD: TIntegerField
      DisplayLabel = 'C Fwd'
      FieldName = 'CARRY_FORWARD'
      Origin = 'CARRY_FORWARD'
    end
    object cdsTSBillableCARRY_FORWARD_STR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C Fwd'
      FieldName = 'CARRY_FORWARD_STR'
      Origin = 'CARRY_FORWARD_STR'
      FixedChar = True
      Size = 1
    end
    object cdsTSBillableIS_ADDITIONAL_WORK: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Add Wk'
      FieldName = 'IS_ADDITIONAL_WORK'
      Origin = 'IS_ADDITIONAL_WORK'
    end
    object cdsTSBillableIS_ADDITIONAL_WORK_STR: TStringField
      Alignment = taCenter
      DisplayLabel = 'Add Wk'
      FieldName = 'IS_ADDITIONAL_WORK_STR'
      Origin = 'IS_ADDITIONAL_WORK_STR'
      FixedChar = True
      Size = 1
    end
    object cdsTSBillableTOTAL_CARRY_FORWARD: TFloatField
      DisplayLabel = 'C/Fwd'
      FieldName = 'TOTAL_CARRY_FORWARD'
    end
  end
  object dtsTSBillable: TDataSource
    DataSet = cdsTSBillable
    Left = 565
    Top = 325
  end
  object frxPDFExport: TfrxPDFExport
    FileName = 'TimesheetUser.pdf'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 43629.686801180560000000
    DataOnly = False
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 155
    Top = 185
  end
  object rptBillableSummaryByCustomer: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43498.583602488400000000
    ReportOptions.LastChange = 43682.465325902780000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 70
    Top = 370
    Datasets = <
      item
        DataSet = fdsBillableSummaryByCustomer
        DataSetName = 'BillableSummary'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Calibri'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 15.000000000000000000
      RightMargin = 15.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 68.031540000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Top = 49.133824090000000000
          Width = 680.314960629921000000
          Height = 18.897637800000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Top = 49.133858270000000000
          Width = 75.590307090000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            'Customer')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 200.314792200000000000
          Top = 49.133890000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Bill Hours')
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362036300000000000
          Top = 49.133890000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Billable')
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 404.409280390000000000
          Top = 49.133890000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Non Bill Hrs')
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 506.456524490000000000
          Top = 49.133890000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'C Fwd')
        end
        object Memo12: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 264.567100000000000000
          Height = 26.456710000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'van Brakel and Accossiates')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 317.480519999999900000
          Width = 362.834880000000000000
          Height = 26.456710000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Billable Summay Report by Customer')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 109.606370000000000000
          Top = 49.133890000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Visible = False
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          Memo.UTF8W = (
            'Period')
        end
      end
      object bndBillableData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Height = 18.897637800000000000
        Top = 192.756030000000000000
        Width = 680.315400000000000000
        DataSet = fdsBillableSummaryByCustomer
        DataSetName = 'BillableSummary'
        RowCount = 0
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 200.315090000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_BILLABLE_HOURS'
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[BillableSummary."TOTAL_BILLABLE_HOURS"]')
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362046060000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_BILLABLE'
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[BillableSummary."TOTAL_BILLABLE"]')
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 404.409295040000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_NON_BILLABLE_HOURS'
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[BillableSummary."TOTAL_NON_BILLABLE_HOURS"]')
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 506.456544020000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_CARRY_FORWARD'
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[BillableSummary."TOTAL_CARRY_FORWARD"]')
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Width = 162.519724090000000000
          Height = 18.897650000000000000
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '#####0'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          GapX = 7.000000000000000000
          HideZeros = True
          Memo.UTF8W = (
            'Period: [BillableSummary."THE_PERIOD"]')
        end
      end
      object bndCustomerHeader: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 22.677180000000000000
        ParentFont = False
        Top = 147.401670000000000000
        Width = 680.315400000000000000
        Condition = 'BillableSummary."NAME"'
        KeepTogether = True
        ReprintOnNewPage = True
        ResetPageNumbers = True
        object lblCustomerHeader: TfrxMemoView
          AllowVectorExport = True
          Width = 449.764070000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[BillableSummary."NAME"]')
        end
      end
      object bndBillableFooter: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 34.015748030000000000
        ParentFont = False
        Top = 234.330860000000000000
        Width = 680.315400000000000000
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Width = 680.314960629921000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftBottom]
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 200.315090000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<BillableSummary."TOTAL_BILLABLE_HOURS">,bndBillableData)]')
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362046060000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<BillableSummary."TOTAL_BILLABLE">,bndBillableData)]')
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 404.409295040001000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            
              '[SUM(<BillableSummary."TOTAL_NON_BILLABLE_HOURS">,bndBillableDat' +
              'a)]')
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 506.456544020001000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<BillableSummary."TOTAL_CARRY_FORWARD">,bndBillableData)]')
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 86.929190000000000000
          Width = 102.047244090000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Totals: ')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 18.897637800000000000
        ParentFont = False
        Top = 328.819110000000000000
        Width = 680.315400000000000000
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 200.315090000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<BillableSummary."TOTAL_BILLABLE_HOURS">,bndBillableData)]')
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362046060000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<BillableSummary."TOTAL_BILLABLE">,bndBillableData)]')
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 404.409295040001000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            
              '[SUM(<BillableSummary."TOTAL_NON_BILLABLE_HOURS">,bndBillableDat' +
              'a)]')
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 506.456544020001000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<BillableSummary."TOTAL_CARRY_FORWARD">,bndBillableData)]')
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 86.929190000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'GrandTotals: ')
        end
      end
    end
  end
  object rptTimesheetByUser: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    EngineOptions.PrintIfEmpty = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43494.671348414300000000
    ReportOptions.LastChange = 43681.403289340280000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 415
    Top = 375
    Datasets = <
      item
        DataSet = fdsTimesheetByUser
        DataSetName = 'TimesheetByUser'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
      end
      object bndMaster: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = [ftRight, ftTop, ftBottom]
        Height = 18.897637800000000000
        Top = 192.756030000000000000
        Width = 1046.929810000000000000
        DataSet = fdsTimesheetByUser
        DataSetName = 'TimesheetByUser'
        RowCount = 0
        Stretched = True
        object TimesheetACTIVITY_DATE: TfrxMemoView
          AllowVectorExport = True
          Width = 79.370078740000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'ACTIVITY_DATE'
          DataSet = fdsTimesheetByUser
          DataSetName = 'TimesheetByUser'
          Frame.Typ = [ftLeft]
          GapX = 7.000000000000000000
          Memo.UTF8W = (
            '[TimesheetByUser."ACTIVITY_DATE"]')
        end
        object TimesheetCUSTOMER_NAME: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'CUSTOMER_NAME'
          DataSet = fdsTimesheetByUser
          DataSetName = 'TimesheetByUser'
          Frame.Typ = [ftLeft]
          GapX = 7.000000000000000000
          Memo.UTF8W = (
            '[TimesheetByUser."CUSTOMER_NAME"]')
        end
        object TimesheetACTIVITY_TYPE: TfrxMemoView
          AllowVectorExport = True
          Left = 317.480520000000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'ACTIVITY_TYPE'
          DataSet = fdsTimesheetByUser
          DataSetName = 'TimesheetByUser'
          Frame.Typ = [ftLeft]
          GapX = 7.000000000000000000
          Memo.UTF8W = (
            '[TimesheetByUser."ACTIVITY_TYPE"]')
        end
        object TimesheetACTIVITY: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Width = 279.685039370078700000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'ACTIVITY'
          DataSet = fdsTimesheetByUser
          DataSetName = 'TimesheetByUser'
          Frame.Typ = [ftLeft]
          GapX = 7.000000000000000000
          Memo.UTF8W = (
            '[TimesheetByUser."ACTIVITY"]')
        end
        object TimesheetTIME_SPENT: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 971.339258818897700000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'TOTAL_CARRY_FORWARD'
          DataSet = fdsTimesheetByUser
          DataSetName = 'TimesheetByUser'
          DisplayFormat.FormatStr = '###,###0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[TimesheetByUser."TOTAL_CARRY_FORWARD"]')
        end
        object TimesheetRATE: TfrxMemoView
          AllowVectorExport = True
          Left = 831.496006850000000000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'ACTUAL_RATE'
          DataSet = fdsTimesheetByUser
          DataSetName = 'TimesheetByUser'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[TimesheetByUser."ACTUAL_RATE"]')
        end
        object TimesheetITEM_VALUE: TfrxMemoView
          AllowVectorExport = True
          Left = 891.968503940000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'ITEM_VALUE'
          DataSet = fdsTimesheetByUser
          DataSetName = 'TimesheetByUser'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[TimesheetByUser."ITEM_VALUE"]')
        end
        object TimesheetTIME_HOURS: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362187640000000000
          Width = 45.354330710000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'TIME_HOURS'
          DataSet = fdsTimesheetByUser
          DataSetName = 'TimesheetByUser'
          DisplayFormat.FormatStr = '###0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[TimesheetByUser."TIME_HOURS"]')
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 759.685530000000000000
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'BILLABLE_STR'
          DataSet = fdsTimesheetByUser
          DataSetName = 'TimesheetByUser'
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[TimesheetByUser."BILLABLE_STR"]')
        end
      end
      object bndGrpFooterUser: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = [ftLeft, ftRight, ftBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 18.897637800000000000
        ParentFont = False
        Top = 234.330860000000000000
        Width = 1046.929810000000000000
        object Memo13: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 971.339258818897700000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TimesheetByUser."TOTAL_CARRY_FORWARD">,bndMaster)]')
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 891.968503937007900000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TimesheetByUser."ITEM_VALUE">,bndMaster)]')
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362204724409300000
          Width = 49.133860710000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TimesheetByUser."TIME_HOURS">,bndMaster)]')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 634.961040000000000000
          Width = 143.622047240000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Totals For: [TimesheetByUser."LOGIN_NAME"]')
        end
      end
      object grpUser: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = [ftBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Top = 170.078850000000000000
        Width = 1046.929810000000000000
        Condition = 'TimesheetByUser."LOGIN_NAME"'
        KeepTogether = True
        ResetPageNumbers = True
        StartNewPage = True
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Width = 423.307360000000000000
          Height = 18.897650000000000000
          Visible = False
          Frame.Typ = []
          Memo.UTF8W = (
            'Timesheets for: [(<TimesheetByUser."LOGIN_NAME">)]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = [ftTop]
        Height = 22.677180000000000000
        Top = 355.275820000000000000
        Width = 1046.929810000000000000
        object Memo11: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Printed on: [(Date)] at: [(Time)]')
        end
        object Memo12: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 854.173780000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page] of [TotalPages]')
          Formats = <
            item
            end
            item
            end>
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 68.031540000000000000
        ParentFont = False
        Top = 41.574830000000000000
        Width = 1046.929810000000000000
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Top = 49.133890000000000000
          Width = 1046.929133860000000000
          Height = 18.897637800000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Top = 49.133890000000000000
          Width = 79.370078740000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            'Date')
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149606300000000000
          Top = 49.133890000000000000
          Width = 230.551181100000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            'Customer')
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 317.480329610000000000
          Top = 49.133890000000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            'Activity Type')
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220472440000000000
          Top = 49.133890000000000000
          Width = 279.685039370078700000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            'Description')
        end
        object Memo25: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 971.339258818897700000
          Top = 49.133890000000000000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'C/Fwd')
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 831.496006850000000000
          Top = 49.133890000000000000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Rate')
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 891.968513700000000000
          Top = 49.133890000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Amt')
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362187640000000000
          Top = 49.133890000000000000
          Width = 45.354330710000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Hrs')
        end
        object Memo5: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 604.724800000000000000
          Width = 442.205010000000000000
          Height = 30.236220470000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Timesheets for: [TimesheetByUser."LOGIN_NAME"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 257.008040000000000000
          Height = 30.236240000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'van Brakel and Associates')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 759.685017400000000000
          Top = 49.133890000000000000
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Bl')
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = [ftLeft, ftRight, ftBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 18.897637800000000000
        ParentFont = False
        Top = 275.905690000000000000
        Width = 1046.929810000000000000
        object Memo4: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 971.339258818897700000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TimesheetByUser."TOTAL_CARRY_FORWARD">,bndMaster)]')
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 891.968503937007900000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TimesheetByUser."ITEM_VALUE">,bndMaster)]')
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362204724409300000
          Width = 49.133860710000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TimesheetByUser."TIME_HOURS">,bndMaster)]')
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 634.961040000000000000
          Width = 143.622047240000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Grand Totals:')
        end
      end
    end
  end
  object fdsBillableSummaryByCustomer: TfrxDBDataset
    UserName = 'BillableSummary'
    CloseDataSource = False
    DataSet = cdsBillableSummary
    BCDToCurrency = False
    Left = 70
    Top = 425
  end
  object fdsTimesheetByUser: TfrxDBDataset
    UserName = 'TimesheetByUser'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'FIRST_NAME=FIRST_NAME'
      'LAST_NAME=LAST_NAME'
      'LOGIN_NAME=LOGIN_NAME'
      'ACTIVITY_DATE=ACTIVITY_DATE'
      'CUSTOMER_TYPE=CUSTOMER_TYPE'
      'CUSTOMER_NAME=CUSTOMER_NAME'
      'ACTIVITY_TYPE=ACTIVITY_TYPE'
      'ACTIVITY=ACTIVITY'
      'PRICE_LIST_ITEM=PRICE_LIST_ITEM'
      'TIME_SPENT=TIME_SPENT'
      'TIME_HOURS=TIME_HOURS'
      'ACTUAL_RATE=ACTUAL_RATE'
      'STD_RATE=STD_RATE'
      'ITEM_VALUE=ITEM_VALUE'
      'THE_PERIOD=THE_PERIOD'
      'WEEK_ENDING=WEEK_ENDING'
      'BILLABLE=BILLABLE'
      'BILLABLE_STR=BILLABLE_STR'
      'INVOICE_ID=INVOICE_ID'
      'CN_ID=CN_ID'
      'LOCKED=LOCKED'
      'LOCKED_STR=LOCKED_STR'
      'INVOICE_DATE=INVOICE_DATE'
      'CARRY_FORWARD=CARRY_FORWARD'
      'CARRY_FORWARD_STR=CARRY_FORWARD_STR'
      'IS_ADDITIONAL_WORK=IS_ADDITIONAL_WORK'
      'IS_ADDITIONAL_WORK_STR=IS_ADDITIONAL_WORK_STR'
      'TOTAL_CARRY_FORWARD=TOTAL_CARRY_FORWARD')
    DataSet = cdsTSBillable
    BCDToCurrency = False
    Left = 415
    Top = 425
  end
  object rptBillableSummaryByPeriod: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43498.583602488400000000
    ReportOptions.LastChange = 43682.464763750000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 245
    Top = 370
    Datasets = <
      item
        DataSet = fdsBillableSummaryByCustomer
        DataSetName = 'BillableSummary'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Calibri'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 15.000000000000000000
      RightMargin = 15.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 68.031540000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1009.134510000000000000
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Top = 49.133824090000000000
          Width = 1009.133858267720000000
          Height = 18.897637800000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Top = 49.133890000000000000
          Width = 453.543307090000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            'Customer')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 461.102362200000000000
          Top = 49.133890000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Bill Hours')
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 563.149606300000000000
          Top = 49.133890000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Billable')
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 665.196850390000000000
          Top = 49.133890000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Non Bill Hrs')
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 767.244094490000000000
          Top = 49.133890000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'C Fwd')
        end
        object Memo12: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 264.567100000000000000
          Height = 26.456710000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'van Brakel and Accossiates')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 619.842919999999900000
          Width = 389.291590000000000000
          Height = 26.456710000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Billable Summay Report by Period')
          ParentFont = False
        end
      end
      object bndBillableData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = [ftRight, ftBottom]
        Height = 18.897637800000000000
        Top = 192.756030000000000000
        Width = 1009.134510000000000000
        DataSet = fdsBillableSummaryByCustomer
        DataSetName = 'BillableSummary'
        RowCount = 0
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Width = 453.543307090000000000
          Height = 18.897650000000000000
          DataField = 'NAME'
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          Frame.Typ = [ftLeft, ftRight]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[BillableSummary."NAME"]')
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 461.102660000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_BILLABLE_HOURS'
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[BillableSummary."TOTAL_BILLABLE_HOURS"]')
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 563.149616060000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_BILLABLE'
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[BillableSummary."TOTAL_BILLABLE"]')
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 665.196865040000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_NON_BILLABLE_HOURS'
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[BillableSummary."TOTAL_NON_BILLABLE_HOURS"]')
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 767.244114020000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_CARRY_FORWARD'
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[BillableSummary."TOTAL_CARRY_FORWARD"]')
        end
      end
      object bndPeriodHeader: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = [ftTop, ftBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 22.677180000000000000
        ParentFont = False
        Top = 147.401670000000000000
        Width = 1009.134510000000000000
        Condition = 'BillableSummary."THE_PERIOD"'
        ReprintOnNewPage = True
        ResetPageNumbers = True
        StartNewPage = True
        object lblPeriodHeader: TfrxMemoView
          AllowVectorExport = True
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Period: [BillableSummary."THE_PERIOD"]')
        end
      end
      object bndBillableFooter: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 18.897637795275600000
        ParentFont = False
        Top = 234.330860000000000000
        Width = 1009.134510000000000000
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 461.102660000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<BillableSummary."TOTAL_BILLABLE_HOURS">,bndBillableData)]')
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 563.149616060000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<BillableSummary."TOTAL_BILLABLE">,bndBillableData)]')
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 665.196865040000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            
              '[SUM(<BillableSummary."TOTAL_NON_BILLABLE_HOURS">,bndBillableDat' +
              'a)]')
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 767.244114020000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<BillableSummary."TOTAL_CARRY_FORWARD">,bndBillableData)]')
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 325.039580000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight]
          HAlign = haRight
          Memo.UTF8W = (
            'Period Totals: ')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 18.897637795275600000
        ParentFont = False
        Top = 313.700990000000000000
        Width = 1009.134510000000000000
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 461.102660000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<BillableSummary."TOTAL_BILLABLE_HOURS">,bndBillableData)]')
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 563.149616060000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<BillableSummary."TOTAL_BILLABLE">,bndBillableData)]')
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 665.196865040000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            
              '[SUM(<BillableSummary."TOTAL_NON_BILLABLE_HOURS">,bndBillableDat' +
              'a)]')
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 767.244114020000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = fdsBillableSummaryByCustomer
          DataSetName = 'BillableSummary'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<BillableSummary."TOTAL_CARRY_FORWARD">,bndBillableData)]')
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 325.039580000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight]
          HAlign = haRight
          Memo.UTF8W = (
            'GrandTotals: ')
        end
      end
    end
  end
  object fdsBillableSummaryByPeriod: TfrxDBDataset
    UserName = 'BillableSummary'
    CloseDataSource = False
    DataSet = cdsBillableSummary
    BCDToCurrency = False
    Left = 245
    Top = 425
  end
  object cdsPeriodListing: TFDMemTable
    ActiveStoredUsage = [auDesignTime]
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvDataSnapCompatibility]
    FormatOptions.DataSnapCompatibility = True
    ResourceOptions.AssignedValues = [rvSilentMode, rvStorePrettyPrint]
    ResourceOptions.StorePrettyPrint = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 395
    Top = 10
    object cdsPeriodListingTHE_PERIOD: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Period'
      FieldName = 'THE_PERIOD'
    end
  end
  object dtsPeriodListing: TDataSource
    DataSet = cdsPeriodListing
    Left = 395
    Top = 60
  end
  object cdsTSCustomer: TFDMemTable
    ActiveStoredUsage = [auDesignTime]
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvDataSnapCompatibility]
    FormatOptions.DataSnapCompatibility = True
    ResourceOptions.AssignedValues = [rvSilentMode, rvStorePrettyPrint]
    ResourceOptions.StorePrettyPrint = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 320
    Top = 135
    object cdsTSCustomerID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ID'
      Origin = 'ID'
    end
    object cdsTSCustomerCUSTOMER_TYPE_ID: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'CT ID'
      FieldName = 'CUSTOMER_TYPE_ID'
      Origin = 'CUSTOMER_TYPE_ID'
    end
    object cdsTSCustomerSTATUS_ID: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Stat ID'
      FieldName = 'STATUS_ID'
      Origin = 'STATUS_ID'
    end
    object cdsTSCustomerNAME: TStringField
      DisplayLabel = 'Customer'
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 100
    end
    object cdsTSCustomerCUSTOMER_TYPE: TStringField
      DisplayLabel = 'Type'
      FieldName = 'CUSTOMER_TYPE'
      Origin = 'CUSTOMER_TYPE'
      Size = 30
    end
    object cdsTSCustomerCUSTOMER_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'CUSTOMER_STATUS'
      Origin = 'CUSTOMER_STATUS'
    end
    object cdsTSCustomerIS_ACTIVE: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Act'
      FieldName = 'IS_ACTIVE'
      Origin = 'IS_ACTIVE'
    end
    object cdsTSCustomerCUSTOMER_GROUP_ID: TIntegerField
      DisplayLabel = 'C Grp ID'
      FieldName = 'CUSTOMER_GROUP_ID'
      Origin = 'CUSTOMER_GROUP_ID'
    end
    object cdsTSCustomerCUSTOMER_ID: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Cust ID'
      FieldName = 'CUSTOMER_ID'
      Origin = 'CUSTOMER_ID'
    end
    object cdsTSCustomerCUSTOMER_GROUP_LINK_NAME: TStringField
      DisplayLabel = 'Cust Grp Link Name'
      FieldName = 'CUSTOMER_GROUP_LINK_NAME'
      Origin = 'CUSTOMER_GROUP_LINK_NAME'
      Size = 100
    end
  end
  object dtsTSCustomer: TDataSource
    DataSet = cdsTSCustomer
    Left = 320
    Top = 185
  end
  object VbliveConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=VB Live')
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtWideString
        TargetDataType = dtAnsiString
      end>
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    Left = 997
    Top = 12
  end
  object cdsActivityType: TFDMemTable
    ActiveStoredUsage = [auDesignTime]
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvDataSnapCompatibility]
    FormatOptions.DataSnapCompatibility = True
    ResourceOptions.AssignedValues = [rvSilentMode, rvStorePrettyPrint]
    ResourceOptions.StorePrettyPrint = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvGeneratorName, uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.GeneratorName = 'ACTIVITY_TYPE_ID_GEN'
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    UpdateOptions.UpdateTableName = 'ACTIVITY_TYPE'
    Left = 410
    Top = 135
    object cdsActivityTypeID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsActivityTypeNAME: TStringField
      DisplayLabel = 'Activity Type'
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 50
    end
  end
  object dtsActivityType: TDataSource
    DataSet = cdsActivityType
    Left = 410
    Top = 185
  end
  object cdsTSSummaryByActivity: TFDMemTable
    ActiveStoredUsage = [auDesignTime]
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvDataSnapCompatibility]
    FormatOptions.DataSnapCompatibility = True
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode, rvStorePrettyPrint]
    ResourceOptions.Persistent = True
    ResourceOptions.StorePrettyPrint = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 860
    Top = 275
    object cdsTSSummaryByActivityTHE_PERIOD: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Period'
      FieldName = 'THE_PERIOD'
      Origin = 'THE_PERIOD'
      Required = True
    end
    object cdsTSSummaryByActivityACTIVITY_TYPE_ID: TIntegerField
      Alignment = taLeftJustify
      AutoGenerateValue = arDefault
      DisplayLabel = 'A T ID'
      FieldName = 'ACTIVITY_TYPE_ID'
      Origin = 'ID'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByActivityACTIVITY_TYPE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Activity Type'
      FieldName = 'ACTIVITY_TYPE'
      Origin = 'NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsTSSummaryByActivityAMANDA: TFloatField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Mins'
      FieldName = 'AMANDA'
      Origin = 'AMANDA'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByActivityAMANDA_HRS: TFloatField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Hours'
      FieldName = 'AMANDA_HRS'
      Origin = 'AMANDA_HRS'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByActivityAMANDA_ITEM_VALUE: TFloatField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Value'
      FieldName = 'AMANDA_ITEM_VALUE'
      Origin = 'AMANDA_ITEM_VALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByActivityCHANEL: TFloatField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Mins'
      FieldName = 'CHANEL'
      Origin = 'CHANEL'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByActivityCHANEL_HRS: TFloatField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Hours'
      FieldName = 'CHANEL_HRS'
      Origin = 'CHANEL_HRS'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByActivityCHANEL_ITEM_VALUE: TFloatField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Value'
      FieldName = 'CHANEL_ITEM_VALUE'
      Origin = 'CHANEL_ITEM_VALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByActivityCHRISTA: TFloatField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Mins'
      FieldName = 'CHRISTA'
      Origin = 'CHRISTA'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByActivityCHRISTA_HRS: TFloatField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Hours'
      FieldName = 'CHRISTA_HRS'
      Origin = 'CHRISTA_HRS'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByActivityCHRISTA_ITEM_VALUE: TFloatField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Value'
      FieldName = 'CHRISTA_ITEM_VALUE'
      Origin = 'CHRISTA_ITEM_VALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByActivityALBERTUS: TFloatField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Mins'
      FieldName = 'ALBERTUS'
      Origin = 'ALBERTUS'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByActivityALBERTUS_HRS: TFloatField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Hours'
      FieldName = 'ALBERTUS_HRS'
      Origin = 'ALBERTUS_HRS'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByActivityALBERTUS_ITEM_VALUE: TFloatField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Value'
      FieldName = 'ALBERTUS_ITEM_VALUE'
      Origin = 'ALBERTUS_ITEM_VALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dtsTSSummaryByActivity: TDataSource
    DataSet = cdsTSSummaryByActivity
    Left = 860
    Top = 325
  end
  object cdsTSSummaryByUser: TFDMemTable
    ActiveStoredUsage = [auDesignTime]
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvDataSnapCompatibility]
    FormatOptions.DataSnapCompatibility = True
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode, rvStorePrettyPrint]
    ResourceOptions.Persistent = True
    ResourceOptions.StorePrettyPrint = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 985
    Top = 135
    object cdsTSSummaryByUserUSER_ID: TIntegerField
      FieldName = 'USER_ID'
      Origin = 'USER_ID'
    end
    object cdsTSSummaryByUserLOGIN_NAME: TStringField
      FieldName = 'LOGIN_NAME'
      Origin = 'LOGIN_NAME'
    end
    object cdsTSSummaryByUserAVB_COMPANIES: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'AVB_COMPANIES'
      Origin = 'AVB_COMPANIES'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByUserAVB_PERSONAL: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'AVB_PERSONAL'
      Origin = 'AVB_PERSONAL'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByUserTIMESHEETS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'TIMESHEETS'
      Origin = 'TIMESHEETS'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByUserFILING_AND_POST: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'FILING_AND_POST'
      Origin = 'FILING_AND_POST'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByUserPC_BANK: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'PC_BANK'
      Origin = 'PC_BANK'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByUserOFFICE_ADMIN: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'OFFICE_ADMIN'
      Origin = 'OFFICE_ADMIN'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByUserSOCIAL: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'SOCIAL'
      Origin = 'SOCIAL'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByUserCOMPUTERS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'COMPUTERS'
      Origin = 'COMPUTERS'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByUserTRAINING_RESEARCH: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'TRAINING_RESEARCH'
      Origin = 'TRAINING_RESEARCH'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByUserESTATES_WILLS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'ESTATES_WILLS'
      Origin = 'ESTATES_WILLS'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByUserWORKMENS_COMP: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'WORKMENS_COMP'
      Origin = 'WORKMENS_COMP'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByUserSARS_TAX: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'SARS_TAX'
      Origin = 'SARS_TAX'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByUserCIPC: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'CIPC'
      Origin = 'CIPC'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByUserCRRADLE_OF_HOPE: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'CRRADLE_OF_HOPE'
      Origin = 'CRRADLE_OF_HOPE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByUserDEBTORS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'DEBTORS'
      Origin = 'DEBTORS'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByUserTRAVELLING: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'TRAVELLING'
      Origin = 'TRAVELLING'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTSSummaryByUserJUDY_PLACE: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'JUDY_PLACE'
      Origin = 'JUDY_PLACE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dtsTSSummaryByUser: TDataSource
    Left = 985
    Top = 190
  end
  object qryDummy: TFDQuery
    Connection = VbliveConnection
    SQL.Strings = (
      'SELECT'
      'T.THE_PERIOD,'
      'A.ID AS ACTIVITY_TYPE_ID,'
      'A."NAME" AS ACTIVITY_TYPE,'
      'SUM(CASE WHEN T.USER_ID=2 THEN'
      'T.TIME_SPENT ELSE 0 END) AS Amanda,'
      'SUM(CASE WHEN T.USER_ID=2 THEN'
      'T.TIME_HOURS ELSE 0 END) AS Amanda_Hrs,'
      'SUM(CASE WHEN T.USER_ID=2 THEN'
      'T.ITEM_VALUE ELSE 0  END) AS Amanda_Item_Value,'
      'SUM(CASE WHEN T.USER_ID=3 THEN'
      'T.TIME_SPENT ELSE 0 END) AS Chanel,'
      'SUM(CASE WHEN T.USER_ID=3 THEN'
      'T.TIME_HOURS ELSE 0 END) AS Chanel_Hrs,'
      'SUM(CASE WHEN T.USER_ID=3 THEN'
      'T.ITEM_VALUE ELSE 0  END) AS Chanel_Item_Value,'
      'SUM(CASE WHEN T.USER_ID=4 THEN'
      'T.TIME_SPENT ELSE 0 END) AS Christa,'
      'SUM(CASE WHEN T.USER_ID=4 THEN'
      'T.TIME_HOURS ELSE 0 END) AS Christa_Hrs,'
      'SUM(CASE WHEN T.USER_ID=4 THEN'
      'T.ITEM_VALUE ELSE 0  END) AS Christa_Item_Value,'
      'SUM(CASE WHEN T.USER_ID=5 THEN'
      'T.TIME_SPENT ELSE 0 END) AS Albertus,'
      'SUM(CASE WHEN T.USER_ID=5 THEN'
      'T.TIME_HOURS ELSE 0 END) AS Albertus_Hrs,'
      'SUM(CASE WHEN T.USER_ID=5 THEN'
      'T.ITEM_VALUE ELSE 0  END) AS Albertus_Item_Value'
      'FROM'
      'TIMESHEET T'
      'LEFT JOIN ACTIVITY_TYPE A'
      'ON T.ACTIVITY_TYPE_ID=A.ID'
      'LEFT JOIN SYSTEM_USER U'
      'ON T.USER_ID=U.ID'
      'WHERE'
      'T.THE_PERIOD = 201905'
      'GROUP BY'
      'T.THE_PERIOD,'
      'A.ID,'
      'A."NAME"'
      'ORDER BY'
      'A."NAME"')
    Left = 710
    Top = 80
  end
  object cdsSumByActivityPeriod: TFDMemTable
    ActiveStoredUsage = [auDesignTime]
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvDataSnapCompatibility]
    FormatOptions.DataSnapCompatibility = True
    ResourceOptions.AssignedValues = [rvSilentMode, rvStorePrettyPrint]
    ResourceOptions.StorePrettyPrint = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 510
    Top = 10
    object cdsSumByActivityPeriodTHE_PERIOD: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Period'
      FieldName = 'THE_PERIOD'
    end
  end
  object dtsSumByActivityPeriod: TDataSource
    DataSet = cdsSumByActivityPeriod
    Left = 510
    Top = 60
  end
  object rptTimesheetByCustomer: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    EngineOptions.PrintIfEmpty = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43494.671348414300000000
    ReportOptions.LastChange = 43681.402867268520000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 565
    Top = 375
    Datasets = <
      item
        DataSet = fdsTimesheetByCustomer
        DataSetName = 'TimesheetByCustomer'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
      end
      object bndMaster: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = [ftRight, ftTop, ftBottom]
        Height = 18.897637800000000000
        Top = 215.433210000000000000
        Width = 1046.929810000000000000
        DataSet = fdsTimesheetByCustomer
        DataSetName = 'TimesheetByCustomer'
        RowCount = 0
        Stretched = True
        object TimesheetACTIVITY_DATE: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
          Width = 79.370078740000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'ACTIVITY_DATE'
          DataSet = fdsTimesheetByCustomer
          DataSetName = 'TimesheetByCustomer'
          Frame.Typ = [ftLeft]
          GapX = 7.000000000000000000
          Memo.UTF8W = (
            '[TimesheetByCustomer."ACTIVITY_DATE"]')
        end
        object TimesheetACTIVITY_TYPE: TfrxMemoView
          AllowVectorExport = True
          Left = 166.299266300000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'ACTIVITY_TYPE'
          DataSet = fdsTimesheetByCustomer
          DataSetName = 'TimesheetByCustomer'
          Frame.Typ = [ftLeft]
          GapX = 7.000000000000000000
          Memo.UTF8W = (
            '[TimesheetByCustomer."ACTIVITY_TYPE"]')
        end
        object TimesheetACTIVITY: TfrxMemoView
          AllowVectorExport = True
          Left = 321.259893780000000000
          Width = 434.645669291338600000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'ACTIVITY'
          DataSet = fdsTimesheetByCustomer
          DataSetName = 'TimesheetByCustomer'
          Frame.Typ = [ftLeft]
          GapX = 7.000000000000000000
          Memo.UTF8W = (
            '[TimesheetByCustomer."ACTIVITY"]')
        end
        object TimesheetTIME_SPENT: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 971.339258818897700000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'TOTAL_CARRY_FORWARD'
          DataSet = fdsTimesheetByCustomer
          DataSetName = 'TimesheetByCustomer'
          DisplayFormat.FormatStr = '###,###0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[TimesheetByCustomer."TOTAL_CARRY_FORWARD"]')
        end
        object TimesheetRATE: TfrxMemoView
          AllowVectorExport = True
          Left = 831.496006850000000000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = fdsTimesheetByCustomer
          DataSetName = 'TimesheetByCustomer'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[TimesheetByCustomer."ACTUAL_RATE"]')
        end
        object TimesheetITEM_VALUE: TfrxMemoView
          AllowVectorExport = True
          Left = 891.969123940000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = fdsTimesheetByCustomer
          DataSetName = 'TimesheetByCustomer'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[TimesheetByCustomer."ITEM_VALUE"]')
        end
        object TimesheetTIME_HOURS: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362187640000000000
          Width = 45.354330710000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'TIME_HOURS'
          DataSet = fdsTimesheetByCustomer
          DataSetName = 'TimesheetByCustomer'
          DisplayFormat.FormatStr = '###0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[TimesheetByCustomer."TIME_HOURS"]')
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 759.685530000000000000
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = fdsTimesheetByCustomer
          DataSetName = 'TimesheetByCustomer'
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[TimesheetByCustomer."BILLABLE_STR"]')
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Width = 75.590551181102400000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = fdsTimesheetByCustomer
          DataSetName = 'TimesheetByCustomer'
          Frame.Typ = [ftLeft]
          GapX = 7.000000000000000000
          Memo.UTF8W = (
            '[TimesheetByCustomer."LOGIN_NAME"]')
        end
      end
      object bndGrpFooterCustomer: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = [ftLeft, ftRight, ftBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 18.897637800000000000
        ParentFont = False
        Top = 257.008040000000000000
        Width = 1046.929810000000000000
        object Memo13: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 971.339258818897700000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TimesheetByCustomer."TOTAL_CARRY_FORWARD">,bndMaster)]')
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 891.968464880000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TimesheetByCustomer."ITEM_VALUE">,bndMaster)]')
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362187640000000000
          Width = 49.133860710000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TimesheetByCustomer."TIME_HOURS">,bndMaster)]')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Width = 143.622047240000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Totals For: [TimesheetByCustomer."CUSTOMER_NAME"]')
        end
      end
      object grpCustomer: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = [ftBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 22.677165350000000000
        ParentFont = False
        Top = 170.078850000000000000
        Width = 1046.929810000000000000
        Condition = '<TimesheetByCustomer."CUSTOMER_NAME">'
        KeepTogether = True
        ResetPageNumbers = True
        StartNewPage = True
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Width = 706.772110000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Timesheets for: [TimesheetByCustomer."CUSTOMER_NAME"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = [ftTop]
        Height = 22.677180000000000000
        Top = 377.953000000000000000
        Width = 1046.929810000000000000
        object Memo11: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Printed on: [(Date)] at: [(Time)]')
        end
        object Memo12: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 903.307670000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page] of [TotalPages]')
          Formats = <
            item
            end
            item
            end>
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 68.031540000000000000
        ParentFont = False
        Top = 41.574830000000000000
        Width = 1046.929810000000000000
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Top = 49.133890000000000000
          Width = 1046.929133860000000000
          Height = 18.897637800000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
          Top = 49.133890000000000000
          Width = 79.370078740000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            'Date')
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 166.299129610000000000
          Top = 49.133890000000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            'Activity Type')
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 321.259830310000000000
          Top = 49.133890000000000000
          Width = 434.645669291338600000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            'Description')
        end
        object Memo25: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 971.339258820000000000
          Top = 49.133890000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'C/Fwd')
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 831.496006850000000000
          Top = 49.133890000000000000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Rate')
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 891.968513700000000000
          Top = 49.133890000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Amt')
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362187640000000000
          Top = 49.133890000000000000
          Width = 45.354330710000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Hrs')
        end
        object Memo5: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 604.724800000000000000
          Width = 442.205010000000000000
          Height = 30.236220470000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Timesheets for Period: [TimesheetByCustomer."THE_PERIOD"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 257.008040000000000000
          Height = 30.236240000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'van Brakel and Associates')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 759.685017400000000000
          Top = 49.133890000000000000
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Bl')
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Top = 49.133890000000000000
          Width = 75.590551181102400000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            'User')
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = [ftLeft, ftRight, ftBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 18.897637800000000000
        ParentFont = False
        Top = 298.582870000000000000
        Width = 1046.929810000000000000
        object Memo4: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 971.339258818897700000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TimesheetByCustomer."TOTAL_CARRY_FORWARD">,bndMaster)]')
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 891.968943310000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TimesheetByCustomer."ITEM_VALUE">,bndMaster)]')
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362666070000000000
          Width = 49.133860710000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TimesheetByCustomer."TIME_HOURS">,bndMaster)]')
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Width = 143.622047240000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Grand Totals:')
        end
      end
    end
  end
  object rptTimesheetByActivity: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    EngineOptions.PrintIfEmpty = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43494.671348414300000000
    ReportOptions.LastChange = 43681.403931701390000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 700
    Top = 375
    Datasets = <
      item
        DataSet = fdsTimesheetByActivity
        DataSetName = 'TimesheetByActivity'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
      end
      object bndMaster: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = [ftRight, ftTop, ftBottom]
        Height = 18.897637800000000000
        Top = 215.433210000000000000
        Width = 1046.929810000000000000
        DataSet = fdsTimesheetByActivity
        DataSetName = 'TimesheetByActivity'
        RowCount = 0
        Stretched = True
        object TimesheetACTIVITY_DATE: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Width = 79.370078740000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'ACTIVITY_DATE'
          DataSet = fdsTimesheetByActivity
          DataSetName = 'TimesheetByActivity'
          Frame.Typ = [ftLeft]
          GapX = 7.000000000000000000
          Memo.UTF8W = (
            '[TimesheetByActivity."ACTIVITY_DATE"]')
        end
        object TimesheetACTIVITY_TYPE: TfrxMemoView
          AllowVectorExport = True
          Left = 166.299266300000000000
          Width = 238.110292360000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'CUSTOMER_NAME'
          DataSet = fdsTimesheetByActivity
          DataSetName = 'TimesheetByActivity'
          Frame.Typ = [ftLeft]
          GapX = 7.000000000000000000
          Memo.UTF8W = (
            '[TimesheetByActivity."CUSTOMER_NAME"]')
        end
        object TimesheetACTIVITY: TfrxMemoView
          AllowVectorExport = True
          Left = 408.189083780000000000
          Width = 340.157480314960600000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'ACTIVITY'
          DataSet = fdsTimesheetByActivity
          DataSetName = 'TimesheetByActivity'
          Frame.Typ = [ftLeft]
          GapX = 7.000000000000000000
          Memo.UTF8W = (
            '[TimesheetByActivity."ACTIVITY"]')
        end
        object TimesheetTIME_SPENT: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 971.339258818897700000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'TOTAL_CARRY_FORWARD'
          DataSet = fdsTimesheetByActivity
          DataSetName = 'TimesheetByActivity'
          DisplayFormat.FormatStr = '###,###0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[TimesheetByActivity."TOTAL_CARRY_FORWARD"]')
        end
        object TimesheetRATE: TfrxMemoView
          AllowVectorExport = True
          Left = 831.496006850000000000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'ACTUAL_RATE'
          DataSet = fdsTimesheetByActivity
          DataSetName = 'TimesheetByActivity'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[TimesheetByActivity."ACTUAL_RATE"]')
        end
        object TimesheetITEM_VALUE: TfrxMemoView
          AllowVectorExport = True
          Left = 891.969123940000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'ITEM_VALUE'
          DataSet = fdsTimesheetByActivity
          DataSetName = 'TimesheetByActivity'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[TimesheetByActivity."ITEM_VALUE"]')
        end
        object TimesheetTIME_HOURS: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362187640000000000
          Width = 45.354330710000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'TIME_HOURS'
          DataSet = fdsTimesheetByActivity
          DataSetName = 'TimesheetByActivity'
          DisplayFormat.FormatStr = '###0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[TimesheetByActivity."TIME_HOURS"]')
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 759.685530000000000000
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'BILLABLE_STR'
          DataSet = fdsTimesheetByActivity
          DataSetName = 'TimesheetByActivity'
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[TimesheetByActivity."BILLABLE_STR"]')
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'LOGIN_NAME'
          DataSet = fdsTimesheetByActivity
          DataSetName = 'TimesheetByActivity'
          Frame.Typ = [ftLeft]
          GapX = 7.000000000000000000
          Memo.UTF8W = (
            '[TimesheetByActivity."LOGIN_NAME"]')
        end
      end
      object bndGrpFooterActivity: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = [ftLeft, ftRight, ftBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 18.897637800000000000
        ParentFont = False
        Top = 257.008040000000000000
        Width = 1046.929810000000000000
        object Memo13: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 971.339258818897700000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          DataSet = fdsTimesheetByActivity
          DataSetName = 'TimesheetByActivity'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TimesheetByActivity."TOTAL_CARRY_FORWARD">,bndMaster)]')
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 891.968464880000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DataSet = fdsTimesheetByActivity
          DataSetName = 'TimesheetByActivity'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TimesheetByActivity."ITEM_VALUE">,bndMaster)]')
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362187640000000000
          Width = 49.133860710000000000
          Height = 18.897650000000000000
          DataSet = fdsTimesheetByActivity
          DataSetName = 'TimesheetByActivity'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TimesheetByActivity."TIME_HOURS">,bndMaster)]')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Width = 143.622047240000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Totals For: [TimesheetByActivity."ACTIVITY_TYPE"]')
        end
      end
      object grpActivity: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = [ftBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 22.677165350000000000
        ParentFont = False
        Top = 170.078850000000000000
        Width = 1046.929810000000000000
        Condition = '<TimesheetByActivity."ACTIVITY_TYPE">'
        KeepTogether = True
        ResetPageNumbers = True
        StartNewPage = True
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Width = 706.772110000000000000
          Height = 18.897650000000000000
          DataSet = fdsTimesheetByActivity
          DataSetName = 'TimesheetByActivity'
          Frame.Typ = []
          Memo.UTF8W = (
            'Timesheets for: [TimesheetByActivity."ACTIVITY_TYPE"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = [ftTop]
        Height = 22.677180000000000000
        Top = 377.953000000000000000
        Width = 1046.929810000000000000
        object Memo11: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Printed on: [(Date)] at: [(Time)]')
        end
        object Memo12: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 903.307670000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page] of [TotalPages]')
          Formats = <
            item
            end
            item
            end>
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 68.031540000000000000
        ParentFont = False
        Top = 41.574830000000000000
        Width = 1046.929810000000000000
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Top = 49.133890000000000000
          Width = 1046.929133860000000000
          Height = 18.897637800000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Top = 49.133890000000000000
          Width = 79.370078740000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            'Date')
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 166.299129610000000000
          Top = 49.133890000000000000
          Width = 238.110292360000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            'Customer')
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748080310000000000
          Top = 49.133890000000000000
          Width = 340.157480310000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            'Description')
        end
        object Memo25: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 971.339258818897700000
          Top = 49.133890000000000000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'C/Fwd')
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 831.496006850000000000
          Top = 49.133890000000000000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Rate')
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 891.968513700000000000
          Top = 49.133890000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Amt')
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362187640000000000
          Top = 49.133890000000000000
          Width = 45.354330710000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Hrs')
        end
        object Memo5: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 604.724800000000000000
          Width = 442.205010000000000000
          Height = 30.236220470000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Timesheets for Period: [TimesheetByActivity."THE_PERIOD"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 257.008040000000000000
          Height = 30.236240000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'van Brakel and Associates')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 759.685017400000000000
          Top = 49.133890000000000000
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Bl')
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Top = 49.133890000000000000
          Width = 75.590551181102400000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            'User')
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = [ftLeft, ftRight, ftBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 18.897637800000000000
        ParentFont = False
        Top = 298.582870000000000000
        Width = 1046.929810000000000000
        object Memo4: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 971.339258818897700000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          DataSet = fdsTimesheetByActivity
          DataSetName = 'TimesheetByActivity'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TimesheetByActivity."TOTAL_CARRY_FORWARD">,bndMaster)]')
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 891.968943310000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DataSet = fdsTimesheetByActivity
          DataSetName = 'TimesheetByActivity'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TimesheetByActivity."ITEM_VALUE">,bndMaster)]')
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 782.362666070000000000
          Width = 49.133860710000000000
          Height = 18.897650000000000000
          DataSet = fdsTimesheetByActivity
          DataSetName = 'TimesheetByActivity'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TimesheetByActivity."TIME_HOURS">,bndMaster)]')
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Width = 143.622047240000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Grand Totals:')
        end
      end
    end
  end
  object fdsTimesheetByCustomer: TfrxDBDataset
    UserName = 'TimesheetByCustomer'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'FIRST_NAME=FIRST_NAME'
      'LAST_NAME=LAST_NAME'
      'LOGIN_NAME=LOGIN_NAME'
      'ACTIVITY_DATE=ACTIVITY_DATE'
      'CUSTOMER_TYPE=CUSTOMER_TYPE'
      'CUSTOMER_NAME=CUSTOMER_NAME'
      'ACTIVITY_TYPE=ACTIVITY_TYPE'
      'ACTIVITY=ACTIVITY'
      'PRICE_LIST_ITEM=PRICE_LIST_ITEM'
      'TIME_SPENT=TIME_SPENT'
      'TIME_HOURS=TIME_HOURS'
      'ACTUAL_RATE=ACTUAL_RATE'
      'STD_RATE=STD_RATE'
      'ITEM_VALUE=ITEM_VALUE'
      'THE_PERIOD=THE_PERIOD'
      'WEEK_ENDING=WEEK_ENDING'
      'BILLABLE=BILLABLE'
      'BILLABLE_STR=BILLABLE_STR'
      'INVOICE_ID=INVOICE_ID'
      'CN_ID=CN_ID'
      'LOCKED=LOCKED'
      'LOCKED_STR=LOCKED_STR'
      'INVOICE_DATE=INVOICE_DATE'
      'CARRY_FORWARD=CARRY_FORWARD'
      'CARRY_FORWARD_STR=CARRY_FORWARD_STR'
      'IS_ADDITIONAL_WORK=IS_ADDITIONAL_WORK'
      'IS_ADDITIONAL_WORK_STR=IS_ADDITIONAL_WORK_STR'
      'TOTAL_CARRY_FORWARD=TOTAL_CARRY_FORWARD')
    DataSet = cdsTSBillable
    BCDToCurrency = False
    Left = 565
    Top = 425
  end
  object fdsTimesheetByActivity: TfrxDBDataset
    UserName = 'TimesheetByActivity'
    CloseDataSource = False
    DataSet = cdsTSBillable
    BCDToCurrency = False
    Left = 700
    Top = 425
  end
  object rptTSSummaryByActivity: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    EngineOptions.PrintIfEmpty = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43498.583602488400000000
    ReportOptions.LastChange = 43630.640013692100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 860
    Top = 375
    Datasets = <
      item
        DataSet = fdsTSSummaryByActivity
        DataSetName = 'TSSummaryByActivity'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Calibri'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 45.354330708661400000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo12: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 264.567100000000000000
          Height = 26.456710000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'van Brakel and Accossiates')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 578.268090000000000000
          Width = 468.661720000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              'Timesheet Summary by Activity for Period: [TSSummaryByActivity."' +
              'THE_PERIOD"]')
          ParentFont = False
        end
      end
      object bndDetail: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = [ftRight, ftBottom]
        Height = 18.897637800000000000
        Top = 185.196970000000000000
        Width = 1046.929810000000000000
        DataSet = fdsTSSummaryByActivity
        DataSetName = 'TSSummaryByActivity'
        RowCount = 0
        object Memo6: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          DataField = 'ACTIVITY_TYPE'
          DataSet = fdsTSSummaryByActivity
          DataSetName = 'TSSummaryByActivity'
          Frame.Typ = [ftLeft, ftRight]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[TSSummaryByActivity."ACTIVITY_TYPE"]')
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 211.653680000000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataSet = fdsTSSummaryByActivity
          DataSetName = 'TSSummaryByActivity'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[TSSummaryByActivity."AMANDA_HRS"]')
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 294.803340000000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataSet = fdsTSSummaryByActivity
          DataSetName = 'TSSummaryByActivity'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[TSSummaryByActivity."AMANDA_ITEM_VALUE"]')
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataSet = fdsTSSummaryByActivity
          DataSetName = 'TSSummaryByActivity'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[TSSummaryByActivity."CHANEL_HRS"]')
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 461.102660000000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataSet = fdsTSSummaryByActivity
          DataSetName = 'TSSummaryByActivity'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[TSSummaryByActivity."CHANEL_ITEM_VALUE"]')
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Width = 83.149606299212600000
          Height = 18.897650000000000000
          DataSet = fdsTSSummaryByActivity
          DataSetName = 'TSSummaryByActivity'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[TSSummaryByActivity."CHRISTA_HRS"]')
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 627.401980000000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataSet = fdsTSSummaryByActivity
          DataSetName = 'TSSummaryByActivity'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[TSSummaryByActivity."CHRISTA_ITEM_VALUE"]')
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 710.551640000000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataSet = fdsTSSummaryByActivity
          DataSetName = 'TSSummaryByActivity'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[TSSummaryByActivity."ALBERTUS_HRS"]')
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 793.701300000000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataSet = fdsTSSummaryByActivity
          DataSetName = 'TSSummaryByActivity'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[TSSummaryByActivity."ALBERTUS_ITEM_VALUE"]')
        end
      end
      object bndGroupFooter: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = [ftLeft, ftRight, ftBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 18.897637800000000000
        ParentFont = False
        Top = 226.771800000000000000
        Width = 1046.929810000000000000
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 211.653680000000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataSet = fdsTSSummaryByActivity
          DataSetName = 'TSSummaryByActivity'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<TSSummaryByActivity."AMANDA_HRS">,bndDetail)]')
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 294.803340000000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataSet = fdsTSSummaryByActivity
          DataSetName = 'TSSummaryByActivity'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<TSSummaryByActivity."AMANDA_ITEM_VALUE">,bndDetail)]')
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataSet = fdsTSSummaryByActivity
          DataSetName = 'TSSummaryByActivity'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<TSSummaryByActivity."CHANEL_HRS">,bndDetail)]')
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 461.102660000000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataSet = fdsTSSummaryByActivity
          DataSetName = 'TSSummaryByActivity'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<TSSummaryByActivity."CHANEL_ITEM_VALUE">,bndDetail)]')
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataSet = fdsTSSummaryByActivity
          DataSetName = 'TSSummaryByActivity'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<TSSummaryByActivity."CHRISTA_HRS">,bndDetail)]')
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 627.401980000000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataSet = fdsTSSummaryByActivity
          DataSetName = 'TSSummaryByActivity'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<TSSummaryByActivity."CHRISTA_ITEM_VALUE">,bndDetail)]')
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 710.551640000000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataSet = fdsTSSummaryByActivity
          DataSetName = 'TSSummaryByActivity'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<TSSummaryByActivity."ALBERTUS_HRS">,bndDetail)]')
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 793.701300000000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataSet = fdsTSSummaryByActivity
          DataSetName = 'TSSummaryByActivity'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<TSSummaryByActivity."ALBERTUS_ITEM_VALUE">,bndDetail)]')
        end
      end
      object bndGroupHeader: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 37.795275590000000000
        ParentFont = False
        Top = 124.724490000000000000
        Width = 1046.929810000000000000
        Condition = 'TSSummaryByActivity."THE_PERIOD"'
        KeepTogether = True
        StartNewPage = True
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Width = 1046.929133860000000000
          Height = 37.795287800000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo1: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = 0.000065910000000002
          Width = 211.653543310000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            'Activity Type')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 211.653543310000000000
          Top = 0.000065910000000002
          Width = 166.299212600000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftBottom]
          GapX = 7.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Amanda')
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Top = 0.000065910000000002
          Width = 166.299212600000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftBottom]
          GapX = 7.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Chanel')
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Top = 0.000065910000000002
          Width = 166.299212600000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftBottom]
          GapX = 7.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Christa')
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 710.551688820000000000
          Top = 0.000065910000000002
          Width = 166.299212600000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftBottom]
          GapX = 7.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Albertus')
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 211.653680000000000000
          Top = 18.897715910000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Hours')
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 294.803340000000000000
          Top = 18.897715910000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Value')
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Top = 18.897715910000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Hours')
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 461.102660000000000000
          Top = 18.897715910000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Value')
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Top = 18.897715910000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Hours')
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 627.401980000000000000
          Top = 18.897715910000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Value')
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 710.551640000000000000
          Top = 18.897715910000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Hours')
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 793.701300000000000000
          Top = 18.897715910000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight]
          GapX = 7.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Value')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = [ftTop]
        Height = 22.677180000000000000
        Top = 306.141930000000000000
        Width = 1046.929810000000000000
        object Memo38: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Printed on: [(Date)] at: [(Time)]')
          Formats = <
            item
            end
            item
            end>
        end
        object Memo39: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 903.307670000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page] of [TotalPages]')
          Formats = <
            item
            end
            item
            end>
        end
      end
    end
  end
  object fdsTSSummaryByActivity: TfrxDBDataset
    UserName = 'TSSummaryByActivity'
    CloseDataSource = False
    DataSet = cdsTSSummaryByActivity
    BCDToCurrency = False
    Left = 860
    Top = 425
  end
  object cdsTimesheet: TFDMemTable
    ActiveStoredUsage = [auDesignTime]
    BeforeEdit = cdsTimesheetBeforeEdit
    BeforePost = cdsTimesheetBeforePost
    AfterPost = cdsTimesheetAfterPost
    OnCalcFields = cdsTimesheetCalcFields
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    Indexes = <
      item
        Active = True
        Selected = True
        Name = 'idxActivityDate'
        Fields = 'ACTIVITY_DATE'
        Options = [soNoCase]
        FilterOptions = [ekNoCase]
      end>
    IndexName = 'idxActivityDate'
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvDataSnapCompatibility]
    FormatOptions.DataSnapCompatibility = True
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode, rvStorePrettyPrint]
    ResourceOptions.Persistent = True
    ResourceOptions.StorePrettyPrint = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 520
    Top = 135
    object cdsTimesheetID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimesheetUSER_ID: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'User Name'
      FieldName = 'USER_ID'
      Origin = 'USER_ID'
      Required = True
    end
    object cdsTimesheetCUSTOMER_ID: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'C ID'
      FieldName = 'CUSTOMER_ID'
      Origin = 'CUSTOMER_ID'
      Required = True
    end
    object cdsTimesheetPRICE_ITEM_ID: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'PI ID'
      FieldName = 'PRICE_ITEM_ID'
      Origin = 'PRICE_ITEM_ID'
      Required = True
    end
    object cdsTimesheetPRICE_LIST_ITEM_ID: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Price Item'
      FieldName = 'PRICE_LIST_ITEM_ID'
      Origin = 'PRICE_LIST_ITEM_ID'
      Required = True
    end
    object cdsTimesheetRATE_UNIT_ID: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Rate Unit'
      FieldName = 'RATE_UNIT_ID'
      Origin = 'RATE_UNIT_ID'
      Required = True
    end
    object cdsTimesheetACTIVITY_TYPE_ID: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Activity Type'
      FieldName = 'ACTIVITY_TYPE_ID'
      Origin = 'ACTIVITY_TYPE_ID'
      Required = True
    end
    object cdsTimesheetINVOICE_ID: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Inv No'
      FieldName = 'INVOICE_ID'
      Origin = 'INVOICE_ID'
      Required = True
    end
    object cdsTimesheetACTIVITY: TStringField
      DisplayLabel = 'Activity'
      FieldName = 'ACTIVITY'
      Origin = 'ACTIVITY'
      Size = 500
    end
    object cdsTimesheetTIME_SPENT: TFloatField
      DisplayLabel = 'Mins'
      FieldName = 'TIME_SPENT'
      Origin = 'TIME_SPENT'
      Required = True
    end
    object cdsTimesheetTIME_HOURS: TFloatField
      DisplayLabel = 'Hours'
      FieldName = 'TIME_HOURS'
      Origin = 'TIME_HOURS'
    end
    object cdsTimesheetACTUAL_RATE: TFloatField
      DisplayLabel = 'Rate'
      FieldName = 'ACTUAL_RATE'
      Origin = 'ACTUAL_RATE'
      Required = True
    end
    object cdsTimesheetSTD_RATE: TFloatField
      DisplayLabel = 'Std Rate'
      FieldName = 'STD_RATE'
      Origin = 'STD_RATE'
      Required = True
    end
    object cdsTimesheetCN_ID: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'C/N No'
      FieldName = 'CN_ID'
      Origin = 'CN_ID'
      Required = True
    end
    object cdsTimesheetITEM_VALUE: TFloatField
      DisplayLabel = 'Value'
      FieldName = 'ITEM_VALUE'
      Origin = 'ITEM_VALUE'
    end
    object cdsTimesheetLOCKED: TIntegerField
      DisplayLabel = 'Locked'
      FieldName = 'LOCKED'
      Origin = 'LOCKED'
      Required = True
    end
    object cdsTimesheetACTIVITY_DATE: TDateField
      DisplayLabel = 'Date'
      FieldName = 'ACTIVITY_DATE'
      Origin = 'ACTIVITY_DATE'
      Required = True
    end
    object cdsTimesheetDATE_MODIFIED: TDateField
      DisplayLabel = 'Modified'
      FieldName = 'DATE_MODIFIED'
      Origin = 'DATE_MODIFIED'
      Required = True
    end
    object cdsTimesheetTHE_PERIOD: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Period'
      FieldName = 'THE_PERIOD'
      Origin = 'THE_PERIOD'
      Required = True
    end
    object cdsTimesheetWEEK_ENDING: TDateField
      DisplayLabel = 'Wk Ending'
      FieldName = 'WEEK_ENDING'
      Origin = 'WEEK_ENDING'
      Required = True
    end
    object cdsTimesheetBILLABLE: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Bill'
      FieldName = 'BILLABLE'
      Origin = 'BILLABLE'
      Required = True
    end
    object cdsTimesheetDAY_NAME: TStringField
      DisplayLabel = 'Day'
      FieldName = 'DAY_NAME'
      Origin = 'DAY_NAME'
      FixedChar = True
      Size = 3
    end
    object cdsTimesheetDAY_ORDER: TIntegerField
      DisplayLabel = 'Ord'
      FieldName = 'DAY_ORDER'
      Origin = 'DAY_ORDER'
    end
    object cdsTimesheetINVOICE_DATE: TDateField
      DisplayLabel = 'Inv Date'
      FieldName = 'INVOICE_DATE'
      Origin = 'INVOICE_DATE'
    end
    object cdsTimesheetCARRY_FORWARD: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C/F'
      FieldName = 'CARRY_FORWARD'
      Origin = 'CARRY_FORWARD'
      Required = True
    end
    object cdsTimesheetAPPROVED: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'App'
      FieldName = 'APPROVED'
      Origin = 'APPROVED'
      Required = True
    end
    object cdsTimesheetIS_ADDITIONAL_WORK: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'A/W'
      FieldName = 'IS_ADDITIONAL_WORK'
      Origin = 'IS_ADDITIONAL_WORK'
      Required = True
    end
    object cdsTimesheetCUSTOMER_GROUP_ID: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'CG ID'
      FieldName = 'CUSTOMER_GROUP_ID'
      Origin = 'CUSTOMER_GROUP_ID'
      Required = True
    end
    object cdsTimesheetBILLABLE_STR: TStringField
      DisplayLabel = 'Bill'
      FieldKind = fkCalculated
      FieldName = 'BILLABLE_STR'
      Size = 1
      Calculated = True
    end
  end
  object dtsTimesheet: TDataSource
    DataSet = cdsTimesheet
    Left = 520
    Top = 185
  end
  object cdsCarryForwardDetail: TFDMemTable
    ActiveStoredUsage = [auDesignTime]
    BeforeEdit = cdsTimesheetBeforeEdit
    BeforePost = cdsCarryForwardDetailBeforePost
    AfterPost = cdsTimesheetAfterPost
    OnCalcFields = cdsCarryForwardDetailCalcFields
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    Indexes = <
      item
        Active = True
        Selected = True
        Name = 'idxActivityDate'
        Fields = 'ACTIVITY_DATE'
        Options = [soNoCase]
        FilterOptions = [ekNoCase]
      end>
    IndexName = 'idxActivityDate'
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvDataSnapCompatibility]
    FormatOptions.DataSnapCompatibility = True
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode, rvStorePrettyPrint]
    ResourceOptions.Persistent = True
    ResourceOptions.StorePrettyPrint = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 630
    Top = 135
    object IntegerField1: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField2: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'User Name'
      FieldName = 'USER_ID'
      Origin = 'USER_ID'
      Required = True
    end
    object IntegerField3: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'C ID'
      FieldName = 'CUSTOMER_ID'
      Origin = 'CUSTOMER_ID'
      Required = True
    end
    object IntegerField4: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'PI ID'
      FieldName = 'PRICE_ITEM_ID'
      Origin = 'PRICE_ITEM_ID'
      Required = True
    end
    object IntegerField5: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Price Item'
      FieldName = 'PRICE_LIST_ITEM_ID'
      Origin = 'PRICE_LIST_ITEM_ID'
      Required = True
    end
    object IntegerField6: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Rate Unit'
      FieldName = 'RATE_UNIT_ID'
      Origin = 'RATE_UNIT_ID'
      Required = True
    end
    object IntegerField7: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Activity Type'
      FieldName = 'ACTIVITY_TYPE_ID'
      Origin = 'ACTIVITY_TYPE_ID'
      Required = True
    end
    object IntegerField8: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Inv No'
      FieldName = 'INVOICE_ID'
      Origin = 'INVOICE_ID'
      Required = True
    end
    object StringField1: TStringField
      DisplayLabel = 'Activity'
      FieldName = 'ACTIVITY'
      Origin = 'ACTIVITY'
      Size = 500
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Mins'
      FieldName = 'TIME_SPENT'
      Origin = 'TIME_SPENT'
      Required = True
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Hours'
      FieldName = 'TIME_HOURS'
      Origin = 'TIME_HOURS'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Rate'
      FieldName = 'ACTUAL_RATE'
      Origin = 'ACTUAL_RATE'
      Required = True
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Std Rate'
      FieldName = 'STD_RATE'
      Origin = 'STD_RATE'
      Required = True
    end
    object IntegerField9: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'C/N No'
      FieldName = 'CN_ID'
      Origin = 'CN_ID'
      Required = True
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Value'
      FieldName = 'ITEM_VALUE'
      Origin = 'ITEM_VALUE'
    end
    object IntegerField10: TIntegerField
      DisplayLabel = 'Locked'
      FieldName = 'LOCKED'
      Origin = 'LOCKED'
      Required = True
    end
    object DateField1: TDateField
      DisplayLabel = 'Date'
      FieldName = 'ACTIVITY_DATE'
      Origin = 'ACTIVITY_DATE'
      Required = True
    end
    object DateField2: TDateField
      DisplayLabel = 'Modified'
      FieldName = 'DATE_MODIFIED'
      Origin = 'DATE_MODIFIED'
      Required = True
    end
    object IntegerField11: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Period'
      FieldName = 'THE_PERIOD'
      Origin = 'THE_PERIOD'
      Required = True
    end
    object DateField3: TDateField
      DisplayLabel = 'Wk Ending'
      FieldName = 'WEEK_ENDING'
      Origin = 'WEEK_ENDING'
      Required = True
    end
    object IntegerField12: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Bill'
      FieldName = 'BILLABLE'
      Origin = 'BILLABLE'
      Required = True
    end
    object StringField2: TStringField
      DisplayLabel = 'Day'
      FieldName = 'DAY_NAME'
      Origin = 'DAY_NAME'
      FixedChar = True
      Size = 3
    end
    object IntegerField13: TIntegerField
      DisplayLabel = 'Ord'
      FieldName = 'DAY_ORDER'
      Origin = 'DAY_ORDER'
    end
    object DateField4: TDateField
      DisplayLabel = 'Inv Date'
      FieldName = 'INVOICE_DATE'
      Origin = 'INVOICE_DATE'
    end
    object IntegerField14: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C/F'
      FieldName = 'CARRY_FORWARD'
      Origin = 'CARRY_FORWARD'
      Required = True
    end
    object IntegerField15: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'App'
      FieldName = 'APPROVED'
      Origin = 'APPROVED'
      Required = True
    end
    object IntegerField16: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'A/W'
      FieldName = 'IS_ADDITIONAL_WORK'
      Origin = 'IS_ADDITIONAL_WORK'
      Required = True
    end
    object IntegerField17: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'CG ID'
      FieldName = 'CUSTOMER_GROUP_ID'
      Origin = 'CUSTOMER_GROUP_ID'
      Required = True
    end
    object StringField3: TStringField
      DisplayLabel = 'Bill'
      FieldKind = fkCalculated
      FieldName = 'BILLABLE_STR'
      Size = 1
      Calculated = True
    end
  end
  object dtsCarryForwardDetail: TDataSource
    DataSet = cdsCarryForwardDetail
    Left = 630
    Top = 185
  end
  object cdsCustomerGroup: TFDMemTable
    ActiveStoredUsage = [auDesignTime]
    FilterOptions = [foCaseInsensitive]
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    Indexes = <
      item
        Active = True
        Name = 'idxCGroupID'
        Fields = 'ID'
        Options = [soPrimary]
      end
      item
        Active = True
        Selected = True
        Name = 'idxCGroupName'
        Fields = 'CUSTOMER_GROUP;CUSTOMER_NAME'
        Options = [soNoCase]
        FilterOptions = [ekNoCase]
      end>
    IndexName = 'idxCGroupName'
    ConstraintsEnabled = True
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale, fvDataSnapCompatibility]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 1073741823
    FormatOptions.DataSnapCompatibility = True
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode, rvStorePrettyPrint]
    ResourceOptions.Persistent = True
    ResourceOptions.StorePrettyPrint = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 70
    Top = 505
  end
  object dtsCustomerGroup: TDataSource
    DataSet = cdsCustomerGroup
    Left = 65
    Top = 555
  end
  object cdsCustomer: TFDMemTable
    ActiveStoredUsage = [auDesignTime]
    FilterOptions = [foCaseInsensitive]
    CachedUpdates = True
    ConstraintsEnabled = True
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvDataSnapCompatibility]
    FormatOptions.DataSnapCompatibility = True
    ResourceOptions.AssignedValues = [rvSilentMode, rvStorePrettyPrint]
    ResourceOptions.StorePrettyPrint = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 190
    Top = 505
    object cdsCustomerID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCustomerCUSTOMER_TYPE_ID: TIntegerField
      FieldName = 'CUSTOMER_TYPE_ID'
      Origin = 'CUSTOMER_TYPE_ID'
      Required = True
    end
    object cdsCustomerSTATUS_ID: TIntegerField
      FieldName = 'STATUS_ID'
      Origin = 'STATUS_ID'
      Required = True
    end
    object cdsCustomerNAME: TStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 100
    end
    object cdsCustomerFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Origin = 'FIRST_NAME'
      Size = 30
    end
    object cdsCustomerLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Origin = 'LAST_NAME'
      Size = 30
    end
    object cdsCustomerINITIALS: TStringField
      FieldName = 'INITIALS'
      Origin = 'INITIALS'
      Size = 5
    end
    object cdsCustomerTRADING_AS: TStringField
      FieldName = 'TRADING_AS'
      Origin = 'TRADING_AS'
      Size = 100
    end
    object cdsCustomerBILL_TO: TStringField
      FieldName = 'BILL_TO'
      Origin = 'BILL_TO'
      Size = 100
    end
    object cdsCustomerCO_NO: TStringField
      FieldName = 'CO_NO'
      Origin = 'CO_NO'
    end
    object cdsCustomerTAX_NO: TStringField
      FieldName = 'TAX_NO'
      Origin = 'TAX_NO'
    end
    object cdsCustomerVAT_NO: TStringField
      FieldName = 'VAT_NO'
      Origin = 'VAT_NO'
    end
    object cdsCustomerIS_ACTIVE: TIntegerField
      FieldName = 'IS_ACTIVE'
      Origin = 'IS_ACTIVE'
      Required = True
    end
    object cdsCustomerCUSTOMER_GROUP_ID: TIntegerField
      FieldName = 'CUSTOMER_GROUP_ID'
      Origin = 'CUSTOMER_GROUP_ID'
    end
  end
  object dtsCustomer: TDataSource
    DataSet = cdsCustomer
    Left = 185
    Top = 560
  end
end
