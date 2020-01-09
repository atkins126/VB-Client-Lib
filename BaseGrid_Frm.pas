unit BaseGrid_Frm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Forms,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Dialogs, System.IOUtils,
  WinApi.ShellApi,

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
  cxGridExportLink;

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
    procedure PrintReport(ATag: Integer);
    procedure ExportToExcel(FileName: string; Grid: TcxGrid);
    procedure ExportToPDF(FileName: string; Grid: TcxGrid);

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
  public
    { Public declarations }
  end;

var
  BaseGridFrm: TBaseGridFrm;

implementation

{$R *.dfm}

uses
  CommonFunction,
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
begin
  inherited;
//  // Don't allow printing or exporting data whilst editing data.
//  if (AButtonIndex in [16, 17, 18, 19]) and (navMaster.DataSet.State in [dsEdit, dsInsert]) then
//    raise EExecutionException.Create('Cannot use the print/export functions whilst editing data.' + CRLF +
//      'Please post or cancel the current transaction and try again.');

  case AButtonIndex of
    16: ReportDM.ReportAction := raPreview;
    17: ReportDM.ReportAction := raPrint;
    18: ReportDM.ReportAction := raExcel;
    19: ReportDM.ReportAction := raPDF;
  end;
  SetPrintButtonStatus(TFDMemTable(navMaster.DataSet));
end;

procedure TBaseGridFrm.PrintReport(ATag: Integer);
begin
  case ATag of
    16, 17: // Preview & Print
      begin
        if ReportDM.rptMaster.PrepareReport then
          if ATag = 16 then
            ReportDM.rptMaster.ShowPreparedReport
          else
          begin
            if dlgPrint.Execute then
            begin
              ReportDM.rptMaster.PrintOptions.Copies :=
                dlgPrint.DialogData.Copies;

              ReportDM.rptMaster.Print;
            end;
          end;
      end;
  end;
end;

procedure TBaseGridFrm.ExportToExcel(FileName: string; Grid: TcxGrid);
var
  DestFolder, FolderPath, ExportFileName: string;
  FileSaved: Boolean;
  RepFileName: string;
//  ProgressDialog: TExcelExportProgressFrm;
begin
  inherited;
  FolderPath := EXCEL_DOCS;
//  FolderPath := MainFrm.FShellResource.RootFolder + '\' + FSHIFT_FOLDER + 'Export\';
  TDirectory.CreateDirectory(FolderPath);
  dlgFileSave.DefaultExt := 'xlsx';
  dlgFileSave.InitialDir := FolderPath;
//  dlgFileSave.FileName := '*.xlsx';
  dlgFileSave.FileName := Filename + '.xlsx';
  FileSaved := dlgFileSave.Execute;

  if not FileSaved then
    Exit;

//  if dlgFileSave.Execute then
  if TFile.Exists(dlgFileSave.FileName) then
  begin
    Beep;
    if DisplayMsg(Application.Title,
      'File Overwrite',
      'The file ' + dlgFileSave.FileName + ' already exists.' + CRLF +
      'Do you want to overwrite this file?',
      mtConfirmation,
      [mbYes, mbNo]
      ) = mrNo then
      Exit;
  end;

  ExportFileName := dlgFileSave.FileName;
  ExportGridToXLSX(
    ExportFileName, // Filename to export
    Grid, // Grid whose data must be exported
    True, // Expand groups
    True, // Save all records (Selected and un-selected ones)
    True, // Use native format
    'xlsx');

//    if cbxOepnDocument.Checked then
  ShellExecute(0, 'open', PChar('Excel.exe'), PChar('"' + ExportFileName + '"'), nil, SW_SHOWNORMAL)
end;

procedure TBaseGridFrm.ExportToPDF(FileName: string; Grid: TcxGrid);
var
  FileSaved: Boolean;
  DC: TcxCustomDataController;
  RepFileName: string;
begin
  inherited;
  ReportDM.frxPDFExport.ShowDialog := False;
  ReportDM.frxPDFExport.Background := True;
  ReportDM.frxPDFExport.OpenAfterExport := True; //cbxOepnDocument.Checked;
  ReportDM.frxPDFExport.OverwritePrompt := True;
  ReportDM.frxPDFExport.ShowProgress := True;
//  TfrxGroupHeader(ReportDM.rptBillableSummaryByCustomer.FindObject('bndCustomerHeader')).Visible := False;
//  TfrxMemoView(ReportDM.rptBillableSummaryByCustomer.FindObject('lblCustomerHeader')).Visible := False;
  dlgFileSave.DefaultExt := 'pdf';
  dlgFileSave.InitialDir := PDF_DOCS;
  dlgFileSave.FileName := '*.pdf';

  FileSaved := dlgFileSave.Execute;

  if not FileSaved then
    Exit;

  if TFile.Exists(dlgFileSave.FileName) then
  begin
    Beep;
    if DisplayMsg(Application.Title,
      'File Overwrite',
      'The file ' + dlgFileSave.FileName + ' already exists. Do you want to overwrite this file?',
      mtConfirmation,
      [mbYes, mbNo]
      ) = mrNo then
      Exit;
  end;

//  RepFileName := TSDM.ShellResource.ReportFolder + FReportFileName[grpData.ItemIndex];
//
//  if not TFile.Exists(RepFileName) then
//    raise EFileNotFoundException.Create('Report file: ' + RepFileName + ' not found. Cannot load report.');
//
//  ReportDM.FReport.LoadFromFile(TSDM.ShellResource.ReportFolder + FReportFileName[grpData.ItemIndex]);

//  DC := viewTimesheetBillable.DataController;
//  DC.BeginUpdate;
//  try
//    ReportDM.frxPDFExport.FileName := dlgFileSave.FileName;
//    if ReportDM.FReport.PrepareReport(True) then
//      ReportDM.FReport.Export(ReportDM.frxPDFExport);
//  finally
//    ReportDM.cdsTSBillable.First;
//    DC.EndUpdate;
//  end;
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

