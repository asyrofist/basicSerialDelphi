program Basic_Serial_1;

uses
  Forms,
  UfrmMain in 'UfrmMain.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Basic Serial Communication';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
