unit BaseGrid_Frm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Forms,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Dialogs, System.IOUtils,
  System.Win.Registry, WinApi.ShellApi,

  BaseLayout_Frm, CommonValues, VBCommonValues,

  FireDac.Comp.Client,

  frxClass, frxDBSet,

  cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  System.ImageList, Vcl.ImgList, cxImageList, dxLayoutLookAndFeels,
  System.Actions, Vcl.ActnList, cxClasses, cxStyles, dxLayoutContainer,
  dxLayoutControl, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges, Data.DB, cxDBData, cxDBNavigator, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGrid, dxScrollbarAnnotations, dxPrnDev, dxPrnDlg,
  cxGridExportLink, dxLayoutcxEditAdapters, cxContainer, cxCheckBox;

type
  TBaseGridFrm = class(TBaseLayoutFrm)
    grdMaster: TcxGrid;
    viewMaster: TcxGridDBBandedTableView;
    lvlMaster: TcxGridLevel;
    navMaster: TcxDBNavigator;
    imgNav: TcxImageList;
    litNavigator: TdxLayoutItem;
    litGrid: TdxLayoutItem;
    grpToolbar: TdxLayoutGroup;
    dlgFileSave: TSaveDialog;
    dlgPrint: TdxPrintDialog;
    litOpenAfterExport: TdxLayoutItem;
    cbxOpenAfterExport: TcxCheckBox;

    procedure viewMasterCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure DrawCellBorder(var Msg: TMessage); message CM_DRAWBORDER;
//    procedure SetButtonVisibility(ReadOnlyDataSet: Boolean);
    procedure SetButtonVisibility(DataSet: TFDMemTable; MasterID: Integer);
    procedure SetPrintButtonStatus(DataSet: TFDMemTable);
    procedure FormShow(Sender: TObject);
    procedure navMasterButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
  private
    { Private declarations }
//    FMasterFormType: TMasterFormTypes;
  public
    { Public declarations }
//    property MasterFormType: TMasterFormTypes read FMasterFormType write FMasterFormType;
  end;

var
  BaseGridFrm: TBaseGridFrm;

implementation

{$R *.dfm}

uses
  CommonFunction,
  VBBase_DM,
  MT_DM,
  Report_DM;

procedure TBaseGridFrm.DrawCellBorder(var Msg: TMessage);
begin
  if (TObject(Msg.WParam) is TcxCanvas)
    and (TObject(Msg.LParam) is TcxGridTableDataCellViewInfo) then
    TcxCanvas(Msg.WParam).DrawComplexFrame(TcxGridTableDataCellViewInfo(Msg.LParam).ClientBounds, clRed, clRed, cxBordersAll, 1);
end;

procedure TBaseGridFrm.FormShow(Sender: TObject);
begin
  inherited;
  grdMaster.SetFocus;
  viewMaster.Focused := True;
end;

procedure TBaseGridFrm.navMasterButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
var
  ID, ScriptID: Integer;
  DataSet: TFDMemTable;
  Generatorname, UpdateTableName, FileName: string;
begin
  inherited;
//  // Don't allow printing or exporting data whilst editing data.
//  if (AButtonIndex in [16, 17, 18, 19]) and (navMaster.DataSet.State in [dsEdit, dsInsert]) then
//    raise EExecutionException.Create('Cannot use the print/export functions whilst editing data.' + CRLF +
//      'Please post or cancel the current transaction and try again.');
  case AbuttonIndex of
    16, 17, 18, 19:
      ReportDM.PrintExporting := True;
  end;

  Screen.Cursor := crHourglass;
  try
    case AButtonIndex of
      NBDI_REFRESH, NBDI_DELETE:
        begin
//        ADone := True;
          case ReportDM.MasterFormType of
            ftActivityType:
              begin
                DataSet := MTDM.cdsActivityType;
                ScriptID := 39;
                FileName := 'C:\Data\Xml\Activity Type.xml';

