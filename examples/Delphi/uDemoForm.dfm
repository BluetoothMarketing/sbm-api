object DemoForm: TDemoForm
  Left = 120
  Top = 121
  BorderStyle = bsSingle
  Caption = 'Smart Bluetooth Marketing automation DEMO'
  ClientHeight = 443
  ClientWidth = 692
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 37
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 104
      Height = 13
      Caption = 'Automation password'
    end
    object PasswordEdit: TEdit
      Left = 118
      Top = 8
      Width = 109
      Height = 21
      TabOrder = 0
    end
    object ConnectButton: TButton
      Left = 243
      Top = 7
      Width = 75
      Height = 23
      Caption = 'Connect'
      TabOrder = 1
      OnClick = ConnectButtonClick
    end
    object QuitButton: TButton
      Left = 347
      Top = 7
      Width = 75
      Height = 23
      Caption = 'Quit'
      TabOrder = 2
      OnClick = QuitButtonClick
    end
    object DisconnectButton: TButton
      Left = 449
      Top = 7
      Width = 75
      Height = 23
      Caption = 'Disconnect'
      TabOrder = 3
      OnClick = DisconnectButtonClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 37
    Width = 692
    Height = 406
    Align = alClient
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 295
      Width = 429
      Height = 105
      Caption = 'Create new campaign with text message'
      TabOrder = 0
      object Name: TLabel
        Left = 12
        Top = 20
        Width = 27
        Height = 13
        Caption = 'Name'
      end
      object Text: TLabel
        Left = 175
        Top = 20
        Width = 22
        Height = 13
        Caption = 'Text'
      end
      object Edit1: TEdit
        Left = 50
        Top = 17
        Width = 109
        Height = 21
        TabOrder = 0
      end
      object Memo2: TMemo
        Left = 203
        Top = 17
        Width = 216
        Height = 78
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object CreateTextButton: TButton
        Left = 12
        Top = 72
        Width = 75
        Height = 23
        Caption = 'Create'
        TabOrder = 2
        OnClick = CreateTextButtonClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 460
      Top = 295
      Width = 225
      Height = 105
      Caption = 'Create new campaign with a file from disk'
      TabOrder = 1
      object OpenFileButton: TButton
        Left = 16
        Top = 72
        Width = 75
        Height = 23
        Caption = 'Browse...'
        TabOrder = 0
        OnClick = OpenFileButtonClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 7
      Top = 7
      Width = 678
      Height = 51
      Caption = 'Status'
      TabOrder = 2
      object Label2: TLabel
        Left = 20
        Top = 21
        Width = 31
        Height = 13
        Caption = 'Label2'
      end
      object Label3: TLabel
        Left = 194
        Top = 21
        Width = 31
        Height = 13
        Caption = 'Label3'
      end
      object Label4: TLabel
        Left = 358
        Top = 21
        Width = 31
        Height = 13
        Caption = 'Label4'
      end
      object RefreshButton: TButton
        Left = 490
        Top = 17
        Width = 75
        Height = 23
        Caption = 'Refresh'
        TabOrder = 0
        OnClick = RefreshButtonClick
      end
      object StartStopButton: TButton
        Left = 592
        Top = 17
        Width = 75
        Height = 23
        Caption = 'StartStopButton'
        TabOrder = 1
        OnClick = StartStopButtonClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 68
      Width = 677
      Height = 45
      Caption = 'Options'
      TabOrder = 3
      object OptionsButton: TButton
        Left = 62
        Top = 13
        Width = 117
        Height = 23
        Caption = 'Display options dialog'
        TabOrder = 0
        OnClick = OptionsButtonClick
      end
      object DefaultOptionsButton: TButton
        Left = 226
        Top = 13
        Width = 109
        Height = 23
        Caption = 'Set default options'
        TabOrder = 1
        OnClick = DefaultOptionsButtonClick
      end
    end
    object GroupBox5: TGroupBox
      Left = 8
      Top = 124
      Width = 677
      Height = 160
      Caption = 'Marketing campaigns'
      TabOrder = 4
      object ListView1: TListView
        Left = 8
        Top = 18
        Width = 660
        Height = 107
        Columns = <
          item
            Caption = 'ID'
            Width = 35
          end
          item
            Caption = 'Title'
            Width = 150
          end
          item
            Caption = 'FileName'
            Width = 150
          end
          item
            Caption = 'Totals'
          end
          item
            Caption = 'Status'
            Width = 150
          end>
        PopupMenu = PopupMenu1
        TabOrder = 0
        ViewStyle = vsReport
      end
      object FillCampaignsButton: TButton
        Left = 593
        Top = 131
        Width = 75
        Height = 23
        Caption = 'Refresh list'
        TabOrder = 1
        OnClick = FillCampaignsButtonClick
      end
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 584
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 388
    Top = 229
    object Start1: TMenuItem
      Tag = 1
      Caption = 'Start'
      OnClick = PopupItemClick
    end
    object Stop1: TMenuItem
      Tag = 2
      Caption = 'Stop'
      OnClick = PopupItemClick
    end
    object Reset1: TMenuItem
      Tag = 3
      Caption = 'Reset'
      OnClick = PopupItemClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Delete1: TMenuItem
      Tag = 4
      Caption = 'Delete'
      OnClick = PopupItemClick
    end
    object Edit2: TMenuItem
      Tag = 5
      Caption = 'Edit'
      OnClick = PopupItemClick
    end
  end
end
