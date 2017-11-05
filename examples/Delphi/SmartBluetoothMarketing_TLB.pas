unit SmartBluetoothMarketing_TLB;

// ************************************************************************ //
// WARNING
// -------
// The types declared in this file were generated from data read from a
// Type Library. If this type library is explicitly or indirectly (via
// another type library referring to this type library) re-imported, or the
// 'Refresh' command of the Type Library Editor activated while editing the
// Type Library, the contents of this file will be regenerated and all
// manual modifications will be lost.
// ************************************************************************ //

// $Rev: 17252 $
// File generated on 15.02.2010 21:43:50 from Type Library described below.

// ************************************************************************  //
// Type Lib: S:\build\sbm\trunk\main\SmartBluetoothMarketing (1)
// LIBID: {948089DD-AE87-43C3-8B57-B5C0AA978577}
// LCID: 0
// Helpfile:
// HelpString:
// DepndLst:
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
//   (2) v4.0 StdVCL, (stdvcl40.dll)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  SmartBluetoothMarketingMajorVersion = 1;
  SmartBluetoothMarketingMinorVersion = 0;

  LIBID_SmartBluetoothMarketing: TGUID = '{948089DD-AE87-43C3-8B57-B5C0AA978577}';

  IID_ISBMApplication: TGUID = '{F378F1AC-73CF-4F17-B076-03EB1B4F3937}';
  DIID_ISBMApplicationEvents: TGUID = '{D668206D-8633-4E68-8D42-FFF1C8B1AE61}';
  CLASS_SBMApplication: TGUID = '{C78BACD4-281C-4A91-8239-C56C1F821882}';
  IID_ISBMOptions: TGUID = '{A32F4F3D-070A-4598-B19E-B04211A34965}';
  IID_ISBMCampaign: TGUID = '{0C5FD8AB-0D9F-4CCE-B777-F95ED620056D}';
  IID_ISBMCampaignDaySchedule: TGUID = '{9B612D22-87A7-45BD-A3C2-A075D2D2B18C}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library
// *********************************************************************//
// Constants for enum SBMCampaignPriority
type
  SBMCampaignPriority = TOleEnum;
const
  SBMCampaignPriorityHighest = $00000064;
  SBMCampaignPriorityHigh = $00000032;
  SBMCampaignPriorityNormal = $00000000;
  SBMCampaignPriorityLow = $FFFFFFCE;
  SBMCampaignPriorityLowest = $FFFFFF9C;

// Constants for enum SBMState
type
  SBMState = TOleEnum;
const
  SBMStopped = $00000000;
  SBMStopping = $00000001;
  SBMStarting = $00000002;
  SBMStarted = $00000003;

// Constants for enum SBMStartup
type
  SBMStartup = TOleEnum;
const
  SBMStartupDontStart = $00000000;
  SBMStartupStart = $00000001;
  SBMStartupRestore = $00000002;

// Constants for enum SBMAutoResetUnit
type
  SBMAutoResetUnit = TOleEnum;
const
  SBMAutoresetMinutes = $00000000;
  SBMAutoresetHours = $00000001;
  SBMAutoresetDays = $00000002;
  SBMAutoresetWeeks = $00000003;
  SBMAutoresetMonths = $00000004;

// Constants for enum SBMDataFormat
type
  SBMDataFormat = TOleEnum;
const
  SBMFormatMSO = $00000000;
  SBMFormatDataPacket = $00000001;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  ISBMApplication = interface;
  ISBMApplicationDisp = dispinterface;
  ISBMApplicationEvents = dispinterface;
  ISBMOptions = interface;
  ISBMOptionsDisp = dispinterface;
  ISBMCampaign = interface;
  ISBMCampaignDisp = dispinterface;
  ISBMCampaignDaySchedule = interface;
  ISBMCampaignDayScheduleDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  SBMApplication = ISBMApplication;


