unit Report_DM;

interface

uses
  System.SysUtils, System.Classes, Base_DM, Data.DBXDataSnap, Data.DBXCommon,
  IPPeerClient, Data.DB, Data.SqlExpr, Winapi.Windows, Vcl.Forms,

  frxClass, frxExportBaseDialog, frxExportPDF, frxDBSet,

  FireDAC.Stan.StorageXML, FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.DApt,
  FireDAC.Phys.SQLiteVDataSet, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  TReportDM = class(TBaseDM)
    cdsBillableSummary: TFDMemTable;
    cdsBillableSummaryCUSTOMER_ID: TIntegerField;
    cdsBillableSummaryTHE_PERIOD: TIntegerField;
    cdsBillableSummaryNAME: TStringField;
    cdsBillableSummaryTOTAL_BILLABLE_HOURS: TFloatField;
    cdsBillableSummaryTOTAL_BILLABLE: TFloatField;
    cdsBillableSummaryTOTAL_NON_BILLABLE_HOURS: TFloatField;
    cdsBillableSummaryTOTAL_NON_BILLABLE: TFloatField;
    cdsBillableSummaryTOTAL_CARRY_FORWARD: TFloatField;
    dtsBillableSummary: TDataSource;
    cdsPeriod: TFDMemTable;
    cdsPeriodTHE_PERIOD: TIntegerField;
    cdsToPeriod: TFDMemTable;
    cdsToPeriodTHE_PERIOD: TIntegerField;
    dtsPeriod: TDataSource;
    dtsToPeriod: TDataSource;
    conSQLLite: TFDConnection;
    qryPeriod: TFDQuery;
    locSQL: TFDLocalSQL;
    cdsTSBillable: TFDMemTable;
    dtsTSBillable: TDataSource;
    frxPDFExport: TfrxPDFExport;
    rptBillableSummaryByCustomer: TfrxReport;
    rptTimesheetByUser: TfrxReport;
    fdsBillableSummaryByCustomer: TfrxDBDataset;
    fdsTimesheetByUser: TfrxDBDataset;
    rptBillableSummaryByPeriod: TfrxReport;
    fdsBillableSummaryByPeriod: TfrxDBDataset;
    cdsPeriodListing: TFDMemTable;
    dtsPeriodListing: TDataSource;
    cdsPeriodListingTHE_PERIOD: TIntegerField;
    cdsTSCustomer: TFDMemTable;
    dtsTSCustomer: TDataSource;
    VbliveConnection: TFDConnection;
    cdsTSCustomerID: TIntegerField;
    cdsTSCustomerCUSTOMER_TYPE_ID: TIntegerField;
    cdsTSCustomerSTATUS_ID: TIntegerField;
    cdsTSCustomerNAME: TStringField;
    cdsTSCustomerCUSTOMER_TYPE: TStringField;
    cdsTSCustomerCUSTOMER_STATUS: TStringField;
    cdsTSCustomerIS_ACTIVE: TIntegerField;
    cdsTSCustomerCUSTOMER_GROUP_ID: TIntegerField;
    cdsTSCustomerCUSTOMER_ID: TIntegerField;
    cdsTSCustomerCUSTOMER_GROUP_LINK_NAME: TStringField;
    cdsActivityType: TFDMemTable;
    dtsActivityType: TDataSource;
    cdsActivityTypeID: TIntegerField;
    cdsActivityTypeNAME: TStringField;
    cdsTSSummaryByActivity: TFDMemTable;
    dtsTSSummaryByActivity: TDataSource;
    cdsTSSummaryByUser: TFDMemTable;
    dtsTSSummaryByUser: TDataSource;
    qryDummy: TFDQuery;
    cdsTSSummaryByUserUSER_ID: TIntegerField;
    cdsTSSummaryByUserLOGIN_NAME: TStringField;
    cdsTSSummaryByUserAVB_COMPANIES: TFloatField;
    cdsTSSummaryByUserAVB_PERSONAL: TFloatField;
    cdsTSSummaryByUserTIMESHEETS: TFloatField;
    cdsTSSummaryByUserFILING_AND_POST: TFloatField;
    cdsTSSummaryByUserPC_BANK: TFloatField;
    cdsTSSummaryByUserOFFICE_ADMIN: TFloatField;
    cdsTSSummaryByUserSOCIAL: TFloatField;
    cdsTSSummaryByUserCOMPUTERS: TFloatField;
    cdsTSSummaryByUserTRAINING_RESEARCH: TFloatField;
    cdsTSSummaryByUserESTATES_WILLS: TFloatField;
    cdsTSSummaryByUserWORKMENS_COMP: TFloatField;
    cdsTSSummaryByUserSARS_TAX: TFloatField;
    cdsTSSummaryByUserCIPC: TFloatField;
    cdsTSSummaryByUserCRRADLE_OF_HOPE: TFloatField;
    cdsTSSummaryByUserDEBTORS: TFloatField;
    cdsTSSummaryByUserTRAVELLING: TFloatField;
    cdsTSSummaryByUserJUDY_PLACE: TFloatField;
    cdsTSSummaryByActivityTHE_PERIOD: TIntegerField;
    cdsTSSummaryByActivityACTIVITY_TYPE_ID: TIntegerField;
    cdsTSSummaryByActivityACTIVITY_TYPE: TStringField;
    cdsTSSummaryByActivityAMANDA: TFloatField;
    cdsTSSummaryByActivityAMANDA_HRS: TFloatField;
    cdsTSSummaryByActivityAMANDA_ITEM_VALUE: TFloatField;
    cdsTSSummaryByActivityCHANEL: TFloatField;
    cdsTSSummaryByActivityCHANEL_HRS: TFloatField;
    cdsTSSummaryByActivityCHANEL_ITEM_VALUE: TFloatField;
    cdsTSSummaryByActivityCHRISTA: TFloatField;
    cdsTSSummaryByActivityCHRISTA_HRS: TFloatField;
    cdsTSSummaryByActivityCHRISTA_ITEM_VALUE: TFloatField;
    cdsTSSummaryByActivityALBERTUS: TFloatField;
    cdsTSSummaryByActivityALBERTUS_HRS: TFloatField;
    cdsTSSummaryByActivityALBERTUS_ITEM_VALUE: TFloatField;
    cdsSumByActivityPeriod: TFDMemTable;
    dtsSumByActivityPeriod: TDataSource;
    cdsSumByActivityPeriodTHE_PERIOD: TIntegerField;
    cdsTSBillableID: TIntegerField;
    cdsTSBillableFIRST_NAME: TStringField;
    cdsTSBillableLAST_NAME: TStringField;
    cdsTSBillableLOGIN_NAME: TStringField;
    cdsTSBillableACTIVITY_DATE: TDateField;
    cdsTSBillableCUSTOMER_TYPE: TStringField;
    cdsTSBillableCUSTOMER_NAME: TStringField;
    cdsTSBillableACTIVITY_TYPE: TStringField;
    cdsTSBillableACTIVITY: TStringField;
    cdsTSBillablePRICE_LIST_ITEM: TStringField;
    cdsTSBillableTIME_SPENT: TFloatField;
    cdsTSBillableTIME_HOURS: TFloatField;
    cdsTSBillableACTUAL_RATE: TFloatField;
    cdsTSBillableSTD_RATE: TFloatField;
    cdsTSBillableITEM_VALUE: TFloatField;
    cdsTSBillableTHE_PERIOD: TIntegerField;
    cdsTSBillableBILLABLE: TIntegerField;
    cdsTSBillableBILLABLE_STR: TStringField;
    cdsTSBillableINVOICE_ID: TIntegerField;
    cdsTSBillableCN_ID: TIntegerField;
    cdsTSBillableLOCKED: TIntegerField;
    cdsTSBillableINVOICE_DATE: TDateField;
    cdsTSBillableCARRY_FORWARD: TIntegerField;
    cdsTSBillableCARRY_FORWARD_STR: TStringField;
    cdsTSBillableIS_ADDITIONAL_WORK: TIntegerField;
    cdsTSBillableIS_ADDITIONAL_WORK_STR: TStringField;
    cdsTSBillableTOTAL_CARRY_FORWARD: TFloatField;
    rptTimesheetByCustomer: TfrxReport;
    rptTimesheetByActivity: TfrxReport;
    fdsTimesheetByCustomer: TfrxDBDataset;
    fdsTimesheetByActivity: TfrxDBDataset;
    cdsTSBillableLOCKED_STR: TStringField;
    rptTSSummaryByActivity: TfrxReport;
    fdsTSSummaryByActivity: TfrxDBDataset;
    cdsTimesheet: TFDMemTable;
    dtsTimesheet: TDataSource;
    cdsTimesheetID: TIntegerField;
    cdsTimesheetUSER_ID: TIntegerField;
    cdsTimesheetCUSTOMER_ID: TIntegerField;
    cdsTimesheetPRICE_LIST_ITEM_ID: TIntegerField;
    cdsTimesheetRATE_UNIT_ID: TIntegerField;
    cdsTimesheetACTIVITY_TYPE_ID: TIntegerField;
    cdsTimesheetINVOICE_ID: TIntegerField;
    cdsTimesheetACTIVITY: TStringField;
    cdsTimesheetTIME_SPENT: TFloatField;
    cdsTimesheetTIME_HOURS: TFloatField;
    cdsTimesheetACTUAL_RATE: TFloatField;
    cdsTimesheetSTD_RATE: TFloatField;
    cdsTimesheetITEM_VALUE: TFloatField;
    cdsTimesheetCN_ID: TIntegerField;
    cdsTimesheetLOCKED: TIntegerField;
    cdsTimesheetACTIVITY_DATE: TDateField;
    cdsTimesheetDATE_MODIFIED: TDateField;
    cdsTimesheetTHE_PERIOD: TIntegerField;
    cdsTimesheetBILLABLE: TIntegerField;
    cdsTimesheetDAY_NAME: TStringField;
    cdsTimesheetDAY_ORDER: TIntegerField;
    cdsTimesheetINVOICE_DATE: TDateField;
    cdsTimesheetCARRY_FORWARD: TIntegerField;
    cdsTimesheetAPPROVED: TIntegerField;
    cdsTimesheetIS_ADDITIONAL_WORK: TIntegerField;
    cdsTimesheetCUSTOMER_GROUP_ID: TIntegerField;
    cdsTimesheetBILLABLE_STR: TStringField;
    cdsCarryForwardDetail: TFDMemTable;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    IntegerField9: TIntegerField;
    FloatField5: TFloatField;
    IntegerField10: TIntegerField;
    DateField1: TDateField;
    DateField2: TDateField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    StringField2: TStringField;
    IntegerField13: TIntegerField;
    DateField4: TDateField;
    IntegerField14: TIntegerField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    StringField3: TStringField;
    dtsCarryForwardDetail: TDataSource;
    cdsCustomerGroup: TFDMemTable;
    dtsCustomerGroup: TDataSource;
    cdsCustomer: TFDMemTable;
    cdsCustomerID: TIntegerField;
    cdsCustomerCUSTOMER_TYPE_ID: TIntegerField;
    cdsCustomerSTATUS_ID: TIntegerField;
    cdsCustomerNAME: TStringField;
    cdsCustomerFIRST_NAME: TStringField;
    cdsCustomerLAST_NAME: TStringField;
    cdsCustomerINITIALS: TStringField;
    cdsCustomerTRADING_AS: TStringField;
    cdsCustomerBILL_TO: TStringField;
    cdsCustomerCO_NO: TStringField;
    cdsCustomerTAX_NO: TStringField;
    cdsCustomerVAT_NO: TStringField;
    cdsCustomerIS_ACTIVE: TIntegerField;
    cdsCustomerCUSTOMER_GROUP_ID: TIntegerField;
    dtsCustomer: TDataSource;
    cdsPriceListView: TFDMemTable;
    cdsPriceListViewID: TIntegerField;
    cdsPriceListViewRATE_UNIT_ID: TIntegerField;
    cdsPriceListViewNAME: TStringField;
    cdsPriceListViewRATE: TFloatField;
    cdsPriceListViewDESCRIPTION: TStringField;
    cdsPriceListViewINVOICE_DESCRIPTION: TStringField;
    cdsPriceListViewRATE_UNIT: TStringField;
    dtsPriceListView: TDataSource;
    cdsRateUnit: TFDMemTable;
    cdsRateUnitID: TIntegerField;
    cdsRateUnitNAME: TStringField;
    dtsRateuit: TDataSource;
    cdsSystemUser: TFDMemTable;
    cdsSystemUserID: TIntegerField;
    cdsSystemUserFIRST_NAME: TStringField;
    cdsSystemUserLAST_NAME: TStringField;
    cdsSystemUserLOGIN_NAME: TStringField;
    cdsSystemUserEMAIL_ADDRESS: TStringField;
    cdsSystemUserPASSWORD: TStringField;
    cdsSystemUserACCOUNT_ENABLED: TIntegerField;
    dtsSystemUser: TDataSource;
    rpt1: TfrxReport;
    procedure cdsTimesheetCalcFields(DataSet: TDataSet);
    procedure cdsTimesheetAfterPost(DataSet: TDataSet);
    procedure cdsTimesheetBeforePost(DataSet: TDataSet);
    procedure cdsTimesheetBeforeEdit(DataSet: TDataSet);
    procedure cdsCarryForwardDetailCalcFields(DataSet: TDataSet);
    procedure cdsCarryForwardDetailBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FID: Integer;
    FReport: TfrxReport;
  public
    { Public declarations }
    property Report: TfrxReport read FReport write FReport;
  end;