//              ID := MTDM.cdsActivityType.FieldByName('ID').AsInteger;
//
//              VBBaseDM.GetData(39, MTDM.cdsActivityType, MTDM.cdsActivityType.Name, '',
//                'C:\Data\Xml\Activity Type.xml', MTDM.cdsActivityType.UpdateOptions.Generatorname,
//                MTDM.cdsActivityType.UpdateOptions.UpdateTableName);
//
//              if not MTDM.cdsActivityType.Locate('ID', ID, []) then
//                MTDM.cdsActivityType.First;
              end;
            ftAgePeriod:
              begin
                DataSet := MTDM.cdsAgePeriod;
                ScriptID := 13;
                FileName := 'C:\Data\Xml\Age Period.xml';

//              ID := MTDM.cdsAgePeriod.FieldByName('ID').AsInteger;
//
//              VBBaseDM.GetData(13, MTDM.cdsAgePeriod, MTDM.cdsAgePeriod.Name, '',
//                'C:\Data\Xml\Age Period.xml', MTDM.cdsAgePeriod.UpdateOptions.Generatorname,
//                MTDM.cdsAgePeriod.UpdateOptions.UpdateTableName);
//
//              if not MTDM.cdsAgePeriod.Locate('ID', ID, []) then
//                MTDM.cdsAgePeriod.First;
              end;

            ftBank:
              begin
                DataSet := MTDM.cdsBank;
                ScriptID := 5;
                FileName := 'C:\Data\Xml\Bank.xml';

//              ID := MTDM.cdsBank.FieldByName('ID').AsInteger;
//
//              VBBaseDM.GetData(5, MTDM.cdsBank, MTDM.cdsBank.Name, '',
//                'C:\Data\Xml\Bannk.xml', MTDM.cdsBank.UpdateOptions.Generatorname,
//                MTDM.cdsBank.UpdateOptions.UpdateTableName);
//
//              if not MTDM.cdsBank.Locate('ID', ID, []) then
//                MTDM.cdsBank.First;
              end;

            ftBankAccountType:
              begin
                DataSet := MTDM.cdsBankAccountType;
                ScriptID := 39;
                FileName := 'C:\Data\Xml\Bank Account Type.xml';

//              ID := MTDM.cdsBankAccountType.FieldByName('ID').AsInteger;
//
//              VBBaseDM.GetData(6, MTDM.cdsBankAccountType, MTDM.cdsBankAccountType.Name, '',
//                'C:\Data\Xml\Bannk Account Type.xml', MTDM.cdsBankAccountType.UpdateOptions.Generatorname,
//                MTDM.cdsBankAccountType.UpdateOptions.UpdateTableName);
//
//              if not MTDM.cdsBankAccountType.Locate('ID', ID, []) then
//                MTDM.cdsBankAccountType.First;
              end;

            ftContactType:
              begin
                DataSet := MTDM.cdsContactType;
                ScriptID := 11;
                FileName := 'C:\Data\Xml\Contact Type.xml';

//              ID := MTDM.cdsContactType.FieldByName('ID').AsInteger;
//
//              VBBaseDM.GetData(11, MTDM.cdsContactType, MTDM.cdsContactType.Name, '',
//                'C:\Data\Xml\Age Period.xml', MTDM.cdsContactType.UpdateOptions.Generatorname,
//                MTDM.cdsContactType.UpdateOptions.UpdateTableName);
//
//              if not MTDM.cdsContactType.Locate('ID', ID, []) then
//                MTDM.cdsContactType.First;
              end;

            ftCountry:
              begin
                DataSet := MTDM.cdsCountry;
                ScriptID := 12;
                FileName := 'C:\Data\Xml\Country.xml';

//              ID := MTDM.cdsCountry.FieldByName('ID').AsInteger;
//
//              VBBaseDM.GetData(12, MTDM.cdsCountry, MTDM.cdsCountry.Name, '',
//                'C:\Data\Xml\Age Period.xml', MTDM.cdsCountry.UpdateOptions.Generatorname,
//                MTDM.cdsCountry.UpdateOptions.UpdateTableName);
//
//              if not MTDM.cdsCountry.Locate('ID', ID, []) then
//                MTDM.cdsCountry.First;
              end;

            ftCustomer:
              begin
                DataSet := MTDM.cdsCustomer;
                ScriptID := 3;
                FileName := 'C:\Data\Xml\Customer.xml';

