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
  clsUserHandler_u in 'clsUserHandler_u.pas',
  clsVehicle_u in 'clsVehicle_u.pas',
  iVehicle_u in 'iVehicle_u.pas',
  iUser_u in 'iUser_u.pas',
  iDriver_u in 'iDriver_u.pas',
  clsDriver_u in 'clsDriver_u.pas',
  iUserType_u in 'iUserType_u.pas',
  clsUserType_u in 'clsUserType_u.pas',
  iImage_u in 'iImage_u.pas',
  clsImage_u in 'clsImage_u.pas',
  frmViewVehicles_u in 'frmViewVehicles_u.pas' {frmViewVehicles},
  iVehicleHandler_u in 'iVehicleHandler_u.pas',
  clsVehicleHandler_u in 'clsVehicleHandler_u.pas',
  clsFactory_u in 'clsFactory_u.pas',
  iImageHandler_u in 'iImageHandler_u.pas',
  clsImageHandler_u in 'clsImageHandler_u.pas',
  login_u in 'login_u.pas',
  iUserTypeHandler_u in 'iUserTypeHandler_u.pas',
  clsUserTypeHandler_u in 'clsUserTypeHandler_u.pas',
  clsApplicationState_u in 'clsApplicationState_u.pas',
  frmMessages_u in 'frmMessages_u.pas' {frmMessages},
  clsMessage_u in 'clsMessage_u.pas',
  iMessage_u in 'iMessage_u.pas',
  clsMessageHandler_u in 'clsMessageHandler_u.pas',
  iMessageHandler_u in 'iMessageHandler_u.pas',
  clsChat_u in 'clsChat_u.pas',
  iChat_u in 'iChat_u.pas',
  IChatHandler_u in 'IChatHandler_u.pas',
  clsChatHandler_u in 'clsChatHandler_u.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmDriverMenu, frmDriverMenu);
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmViewVehicles, frmViewVehicles);
  Application.CreateForm(TfrmMessages, frmMessages);
  TStyleManager.TrySetStyle('Windows11 MineShaft');
  Application.Run;
end.
