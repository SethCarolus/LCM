program LCM_p;

uses
  Vcl.Forms,
  frmMain_u in 'frmMain_u.pas' {frmMain},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows11 MineShaft');
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
