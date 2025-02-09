program LCM_p;

uses
  Vcl.Forms,
  frmMain_u in 'frmMain_u.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
