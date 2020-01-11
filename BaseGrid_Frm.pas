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
    procedure FormCreate(Sender: TObject);
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

procedure TBaseGridFrm.FormCreate(Sender: TObject);
var
  RegKey: TRegistry;
begin
  inherited;
  ReportDM.PrintExporting := False;
  RegKey := TRegistry.Create(KEY_ALL_ACCESS or KEY_WRITE or KEY_WOW64_64KEY);
  RegKey.RootKey := HKEY_CURRENT_USER;
  try
    RegKey.OpenKey(KEY_MASTER_TABLE_MANAGER, True);

    if not RegKey.ValueExists('Open Ducoment After Export') then
      RegKey.WriteBool('Open Ducoment After Export', True);

    cbxOpenAfterExport.Checked := RegKey.ReadBool('Open Ducoment After Export');
  finally
    RegKey.Free;
  end;
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
  ID: Integer;
begin
  inherited;
//  // Don't allow printing or exporting data whilst editing data.
//  if (AButtonIndex in [16, 17, 18, 19]) and (navMaster.DataSet.State in [dsEdit, dsInsert]) then
//    raise EExecutionException.Create('Cannot use the print/export functions whilst editing data.' + CRLF +
//      'Please post or cancel the current transaction and try again.');
  case AButtonIndex of
    NBDI_REFRESH:
      begin
        ADone := True;
        case ReportDM.MasterFormType of
          ftActivityType:
            begin
              ID := MTDM.cdsActivityType.FieldByName('ID').AsInteger;

              VBBaseDM.GetData(39, MTDM.cdsActivityType, MTDM.cdsActivityType.Name, '',
                'C:\Data\Xml\Activity Type.xml', MTDM.cdsActivityType.UpdateOptions.Generatorname,
                MTDM.cdsActivityType.UpdateOptions.UpdateTableName);

              if not MTDM.cdsActivityType.Locate('ID', ID, []) then
                MTDM.cdsActivityType.First;
            end;
          ftAgePeriod:
            begin
              ID := MTDM.cdsAgePeriod.FieldByName('ID').AsInteger;

              VBBaseDM.GetData(13, MTDM.cdsAgePeriod, MTDM.cdsAgePeriod.Name, '',
                'C:\Data\Xml\Age Period.xml', MTDM.cdsAgePeriod.UpdateOptions.Generatorname,
                MTDM.cdsAgePeriod.UpdateOptions.UpdateTableName);

              if not MTDM.cdsAgePeriod.Locate('ID', ID, []) then
                MTDM.cdsAgePeriod.First;
            end;

          ftBankAccountType:
            begin
              ID := MTDM.cdsBankAccountType.FieldByName('ID').AsInteger;

              VBBaseDM.GetData(6, MTDM.cdsBankAccountType, MTDM.cdsBankAccountType.Name, '',
                'C:\Data\Xml\Bannk Account Type.xml', MTDM.cdsBankAccountType.UpdateOptions.Generatorname,
                MTDM.cdsBankAccountType.UpdateOptions.UpdateTableName);

              if not MTDM.cdsBankAccountType.Locate('ID', ID, []) then
                MTDM.cdsBankAccountType.First;
            end;
          ftBank:
            begin
              ID := MTDM.cdsBank.FieldByName('ID').AsInteger;

              VBBaseDM.GetData(5, MTDM.cdsBank, MTDM.cdsBank.Name, '',
                'C:\Data\Xml\Bannk.xml', MTDM.cdsBank.UpdateOptions.Generatorname,
                MTDM.cdsBank.UpdateOptions.UpdateTableName);

              if not MTDM.cdsBank.Locate('ID', ID, []) then
                MTDM.cdsBank.First;
            end;
          ftContactType:
            begin
              ID := MTDM.cdsContactType.FieldByName('ID').AsInteger;

              VBBaseDM.GetData(11, MTDM.cdsContactType, MTDM.cdsContactType.Name, '',
                'C:\Data\Xml\Age Period.xml', MTDM.cdsContactType.UpdateOptions.Generatorname,
                MTDM.cdsContactType.UpdateOptions.UpdateTableName);

              if not MTDM.cdsContactType.Locate('ID', ID, []) then
                MTDM.cdsContactType.First;
            end;
          ftCountry:
            begin
              ID := MTDM.cdsCountry.FieldByName('ID').AsInteger;

              VBBaseDM.GetData(12, MTDM.cdsCountry, MTDM.cdsCountry.Name, '',
                'C:\Data\Xml\Age Period.xml', MTDM.cdsCountry.UpdateOptions.Generatorname,
                MTDM.cdsCountry.UpdateOptions.UpdateTableName);

              if not MTDM.cdsCountry.Locate('ID', ID, []) then
                MTDM.cdsCountry.First;
            end;
          ftCustomerGroup:
            begin
              ID := MTDM.cdsCustomerGroup.FieldByName('ID').AsInteger;

              VBBaseDM.GetData(56, MTDM.cdsCustomerGroup, MTDM.cdsCustomerGroup.Name, '',
                'C:\Data\Xml\Age Period.xml', MTDM.cdsCustomerGroup.UpdateOptions.Generatorname,
                MTDM.cdsCustomerGroup.UpdateOptions.UpdateTableName);

              if not MTDM.cdsCustomerGroup.Locate('ID', ID, []) then
                MTDM.cdsCustomerGroup.First;
            end;
          ftCustomerStatus:
            begin
              ID := MTDM.cdsCustomerStatus.FieldByName('ID').AsInteger;

              VBBaseDM.GetData(14, MTDM.cdsCustomerStatus, MTDM.cdsCustomerStatus.Name, '',
                'C:\Data\Xml\Age Period.xml', MTDM.cdsCustomerStatus.UpdateOptions.Generatorname,
                MTDM.cdsCustomerStatus.UpdateOptions.UpdateTableName);

              if not MTDM.cdsCustomerStatus.Locate('ID', ID, []) then
                MTDM.cdsCustomerStatus.First;
            end;
          ftCustomerType:
            begin
              ID := MTDM.cdsCustomerType.FieldByName('ID').AsInteger;

              VBBaseDM.GetData(15, MTDM.cdsCustomerType, MTDM.cdsCustomerType.Name, '',
                'C:\Data\Xml\Age Period.xml', MTDM.cdsCustomerType.UpdateOptions.Generatorname,
                MTDM.cdsCustomerType.UpdateOptions.UpdateTableName);

              if not MTDM.cdsCustomerType.Locate('ID', ID, []) then
                MTDM.cdsCustomerType.First;
            end;
          ftJobFunction:
            begin
              ID := MTDM.cdsJobFunction.FieldByName('ID').AsInteger;

              VBBaseDM.GetData(19, MTDM.cdsJobFunction, MTDM.cdsJobFunction.Name, '',
                'C:\Data\Xml\Age Period.xml', MTDM.cdsJobFunction.UpdateOptions.Generatorname,
                MTDM.cdsJobFunction.UpdateOptions.UpdateTableName);

              if not MTDM.cdsJobFunction.Locate('ID', ID, []) then
                MTDM.cdsJobFunction.First;
            end;
          ftMonthOfYear:
            begin
              ID := MTDM.cdsMonthOfYear.FieldByName('ID').AsInteger;

              VBBaseDM.GetData(20, MTDM.cdsMonthOfYear, MTDM.cdsMonthOfYear.Name, '',
                'C:\Data\Xml\Age Period.xml', MTDM.cdsMonthOfYear.UpdateOptions.Generatorname,
                MTDM.cdsMonthOfYear.UpdateOptions.UpdateTableName);

              if not MTDM.cdsMonthOfYear.Locate('ID', ID, []) then
                MTDM.cdsMonthOfYear.First;
            end;
          ftRateUnit:
            begin
              ID := MTDM.cdsRateUnit.FieldByName('ID').AsInteger;

              VBBaseDM.GetData(38, MTDM.cdsRateUnit, MTDM.cdsRateUnit.Name, '',
                'C:\Data\Xml\Age Period.xml', MTDM.cdsRateUnit.UpdateOptions.Generatorname,
                MTDM.cdsRateUnit.UpdateOptions.UpdateTableName);

              if not MTDM.cdsRateUnit.Locate('ID', ID, []) then
                MTDM.cdsRateUnit.First;
            end;
          ftSalutation:
            begin
              ID := MTDM.cdsSalutation.FieldByName('ID').AsInteger;

              VBBaseDM.GetData(23, MTDM.cdsSalutation, MTDM.cdsSalutation.Name, '',
                'C:\Data\Xml\Age Period.xml', MTDM.cdsSalutation.UpdateOptions.Generatorname,
                MTDM.cdsSalutation.UpdateOptions.UpdateTableName);

              if not MTDM.cdsSalutation.Locate('ID', ID, []) then
                MTDM.cdsSalutation.First;
            end;
          ftStdActivity:
            begin
              ID := MTDM.cdsStdActivity.FieldByName('ID').AsInteger;

              VBBaseDM.GetData(52, MTDM.cdsStdActivity, MTDM.cdsStdActivity.Name, '',
                'C:\Data\Xml\Age Period.xml', MTDM.cdsStdActivity.UpdateOptions.Generatorname,
                MTDM.cdsStdActivity.UpdateOptions.UpdateTableName);

              if not MTDM.cdsStdActivity.Locate('ID', ID, []) then
                MTDM.cdsStdActivity.First;
            end;
          ftTaxoffice:
            begin
              ID := MTDM.cdsTaxOffice.FieldByName('ID').AsInteger;

              VBBaseDM.GetData(25, MTDM.cdsTaxOffice, MTDM.cdsTaxOffice.Name, '',
                'C:\Data\Xml\Age Period.xml', MTDM.cdsTaxOffice.UpdateOptions.Generatorname,
                MTDM.cdsTaxOffice.UpdateOptions.UpdateTableName);

              if not MTDM.cdsTaxOffice.Locate('ID', ID, []) then
                MTDM.cdsTaxOffice.First;
            end;
          ftVehicleMake:
            begin
              ID := MTDM.cdsVehicle.FieldByName('ID').AsInteger;

              VBBaseDM.GetData(48, MTDM.cdsVehicle, MTDM.cdsVehicle.Name, '',
                'C:\Data\Xml\Age Period.xml', MTDM.cdsVehicle.UpdateOptions.Generatorname,
                MTDM.cdsVehicle.UpdateOptions.UpdateTableName);

              if not MTDM.cdsVehicle.Locate('ID', ID, []) then
                MTDM.cdsVehicle.First;
            end;
        end;
      end;

    16: ReportDM.ReportAction := raPreview;
    17: ReportDM.ReportAction := raPrint;
    18: ReportDM.ReportAction := raExcel;
    19: ReportDM.ReportAction := raPDF;
  end;

  SetPrintButtonStatus(TFDMemTable(navMaster.DataSet));
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

