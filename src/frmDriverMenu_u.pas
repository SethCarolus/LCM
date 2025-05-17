unit frmDriverMenu_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons;

type
  TfrmDriverMenu = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    GridPanel3: TGridPanel;
    btnMessages: TButton;
    btnFutreTrips: TButton;
    btnViewVehicles: TButton;
    btnPastTrips: TButton;
    btnHabits: TButton;
    Button6: TButton;
    Panel1: TPanel;
    GridPanel4: TGridPanel;
    btnBack: TBitBtn;
    procedure btnMessagesClick(Sender: TObject);
    procedure btnViewVehiclesClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnFutreTripsClick(Sender: TObject);
    procedure btnPastTripsClick(Sender: TObject);
    procedure btnHabitsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDriverMenu: TfrmDriverMenu;

implementation

uses frmMessages_u, frmViewVehicles_u, frmManageTrips_u ,
     iDriverHandler_u, clsFactory_u, clsApplicationState_u, frmPastTrips_u,
     frmViewHabits_u;

{$R *.dfm}

procedure TfrmDriverMenu.btnHabitsClick(Sender: TObject);
begin
  var form := TfrmViewHabits.Create(Self);
  try
    Hide();
    form.ShowModal;
  finally
    FreeAndNil(form);
  end;
  Show;
end;

procedure TfrmDriverMenu.btnMessagesClick(Sender: TObject);
begin
  var form := TfrmMessages.Create(Self);
  try
    Hide();
    form.ShowModal;
  finally
    FreeAndNil(form);
  end;
  Show;
end;

procedure TfrmDriverMenu.btnPastTripsClick(Sender: TObject);
begin
  var form := TfrmPastTrips.Create(Self);
  try
    Hide();
    form.ShowModal;
  finally
    FreeAndNil(form);
  end;
  Show;
end;

procedure TfrmDriverMenu.btnFutreTripsClick(Sender: TObject);
begin
  var form := TfrmManageTrips.Create(Self);
  try
    Hide();
    form.ShowModal;
  finally
    FreeAndNil(form);
  end;
  Show;
end;

procedure TfrmDriverMenu.btnViewVehiclesClick(Sender: TObject);
begin
  var form := TfrmViewVehicles.Create(Self);
  try
    Hide();
    form.ShowModal;
  finally
    FreeAndNil(form);
  end;
  Show;
end;

procedure TfrmDriverMenu.FormActivate(Sender: TObject);
begin
  var handler := TFactory.createDriverHandler();
  TApplicationState.CurrentDriver :=
    handler.getDriverWithUserId(TApplicationState.CurrentUser.Id);
end;

end.
