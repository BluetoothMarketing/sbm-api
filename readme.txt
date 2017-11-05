
This file is a part of Smart Bluetooth Marketing SDK. © 2010 SmartBluetoothMarketing.com
Last updated on Jan 23, 2010

DISCLAIMER
This package is provided "as is" and without any warranty. Any express or implied warranties, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose are disclaimed. In no event shall the authors be liable to any party for any direct, indirect, incidental, special, exemplary, or consequential damages arising in any way out of the use or misuse of this package.


Smart Bluetooth Marketing OLE Automation API allows to perform the following tasks programmatically:

    * Manipulating (create, delete, modify) marketing campaigns
    * Getting totals and detailed statistics
    * Adjusting program settings

Automation API is accessible from most of modern programming languages and tools including Delphi, C/C++, Visual Basic, .NET (VB.NET, C#, J#), JavaScript and many others.

Automation API is available in Smart Bluetooth Marketing since version 1.5.


Contents of the SDK

\readme.txt - this document
\SmartBluetoothMarketing.tlb - type library containing definitions for for all objects and enumerations
\SmartBluetoothMarketing.ridl - Interface Definition File.
\examples
	\Delphi - DEMO Application written in Delphi (It is created in Delphi 2009, but should compile on earlier versions as well. You may need to ignore warnings about missing properties and reimport type library).
	\Gadget - Windows sidebar gadget sample (JavaScript code)
	\VBA - simple sample on how to use the Automation API from MS Word document



Getting started

By default automation access is disabled. To enable it open options dialog (From the main menu select Tools -> Options). On the "General" tab check "Enable automation" checkbox and enter a password. To prevent unauthorized access you should use this password when calling SBMApplication.Connect method. 



API reference

SBMApplication object
SBMApplication is a core object of the Automation API. You should create an instance of it before doing anything else. 

Property Version, read-only
  Parameters: None
  Return type: string
  Description: Returns version of the program in X.X.X.X format

Method Connect
  Parameters: Password (string)
  Return type: void
  Description: This method should be called right after creation of SBMApplication object, providing valid password. Otherwise calling other methods will fail with "Not connected" exception.

Property IsBluetoothOK, read-only
  Parameters: None
  Return type: boolean
  Description: Returns true is bluetooth adapter is installed and accessible, false otherwise

Method Minimize
  Parameters: None
  Return type: void
  Description: Minimizes the application window

method Restore
  Parameters: None
  Return type: void
  Description: Restores the application window

method Quit
  Parameters: None
  Return type: void
  Description: Quits the application

property Options, read-only
  Parameters: None
  Return type: SBMOptions
  Description: returns SBMOptions object used to adjust program settings

method DisplayOptionsDialog
  Parameters: None
  Return type: void
  Description: Displays options dialog

property SenderState, read-only
  Parameters: None
  Return type: SBMState
  Description: returns the current state of the sender

property ReceiverState, read-only
  Parameters: None
  Return type: SBMState
  Description: returns the current state of the sender

Method StartSender
  Parameters: None
  Return type: void
  Description: Starts the sender

Method StopSender
  Parameters: None
  Return type: void
  Description: Stops the sender

Method StartReceiver
  Parameters: None
  Return type: void
  Description: Starts the receiver

Method StopReceiver
  Parameters: None
  Return type: void
  Description: Stops the receiver

Method RenameLocalRadio
  Parameters: New name (string)
  Return type: void
  Description: Renames local bluetooth radio. This function will fail if Smart Bluetooth Marketing is run under ordinary user account

Property CampaignCount, read-only
  Parameters: None
  Return type: integer
  Description: Returns total number of marketing campaigns

Property Campaigns, read-only
  Parameters: index (integer)
  Return type: SBMCampaign
  Description: Returns SBMCampaign object (index is 1 based)

Property CampaignByID, read-only
  Parameters: ID (integer)
  Return type: SBMCampaign
  Description: Returns SBMCampaign object with the specified ID. Exception is raised if no such id exists.

Method CreateNewCampaign
  Parameters: None
  Return type: SBMCampaign
  Description: Creates and returns a new empty marketing campaign

Method DeleteCampaign
  Parameters: index (integer)
  Return type: void
  Description: Deletes a marketing campaign (index is 1 based)

Method DeleteCampaignByID
  Parameters: ID (integer)
  Return type: void
  Description: Deletes a marketing campaign with the given ID.

Method DuplicateCampaign
  Parameters: index (integer)
  Return type: SBMCampaign
  Description: Creates and returns a copy of the specified marketing campaign

Method DuplicateCampaignByID
  Parameters: index (integer)
  Return type: SBMCampaign
  Description: Creates and returns a copy of the specified marketing campaign



SBMOptions object

SBMOptions represents options of the program. To obtain it use SBMApplication.Options().
The object is simple stateless wrapper, so all changes to it's properties are instantly applied.
To reset options to the default state call SBMOptions.UseDefault().
The properties of SBMOptions mostly correspond to the controls of Options dialog. See program manual for the descriptions.



SBMCampaign object
This object represents a marketing campaign. It can be obtained by calling SBMApplication.Campaigns() or SBMApplication.CampaignByID() methods.  
The object is simple stateless wrapper, so all changes to it's properties are instantly applied. If you need to modify several properties in a batch, stop the campaign first, then make all the changes and finally start the campaign again.

Property ID, read-only
  Parameters: None
  Return type: integer
  Description: Unique ID of the campaign. Assigned automatically when a new campaign is created
  
Method Start
  Parameters: None
  Return type: void
  Description: Starts the campaign

Method Stop
  Parameters: None
  Return type: void
  Description: Stops the campaign

Property Started, read-only
  Parameters: None
  Return type: boolean
  Description: Returns true if the campaign is started

Method Reset
  Parameters: None
  Return type: void
  Description: Resets the campaign

Property ResetDate, read-only
  Parameters: None
  Return type: DateTime
  Description: Returns date/time the campaign was reset

Method DisplayEditDialog
  Parameters: None
  Return type: void
  Description: Displays edit dialog

Property Title
  Parameters: None
  Return type: string
  Description: The title of the campaign

Property Comments
  Parameters: None
  Return type: string
  Description: The description of the campaign

Property IsPrivate
  Parameters: None
  Return type: boolean
  Description: Private status of the campaign

Property Priority
  Parameters: None
  Return type: SBMCampaignPriority
  Description: The priority of the campaign

Property FileName
  Parameters: None
  Return type: string
  Description: The filename of the campaign

Property RawBytes
  Parameters: None
  Return type: SAFEARRAY
  Description: Raw content of the file attached to the campaign

Method AttachFile
  Parameters: FileName (string), Store (boolean)
  Return type: void
  Description: Loads file from the disk and attach it to the campaign

Method AttachText
  Parameters: Text (string), Name (string)
  Return type: void
  Description: Creates a file with the passed Text and Name and attach it to the campaign

Property StartDate, read-only
  Parameters: None
  Return type: DateTime
  Description: Start date of the campaign. To set both Start date and End date use SetDates() method.

Property EndDate, read-only
  Parameters: None
  Return type: DateTime
  Description: End date of the campaign. To set both Start date and End date use SetDates() method.

Method SetDates
  Parameters: Startdate (date), EndDate (date)
  Return type: void
  Description: Sets both Start date and End date. To clear a date, pass 0 as a parameter.

Property ScheduleEnabled
  Parameters: None
  Return type: boolean
  Description: Schedule state of the campaign

Property Schedule
  Parameters: Index (integer)
  Return type: SBMCampaignSchedule
  Description: Returns a schedule for the given day of the week (0 - Sunday, 1 - Monday, etc)
  
Property MaxCount
  Parameters: None
  Return type: integer
  Description: Maximum count of files to be sent (0 - unlimited)

Property RandomRatio
  Parameters: None
  Return type: float
  Description: Random ratio (valid range is 0..100.00, 0 - random sending disabled)

Property AutoReset
  Parameters: None
  Return type: integer
  Description: Auto reset state of the campaign (0 - auto reset disabled)

Property AutoResetUnits
  Parameters: None
  Return type: SBMAutoResetUnit
  Description: Measure units for the AutoReset property

Property TotalOK, read-only
  Parameters: None
  Return type: integer
  Description: Total count of successfully sent files since last reset

Property TotalFailed, read-only
  Parameters: None
  Return type: integer
  Description: Total count of failed sending attempts since last reset

Property TotalRejected, read-only
  Parameters: None
  Return type: integer
  Description: Total count of rejected sending attempts since last reset

Property StatusText, read-only
  Parameters: None
  Return type: string
  Description: Status of the campaign

Method GetStatistics
  Parameters: FromDate (Date/time), OutputType (SBMDataFormat)
  Return type: string
  Description: returns full statistics of the campaign in XML format