// *********************************************************************//
// Interface: ISBMApplication
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F378F1AC-73CF-4F17-B076-03EB1B4F3937}
// *********************************************************************//
  ISBMApplication = interface(IDispatch)
    ['{F378F1AC-73CF-4F17-B076-03EB1B4F3937}']
    function Get_Version: WideString; safecall;
    procedure Connect(const Password: WideString); safecall;
    function Get_IsBluetoothOK: WordBool; safecall;
    procedure Minimize; safecall;
    procedure Restore; safecall;
    procedure Quit; safecall;
    function Get_Options: ISBMOptions; safecall;
    procedure DisplayOptionsDialog; safecall;
    function Get_SenderState: SBMState; safecall;
    function Get_ReceiverState: SBMState; safecall;
    procedure StartSender; safecall;
    procedure StopSender; safecall;
    procedure StartReceiver; safecall;
    procedure StopReceiver; safecall;
    procedure RenameLocalRadio(const NewName: WideString); safecall;
    function Get_CampaignCount: Integer; safecall;
    function Get_Campaigns(index: Integer): ISBMCampaign; safecall;
    function CampaignByID(ID: Integer): ISBMCampaign; safecall;
    function CreateNewCampaign: ISBMCampaign; safecall;
    procedure DeleteCampaign(index: Integer); safecall;
    procedure DeleteCampaignByID(ID: Integer); safecall;
    function DuplicateCampaign(index: Integer): ISBMCampaign; safecall;
    function DuplicateCampaignByID(ID: Integer): ISBMCampaign; safecall;
    property Version: WideString read Get_Version;
    property IsBluetoothOK: WordBool read Get_IsBluetoothOK;
    property Options: ISBMOptions read Get_Options;
    property SenderState: SBMState read Get_SenderState;
    property ReceiverState: SBMState read Get_ReceiverState;
    property CampaignCount: Integer read Get_CampaignCount;
    property Campaigns[index: Integer]: ISBMCampaign read Get_Campaigns;
  end;

// *********************************************************************//
// DispIntf:  ISBMApplicationDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F378F1AC-73CF-4F17-B076-03EB1B4F3937}
// *********************************************************************//
  ISBMApplicationDisp = dispinterface
    ['{F378F1AC-73CF-4F17-B076-03EB1B4F3937}']
    property Version: WideString readonly dispid 201;
    procedure Connect(const Password: WideString); dispid 202;
    property IsBluetoothOK: WordBool readonly dispid 203;
    procedure Minimize; dispid 204;
    procedure Restore; dispid 205;
    procedure Quit; dispid 206;
    property Options: ISBMOptions readonly dispid 207;
    procedure DisplayOptionsDialog; dispid 208;
    property SenderState: SBMState readonly dispid 209;
    property ReceiverState: SBMState readonly dispid 210;
    procedure StartSender; dispid 211;
    procedure StopSender; dispid 212;
    procedure StartReceiver; dispid 213;
    procedure StopReceiver; dispid 214;
    procedure RenameLocalRadio(const NewName: WideString); dispid 215;
    property CampaignCount: Integer readonly dispid 216;
    property Campaigns[index: Integer]: ISBMCampaign readonly dispid 217;
    function CampaignByID(ID: Integer): ISBMCampaign; dispid 218;
    function CreateNewCampaign: ISBMCampaign; dispid 219;
    procedure DeleteCampaign(index: Integer); dispid 220;
    procedure DeleteCampaignByID(ID: Integer); dispid 221;
    function DuplicateCampaign(index: Integer): ISBMCampaign; dispid 222;
    function DuplicateCampaignByID(ID: Integer): ISBMCampaign; dispid 223;
  end;

// *********************************************************************//
// DispIntf:  ISBMApplicationEvents
// Flags:     (0)
// GUID:      {D668206D-8633-4E68-8D42-FFF1C8B1AE61}
// *********************************************************************//
  ISBMApplicationEvents = dispinterface
    ['{D668206D-8633-4E68-8D42-FFF1C8B1AE61}']
  end;

