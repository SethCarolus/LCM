unit iVehicle_u;

interface

uses Generics.Collections, iImage_u;

type

  /// <summary>
  /// Represents a vehicle.
  /// </summary>
  IVehicle = interface

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

    /// <summary>
    /// Represents the id of a vehicle in the database table.
    /// </summary>
    property Id: Integer read getId write setId;

    /// <summary>
    /// Represents the model of a vehicle.
    /// </summary>
    property Model: string read getModel write setModel;

    /// <summary>
    /// Represents the number plate of a vehicle.
    /// </summary>
    property NumberPlate: string read getNumberPlate write setNumberPlate;

    /// <summary>
    /// Represents the max passengers a vehicle can carry.
    /// </summary>
    property MaxPassengers: Integer read getMaxPassengers
      write setMaxPassengers;

    /// <summary>
    /// Represents the exterior color of a vehicle.
    /// </summary>
    property Color: string read getColor write setColor;

    /// <summary>
    /// Represents the images of a vehicle.
    /// </summary>
    property Images: TList<IImage> read getImages write setImages;

  end;

implementation

end.
