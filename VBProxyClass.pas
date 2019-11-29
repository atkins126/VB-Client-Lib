//
// Created by the DataSnap proxy generator.
// 02/08/2019 11:40:10
//

unit VBProxyClass;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON,
  Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr,
  Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type
  TVBServerMethodsClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
    FDSServerModuleDestroyCommand: TDBXCommand;
    FconFBBeforeConnectCommand: TDBXCommand;
    FGetDataCommand: TDBXCommand;
    FApplyDataUpdatesCommand: TDBXCommand;
    FExecuteSQLCommandCommand: TDBXCommand;
    FGetFileVersionCommand: TDBXCommand;
    FDownloadFileCommand: TDBXCommand;
    FTestTypeCommand: TDBXCommand;
    FEchoStringCommand: TDBXCommand;
    FExecuteStoredProcedureCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
    procedure conFBBeforeConnect(Sender: TObject);
    function GetData(Request: string; ParameterList: string; GeneratorName: string; Tablename: string; DataSetName: string; var Response: string): TFDJSONDataSets;
    function ApplyDataUpdates(DeltaList: TFDJSONDeltas; var Response: string; GeneratorName: string; Tablename: string): string;
    function ExecuteSQLCommand(Request: string; var Reponse: string): string;
    function GetFileVersion(Request: string; var Response: string): string;
    function DownloadFile(Request: string; var Response: string; var Size: Int64): TStream;
    function TestType(Request: string; var Response: string): string;
    function EchoString(Request: string; var Response: string): string;
    function ExecuteStoredProcedure(ProcedureName: string; ParameterList: string): string;
  end;

implementation

procedure TVBServerMethodsClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TVBServerMethods.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;

procedure TVBServerMethodsClient.DSServerModuleDestroy(Sender: TObject);
begin
  if FDSServerModuleDestroyCommand = nil then
  begin
    FDSServerModuleDestroyCommand := FDBXConnection.CreateCommand;
    FDSServerModuleDestroyCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleDestroyCommand.Text := 'TVBServerMethods.DSServerModuleDestroy';
    FDSServerModuleDestroyCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleDestroyCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleDestroyCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleDestroyCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDSServerModuleDestroyCommand.ExecuteUpdate;
end;

procedure TVBServerMethodsClient.conFBBeforeConnect(Sender: TObject);
begin
  if FconFBBeforeConnectCommand = nil then
  begin
    FconFBBeforeConnectCommand := FDBXConnection.CreateCommand;
    FconFBBeforeConnectCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FconFBBeforeConnectCommand.Text := 'TVBServerMethods.conFBBeforeConnect';
    FconFBBeforeConnectCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FconFBBeforeConnectCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FconFBBeforeConnectCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FconFBBeforeConnectCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FconFBBeforeConnectCommand.ExecuteUpdate;
end;

function TVBServerMethodsClient.GetData(Request: string; ParameterList: string; GeneratorName: string; Tablename: string; DataSetName: string; var Response: string): TFDJSONDataSets;
begin
  if FGetDataCommand = nil then
  begin
    FGetDataCommand := FDBXConnection.CreateCommand;
    FGetDataCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetDataCommand.Text := 'TVBServerMethods.GetData';
    FGetDataCommand.Prepare;
  end;
  FGetDataCommand.Parameters[0].Value.SetWideString(Request);
  FGetDataCommand.Parameters[1].Value.SetWideString(ParameterList);
  FGetDataCommand.Parameters[2].Value.SetWideString(GeneratorName);
  FGetDataCommand.Parameters[3].Value.SetWideString(Tablename);
  FGetDataCommand.Parameters[4].Value.SetWideString(DataSetName);
  FGetDataCommand.Parameters[5].Value.SetWideString(Response);
  FGetDataCommand.ExecuteUpdate;
  Response := FGetDataCommand.Parameters[5].Value.GetWideString;
  if not FGetDataCommand.Parameters[6].Value.IsNull then
  begin
    FUnMarshal := TDBXClientCommand(FGetDataCommand.Parameters[6].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetDataCommand.Parameters[6].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetDataCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TVBServerMethodsClient.ApplyDataUpdates(DeltaList: TFDJSONDeltas; var Response: string; GeneratorName: string; Tablename: string): string;
begin
  if FApplyDataUpdatesCommand = nil then
  begin
    FApplyDataUpdatesCommand := FDBXConnection.CreateCommand;
    FApplyDataUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FApplyDataUpdatesCommand.Text := 'TVBServerMethods.ApplyDataUpdates';
    FApplyDataUpdatesCommand.Prepare;
  end;
  if not Assigned(DeltaList) then
    FApplyDataUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FApplyDataUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FApplyDataUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(DeltaList), True);
      if FInstanceOwner then
        DeltaList.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FApplyDataUpdatesCommand.Parameters[1].Value.SetWideString(Response);
  FApplyDataUpdatesCommand.Parameters[2].Value.SetWideString(GeneratorName);
  FApplyDataUpdatesCommand.Parameters[3].Value.SetWideString(Tablename);
  FApplyDataUpdatesCommand.ExecuteUpdate;
  Response := FApplyDataUpdatesCommand.Parameters[1].Value.GetWideString;
  Result := FApplyDataUpdatesCommand.Parameters[4].Value.GetWideString;
end;