// *********************************************************************//
// Interface: ISBMOptions
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A32F4F3D-070A-4598-B19E-B04211A34965}
// *********************************************************************//
  ISBMOptions = interface(IDispatch)
    ['{A32F4F3D-070A-4598-B19E-B04211A34965}']
    procedure UseDefaults; safecall;
    function Get_SenderMaxConnections: Integer; safecall;
    procedure Set_SenderMaxConnections(Value: Integer); safecall;
    function Get_SenderDiscoveryLength: Integer; safecall;
    procedure Set_SenderDiscoveryLength(Value: Integer); safecall;
    function Get_SenderDiscoveryInterval: Integer; safecall;
    procedure Set_SenderDiscoveryInterval(Value: Integer); safecall;
    function Get_SenderTimeout: Integer; safecall;
    procedure Set_SenderTimeout(Value: Integer); safecall;
    function Get_SenderRetriesIfRejected: Integer; safecall;
    procedure Set_SenderRetriesIfRejected(Value: Integer); safecall;
    function Get_SenderRetriesIfFailed: Integer; safecall;
    procedure Set_SenderRetriesIfFailed(Value: Integer); safecall;
    function Get_SenderTryAfterIfRejected: Integer; safecall;
    procedure Set_SenderTryAfterIfRejected(Value: Integer); safecall;
    function Get_SenderEnableAuth: WordBool; safecall;
    procedure Set_SenderEnableAuth(Value: WordBool); safecall;
    function Get_SenderDefaultPIN: WideString; safecall;
    procedure Set_SenderDefaultPIN(const Value: WideString); safecall;
    function Get_SenderStartup: SBMStartup; safecall;
    procedure Set_SenderStartup(Value: SBMStartup); safecall;
    function Get_SenderTrackAll: WordBool; safecall;
    procedure Set_SenderTrackAll(Value: WordBool); safecall;
    function Get_SenderCreateTextLog: WordBool; safecall;
    procedure Set_SenderCreateTextLog(Value: WordBool); safecall;
    function Get_SenderLogFolder: WideString; safecall;
    procedure Set_SenderLogFolder(const Value: WideString); safecall;
    function Get_ReceiverStartup: SBMStartup; safecall;
    procedure Set_ReceiverStartup(Value: SBMStartup); safecall;
    function Get_ReceiverDisplayBalloon: WordBool; safecall;
    procedure Set_ReceiverDisplayBalloon(Value: WordBool); safecall;
    function Get_ReceiverPlaySound: WordBool; safecall;
    procedure Set_ReceiverPlaySound(Value: WordBool); safecall;
    function Get_ReceiverSoundFile: WideString; safecall;
    procedure Set_ReceiverSoundFile(const Value: WideString); safecall;
    function Get_ReceiverMaxFileSize: Integer; safecall;
    procedure Set_ReceiverMaxFileSize(Value: Integer); safecall;
    function Get_ReceiverMaxMessagesPerDevice: Integer; safecall;
    procedure Set_ReceiverMaxMessagesPerDevice(Value: Integer); safecall;
    function Get_ReceiverAutoSave: WordBool; safecall;
    procedure Set_ReceiverAutoSave(Value: WordBool); safecall;
    function Get_ReceiverAutoSaveFolder: WideString; safecall;
    procedure Set_ReceiverAutoSaveFolder(const Value: WideString); safecall;
    property SenderMaxConnections: Integer read Get_SenderMaxConnections write Set_SenderMaxConnections;
    property SenderDiscoveryLength: Integer read Get_SenderDiscoveryLength write Set_SenderDiscoveryLength;
    property SenderDiscoveryInterval: Integer read Get_SenderDiscoveryInterval write Set_SenderDiscoveryInterval;
    property SenderTimeout: Integer read Get_SenderTimeout write Set_SenderTimeout;
    property SenderRetriesIfRejected: Integer read Get_SenderRetriesIfRejected write Set_SenderRetriesIfRejected;
    property SenderRetriesIfFailed: Integer read Get_SenderRetriesIfFailed write Set_SenderRetriesIfFailed;
    property SenderTryAfterIfRejected: Integer read Get_SenderTryAfterIfRejected write Set_SenderTryAfterIfRejected;
    property SenderEnableAuth: WordBool read Get_SenderEnableAuth write Set_SenderEnableAuth;
    property SenderDefaultPIN: WideString read Get_SenderDefaultPIN write Set_SenderDefaultPIN;
    property SenderStartup: SBMStartup read Get_SenderStartup write Set_SenderStartup;
    property SenderTrackAll: WordBool read Get_SenderTrackAll write Set_SenderTrackAll;
    property SenderCreateTextLog: WordBool read Get_SenderCreateTextLog write Set_SenderCreateTextLog;
    property SenderLogFolder: WideString read Get_SenderLogFolder write Set_SenderLogFolder;
    property ReceiverStartup: SBMStartup read Get_ReceiverStartup write Set_ReceiverStartup;
    property ReceiverDisplayBalloon: WordBool read Get_ReceiverDisplayBalloon write Set_ReceiverDisplayBalloon;
    property ReceiverPlaySound: WordBool read Get_ReceiverPlaySound write Set_ReceiverPlaySound;
    property ReceiverSoundFile: WideString read Get_ReceiverSoundFile write Set_ReceiverSoundFile;
    property ReceiverMaxFileSize: Integer read Get_ReceiverMaxFileSize write Set_ReceiverMaxFileSize;
    property ReceiverMaxMessagesPerDevice: Integer read Get_ReceiverMaxMessagesPerDevice write Set_ReceiverMaxMessagesPerDevice;
    property ReceiverAutoSave: WordBool read Get_ReceiverAutoSave write Set_ReceiverAutoSave;
    property ReceiverAutoSaveFolder: WideString read Get_ReceiverAutoSaveFolder write Set_ReceiverAutoSaveFolder;
  end;

