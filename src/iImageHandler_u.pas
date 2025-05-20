unit iImageHandler_u;

interface

uses iImage_u, Generics.Collections;

type
  IImageHandler = interface
    ///<summary>
    /// Retrieves a list of images associated with a specific vehicle.
    ///</summary>
    ///<param name="id">The ID of the vehicle whose images are to be retrieved.</param>
    ///<returns>A list of IImage objects representing the vehicle's images.</returns>
    function getImagesForVehicleWith(const id: Integer): TList<IImage>;

    ///<summary>
    /// Retrieves a list of images associated with a specific driver.
    ///</summary>
    ///<param name="id">The ID of the driver whose images are to be retrieved.</param>
    ///<returns>A list of IImage objects representing the driver's images.</returns>
    function getImagesForDriverWith(const id: Integer): TList<IImage>;
  end;

implementation

end.
