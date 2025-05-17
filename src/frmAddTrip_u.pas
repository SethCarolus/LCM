unit frmAddTrip_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.WinXPanels, iVehicle_u, System.Threading,
  Vcl.NumberBox, Vcl.Buttons;

type
  TfrmAddTrip = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
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
    btnAdd: TButton;
    Label1: TLabel;
    GridPanel3: TGridPanel;
    btnBack: TBitBtn;
    procedure lstVehicleNamesClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnVehicleImageNextClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }

    procedure setSelectedVehicle(const vehicle: IVehicle);
    function getSelectedVehicle(): IVehicle;

    property SelectedVehicle: IVehicle read getSelectedVehicle
                                       write setSelectedVehicle;
    procedure displaySelectedImage(const imageIndex: Integer);
  public
    { Public declarations }
  end;

var
  frmAddTrip: TfrmAddTrip;

implementation

uses clsFactory_u, iVehicleHandler_u, clsApplicationState_u,
     Generics.Collections;

var
  vehicles: TList<IVehicle>;
  _selectedVehicle: IVehicle;
  iImageIndex: Integer = 0;

{$R *.dfm}

procedure TfrmAddTrip.btnAddClick(Sender: TObject);
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

  var name: string := edtName.Text;
  var price := nbxPrice.Value;
  var startTime: TDateTime := dtpStartTime.DateTime;

  var handler := TFactory.createTripHandler();

  handler.addTrip(name, TApplicationState.CurrentDriver.Id, SelectedVehicle.Id,
                  startTime, price);

  ShowMessage('Trip Added!');
  Close();
end;

procedure TfrmAddTrip.btnVehicleImageNextClick(Sender: TObject);
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

procedure TfrmAddTrip.displaySelectedImage(const imageIndex: Integer);
begin

  if (SelectedVehicle = nil) then
  begin
    Exit;
  end;

  try
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

procedure TfrmAddTrip.FormActivate(Sender: TObject);
begin
  var vehicleHandler := TFactory.createVehicleHandler();

  vehicles := vehicleHandler.getVehiclesForDriverWith(TApplicationState.CurrentDriver.Id);

  for var v in vehicles do
    begin
      lstVehicleNames.Items.Add(v.model);
    end;

  SelectedVehicle := vehicles[0];
end;

function TfrmAddTrip.getSelectedVehicle: IVehicle;
begin
   Result := _selectedVehicle;
end;

procedure TfrmAddTrip.lstVehicleNamesClick(Sender: TObject);
begin
  if lstVehicleNames.ItemIndex = -1 then
    Exit;

  SelectedVehicle := vehicles[lstVehicleNames.ItemIndex];
end;

procedure TfrmAddTrip.setSelectedVehicle(const vehicle: IVehicle);
begin
  _selectedVehicle := vehicle;
  iImageIndex := 0;
  displaySelectedImage(iImageIndex);
end;
end.
