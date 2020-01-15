object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = '[MRT] Basic Serial Communication'
  ClientHeight = 332
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 66
    Width = 69
    Height = 13
    Caption = 'Received data'
  end
  object edtSendText: TEdit
    Left = 8
    Top = 39
    Width = 241
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'MRT:Micro Research'
    OnKeyPress = edtSendTextKeyPress
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 370
    Height = 33
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 376
    object Label1: TLabel
      Left = 16
      Top = 9
      Width = 53
      Height = 13
      Caption = 'COM PORT'
    end
    object edtPortNo: TEdit
      Left = 75
      Top = 6
      Width = 54
      Height = 21
      TabOrder = 0
      Text = '1'
    end
    object btnOpenClose: TButton
      Left = 151
      Top = 4
      Width = 98
      Height = 25
      Caption = 'OPEN'
      TabOrder = 1
      OnClick = btnOpenCloseClick
    end
    object btnExit: TButton
      Left = 263
      Top = 4
      Width = 99
      Height = 25
      Caption = 'EXIT'
      TabOrder = 2
      OnClick = btnExitClick
    end
  end
  object btnSend: TButton
    Left = 263
    Top = 37
    Width = 99
    Height = 25
    Caption = 'SEND'
    Enabled = False
    TabOrder = 2
    OnClick = btnSendClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 313
    Width = 370
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    ExplicitLeft = 200
    ExplicitTop = 152
    ExplicitWidth = 0
  end
  object memoRxData: TMemo
    Left = 8
    Top = 85
    Width = 354
    Height = 196
    TabOrder = 4
  end
  object btnClear: TButton
    Left = 8
    Top = 285
    Width = 354
    Height = 25
    Caption = 'CLEAR'
    TabOrder = 5
    OnClick = btnClearClick
  end
  object ComPort1: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = True
    OnRxChar = ComPort1RxChar
    Left = 216
    Top = 40
  end
  object MainMenu1: TMainMenu
    Left = 160
    Top = 40
    object Fil1: TMenuItem
      Caption = 'File'
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object About1: TMenuItem
      Caption = 'About'
      object AboutMRT1: TMenuItem
        Caption = 'About MRT'
        OnClick = AboutMRT1Click
      end
    end
  end
end