// *********************************************************************//
// DispIntf:  ISBMOptionsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A32F4F3D-070A-4598-B19E-B04211A34965}
// *********************************************************************//
  ISBMOptionsDisp = dispinterface
    ['{A32F4F3D-070A-4598-B19E-B04211A34965}']
    procedure UseDefaults; dispid 201;
    property SenderMaxConnections: Integer dispid 202;
    property SenderDiscoveryLength: Integer dispid 203;
    property SenderDiscoveryInterval: Integer dispid 204;
    property SenderTimeout: Integer dispid 205;
    property SenderRetriesIfRejected: Integer dispid 206;
    property SenderRetriesIfFailed: Integer dispid 207;
    property SenderTryAfterIfRejected: Integer dispid 208;
    property SenderEnableAuth: WordBool dispid 209;
    property SenderDefaultPIN: WideString dispid 210;
    property SenderStartup: SBMStartup dispid 211;
    property SenderTrackAll: WordBool dispid 212;
    property SenderCreateTextLog: WordBool dispid 213;
    property SenderLogFolder: WideString dispid 214;
    property ReceiverStartup: SBMStartup dispid 215;
    property ReceiverDisplayBalloon: WordBool dispid 216;
    property ReceiverPlaySound: WordBool dispid 217;
    property ReceiverSoundFile: WideString dispid 218;
    property ReceiverMaxFileSize: Integer dispid 219;
    property ReceiverMaxMessagesPerDevice: Integer dispid 220;
    property ReceiverAutoSave: WordBool dispid 221;
    property ReceiverAutoSaveFolder: WideString dispid 222;
  end;

