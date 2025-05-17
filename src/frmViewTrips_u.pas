unit frmViewTrips_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXPanels, Vcl.Imaging.jpeg, Vcl.Mask, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmViewTrips = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    lstTrips: TListBox;
    Label1: TLabel;
    btnEnquire: TButton;
    StackPanel1: TStackPanel;
    Label2: TLabel;
    edtDriverName: TLabeledEdit;
    imgDriver: TImage;
    btnDriverImageNext: TButton;
    StackPanel2: TStackPanel;
    Label3: TLabel;
    edtModel: TLabeledEdit;
    edtNumberPlate: TLabeledEdit;
    edtMaxPassengers: TLabeledEdit;
    edtColor: TLabeledEdit;
    imgVehicle: TImage;
    btnVehicleImageNext: TButton;
    StackPanel3: TStackPanel;
    edtStartTime: TLabel;
    dtpStartTime: TDateTimePicker;
    StackPanel4: TStackPanel;
    Label4: TLabel;
    edtPricePerPassenger: TEdit;
    GridPanel4: TGridPanel;
    btnBack: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure lstTripsClick(Sender: TObject);
    procedure btnVehicleImageNextClick(Sender: TObject);
    procedure btnDriverImageNextClick(Sender: TObject);
    procedure btnEnquireClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure displaySelectedTrip;
  end;

var
  frmViewTrips: TfrmViewTrips;

implementation

uses iTripHandler_u, clsFactory_u, clsApplicationState_u, iDriver_u, Generics.Collections;

var iVehicleImageIndex : Integer = 0;
var iDriverImageIndex : Integer = 0;

{$R *.dfm}

procedure TfrmViewTrips.btnEnquireClick(Sender: TObject);
begin
  var handler := TFactory.createTripHandler();
  handler.addTripEnquiry(TApplicationState.CurrentStudent.Id,
                         TApplicationState.SelectedTrip.Id);
  ShowMessage('Enquired about Trip!');
end;

procedure TfrmViewTrips.btnVehicleImageNextClick(Sender: TObject);
begin
  if (TApplicationState.SelectedTrip = nil) then
    begin
      ShowMessage('Trip must be selected!');
      Exit;
    end;

  with TApplicationState.SelectedTrip do
    begin
      if (iVehicleImageIndex = Vehicle.Images.Count - 1) then
        iVehicleImageIndex := 0
      else
        Inc(iVehicleImageIndex);
        imgVehicle.Picture.LoadFromFile('./Vehicle Images/' +
        TApplicationState.SelectedTrip.Vehicle.Images[iVehicleImageIndex].FileName)
    end;
end;

procedure TfrmViewTrips.btnDriverImageNextClick(Sender: TObject);
begin
  if (TApplicationState.SelectedTrip = nil) then
    begin
      ShowMessage('Trip must be selected!');
      Exit;
    end;

  with TApplicationState.SelectedTrip do
    begin
      if (iDriverImageIndex = Driver.Images.Count - 1) then
        iDriverImageIndex := 0
      else
        Inc(iDriverImageIndex);
        imgDriver.Picture.LoadFromFile('./Driver Images/' +
        TApplicationState.SelectedTrip.Driver.Images[iDriverImageIndex].FileName)
    end;

  TApplicationState.SelectedTrip.Driver.Images;
end;

procedure TfrmViewTrips.displaySelectedTrip;
begin
  if (TApplicationState.SelectedTrip = nil) then
    begin
      ShowMessage('Trip must be selected!');
      Exit;
    end;

  with TApplicationState.SelectedTrip do
    begin
      // Driver
      edtDriverName.Text := Driver.User.FirstName + ' ' + Driver.User.LastName;
      imgDriver.Picture.LoadFromFile('./Driver Images/' + Driver.Images[0].FileName);

      // Vehicle
      edtModel.Text := Vehicle.Model;
      edtNumberPlate.Text := Vehicle.NumberPlate;
      edtMaxPassengers.Text := Vehicle.MaxPassengers.ToString();
      edtColor.Text := Vehicle.Color;
      imgVehicle.Picture.LoadFromFile('./Vehicle Images/' + Vehicle.Images[0].FileName);

      edtPricePerPassenger.Text := CurrToStrF(CostPerPassenger, ffCurrency, 2);
      dtpStartTime.DateTime := StartTime;
    end;

end;

procedure TfrmViewTrips.FormActivate(Sender: TObject);
begin
  var handler := TFactory.createTripHandler();

  TApplicationState.Trips := handler.getTrips(Now);

  for var t in TApplicationState.Trips do
      begin
        lstTrips.Items.Add(t.Name)
      end;
end;

procedure TfrmViewTrips.lstTripsClick(Sender: TObject);
begin
  iVehicleImageIndex := 0;
  iDriverImageIndex := 0;

  var index  := lstTrips.ItemIndex;

  if (index = -1) then
    begin
      ShowMessage('Please select a trip.');
      Exit;
    end;

  TApplicationState.SelectedTrip := TApplicationState.Trips[index];

  displaySelectedTrip();
end;

end.
