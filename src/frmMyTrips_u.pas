unit frmMyTrips_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.WinXPanels, Vcl.NumberBox;

type
  TfrmMyTrips = class(TForm)
    GridPanel1: TGridPanel;
    lstTrips: TListBox;
    Label1: TLabel;
    StackPanel3: TStackPanel;
    edtStartTime: TLabel;
    dtpStartTime: TDateTimePicker;
    StackPanel4: TStackPanel;
    StackPanel1: TStackPanel;
    Label2: TLabel;
    redTripComment: TRichEdit;
    Label3: TLabel;
    Label5: TLabel;
    nbxRating: TNumberBox;
    edtPricePerPassenger: TEdit;
    Label4: TLabel;
    btnSubmit: TButton;
    edtHeader: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure lstTripsClick(Sender: TObject);
    procedure btnSubmitClick(Sender: TObject);
  private
    { Private declarations }
    procedure displayTrip();
  public
    { Public declarations }
  end;

var
  frmMyTrips: TfrmMyTrips;

implementation

uses clsFactory_u, clsApplicationState_u;

{$R *.dfm}

procedure TfrmMyTrips.btnSubmitClick(Sender: TObject);
begin
  var handler := TFactory.createTripHandler();

  if (string.IsNullOrWhiteSpace(edtHeader.Text)) then
    begin
      ShowMessage('Please enter a header for your comment!');
      Exit;
    end;

  if (redTripComment.Lines.IsEmpty) then
    begin
      ShowMessage('Please leave a comment!');
      Exit;
    end;

  if (nbxRating.Value < 1) OR (nbxRating.Value > 10) then
    begin
      ShowMessage('Rating must be between 1 and 10 (Inclusive).');
      Exit;
    end;

  var content : string;

  for var l in redTripComment.Lines do
    begin
      content := content + l;
    end;


  handler.addTripComment(edtHeader.Text,content,
                         TApplicationState.CurrentStudent.User.Id,
                         TApplicationState.SelectedTrip.Id);

  handler.updateTripRatingForStudent(TApplicationState.CurrentStudent.Id,
                                     TApplicationState.SelectedTrip.Id,
                                     nbxRating.ValueInt);


end;

procedure TfrmMyTrips.displayTrip;
begin
  if (TApplicationState.SelectedTrip = nil) then
    begin
      ShowMessage('Trip must be selected!');
      Exit;
    end;

  with TApplicationState.SelectedTrip do
    begin
      edtPricePerPassenger.Text := CurrToStrF(CostPerPassenger, ffCurrency, 2);
      dtpStartTime.DateTime := StartTime;
    end;

end;

procedure TfrmMyTrips.FormActivate(Sender: TObject);
begin
  var handler := TFactory.createTripHandler();

  TApplicationState.Trips := handler.getTripsForStudent(
                                                        10,
                                                        Now);

  lstTrips.Clear();
  for var t in TApplicationState.Trips do
    begin
      lstTrips.items.Add(t.Name);
    end;
end;

procedure TfrmMyTrips.lstTripsClick(Sender: TObject);
begin
  var index := lstTrips.ItemIndex;

  if index = -1 then
    begin
      ShowMessage('Select Trip!');
      Exit;
    end;

  TApplicationState.SelectedTrip := TApplicationState.Trips[index];
  displayTrip();
end;

end.
