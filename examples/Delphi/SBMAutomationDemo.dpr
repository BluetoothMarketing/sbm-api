{
This file is a part of Smart Bluetooth Marketing SDK.
� 2010 SmartBluetoothMarketing.com
support@smartbluetoothmarketing.com   http://smartbluetoothmarketing.com/

See readme.txt included in the archive for more details.

DISCLAIMER
This package is provided "as is" and without any warranty. Any express or implied warranties,
}

program SBMAutomationDemo;

uses
  Forms,
  uDemoForm in 'uDemoForm.pas' {DemoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDemoForm, DemoForm);
  Application.Run;
end.