//              ID := MTDM.cdsCustomer.FieldByName('ID').AsInteger;
//
//              VBBaseDM.GetData(3, MTDM.cdsCustomer, MTDM.cdsCustomer.Name, ONE_SPACE,
//                'C:\Data\Xml\Customer.xml', MTDM.cdsCustomer.UpdateOptions.Generatorname,
//                MTDM.cdsCustomer.UpdateOptions.UpdateTableName);
//
//              if not MTDM.cdsCustomer.Locate('ID', ID, []) then
//                MTDM.cdsCustomer.First;
              end;

            ftCustomerGroup:
              begin
                DataSet := MTDM.cdsCustomerGroup;
                ScriptID := 56;
                FileName := 'C:\Data\Xml\Customer Group.xml';

//              ID := MTDM.cdsCustomerGroup.FieldByName('ID').AsInteger;
//
//              VBBaseDM.GetData(56, MTDM.cdsCustomerGroup, MTDM.cdsCustomerGroup.Name, '',
//                'C:\Data\Xml\Age Period.xml', MTDM.cdsCustomerGroup.UpdateOptions.Generatorname,
//                MTDM.cdsCustomerGroup.UpdateOptions.UpdateTableName);
//
//              if not MTDM.cdsCustomerGroup.Locate('ID', ID, []) then
//                MTDM.cdsCustomerGroup.First;
              end;

            ftCustomerStatus:
              begin
                DataSet := MTDM.cdsCustomerStatus;
                ScriptID := 14;
                FileName := 'C:\Data\Xml\Customer Status.xml';

//              ID := MTDM.cdsCustomerStatus.FieldByName('ID').AsInteger;
//
//              VBBaseDM.GetData(14, MTDM.cdsCustomerStatus, MTDM.cdsCustomerStatus.Name, '',
//                'C:\Data\Xml\Age Period.xml', MTDM.cdsCustomerStatus.UpdateOptions.Generatorname,
//                MTDM.cdsCustomerStatus.UpdateOptions.UpdateTableName);
//
//              if not MTDM.cdsCustomerStatus.Locate('ID', ID, []) then
//                MTDM.cdsCustomerStatus.First;
              end;

            ftCustomerType:
              begin
                DataSet := MTDM.cdsCustomerType;
                ScriptID := 15;
                FileName := 'C:\Data\Xml\Customer Type.xml';

//              ID := MTDM.cdsCustomerType.FieldByName('ID').AsInteger;
//
//              VBBaseDM.GetData(15, MTDM.cdsCustomerType, MTDM.cdsCustomerType.Name, '',
//                'C:\Data\Xml\Age Period.xml', MTDM.cdsCustomerType.UpdateOptions.Generatorname,
//                MTDM.cdsCustomerType.UpdateOptions.UpdateTableName);
//
//              if not MTDM.cdsCustomerType.Locate('ID', ID, []) then
//                MTDM.cdsCustomerType.First;
              end;

            ftJobFunction:
              begin
                DataSet := MTDM.cdsJobFunction;
                ScriptID := 19;
                FileName := 'C:\Data\Xml\Job Function.xml';

//              ID := MTDM.cdsJobFunction.FieldByName('ID').AsInteger;
//
//              VBBaseDM.GetData(19, MTDM.cdsJobFunction, MTDM.cdsJobFunction.Name, '',
//                'C:\Data\Xml\Age Period.xml', MTDM.cdsJobFunction.UpdateOptions.Generatorname,
//                MTDM.cdsJobFunction.UpdateOptions.UpdateTableName);
//
//              if not MTDM.cdsJobFunction.Locate('ID', ID, []) then
//                MTDM.cdsJobFunction.First;
              end;

            ftMonthOfYear:
              begin
                DataSet := MTDM.cdsMonthOfYear;
                ScriptID := 20;
                FileName := 'C:\Data\Xml\Month of Year.xml';

//              ID := MTDM.cdsMonthOfYear.FieldByName('ID').AsInteger;
//
//              VBBaseDM.GetData(20, MTDM.cdsMonthOfYear, MTDM.cdsMonthOfYear.Name, '',
//                'C:\Data\Xml\Age Period.xml', MTDM.cdsMonthOfYear.UpdateOptions.Generatorname,
//                MTDM.cdsMonthOfYear.UpdateOptions.UpdateTableName);
//
//              if not MTDM.cdsMonthOfYear.Locate('ID', ID, []) then
//                MTDM.cdsMonthOfYear.First;
              end;

            ftPricelist:
              begin
                DataSet := MTDM.cdsPricelist;
                ScriptID := 22;
                FileName := 'C:\Data\Xml\Price List.xml';

