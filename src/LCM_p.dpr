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
  clsChatHandler_u in 'clsChatHandler_u.pas',
  frmRequest_u in 'frmRequest_u.pas' {frmRequest},
  frmViewRequests_u in 'frmViewRequests_u.pas' {frmViewRequests},
  frmStudentMenu_u in 'frmStudentMenu_u.pas' {frmStudentMenu},
  frmParentMenu_u in 'frmParentMenu_u.pas' {frmParentMenu},
  iTrip_u in 'iTrip_u.pas',
  clsTrip_u in 'clsTrip_u.pas',
  iTripHandler_u in 'iTripHandler_u.pas',
  clsTripHandler_u in 'clsTripHandler_u.pas',
  iDriverHandler_u in 'iDriverHandler_u.pas',
  clsDriverHandler_u in 'clsDriverHandler_u.pas',
  frmViewTrips_u in 'frmViewTrips_u.pas' {frmViewTrips},
  frmManageTrips_u in 'frmManageTrips_u.pas' {frmManageTrips},
  frmAddTrip_u in 'frmAddTrip_u.pas' {frmAddTrip},
  frmEditTrip_u in 'frmEditTrip_u.pas' {frmEditTrip},
  clsStudent_u in 'clsStudent_u.pas',
  iStudent_u in 'iStudent_u.pas',
  clsStudentHandler_u in 'clsStudentHandler_u.pas',
  iStudentHandler_u in 'iStudentHandler_u.pas',
  frmViewStudentsEnquiringAboutTrip_u in 'frmViewStudentsEnquiringAboutTrip_u.pas' {frmViewStudentsEnquiringAboutTrip},
  frmMyTrips_u in 'frmMyTrips_u.pas' {frmMyTrips},
  frmPastTrips_u in 'frmPastTrips_u.pas' {frmPastTrips},
  frmViewTripComments_u in 'frmViewTripComments_u.pas' {frmViewTripComments},
  iCommentHandler_u in 'iCommentHandler_u.pas',
  clsCommentHandler_u in 'clsCommentHandler_u.pas',
  iComment_u in 'iComment_u.pas',
  clsComment_u in 'clsComment_u.pas',
  clsBank_u in 'clsBank_u.pas',
  clsBankCard_u in 'clsBankCard_u.pas',
  clsBankCardHandler_u in 'clsBankCardHandler_u.pas',
  clsBankHandler_u in 'clsBankHandler_u.pas',
  iBank_u in 'iBank_u.pas',
  iBankCard_u in 'iBankCard_u.pas',
  iBankCardHandler_u in 'iBankCardHandler_u.pas',
  iBankHandler_u in 'iBankHandler_u.pas',
  iParent_u in 'iParent_u.pas',
  iParentHandler_u in 'iParentHandler_u.pas',
  clsParent_u in 'clsParent_u.pas',
  clsParentHandler_u in 'clsParentHandler_u.pas',
  clsPaymentHandler_u in 'clsPaymentHandler_u.pas',
  iPaymentHandler_u in 'iPaymentHandler_u.pas',
  frmManageTripPayment_u in 'frmManageTripPayment_u.pas' {frmManagePayment},
  clsUserHabitHandler_u in 'clsUserHabitHandler_u.pas',
  IUserHabitHandler_u in 'IUserHabitHandler_u.pas',
  clsTimer_u in 'clsTimer_u.pas',
  ITimer_u in 'ITimer_u.pas',
  logout_u in 'logout_u.pas',
  frmViewHabits_u in 'frmViewHabits_u.pas' {frmViewHabits};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmDriverMenu, frmDriverMenu);
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmViewVehicles, frmViewVehicles);
  Application.CreateForm(TfrmMessages, frmMessages);
  Application.CreateForm(TfrmRequest, frmRequest);
  Application.CreateForm(TfrmViewRequests, frmViewRequests);
  Application.CreateForm(TfrmStudentMenu, frmStudentMenu);
  Application.CreateForm(TfrmParentMenu, frmParentMenu);
  Application.CreateForm(TfrmViewTrips, frmViewTrips);
  Application.CreateForm(TfrmManageTrips, frmManageTrips);
  Application.CreateForm(TfrmAddTrip, frmAddTrip);
  Application.CreateForm(TfrmEditTrip, frmEditTrip);
  Application.CreateForm(TfrmViewStudentsEnquiringAboutTrip, frmViewStudentsEnquiringAboutTrip);
  Application.CreateForm(TfrmMyTrips, frmMyTrips);
  Application.CreateForm(TfrmPastTrips, frmPastTrips);
  Application.CreateForm(TfrmViewTripComments, frmViewTripComments);
  Application.CreateForm(TfrmManagePayment, frmManagePayment);
  Application.CreateForm(TfrmViewHabits, frmViewHabits);
  TStyleManager.TrySetStyle('Windows11 MineShaft');
  Application.Run;
end.
