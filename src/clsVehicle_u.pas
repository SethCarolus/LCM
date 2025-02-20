unit clsVehicle_u;

interface

uses iVehicle_u, iImage_u, Generics.Collections;

type

  /// <summary>
  /// Represents a vehicle
  /// </summary>
  TVehicle = class(TInterfacedObject, IVehicle)
  private
    /// <summary>
    /// Represents the id of the vehicle in the database table.
    /// </summary>
    fId: Integer;

    /// <summary>
    /// Represents the model of the vehicle.
    /// </summary>
    fModel: string;

    /// <summary>
    /// Represents the number plate of the vehicle.
    /// </summary>
    fNumberPlate: string;

    /// <summary>
    /// Represents the max passengers the vehicle can carry.
    /// </summary>
    fMaxPassengers: Integer;

    /// <summary>
    /// Represents the exterior color of the vehicle.
    /// </summary>
    fColor: string;

    /// <summary>
    /// Represents the images of a vehicle.
    /// </summary>
    fImages: TList<IImage>;

    /// <summary>
    /// Function that returns the id of the vehicle.
    /// </summary>
    /// <returns>The id of the vehicle.</returns>
    function getId: Integer;

    /// <summary>
    /// Procedure that sets the id of the vehicle.
    /// </summary>
    /// <param name="id">Id to assign to the vehicle.</param>
    procedure setId(const id: Integer);

    /// <summary>
    /// Function that returns the model of the vehicle.
    /// </summary>
    /// <returns>The model of the vehicle.</returns>
    function getModel: string;

    /// <summary>
    /// Procedure that sets the model of the vehicle.
    /// </summary>
    /// <param name="model">Model to assign to the vehicle.</param>
    procedure setModel(const model: string);

    /// <summary>
    /// Function that returns the number plate of the vehicle.
    /// </summary>
    /// <returns>The number plate of the vehicle.</returns>
    function getNumberPlate: string;

    /// <summary>
    /// Procedure that sets the number plate of the vehicle.
    /// </summary>
    /// <param name="numberPlate">Number plate to assign to the vehicle.</param>
    procedure setNumberPlate(const numberPlate: string);

    /// <summary>
    /// Function that returns the max passengers the vehicle can carry.
    /// </summary>
    /// <returns>The max passengers the vehicle the vehicle can carry.</returns>
    function getMaxPassengers: Integer;

    /// <summary>
    /// Procedure that sets the max passengers the vehicle can carry.
    /// </summary>
    /// <param name="maxPassengers">Max passengers to assign to the vehicle.</param>
    procedure setMaxPassengers(const maxPassengers: Integer);

    /// <summary>
    /// Function that returns the exterior color of the vehicle.
    /// </summary>
    /// <returns>The exterior color of the vehicle.</returns>
    function getColor: string;

    /// <summary>
    /// Procedure that sets the exterior color of the vehicle.
    /// </summary>
    /// <param name="color">Color to assign to the vehicle.</param>
    procedure setColor(const color: string);

    /// <summary>
    /// Function that returns the images of the vehicle.
    /// </summary>
    /// <returns>The images of the vehicle.</returns>
    function getImages: TList<IImage>;

    /// <summary>
    /// Procedure that sets the images of the vehicle.
    /// </summary>
    /// <param name="images">Images to assign to the vehicle.</param>
    procedure setImages(images: TList<IImage>);

  public

    constructor create(); overload;
    constructor create(const id: Integer; const model: string;
      const numberPlate: string; const maxPassengers: Integer;
      const color: string; const images: TList<IImage>); overload;

    /// <summary>
    /// Represents the id of a vehicle in the database table.
    /// </summary>
    property id: Integer read getId write setId;

    /// <summary>
    /// Represents the model of a vehicle.
    /// </summary>
    property model: string read getModel write setModel;

    /// <summary>
    /// Represents the number plate of a vehicle.
    /// </summary>
    property numberPlate: string read getNumberPlate write setNumberPlate;

    /// <summary>
    /// Represents the max passengers a vehicle can carry.
    /// </summary>
    property maxPassengers: Integer read getMaxPassengers
      write setMaxPassengers;

    /// <summary>
    /// Represents the exterior color of a vehicle.
    /// </summary>
    property color: string read getColor write setColor;

    /// <summary>
    /// Represents the images of a vehicle.
    /// </summary>
    property Images: TList<IImage> read getImages write setImages;

  end;

implementation

{ TVehicle }

constructor TVehicle.create(const id: Integer; const model: string;
  const numberPlate: string; const maxPassengers: Integer; const color: string;
  const images: TList<IImage>);
begin
  Self.fId := id;
  Self.fModel := model;
  Self.fNumberPlate := numberPlate;
  Self.fMaxPassengers := maxPassengers;
  Self.fColor := color;
  Self.Images := images;
end;

constructor TVehicle.create;
begin

end;

function TVehicle.getColor: string;
begin
  Result := fColor;
end;

function TVehicle.getId: Integer;
begin
  Result := fId;
end;

function TVehicle.getImages: TList<IImage>;
begin
  Result := fImages;
end;

function TVehicle.getMaxPassengers: Integer;
begin
  Result := fMaxPassengers;
end;

function TVehicle.getModel: string;
begin
  Result := fModel;
end;

function TVehicle.getNumberPlate: string;
begin
  Result := fNumberPlate;
end;

procedure TVehicle.setColor(const color: string);
begin
  Self.fColor := color;
end;

procedure TVehicle.setId(const id: Integer);
begin
  Self.fId := id;
end;

procedure TVehicle.setImages(images: TList<IImage>);
begin
  fImages := images;
end;

procedure TVehicle.setMaxPassengers(const maxPassengers: Integer);
begin
  Self.fMaxPassengers := maxPassengers;
end;

procedure TVehicle.setModel(const model: string);
begin
  Self.fModel := model;
end;

procedure TVehicle.setNumberPlate(const numberPlate: string);
begin
  Self.fNumberPlate := numberPlate;
end;

end.
