unit frmStudentMenu_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmStudentMenu = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    btnMessages: TButton;
    btnTrips: TButton;
    btnMyTrips: TButton;
    btnHabits: TButton;
    Button5: TButton;
    Button6: TButton;
    Panel1: TPanel;
    procedure btnMessagesClick(Sender: TObject);
    procedure btnTripsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnMyTripsClick(Sender: TObject);
    procedure btnHabitsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStudentMenu: TfrmStudentMenu;

implementation

uses frmMessages_u, frmViewTrips_u, clsFactory_u, clsApplicationState_u,
     frmMyTrips_u, frmViewHabits_u;

{$R *.dfm}

procedure TfrmStudentMenu.btnHabitsClick(Sender: TObject);
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

procedure TfrmStudentMenu.btnMessagesClick(Sender: TObject);
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

procedure TfrmStudentMenu.btnMyTripsClick(Sender: TObject);
begin
  var form := TFrmMyTrips.Create(Self);
  try
    Hide();
    form.ShowModal;
  finally
    FreeAndNil(form);
  end;
  Show;
end;

procedure TfrmStudentMenu.btnTripsClick(Sender: TObject);
begin
  var form := TfrmViewTrips.Create(Self);
  try
    Hide();
    form.ShowModal;
  finally
    FreeAndNil(form);
  end;
  Show;
end;

procedure TfrmStudentMenu.FormActivate(Sender: TObject);
begin
  var handler := TFactory.createStudentHandler();
  TApplicationState.CurrentStudent := handler.getStudentForUserWith(TApplicationState.CurrentUser.Id);
end;

end.