function TVBServerMethodsClient.ExecuteSQLCommand(Request: string; var Reponse: string): string;
begin
  if FExecuteSQLCommandCommand = nil then
  begin
    FExecuteSQLCommandCommand := FDBXConnection.CreateCommand;
    FExecuteSQLCommandCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FExecuteSQLCommandCommand.Text := 'TVBServerMethods.ExecuteSQLCommand';
    FExecuteSQLCommandCommand.Prepare;
  end;
  FExecuteSQLCommandCommand.Parameters[0].Value.SetWideString(Request);
  FExecuteSQLCommandCommand.Parameters[1].Value.SetWideString(Reponse);
  FExecuteSQLCommandCommand.ExecuteUpdate;
  Reponse := FExecuteSQLCommandCommand.Parameters[1].Value.GetWideString;
  Result := FExecuteSQLCommandCommand.Parameters[2].Value.GetWideString;
end;

function TVBServerMethodsClient.GetFileVersion(Request: string; var Response: string): string;
begin
  if FGetFileVersionCommand = nil then
  begin
    FGetFileVersionCommand := FDBXConnection.CreateCommand;
    FGetFileVersionCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetFileVersionCommand.Text := 'TVBServerMethods.GetFileVersion';
    FGetFileVersionCommand.Prepare;
  end;
  FGetFileVersionCommand.Parameters[0].Value.SetWideString(Request);
  FGetFileVersionCommand.Parameters[1].Value.SetWideString(Response);
  FGetFileVersionCommand.ExecuteUpdate;
  Response := FGetFileVersionCommand.Parameters[1].Value.GetWideString;
  Result := FGetFileVersionCommand.Parameters[2].Value.GetWideString;
end;

function TVBServerMethodsClient.DownloadFile(Request: string; var Response: string; var Size: Int64): TStream;
begin
  if FDownloadFileCommand = nil then
  begin
    FDownloadFileCommand := FDBXConnection.CreateCommand;
    FDownloadFileCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDownloadFileCommand.Text := 'TVBServerMethods.DownloadFile';
    FDownloadFileCommand.Prepare;
  end;
  FDownloadFileCommand.Parameters[0].Value.SetWideString(Request);
  FDownloadFileCommand.Parameters[1].Value.SetWideString(Response);
  FDownloadFileCommand.Parameters[2].Value.SetInt64(Size);
  FDownloadFileCommand.ExecuteUpdate;
  Response := FDownloadFileCommand.Parameters[1].Value.GetWideString;
  Size := FDownloadFileCommand.Parameters[2].Value.GetInt64;
  Result := FDownloadFileCommand.Parameters[3].Value.GetStream(FInstanceOwner);
end;

function TVBServerMethodsClient.TestType(Request: string; var Response: string): string;
begin
  if FTestTypeCommand = nil then
  begin
    FTestTypeCommand := FDBXConnection.CreateCommand;
    FTestTypeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FTestTypeCommand.Text := 'TVBServerMethods.TestType';
    FTestTypeCommand.Prepare;
  end;
  FTestTypeCommand.Parameters[0].Value.SetWideString(Request);
  FTestTypeCommand.Parameters[1].Value.SetWideString(Response);
  FTestTypeCommand.ExecuteUpdate;
  Response := FTestTypeCommand.Parameters[1].Value.GetWideString;
  Result := FTestTypeCommand.Parameters[2].Value.GetWideString;
end;

function TVBServerMethodsClient.EchoString(Request: string; var Response: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FDBXConnection.CreateCommand;
    FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStringCommand.Text := 'TVBServerMethods.EchoString';
    FEchoStringCommand.Prepare;
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Request);
  FEchoStringCommand.Parameters[1].Value.SetWideString(Response);
  FEchoStringCommand.ExecuteUpdate;
  Response := FEchoStringCommand.Parameters[1].Value.GetWideString;
  Result := FEchoStringCommand.Parameters[2].Value.GetWideString;
end;

function TVBServerMethodsClient.ExecuteStoredProcedure(ProcedureName: string; ParameterList: string): string;
begin
  if FExecuteStoredProcedureCommand = nil then
  begin
    FExecuteStoredProcedureCommand := FDBXConnection.CreateCommand;
    FExecuteStoredProcedureCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FExecuteStoredProcedureCommand.Text := 'TVBServerMethods.ExecuteStoredProcedure';
    FExecuteStoredProcedureCommand.Prepare;
  end;
  FExecuteStoredProcedureCommand.Parameters[0].Value.SetWideString(ProcedureName);
  FExecuteStoredProcedureCommand.Parameters[1].Value.SetWideString(ParameterList);
  FExecuteStoredProcedureCommand.ExecuteUpdate;
  Result := FExecuteStoredProcedureCommand.Parameters[2].Value.GetWideString;
end;

constructor TVBServerMethodsClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TVBServerMethodsClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TVBServerMethodsClient.Destroy;
begin
  FDSServerModuleCreateCommand.DisposeOf;
  FDSServerModuleDestroyCommand.DisposeOf;
  FconFBBeforeConnectCommand.DisposeOf;
  FGetDataCommand.DisposeOf;
  FApplyDataUpdatesCommand.DisposeOf;
  FExecuteSQLCommandCommand.DisposeOf;
  FGetFileVersionCommand.DisposeOf;
  FDownloadFileCommand.DisposeOf;
  FTestTypeCommand.DisposeOf;
  FEchoStringCommand.DisposeOf;
  FExecuteStoredProcedureCommand.DisposeOf;
  inherited;
end;

end.

