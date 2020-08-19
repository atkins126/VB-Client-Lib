//
// Created by the DataSnap proxy generator.
// 18/08/2020 16:37:41
// 

unit VBProxyClasses;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type
  TVBServerMethodsClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
    FDSServerModuleDestroyCommand: TDBXCommand;
    FconFBBeforeConnectCommand: TDBXCommand;
    FconFBErrorCommand: TDBXCommand;
    FGetDataCommand: TDBXCommand;
    FExecuteSQLCommandCommand: TDBXCommand;
    FExecuteStoredProcedureCommand: TDBXCommand;
    FGetFileVersionCommand: TDBXCommand;
    FDownloadFileCommand: TDBXCommand;
    FModifyRecordCommand: TDBXCommand;
    FGetIDCommand: TDBXCommand;
    FGetUseCountCommand: TDBXCommand;
    FGetFieldValueCommand: TDBXCommand;
    FApplyDataUpdatesCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
    procedure conFBBeforeConnect(Sender: TObject);
    procedure conFBError(ASender: TObject; AInitiator: TObject; var AException: Exception);
    function GetData(Request: string; ParameterList: string; Generatorname: string; Tablename: string; DataSetName: string; var Response: string): TFDJSONDataSets;
    function ExecuteSQLCommand(Request: string): string;
    function ExecuteStoredProcedure(ProcedureName: string; ParameterList: string; ParameterValues: string; var OutputValues: string): string;
    function GetFileVersion(Request: string; var Response: string): string;
    function DownloadFile(Request: string; var Response: string; var Size: Int64): TStream;
    function ModifyRecord(Request: string; var Response: string): string;
    function GetID(GeneratorName: string; IDRank: Integer): string;
    function GetUseCount(Request: string): string;
    function GetFieldValue(Request: string; FieldTypeID: Integer; var Response: string): string;
    function ApplyDataUpdates(DeltaList: TFDJSONDeltas; var ReplyMessage: string; GeneratorName: string; TableName: string; ScriptID: Integer): string;
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