var
  ReportDM: TReportDM;

const
  TABLE_COUNT = 5;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses VBBase_DM, VBCommonValues, RUtils;

{$R *.dfm}

procedure TReportDM.cdsTimesheetAfterPost(DataSet: TDataSet);
begin
  DataSet := cdsTimesheet;
  SetLength(VBBaseDM.DataSetArray, 1);
  VBBaseDM.DataSetArray[0] := TFDMemTable(DataSet);

  VBBaseDM.ApplyUpdates(
    TFDMemTable(DataSet),
    VBBaseDM.DataSetArray,
    TFDMemTable(DataSet).UpdateOptions.GeneratorName,
    TFDMemTable(DataSet).UpdateOptions.UpdateTableName,
    TFDMemTable(DataSet).Tag);

  SendMessage(Application.MainForm.Handle, WM_RECORD_ID, DWORD(PChar('REQUEST=REFRESH_DATA' + '|ID=' + FID.ToString)), 0);
end;

procedure TReportDM.cdsTimesheetBeforeEdit(DataSet: TDataSet);
begin
  VBBaseDM.MadeChanges := False;
end;

procedure TReportDM.cdsTimesheetBeforePost(DataSet: TDataSet);
begin
  FID := cdsTimesheet.FieldByName('ID').AsInteger;
