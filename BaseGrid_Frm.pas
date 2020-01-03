unit BaseGrid_Frm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  BaseLayout_Frm, CommonValues,

  FireDac.Comp.Client,

  frxClass, frxDBSet,

  cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  System.ImageList, Vcl.ImgList, cxImageList, dxLayoutLookAndFeels,
  System.Actions, Vcl.ActnList, cxClasses, cxStyles, dxLayoutContainer,
  dxLayoutControl, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges, Data.DB, cxDBData, cxDBNavigator, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGrid,
  dxScrollbarAnnotations, dxPrnDev, dxPrnDlg;

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
    procedure viewMasterCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure DrawCellBorder(var Msg: TMessage); message CM_DRAWBORDER;
//    procedure SetButtonVisibility(ReadOnlyDataSet: Boolean);
    procedure SetButtonVisibility(DataSet: TFDMemTable; MasterID: Integer);
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
  // Don't allow printing or exporting data whilst editing data.
  if (AButtonIndex in [16, 17, 18, 19]) and (navMaster.DataSet.State in [dsEdit, dsInsert]) then
    raise EExecutionException.Create('Cannot use the print/export functions whilst editing data.' + CRLF +
      'Please post or cancel the current transaction and try again.');

  case AButtonIndex of
    16, 17: // Preview & Print
      begin
        if ReportDM.rptMaster.PrepareReport then
          if AButtonIndex = 16 then
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