// *********************************************************************//
// Interface: ISBMCampaign
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0C5FD8AB-0D9F-4CCE-B777-F95ED620056D}
// *********************************************************************//
  ISBMCampaign = interface(IDispatch)
    ['{0C5FD8AB-0D9F-4CCE-B777-F95ED620056D}']
    function Get_ID: Integer; safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    function Get_Started: WordBool; safecall;
    procedure Reset; safecall;
    function Get_ResetDate: TDateTime; safecall;
    procedure DisplayEditDialog; safecall;
    function Get_Title: WideString; safecall;
    procedure Set_Title(const Value: WideString); safecall;
    function Get_Comments: WideString; safecall;
    procedure Set_Comments(const Value: WideString); safecall;
    function Get_IsPrivate: WordBool; safecall;
    procedure Set_IsPrivate(Value: WordBool); safecall;
    function Get_Priority: SBMCampaignPriority; safecall;
    procedure Set_Priority(Value: SBMCampaignPriority); safecall;
    function Get_FileName: WideString; safecall;
    procedure Set_FileName(const Value: WideString); safecall;
    function Get_RawBytes: PSafeArray; safecall;
    procedure Set_RawBytes(Value: PSafeArray); safecall;
    procedure AttachFile(const FileName: WideString; Store: WordBool); safecall;
    procedure AttachText(const Text: WideString; const Name: WideString); safecall;
    function Get_StartDate: TDateTime; safecall;
    function Get_EndDate: TDateTime; safecall;
    procedure SetDates(StartDate: TDateTime; EndDate: TDateTime); safecall;
    function Get_ScheduleEnabled: WordBool; safecall;
    procedure Set_ScheduleEnabled(Value: WordBool); safecall;
    function Get_Schedule(index: Integer): ISBMCampaignDaySchedule; safecall;
    procedure ResetSchedule; safecall;
    function Get_MaxCount: Integer; safecall;
    procedure Set_MaxCount(Value: Integer); safecall;
    function Get_RandomRatio: Currency; safecall;
    procedure Set_RandomRatio(Value: Currency); safecall;
    function Get_AutoReset: Integer; safecall;
    procedure Set_AutoReset(Value: Integer); safecall;
    function Get_AutoResetUnits: SBMAutoResetUnit; safecall;
    procedure Set_AutoResetUnits(Value: SBMAutoResetUnit); safecall;
    function Get_TotalOK: Integer; safecall;
    function Get_TotalFailed: Integer; safecall;
    function Get_TotalRejected: Integer; safecall;
    function Get_StatusText: WideString; safecall;
    function GetStatistics(FromDate: TDateTime; OutputType: SBMDataFormat): WideString; safecall;
    property ID: Integer read Get_ID;
    property Started: WordBool read Get_Started;
    property ResetDate: TDateTime read Get_ResetDate;
    property Title: WideString read Get_Title write Set_Title;
    property Comments: WideString read Get_Comments write Set_Comments;
    property IsPrivate: WordBool read Get_IsPrivate write Set_IsPrivate;
    property Priority: SBMCampaignPriority read Get_Priority write Set_Priority;
    property FileName: WideString read Get_FileName write Set_FileName;
    property RawBytes: PSafeArray read Get_RawBytes write Set_RawBytes;
    property StartDate: TDateTime read Get_StartDate;
    property EndDate: TDateTime read Get_EndDate;
    property ScheduleEnabled: WordBool read Get_ScheduleEnabled write Set_ScheduleEnabled;
    property Schedule[index: Integer]: ISBMCampaignDaySchedule read Get_Schedule;
    property MaxCount: Integer read Get_MaxCount write Set_MaxCount;
    property RandomRatio: Currency read Get_RandomRatio write Set_RandomRatio;
    property AutoReset: Integer read Get_AutoReset write Set_AutoReset;
    property AutoResetUnits: SBMAutoResetUnit read Get_AutoResetUnits write Set_AutoResetUnits;
    property TotalOK: Integer read Get_TotalOK;
    property TotalFailed: Integer read Get_TotalFailed;
    property TotalRejected: Integer read Get_TotalRejected;
    property StatusText: WideString read Get_StatusText;
  end;