end;

procedure TReportDM.cdsTimesheetCalcFields(DataSet: TDataSet);
//var
//  Day, Month, Year: Word;
//  PeriodMonth: Integer;
begin
//  if cdsTimesheet.FieldByName('TIME_SPENT').AsFloat = 0 then
//    cdsTimesheet.FieldByName('TIME_HOURS').AsFloat := 0
//  else
//    cdsTimesheet.FieldByName('TIME_HOURS').AsFloat := cdsTimesheet.FieldByName('TIME_SPENT').AsFloat / 60;
//
//  if cdsTimesheet.FieldByName('BILLABLE').AsInteger = 0 then
//    cdsTimesheet.FieldByName('ITEM_VALUE').AsFloat := 0
//  else
//    case cdsTimesheet.FieldByName('RATE_UNIT_ID').AsInteger of
//      1: cdsTimesheet.FieldByName('ITEM_VALUE').AsFloat :=
//        cdsTimesheet.FieldByName('ACTUAL_RATE').AsFloat *
//          cdsTimesheet.FieldByName('TIME_HOURS').AsFloat;
//
//      2: cdsTimesheet.FieldByName('ITEM_VALUE').AsFloat :=
//        cdsTimesheet.FieldByName('ACTUAL_RATE').AsFloat;
//    end;

