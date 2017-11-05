unit uDemoForm;

{
This file is a part of Smart Bluetooth Marketing SDK.
© 2010 SmartBluetoothMarketing.com
support@smartbluetoothmarketing.com   http://smartbluetoothmarketing.com/

See readme.txt included in the archive for more details.

DISCLAIMER
This package is provided "as is" and without any warranty. Any express or implied warranties,including, but not limited to, the implied warranties of merchantability and fitness fora particular purpose are disclaimed. In no event shall the authors be liable to any partyfor any direct, indirect, incidental, special, exemplary, or consequential damages arisingin any way out of the use or misuse of this package.
}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, SmartBluetoothMarketing_TLB, StdCtrls, Activex, ExtCtrls, AppEvnts,
  ComCtrls, Menus;

type
  TDemoForm = class(TForm)
    Panel1: TPanel;
    PasswordEdit: TEdit;
    ConnectButton: TButton;
    QuitButton: TButton;
    DisconnectButton: TButton;
    Label1: TLabel;
    ApplicationEvents1: TApplicationEvents;
    Panel2: TPanel;
    PopupMenu1: TPopupMenu;
    Start1: TMenuItem;
    Stop1: TMenuItem;
    Reset1: TMenuItem;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Memo2: TMemo;
    CreateTextButton: TButton;
    GroupBox2: TGroupBox;
    OpenFileButton: TButton;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RefreshButton: TButton;
    StartStopButton: TButton;
    GroupBox4: TGroupBox;
    OptionsButton: TButton;
    DefaultOptionsButton: TButton;
    GroupBox5: TGroupBox;
    ListView1: TListView;
    FillCampaignsButton: TButton;
    Name: TLabel;
    Text: TLabel;
    Delete1: TMenuItem;
    Edit2: TMenuItem;
    N1: TMenuItem;
    procedure CreateTextButtonClick(Sender: TObject);
    procedure ConnectButtonClick(Sender: TObject);
    procedure QuitButtonClick(Sender: TObject);
    procedure DisconnectButtonClick(Sender: TObject);
    procedure OptionsButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure StartStopButtonClick(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure DefaultOptionsButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OpenFileButtonClick(Sender: TObject);
    procedure FillCampaignsButtonClick(Sender: TObject);
    procedure PopupItemClick(Sender: TObject);
  private
    FSBM : ISBMApplication;
    procedure RefreshInfo;
    procedure RefreshControls;

    procedure FillCampaignsListView;
  public

  end;

var
  DemoForm: TDemoForm;

implementation

{$R *.dfm}

procedure TDemoForm.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
  if E.Message = 'The RPC server is unavailable' then
    DisconnectButton.Click;

  Application.ShowException(E);
end;

procedure TDemoForm.FormCreate(Sender: TObject);
begin
  FSBM := nil;
  RefreshControls;
end;

procedure TDemoForm.CreateTextButtonClick(Sender: TObject);
var
aCampaign : ISBMCampaign;
begin
  aCampaign := FSBM.CreateNewCampaign;
  aCampaign.AttachText(Memo2.Text, Edit1.Text);
  aCampaign.Title := Edit1.Text;
  aCampaign.Comments := 'DEMO campaign'#13#10'Created using AttachText method';
  if MessageDlg('Do you want to start the created campaign?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    aCampaign.Start;

  FillCampaignsListView;
  MessageDlg('Campaign created successfully.', mtInformation, [mbOK], 0);
end;

procedure TDemoForm.StartStopButtonClick(Sender: TObject);
begin
  if FSBM.SenderState = SBMStopped then
    FSBM.StartSender
  else
    FSBM.StopSender;

  RefreshInfo;
end;

procedure TDemoForm.DefaultOptionsButtonClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to use default options?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    FSBM.Options.UseDefaults;
end;

procedure TDemoForm.RefreshButtonClick(Sender: TObject);
begin
  RefreshInfo;
end;

procedure TDemoForm.FillCampaignsButtonClick(Sender: TObject);
begin
  FillCampaignsListView;
end;

procedure TDemoForm.ConnectButtonClick(Sender: TObject);
begin
  FSBM := nil;

  FSBM := CoSBMApplication.Create;
  FSBM.Connect(PasswordEdit.Text);

  RefreshControls;
  RefreshInfo;
  FillCampaignsListView;
end;

procedure TDemoForm.QuitButtonClick(Sender: TObject);
begin
  FSBM.Quit;
  FSBM := nil;
  RefreshControls;
end;

procedure TDemoForm.RefreshControls;
var
  aConnected : boolean;
begin
  aConnected := FSBM <> nil;

  ConnectButton.Enabled := not aConnected;
  QuitButton.Enabled := aConnected;
  DisconnectButton.Enabled := aConnected;
  Panel2.Visible := aConnected;
end;

procedure TDemoForm.RefreshInfo;
begin
  if FSBM.IsBluetoothOK then
    Label2.Caption := 'Bluetooth hardware OK'
  else
    Label2.Caption := 'Bluetooth hardware Error';

  Label3.Caption := Format('Total: %d campaigns', [FSBM.CampaignCount]);

  case FSBM.SenderState of
    SBMStopped :
      begin
        Label4.Caption := 'Sender stopped';
        StartStopButton.Caption := 'Start sender';
        StartStopButton.Enabled := true;
      end;
    SBMStopping :
      begin
        Label4.Caption := 'Sender stopping';
        StartStopButton.Enabled := false;
      end;
    SBMStarting :
      begin
        Label4.Caption := 'Sender starting';
        StartStopButton.Enabled := false;
      end;
    SBMStarted :
      begin
        Label4.Caption := 'Sender started';
        StartStopButton.Caption := 'Stop sender';
        StartStopButton.Enabled := true;
      end;
  else
    Label4.Caption := 'Sender state unknown';
  end;
end;

procedure TDemoForm.DisconnectButtonClick(Sender: TObject);
begin
  FSBM := nil;
  RefreshControls;
end;

procedure TDemoForm.PopupItemClick(Sender: TObject);
var
  aCampaign : ISBMCampaign;
  aID : integer;
begin
  if ListView1.Selected = nil then
    exit;

  aID := Integer(ListView1.Selected.Data);
  aCampaign := FSBM.CampaignByID(aID);

  case TComponent(Sender).Tag of
    1 : aCampaign.Start;
    2 : aCampaign.Stop;
    3 :
      if MessageDlg('Are you sure you want to reset the campaign?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        aCampaign.Reset;
    4 :
      if MessageDlg('Are you sure you want to delete the campaign?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        FSBM.DeleteCampaignByID(aID);
    5 : aCampaign.DisplayEditDialog;
  end;
  FillCampaignsListView;
end;

procedure TDemoForm.FillCampaignsListView;
var
  i, count : integer;
  campaign : ISBMCampaign;
  aItem : TListItem;
begin
  Screen.Cursor := crHourGlass;
  try
    ListView1.Items.Clear;
    count := FSBM.CampaignCount;
    for i := 1 to count do
    begin
      campaign := FSBM.Campaigns[i];

      aItem := ListView1.Items.Add;
      aItem.Data := Pointer(campaign.ID);
      aItem.Caption := IntToStr(campaign.ID);
      aItem.SubItems.Add(campaign.Title);
      aItem.SubItems.Add(campaign.FileName);
      aItem.SubItems.Add(Format('%d %d %d', [campaign.TotalOK, campaign.TotalFailed, campaign.TotalRejected]));
      aItem.SubItems.Add(campaign.StatusText);
    end;
  finally
    Screen.Cursor := crDefault;
  end;

end;


procedure TDemoForm.OptionsButtonClick(Sender: TObject);
begin
  FSBM.DisplayOptionsDialog;
end;

procedure TDemoForm.OpenFileButtonClick(Sender: TObject);
var
  aCampaign : ISBMCampaign;
begin
  with TOpenDialog.Create(nil) do
  try
    if Execute then
    begin
      aCampaign := FSBM.CreateNewCampaign;
      aCampaign.AttachFile(FileName, true);
      aCampaign.Title := ExtractFileName(FileName);
      aCampaign.Comments := 'DEMO campaign'#13#10'Created using AttachFile method';

      if MessageDlg('Do you want to start the created campaign?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        aCampaign.Start;

      FillCampaignsListView;
      MessageDlg('Campaign created successfully.', mtInformation, [mbOK], 0);
    end;

  finally
    Free;
  end;
end;

end.
