unit frmPastTrips_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.WinXPanels, Vcl.ExtCtrls, DateUtils;

type
  TfrmPastTrips = class(TForm)
    GridPanel1: TGridPanel;
    lstTrips: TListBox;
    Label1: TLabel;
    StackPanel3: TStackPanel;
    Label2: TLabel;
    dtpStartTime: TDateTimePicker;
    Label4: TLabel;
    edtPricePerPassenger: TEdit;
    StackPanel4: TStackPanel;
    btnViewComments: TButton;
    procedure lstTripsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnViewCommentsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPastTrips: TfrmPastTrips;

implementation

uses frmViewTripComments_u, clsApplicationState_u, clsFactory_u, iTrip_u,
     Generics.Collections;

{$R *.dfm}

procedure TfrmPastTrips.btnViewCommentsClick(Sender: TObject);
begin
  var handler := TFactory.createCommentHandler();

  TApplicationState.Comments :=
    handler.getCommentsForTrip(TApplicationState.SelectedTrip.Id);

  if (TApplicationState.Comments.IsEmpty) then
    begin
      ShowMessage('Trip has no comments!');
      Exit;
    end;

  var form := TfrmViewTripComments.Create(Self);
  try
    Hide();
    form.ShowModal;
  finally
    FreeAndNil(form);
  end;
  Show;
end;

procedure TfrmPastTrips.FormActivate(Sender: TObject);
begin
  var handler := TFactory.createTripHandler();

  TApplicationState.Trips := TList<ITrip>.Create();

  lstTrips.Clear();
  for var t in handler.getTripsForDriver(TApplicationState.CurrentDriver.Id) do
    begin
      if (t.StartTime < Now) then
        begin
          TApplicationState.Trips.Add(t);
          lstTrips.Items.Add(t.Name);
        end;
    end;
end;

procedure TfrmPastTrips.lstTripsClick(Sender: TObject);
begin
  var index := lstTrips.ItemIndex;

  if (index = -1 ) then
    begin
      ShowMessage('Select a Trip.');
      Exit;
    end;

  TApplicationState.SelectedTrip:= TApplicationState.Trips[index];

  dtpStartTime.DateTime := TApplicationState.SelectedTrip.StartTime;
  edtPricePerPassenger.Text := CurrToStrF(TApplicationState.SelectedTrip.CostPerPassenger, ffCurrency, 2);

end;

end.