//  DecodeDate(cdsTimesheet.FieldByName('ACTIVITY_DATE').AsDateTime, Year, Month, Day);
//  PeriodMonth := cdsTimesheet.FieldByName('THE_PERIOD').AsInteger mod 1000;
//  if PeriodMonth <> Month then
//  begin
//    if not (cdsTimesheet.State in [dsEdit, dsInsert]) then
//      cdsTimesheet.Edit;
//    if Day < 10 then
//      cdsTimesheet.FieldByName('THE_PERIOD').AsInteger := Year * 100000 + Day
//    else
//      cdsTimesheet.FieldByName('THE_PERIOD').AsInteger := Year * 10000 + Day;
//    cdsTimesheet.AfterPost := nil;
//    try
//      cdsTimesheet.Post;
//    finally
//      cdsTimesheet.AfterPost := cdsTimesheetAfterPost;
//    end;
//  end;

  cdsTimesheet.FieldByName('BILLABLE_STR').AsString := 'Y';
  if cdsTimesheet.FieldByName('BILLABLE').AsInteger = 0 then
    cdsTimesheet.FieldByName('BILLABLE_STR').AsString := 'N';
end;

procedure TReportDM.cdsCarryForwardDetailBeforePost(DataSet: TDataSet);
begin
  FID := cdsCarryForwardDetail.FieldByName('ID').AsInteger;
