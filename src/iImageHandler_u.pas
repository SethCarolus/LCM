unit iImageHandler_u;

interface

uses iImage_u, Generics.Collections;

type
  IImageHandler = interface
    function getImagesForVehicleWith(const id: Integer): TList<IImage>;
    function getImagesForDriverWith(const id: Integer): TList<IImage>;
  end;

implementation

end.
