program LCM_p;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  frmLogin_u in 'frmLogin_u.pas' {frmMain},
  frmDriverMenu_u in 'frmDriverMenu_u.pas' {frmDriverMenu},
  dmMain_u in 'dmMain_u.pas' {dmMain: TDataModule},
  clsUser_u in 'clsUser_u.pas',
  iUserHandler_u in 'iUserHandler_u.pas',
  clsUserHandler_u in 'clsUserHandler_u.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmDriverMenu, frmDriverMenu);
  Application.CreateForm(TdmMain, dmMain);
  TStyleManager.TrySetStyle('Windows11 MineShaft');
  Application.Run;
end.
