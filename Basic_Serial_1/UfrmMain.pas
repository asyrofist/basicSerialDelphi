{ Project     :   Basic Serial Communication
  Component   :   CPort Library , Freeware
                  http://sourceforge.net/projects/comport/

  Programmer  :   Mr.Ukrit Tantasutanon
  Website     :   www.micro-research.co.th
}
unit UfrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CPort, Menus, ExtCtrls, ComCtrls;

type
  TfrmMain = class(TForm)
    ComPort1: TComPort;
    edtSendText: TEdit;
    MainMenu1: TMainMenu;
    Fil1: TMenuItem;
    Exit1: TMenuItem;
    About1: TMenuItem;
    AboutMRT1: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    edtPortNo: TEdit;
    btnOpenClose: TButton;
    btnExit: TButton;
    btnSend: TButton;
    StatusBar1: TStatusBar;
    memoRxData: TMemo;
    Label2: TLabel;
    btnClear: TButton;
    procedure btnOpenCloseClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure AboutMRT1Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
    procedure edtSendTextKeyPress(Sender: TObject; var Key: Char);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.AboutMRT1Click(Sender: TObject);
begin
  ShowMessage('More information for microcontroller product at www.micro-research.co.th');
end;

procedure TfrmMain.btnClearClick(Sender: TObject);
begin
  memoRxData.Clear;
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.btnOpenCloseClick(Sender: TObject);
begin
  try
    if ComPort1.Connected=false then
    begin
      edtPortNo.Enabled:=False;
      ComPort1.Port:='COM'+edtPortNo.Text;
      ComPort1.Connected:=True;
      btnOpenClose.Caption:='CLOSE';
      edtSendText.Enabled:=True;
      btnSend.Enabled:=True;
      StatusBar1.Panels[0].Text:='Connected : 9600 bps,N,8,1';
    end
    else
    begin
      edtPortNo.Enabled:=True;
      ComPort1.Connected:=False;
      btnOpenClose.Caption:='OPEN';
      edtSendText.Enabled:=False;
      btnSend.Enabled:=False;
      StatusBar1.Panels[0].Text:='Disconnected';
    end;
  except
      edtPortNo.Enabled:=True;
      ComPort1.Connected:=False;
      btnOpenClose.Caption:='OPEN';
      StatusBar1.Panels[0].Text:='Can not open specific COM port!!!';
  end;


end;

procedure TfrmMain.btnSendClick(Sender: TObject);
begin
  if ComPort1.Connected then
  begin
    ComPort1.WriteStr(edtSendText.Text+#13);
  end;
end;

procedure TfrmMain.ComPort1RxChar(Sender: TObject; Count: Integer);
var
  RxData : string;
begin
  ComPort1.ReadStr(RxData,Count);
  if RxData[Count]=#13 then
    begin
      memoRxData.Text:=memoRxData.Text+RxData+#13+#10;
    end
  else
    begin
      memoRxData.Text:=memoRxData.Text+RxData;
    end;
end;

procedure TfrmMain.edtSendTextKeyPress(Sender: TObject; var Key: Char);
begin

 if Key=#13 then
  begin
    //ShowMessage('OK');
    btnSendClick(Self);
  end;

end;

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