//              ID := MTDM.cdsPricelist.FieldByName('ID').AsInteger;
//
//              VBBaseDM.GetData(22, MTDM.cdsPricelist, MTDM.cdsPricelist.Name, ONE_SPACE,
//                'C:\Data\Xml\Price List.xml', MTDM.cdsPricelist.UpdateOptions.Generatorname,
//                MTDM.cdsPricelist.UpdateOptions.UpdateTableName);
//
//              if not MTDM.cdsPricelist.Locate('ID', ID, []) then
//                MTDM.cdsPricelist.First;
              end;

            ftRateUnit:
              begin
                DataSet := MTDM.cdsRateUnit;
                ScriptID := 38;
                FileName := 'C:\Data\Xml\Rate Unit.xml';

//              ID := MTDM.cdsRateUnit.FieldByName('ID').AsInteger;
//
//              VBBaseDM.GetData(38, MTDM.cdsRateUnit, MTDM.cdsRateUnit.Name, '',
//                'C:\Data\Xml\Age Period.xml', MTDM.cdsRateUnit.UpdateOptions.Generatorname,
//                MTDM.cdsRateUnit.UpdateOptions.UpdateTableName);
//
//              if not MTDM.cdsRateUnit.Locate('ID', ID, []) then
//                MTDM.cdsRateUnit.First;
              end;

            ftSalutation:
              begin
                DataSet := MTDM.cdsSalutation;
                ScriptID := 23;
                FileName := 'C:\Data\Xml\Salutation.xml';

//              ID := MTDM.cdsSalutation.FieldByName('ID').AsInteger;
//
//              VBBaseDM.GetData(23, MTDM.cdsSalutation, MTDM.cdsSalutation.Name, '',
//                'C:\Data\Xml\Age Period.xml', MTDM.cdsSalutation.UpdateOptions.Generatorname,
//                MTDM.cdsSalutation.UpdateOptions.UpdateTableName);
//
//              if not MTDM.cdsSalutation.Locate('ID', ID, []) then
//                MTDM.cdsSalutation.First;
              end;

            ftStdActivity:
              begin
                DataSet := MTDM.cdsStdActivity;
                ScriptID := 52;
                FileName := 'C:\Data\Xml\Standard Activity.xml';

//              ID := MTDM.cdsStdActivity.FieldByName('ID').AsInteger;
//
//              VBBaseDM.GetData(52, MTDM.cdsStdActivity, MTDM.cdsStdActivity.Name, '',
//                'C:\Data\Xml\Age Period.xml', MTDM.cdsStdActivity.UpdateOptions.Generatorname,
//                MTDM.cdsStdActivity.UpdateOptions.UpdateTableName);
//
//              if not MTDM.cdsStdActivity.Locate('ID', ID, []) then
//                MTDM.cdsStdActivity.First;
              end;

            ftTaxoffice:
              begin
                DataSet := MTDM.cdsTaxOffice;
                ScriptID := 25;
                FileName := 'C:\Data\Xml\Tax Office.xml';

//              ID := MTDM.cdsTaxOffice.FieldByName('ID').AsInteger;
//
//              VBBaseDM.GetData(25, MTDM.cdsTaxOffice, MTDM.cdsTaxOffice.Name, '',
//                'C:\Data\Xml\Age Period.xml', MTDM.cdsTaxOffice.UpdateOptions.Generatorname,
//                MTDM.cdsTaxOffice.UpdateOptions.UpdateTableName);
//
//              if not MTDM.cdsTaxOffice.Locate('ID', ID, []) then
//                MTDM.cdsTaxOffice.First;
              end;

            ftVehicleMake:
              begin
                DataSet := MTDM.cdsVehicleMake;
                ScriptID := 48;
                FileName := 'C:\Data\Xml\Vehicle Make.xml';

