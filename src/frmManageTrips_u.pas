unit frmManageTrips_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.WinXPanels, Vcl.Buttons;

type
  TfrmManageTrips = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    Label1: TLabel;
    btnEdit: TButton;
    StackPanel2: TStackPanel;
    Label3: TLabel;
    edtModel: TLabeledEdit;
    edtNumberPlate: TLabeledEdit;
    edtMaxPassengers: TLabeledEdit;
    edtColor: TLabeledEdit;
    imgVehicle: TImage;
    btnVehicleImageNext: TButton;
    StackPanel4: TStackPanel;
    Label4: TLabel;
    edtPricePerPassenger: TEdit;
    Label2: TLabel;
    dtpStartTime: TDateTimePicker;
    StackPanel1: TStackPanel;
    btnAdd: TButton;
    btnDelete: TButton;
    GridPanel3: TGridPanel;
    lstTrips: TListBox;
    btnEnquiries: TButton;
    GridPanel4: TGridPanel;
    btnBack: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btnVehicleImageNextClick(Sender: TObject);
    procedure lstTripsClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnViewEnquiriesClick(Sender: TObject);
    procedure btnEnquiriesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure displaySelectedTrip;
    procedure loadData();
    procedure clearUi();
  end;

var
  frmManageTrips: TfrmManageTrips;

implementation

uses clsFactory_u, clsApplicationState_u, frmAddTrip_u, frmEditTrip_u,
  frmViewStudentsEnquiringAboutTrip_u, iTrip_u, Generics.Collections;

var iVehicleImageIndex : Integer = 0;

{$R *.dfm}


procedure TfrmManageTrips.btnAddClick(Sender: TObject);
begin
  var form := TfrmAddTrip.Create(Self);
  try
    Hide();
    form.ShowModal;
  finally
    FreeAndNil(form);
  end;
  loadData();

  if not(TApplicationState.Trips.IsEmpty) then
    begin
      TApplicationState.SelectedTrip := TApplicationState.Trips[0];
    end
  else
    begin
      TApplicationState.SelectedTrip := nil;
      Show;
      Exit;
    end;
  displaySelectedTrip();
  Show;
end;

procedure TfrmManageTrips.btnDeleteClick(Sender: TObject);
begin
  var handler := TFactory.createTripHandler();

  if TApplicationState.SelectedTrip = nil then
    begin
      Exit;
    end;

  handler.deleteTrip(TApplicationState.SelectedTrip.Id);
  loadData();
  clearUi();
  TApplicationState.SelectedTrip := nil;
end;

procedure TfrmManageTrips.btnEditClick(Sender: TObject);
begin
  if (TApplicationState.SelectedTrip = nil) then
    begin
      ShowMessage('Trip must be selected!');
      Exit;
    end;

  var form := TfrmEditTrip.Create(Self);
  try
    Hide();
    form.ShowModal;
  finally
    FreeAndNil(form);
  end;
  loadData();
  displaySelectedTrip();

  for var i := 0 to TApplicationState.Trips.Count - 1 do
    begin
      if TApplicationState.Trips[i].Id = TApplicationState.SelectedTrip.Id  then
        begin
          lstTrips.ItemIndex := i;
          Break;
        end;
    end;
  Show;
end;

procedure TfrmManageTrips.btnEnquiriesClick(Sender: TObject);
begin
  if (TApplicationState.SelectedTrip = nil) then
    begin
      ShowMessage('Trip must be selected!');
      Exit;
    end;
  var form := TfrmViewStudentsEnquiringAboutTrip.Create(Self);
  try
    Hide();
    form.ShowModal;
  finally
    FreeAndNil(form);
  end;
  Show();
end;

procedure TfrmManageTrips.btnVehicleImageNextClick(Sender: TObject);
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

procedure TfrmManageTrips.btnViewEnquiriesClick(Sender: TObject);
begin
  if (TApplicationState.SelectedTrip = nil) then
    begin
      ShowMessage('Trip must be selected!');
      Exit;
    end;
end;

procedure TfrmManageTrips.clearUi;
begin
  edtModel.Text := '';
  edtNumberPlate.Text := '';
  edtMaxPassengers.Text := '0';
  edtColor.Text := '';

  edtPricePerPassenger.Text := '';
  dtpStartTime.Time := Now;
end;

procedure TfrmManageTrips.displaySelectedTrip;
begin
  if (TApplicationState.SelectedTrip = nil) then
    begin
      ShowMessage('Trip must be selected!');
      Exit;
    end;

  with TApplicationState.SelectedTrip do
    begin
      // Vehicle
      edtModel.Text := Vehicle.Model;
      edtNumberPlate.Text := Vehicle.NumberPlate;
      edtMaxPassengers.Text := Vehicle.MaxPassengers.ToString();
      edtColor.Text := Vehicle.Color;
      imgVehicle.Picture.LoadFromFile('./Vehicle Images/' + Vehicle.Images[0].FileName);

      edtPricePerPassenger.Text := CurrToStrF(CostPerPassenger, ffCurrency, 2);
      dtpStartTime.DateTime  := StartTime;
    end;

end;

procedure TfrmManageTrips.FormActivate(Sender: TObject);
begin
  loadData();
end;

procedure TfrmManageTrips.loadData;
begin
  var handler := TFactory.createTripHandler();

  TApplicationState.Trips := TList<ITrip>.Create();

  lstTrips.Clear();
  for var t in handler.getTripsForDriver(TApplicationState.CurrentDriver.Id) do
      begin
        if (t.StartTime > NOW) then
          begin
            TApplicationState.Trips.Add(t);
            lstTrips.Items.Add(t.Name)
          end;
      end;
end;

procedure TfrmManageTrips.lstTripsClick(Sender: TObject);
begin
  iVehicleImageIndex := 0;

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