// *********************************************************************//
// DispIntf:  ISBMCampaignDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0C5FD8AB-0D9F-4CCE-B777-F95ED620056D}
// *********************************************************************//
  ISBMCampaignDisp = dispinterface
    ['{0C5FD8AB-0D9F-4CCE-B777-F95ED620056D}']
    property ID: Integer readonly dispid 201;
    procedure Start; dispid 202;
    procedure Stop; dispid 203;
    property Started: WordBool readonly dispid 204;
    procedure Reset; dispid 205;
    property ResetDate: TDateTime readonly dispid 206;
    procedure DisplayEditDialog; dispid 207;
    property Title: WideString dispid 208;
    property Comments: WideString dispid 209;
    property IsPrivate: WordBool dispid 210;
    property Priority: SBMCampaignPriority dispid 211;
    property FileName: WideString dispid 212;
    property RawBytes: {??PSafeArray}OleVariant dispid 213;
    procedure AttachFile(const FileName: WideString; Store: WordBool); dispid 214;
    procedure AttachText(const Text: WideString; const Name: WideString); dispid 215;
    property StartDate: TDateTime readonly dispid 216;
    property EndDate: TDateTime readonly dispid 217;
    procedure SetDates(StartDate: TDateTime; EndDate: TDateTime); dispid 218;
    property ScheduleEnabled: WordBool dispid 219;
    property Schedule[index: Integer]: ISBMCampaignDaySchedule readonly dispid 220;
    procedure ResetSchedule; dispid 221;
    property MaxCount: Integer dispid 222;
    property RandomRatio: Currency dispid 223;
    property AutoReset: Integer dispid 224;
    property AutoResetUnits: SBMAutoResetUnit dispid 225;
    property TotalOK: Integer readonly dispid 226;
    property TotalFailed: Integer readonly dispid 227;
    property TotalRejected: Integer readonly dispid 228;
    property StatusText: WideString readonly dispid 229;
    function GetStatistics(FromDate: TDateTime; OutputType: SBMDataFormat): WideString; dispid 230;
  end;

// *********************************************************************//
// Interface: ISBMCampaignDaySchedule
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9B612D22-87A7-45BD-A3C2-A075D2D2B18C}
// *********************************************************************//
  ISBMCampaignDaySchedule = interface(IDispatch)
    ['{9B612D22-87A7-45BD-A3C2-A075D2D2B18C}']
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_StartMinute: Integer; safecall;
    function Get_EndMinute: Integer; safecall;
    procedure SetPeriod(StartMinute: Integer; EndMinute: Integer); safecall;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property StartMinute: Integer read Get_StartMinute;
    property EndMinute: Integer read Get_EndMinute;
  end;

// *********************************************************************//
// DispIntf:  ISBMCampaignDayScheduleDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9B612D22-87A7-45BD-A3C2-A075D2D2B18C}
// *********************************************************************//
  ISBMCampaignDayScheduleDisp = dispinterface
    ['{9B612D22-87A7-45BD-A3C2-A075D2D2B18C}']
    property Enabled: WordBool dispid 201;
    property StartMinute: Integer readonly dispid 202;
    property EndMinute: Integer readonly dispid 203;
    procedure SetPeriod(StartMinute: Integer; EndMinute: Integer); dispid 204;
  end;

// *********************************************************************//
// The Class CoSBMApplication provides a Create and CreateRemote method to
// create instances of the default interface ISBMApplication exposed by
// the CoClass SBMApplication. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoSBMApplication = class
    class function Create: ISBMApplication;
    class function CreateRemote(const MachineName: string): ISBMApplication;
  end;

implementation

uses ComObj;

class function CoSBMApplication.Create: ISBMApplication;
begin
  Result := CreateComObject(CLASS_SBMApplication) as ISBMApplication;
end;

class function CoSBMApplication.CreateRemote(const MachineName: string): ISBMApplication;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SBMApplication) as ISBMApplication;
end;

end.