//              ID := MTDM.cdsVehicle.FieldByName('ID').AsInteger;
//
//              VBBaseDM.GetData(48, MTDM.cdsVehicle, MTDM.cdsVehicle.Name, '',
//                'C:\Data\Xml\Age Period.xml', MTDM.cdsVehicle.UpdateOptions.Generatorname,
//                MTDM.cdsVehicle.UpdateOptions.UpdateTableName);
//
//              if not MTDM.cdsVehicle.Locate('ID', ID, []) then
//                MTDM.cdsVehicle.First;
              end;
          end;

          case AButtonIndex of
            NBDI_REFRESH:
              begin
                ADone := True;
                GeneratorName := DataSet.UpdateOptions.GeneratorName;
                UpdateTableName := DataSet.UpdateOptions.UpdateTableName;
                ID := DataSet.FieldByName('ID').AsInteger;

                VBBaseDM.GetData(ScriptID, DataSet, DataSet.Name, '',
                  FileName, Generatorname, UpdateTableName);

                if not DataSet.Locate('ID', ID, []) then
                  DataSet.First;
              end;

            NBDI_DELETE:
              begin
                ADone := True;

                if VBBaseDM.GetUseCount(VBBaseDM.QueryRequest) > 0 then
                  raise EValidateException.Create('The selected: ''' + VBBaseDM.ItemToCount + ''' is already in use in one or more transaction table(s) and cannot be deleted.');

                Beep;
                if DisplayMsg(
                  Application.Title,
                  'Delete Confirmaiton',
                  'Are you sure you want to delete the selected ' + VBBaseDM.ItemToCount + '?' + CRLF + CRLF +
                  'This action cannot be undone!',
                  mtConfirmation,
                  [mbYes, mbNo]
                  ) = mrNo then
                  Exit;

                DataSet.Delete;
              end;
          end;
        end;

      16: ReportDM.ReportAction := raPreview;
      17: ReportDM.ReportAction := raPrint;
      18: ReportDM.ReportAction := raExcel;
      19: ReportDM.ReportAction := raPDF;
    end;

    SetPrintButtonStatus(TFDMemTable(navMaster.DataSet));
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TBaseGridFrm.SetButtonVisibility(DataSet: TFDMemTable; MasterID: Integer);
var
  ReadOnly: Boolean;
begin
  if not DataSet.Locate('ID', MasterID, []) then
    ReadOnly := False
  else
    ReadOnly := DataSet.FieldByName('READ_ONLY').AsInteger = 1;

  navMaster.Buttons[6].Visible := not ReadOnly; // Insert
  navMaster.Buttons[8].Visible := not ReadOnly; // Delete
  navMaster.Buttons[10].Visible := not ReadOnly; // Post
  navMaster.Buttons[11].Visible := not ReadOnly; //  Cancel
  navMaster.Width := 40;
end;

procedure TBaseGridFrm.SetPrintButtonStatus(DataSet: TFDMemTable);
begin
  navMaster.Buttons[6].Enabled := not (DataSet.State in [dsEdit, dsInsert]);
  navMaster.Buttons[8].Enabled := not (DataSet.State in [dsEdit, dsInsert]);
  navMaster.Buttons[10].Enabled := not (DataSet.State in [dsEdit, dsInsert]);
  navMaster.Buttons[11].Enabled := not (DataSet.State in [dsEdit, dsInsert]);

  // Don't allow printing or exporting data whilst editing data.
  if DataSet.State in [dsEdit, dsInsert] then
    raise EExecutionException.Create('Cannot use the print/export functions whilst editing data.' + CRLF +
      'Please post or cancel the current transaction and try again.');
end;

procedure TBaseGridFrm.viewMasterCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if AViewInfo.GridRecord = nil then
    Exit;

  if AViewInfo.GridRecord.Focused then
  // This renders the background and font colours of the focused record
  begin
    if AViewInfo.Item <> nil then
      if AViewInfo.Item.Focused then
      begin
      // This renders the background and border colour of the focused cell
        ACanvas.Brush.Color := $B6EDFA;
        ACanvas.Font.Color := RootLookAndFeel.SkinPainter.DefaultSelectionColor;
        PostMessage(Handle, CM_DRAWBORDER, Integer(ACanvas), Integer(AViewInfo));
      end;
  end;
end;

end.

