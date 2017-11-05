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


System.Gadget.onSettingsClosing = SettingsClosing;

function SettingsClosing(event)
{
    if(event.closeAction == event.Action.commit) {
      System.Gadget.Settings.writeString("SBMPassword", document.getElementById('SBMPasswordEdit').value);
    }
    event.cancel = false;
}

function LoadSettings() {
  document.getElementById('SBMPasswordEdit').value = System.Gadget.Settings.readString("SBMPassword");
}