end;

procedure TReportDM.cdsCarryForwardDetailCalcFields(DataSet: TDataSet);
begin
//  if cdsCarryForwardDetail.FieldByName('TIME_SPENT').AsFloat = 0 then
//    cdsCarryForwardDetail.FieldByName('TIME_HOURS').AsFloat := 0
//  else
//    cdsCarryForwardDetail.FieldByName('TIME_HOURS').AsFloat := cdsCarryForwardDetail.FieldByName('TIME_SPENT').AsFloat / 60;
//
//  if cdsCarryForwardDetail.FieldByName('BILLABLE').AsInteger = 0 then
//    cdsCarryForwardDetail.FieldByName('ITEM_VALUE').AsFloat := 0
//  else
//    case cdsCarryForwardDetail.FieldByName('RATE_UNIT_ID').AsInteger of
//      1: cdsCarryForwardDetail.FieldByName('ITEM_VALUE').AsFloat :=
//        cdsCarryForwardDetail.FieldByName('ACTUAL_RATE').AsFloat *
//          cdsCarryForwardDetail.FieldByName('TIME_HOURS').AsFloat;
//
//      2: cdsCarryForwardDetail.FieldByName('ITEM_VALUE').AsFloat :=
//        cdsCarryForwardDetail.FieldByName('ACTUAL_RATE').AsFloat;
//    end;

  cdsCarryForwardDetail.FieldByName('BILLABLE_STR').AsString := 'Y';
  if cdsCarryForwardDetail.FieldByName('BILLABLE').AsInteger = 0 then
    cdsCarryForwardDetail.FieldByName('BILLABLE_STR').AsString := 'N';
end;

end.



