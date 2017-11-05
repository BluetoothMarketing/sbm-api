/*
This file is a part of Smart Bluetooth Marketing SDK.
© 2010 SmartBluetoothMarketing.com
support@smartbluetoothmarketing.com   http://smartbluetoothmarketing.com/

See readme.txt included in the archive for more details.

DISCLAIMER
This package is provided "as is" and without any warranty. Any express or implied warranties,
including, but not limited to, the implied warranties of merchantability and fitness for
a particular purpose are disclaimed. In no event shall the authors be liable to any party
for any direct, indirect, incidental, special, exemplary, or consequential damages arising
in any way out of the use or misuse of this package.
*/

var SBMPassword = "";
var SBMApplication = null;

System.Gadget.onSettingsClosed = SettingsClosed;

function SettingsClosed(event) {
	Init();
	Refresh();
}

function Init() {
	SBMApplication = null;
	SBMPassword = System.Gadget.Settings.readString("SBMPassword");
  
	if (SBMPassword == "") {
		ShowError("Set automation password in the gadget settings dialog.");
		return;
	}

	try {  
		SBMApplication = new ActiveXObject("SmartBluetoothMarketing.SBMApplication");
		SBMApplication.Connect(SBMPassword);
		return true;  
	} catch(e) { 
		SBMApplication = null;  
		ShowError(e.message); 
		return false;
	}
}

function StartSender() {
	SBMApplication.StartSender();
	Refresh();
}

function StopSender() {
	SBMApplication.StopSender();
	Refresh();	
}

function CreateCampaign() {
	SBMApplication.Restore();
	SBMApplication.CreateNewCampaign().DisplayEditDialog();
}

function ShowOptions() {
	SBMApplication.Restore();
	SBMApplication.DisplayOptionsDialog();
}


function Refresh() {
	if (SBMApplication == null) {
		if (!Init()) {
			return;
		}
	}

	CancelError();    

	try {  
		data = "";
  
		if (!SBMApplication.IsBluetoothOK) {
			data = "Bluetooth hardware Error<br />";	
		} else
			data = "Bluetooth hardware OK<br />";	
    	
		data += "Total: " + SBMApplication.CampaignCount + " campaigns<br />";

		switch (SBMApplication.SenderState) {
			case 0 : 
				data += 'Sender stopped [<a href="javascript:StartSender();">Start</a>]<br />';
				break;
			case 1 :    
				data += 'Sender stopping<br />';    
				break;
			case 2 :    
				data += 'Sender starting<br />';
				break;
			case 3 :    
				data += 'Sender started [<a href="javascript:StopSender();">Stop</a>]<br />';    
				break;
			default :
				data += 'Sender state unknown<br />';
		}

		data += '[<a href="javascript:CreateCampaign();">Create new campaign</a>]&nbsp;&nbsp;';
		data += '[<a href="javascript:ShowOptions();">Options</a>]&nbsp;&nbsp;';

		document.getElementById("content").innerHTML = data;   
  
	} catch(e) { 
		SBMApplication = null;  
		ShowError(e.message); 
	}
}


function Setup() {
	Init();
	System.Gadget.settingsUI = "Settings.html";
	setInterval("Refresh();", 7000);	
}



function ShowError(msg) {
	document.getElementById("content").style.visibility = "hidden";
	document.getElementById("error").innerText = msg ;
	document.getElementById("error").style.visibility = "visible";
}

function CancelError() {
	document.getElementById("content").style.visibility = "visible";
	document.getElementById("error").style.visibility = "hidden";
}


