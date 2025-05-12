unit frmEditTrip_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.NumberBox,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.WinXPanels,
  iVehicle_u, System.Threading;

type
  TfrmEditTrip = class(TForm)
    GridPanel1: TGridPanel;
    lstVehicleNames: TListBox;
    StackPanel2: TStackPanel;
    Label3: TLabel;
    edtModel: TLabeledEdit;
    edtNumberPlate: TLabeledEdit;
    edtMaxPassengers: TLabeledEdit;
    edtColor: TLabeledEdit;
    imgVehicle: TImage;
    btnVehicleImageNext: TButton;
    StackPanel4: TStackPanel;
    Label5: TLabel;
    edtName: TEdit;
    Label4: TLabel;
    nbxPrice: TNumberBox;
    Label2: TLabel;
    dtpStartTime: TDateTimePicker;
    Label6: TLabel;
    btnMakeChanges: TButton;
    Label1: TLabel;
    procedure lstVehicleNamesClick(Sender: TObject);
    procedure btnVehicleImageNextClick(Sender: TObject);
    procedure btnMakeChangesClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure setSelectedVehicle(const vehicle: IVehicle);
    function getSelectedVehicle(): IVehicle;

    property SelectedVehicle: IVehicle read getSelectedVehicle
                                       write setSelectedVehicle;
    procedure displaySelectedImage(const imageIndex: Integer);
  end;

var
  frmEditTrip: TfrmEditTrip;

implementation

uses clsFactory_u, iVehicleHandler_u, clsApplicationState_u,
     Generics.Collections;

var
  vehicles: TList<IVehicle>;
  _selectedVehicle: IVehicle;
  iImageIndex: Integer = 0;

{$R *.dfm}

{ TfrmEditTrip }

procedure TfrmEditTrip.btnMakeChangesClick(Sender: TObject);
begin
  if (string.IsNullOrWhiteSpace(edtName.Text)) then
    begin
      ShowMessage('Please enter a name.');
      Exit;
    end;

  if (nbxPrice.Value < 1) then
    begin
      ShowMessage('Please enter a valid price.');
      Exit;
    end;

  if dtpStartTime.DateTime <  Now then
    begin
      ShowMessage('Date must be valid.');
      Exit;
    end;

  TApplicationState.SelectedTrip.Name := edtName.Text;
  TApplicationState.SelectedTrip.CostPerPassenger := nbxPrice.Value;
  TApplicationState.SelectedTrip.StartTime := dtpStartTime.DateTime;
  TApplicationState.SelectedTrip.Vehicle := SelectedVehicle;

  var handler := TFactory.createTripHandler();

  handler.updateTrip(TApplicationState.SelectedTrip);

  ShowMessage('Trip Edited!');

  Close();
end;

procedure TfrmEditTrip.btnVehicleImageNextClick(Sender: TObject);
begin
  if (SelectedVehicle = nil) then
    begin
      Exit;
    end;

  if (iImageIndex = SelectedVehicle.Images.Count - 1) then
    iImageIndex := 0
  else
    Inc(iImageIndex);

  displaySelectedImage(iImageIndex);
end;

procedure TfrmEditTrip.displaySelectedImage(const imageIndex: Integer);
begin
  if (TApplicationState.SelectedTrip = nil) then
  begin
    Exit;
  end;

  try
    edtName.Text := TApplicationState.SelectedTrip.Name;
    nbxPrice.Value := TApplicationState.SelectedTrip.CostPerPassenger;
    dtpStartTime.DateTime := TApplicationState.SelectedTrip.StartTime;
    edtModel.Text := SelectedVehicle.model;
    edtNumberPlate.Text := SelectedVehicle.NumberPlate;
    edtMaxPassengers.Text := SelectedVehicle.MaxPassengers.ToString();
    edtColor.Text := SelectedVehicle.Color;
    imgVehicle.Picture.LoadFromFile('./Vehicle Images/' + SelectedVehicle.Images
      [imageIndex].FileName);
  except
    ShowMessage('Error in loading image!');
    imgVehicle.Picture.Destroy();
  end;
end;

procedure TfrmEditTrip.FormActivate(Sender: TObject);
begin
  var vehicleHandler := TFactory.createVehicleHandler();

  vehicles := vehicleHandler.getVehiclesForDriverWith(TApplicationState.CurrentDriver.Id);

  for var v in vehicles do
    begin
      lstVehicleNames.Items.Add(v.model);
    end;

  SelectedVehicle := TApplicationState.SelectedTrip.Vehicle;

  for var i := 0 to vehicles.Count - 1 do
    begin
      if vehicles[i].Id = SelectedVehicle.Id  then
        begin
          lstVehicleNames.ItemIndex := i;
          Break;
        end;
    end;

end;

function TfrmEditTrip.getSelectedVehicle: IVehicle;
begin
   Result := _selectedVehicle;
end;

procedure TfrmEditTrip.lstVehicleNamesClick(Sender: TObject);
begin
  if lstVehicleNames.ItemIndex = -1 then
    Exit;

  SelectedVehicle := vehicles[lstVehicleNames.ItemIndex];
end;

procedure TfrmEditTrip.setSelectedVehicle(const vehicle: IVehicle);
begin
  _selectedVehicle := vehicle;
  iImageIndex := 0;
  displaySelectedImage(iImageIndex)
end;

end.
