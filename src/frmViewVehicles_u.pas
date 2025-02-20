unit frmViewVehicles_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, jpeg, iVehicle_u, System.Threading;

type
  TfrmViewVehicles = class(TForm)
    GridPanel1: TGridPanel;
    lstVehicleNames: TListBox;
    ImgVehicleImage: TImage;
    btnNext: TButton;
    GridPanel2: TGridPanel;
    pnlDescription: TPanel;
    pnlUploadedOn: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure lstVehicleNamesClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure displaySelectedImage(const imageIndex: Integer);

    procedure setSelectedVehicle(const vehicle: IVehicle);
    function getSelectedVehicle(): IVehicle;

    property SelectedVehicle: IVehicle read getSelectedVehicle
                                       write setSelectedVehicle;


  public
    { Public declarations }
  end;

var
  frmViewVehicles: TfrmViewVehicles;

implementation

uses iVehicleHandler_u, Generics.Collections, clsFactory_u;

var
  vehicles: TList<IVehicle>;
  _selectedVehicle: IVehicle;
  iImageIndex: Integer = 0;

{$R *.dfm}

procedure TfrmViewVehicles.btnNextClick(Sender: TObject);
begin
  if (SelectedVehicle = nil) then
    Exit;

  if (SelectedVehicle.Images = nil) then
    Exit;

  if (iImageIndex = selectedVehicle.Images.Count - 1) then
    iImageIndex := 0
  else
    Inc(iImageIndex);

  displaySelectedImage(iImageIndex);
end;

procedure TfrmViewVehicles.displaySelectedImage(const imageIndex: Integer);
begin
  TTask.Run(
  procedure
  begin
    try
      ImgVehicleImage.Picture.LoadFromFile('./Vehicle Images/' +
                        SelectedVehicle.Images[imageIndex].FileName);
      pnlDescription.Caption := 'Description: ' +
                                 SelectedVehicle.Images[imageIndex].Description;
      pnlUploadedOn.Caption := 'Uploaded On: ' +
                                  DateToStr(SelectedVehicle.Images[imageIndex].UploadedOn);
    except
      ShowMessage('Error in loading image!');
      ImgVehicleImage.Picture.Destroy();
    end;
  end
    ).Wait();
end;

procedure TfrmViewVehicles.FormActivate(Sender: TObject);
begin
  var vehicleHandler := TFactory.createVehicleHandler();

  vehicles := vehicleHandler.getVehiclesForDriverWith(1);

  for var v in vehicles do
    begin
      lstVehicleNames.Items.Add(v.model);
    end;
    var hello: string;
end;

procedure TfrmViewVehicles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

function TfrmViewVehicles.getSelectedVehicle: IVehicle;
begin
  Result := _selectedVehicle;
end;

procedure TfrmViewVehicles.lstVehicleNamesClick(Sender: TObject);
begin
  if lstVehicleNames.ItemIndex = -1 then
    Exit;

  SelectedVehicle := vehicles[lstVehicleNames.ItemIndex];
end;
procedure TfrmViewVehicles.setSelectedVehicle(const vehicle: IVehicle);
begin
  _selectedVehicle := vehicle;

  iImageIndex := 0;
  displaySelectedImage(iImageIndex);
end;

end.
