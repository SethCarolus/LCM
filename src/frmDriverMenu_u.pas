unit frmDriverMenu_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask;

type
  TfrmDriverMenu = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    Panel1: TPanel;
    btnMessages: TButton;
    btnFutreTrips: TButton;
    btnViewVehicles: TButton;
    btnPastTrips: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure btnMessagesClick(Sender: TObject);
    procedure btnViewVehiclesClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnFutreTripsClick(Sender: TObject);
    procedure btnPastTripsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDriverMenu: TfrmDriverMenu;

implementation

uses frmMessages_u, frmViewVehicles_u, frmManageTrips_u ,
     iDriverHandler_u, clsFactory_u, clsApplicationState_u, frmPastTrips_u;

{$R *.dfm}

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