procedure TVBServerMethodsClient.conFBError(ASender: TObject; AInitiator: TObject; var AException: Exception);
begin
  if FconFBErrorCommand = nil then
  begin
    FconFBErrorCommand := FDBXConnection.CreateCommand;
    FconFBErrorCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FconFBErrorCommand.Text := 'TVBServerMethods.conFBError';
    FconFBErrorCommand.Prepare;
  end;
  if not Assigned(ASender) then
    FconFBErrorCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FconFBErrorCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FconFBErrorCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ASender), True);
      if FInstanceOwner then
        ASender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  if not Assigned(AInitiator) then
    FconFBErrorCommand.Parameters[1].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FconFBErrorCommand.Parameters[1].ConnectionHandler).GetJSONMarshaler;
    try
      FconFBErrorCommand.Parameters[1].Value.SetJSONValue(FMarshal.Marshal(AInitiator), True);
      if FInstanceOwner then
        AInitiator.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  if not Assigned(AException) then
    FconFBErrorCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FconFBErrorCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FconFBErrorCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(AException), True);
      if FInstanceOwner then
        AException.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FconFBErrorCommand.ExecuteUpdate;
  if not FconFBErrorCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDBXClientCommand(FconFBErrorCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      AException := Exception(FUnMarshal.UnMarshal(FconFBErrorCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FconFBErrorCommand.FreeOnExecute(AException);
    finally
      FreeAndNil(FUnMarshal)
    end;
  end
  else
    AException := nil;
end;

function TVBServerMethodsClient.GetData(Request: string; ParameterList: string; Generatorname: string; Tablename: string; DataSetName: string; var Response: string): TFDJSONDataSets;
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
  FGetDataCommand.Parameters[2].Value.SetWideString(Generatorname);
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

function TVBServerMethodsClient.ExecuteSQLCommand(Request: string): string;
begin
  if FExecuteSQLCommandCommand = nil then
  begin
    FExecuteSQLCommandCommand := FDBXConnection.CreateCommand;
    FExecuteSQLCommandCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FExecuteSQLCommandCommand.Text := 'TVBServerMethods.ExecuteSQLCommand';
    FExecuteSQLCommandCommand.Prepare;
  end;
  FExecuteSQLCommandCommand.Parameters[0].Value.SetWideString(Request);
  FExecuteSQLCommandCommand.ExecuteUpdate;
  Result := FExecuteSQLCommandCommand.Parameters[1].Value.GetWideString;
end;

function TVBServerMethodsClient.ExecuteStoredProcedure(ProcedureName: string; ParameterList: string; ParameterValues: string; var OutputValues: string): string;
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
  FExecuteStoredProcedureCommand.Parameters[2].Value.SetWideString(ParameterValues);
  FExecuteStoredProcedureCommand.Parameters[3].Value.SetWideString(OutputValues);
  FExecuteStoredProcedureCommand.ExecuteUpdate;
  OutputValues := FExecuteStoredProcedureCommand.Parameters[3].Value.GetWideString;
  Result := FExecuteStoredProcedureCommand.Parameters[4].Value.GetWideString;
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

function TVBServerMethodsClient.ModifyRecord(Request: string; var Response: string): string;
begin
  if FModifyRecordCommand = nil then
  begin
    FModifyRecordCommand := FDBXConnection.CreateCommand;
    FModifyRecordCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FModifyRecordCommand.Text := 'TVBServerMethods.ModifyRecord';
    FModifyRecordCommand.Prepare;
  end;
  FModifyRecordCommand.Parameters[0].Value.SetWideString(Request);
  FModifyRecordCommand.Parameters[1].Value.SetWideString(Response);
  FModifyRecordCommand.ExecuteUpdate;
  Response := FModifyRecordCommand.Parameters[1].Value.GetWideString;
  Result := FModifyRecordCommand.Parameters[2].Value.GetWideString;
end;

function TVBServerMethodsClient.GetID(GeneratorName: string; IDRank: Integer): string;
begin
  if FGetIDCommand = nil then
  begin
    FGetIDCommand := FDBXConnection.CreateCommand;
    FGetIDCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetIDCommand.Text := 'TVBServerMethods.GetID';
    FGetIDCommand.Prepare;
  end;
  FGetIDCommand.Parameters[0].Value.SetWideString(GeneratorName);
  FGetIDCommand.Parameters[1].Value.SetInt32(IDRank);
  FGetIDCommand.ExecuteUpdate;
  Result := FGetIDCommand.Parameters[2].Value.GetWideString;
end;

function TVBServerMethodsClient.GetUseCount(Request: string): string;
begin
  if FGetUseCountCommand = nil then
  begin
    FGetUseCountCommand := FDBXConnection.CreateCommand;
    FGetUseCountCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetUseCountCommand.Text := 'TVBServerMethods.GetUseCount';
    FGetUseCountCommand.Prepare;
  end;
  FGetUseCountCommand.Parameters[0].Value.SetWideString(Request);
  FGetUseCountCommand.ExecuteUpdate;
  Result := FGetUseCountCommand.Parameters[1].Value.GetWideString;
end;

function TVBServerMethodsClient.GetFieldValue(Request: string; FieldTypeID: Integer; var Response: string): string;
begin
  if FGetFieldValueCommand = nil then
  begin
    FGetFieldValueCommand := FDBXConnection.CreateCommand;
    FGetFieldValueCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetFieldValueCommand.Text := 'TVBServerMethods.GetFieldValue';
    FGetFieldValueCommand.Prepare;
  end;
  FGetFieldValueCommand.Parameters[0].Value.SetWideString(Request);
  FGetFieldValueCommand.Parameters[1].Value.SetInt32(FieldTypeID);
  FGetFieldValueCommand.Parameters[2].Value.SetWideString(Response);
  FGetFieldValueCommand.ExecuteUpdate;
  Response := FGetFieldValueCommand.Parameters[2].Value.GetWideString;
  Result := FGetFieldValueCommand.Parameters[3].Value.GetWideString;
end;

function TVBServerMethodsClient.ApplyDataUpdates(DeltaList: TFDJSONDeltas; var ReplyMessage: string; GeneratorName: string; TableName: string; ScriptID: Integer): string;
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
  FApplyDataUpdatesCommand.Parameters[1].Value.SetWideString(ReplyMessage);
  FApplyDataUpdatesCommand.Parameters[2].Value.SetWideString(GeneratorName);
  FApplyDataUpdatesCommand.Parameters[3].Value.SetWideString(TableName);
  FApplyDataUpdatesCommand.Parameters[4].Value.SetInt32(ScriptID);
  FApplyDataUpdatesCommand.ExecuteUpdate;
  ReplyMessage := FApplyDataUpdatesCommand.Parameters[1].Value.GetWideString;
  Result := FApplyDataUpdatesCommand.Parameters[5].Value.GetWideString;
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
  FconFBErrorCommand.DisposeOf;
  FGetDataCommand.DisposeOf;
  FExecuteSQLCommandCommand.DisposeOf;
  FExecuteStoredProcedureCommand.DisposeOf;
  FGetFileVersionCommand.DisposeOf;
  FDownloadFileCommand.DisposeOf;
  FModifyRecordCommand.DisposeOf;
  FGetIDCommand.DisposeOf;
  FGetUseCountCommand.DisposeOf;
  FGetFieldValueCommand.DisposeOf;
  FApplyDataUpdatesCommand.DisposeOf;
  inherited;
end;

end.
