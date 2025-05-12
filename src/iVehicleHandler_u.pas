unit iVehicleHandler_u;

interface
  uses iVehicle_u, Generics.Collections;
type
  /// <summary>
  /// Represents an interface for handling vehicle data interactions.
  /// </summary>
  IVehicleHandler = interface

    /// <summary>
    /// Retrieves a list of vehicles.
    /// </summary>
    /// <returns>
    /// A <see cref="TList{IVehicle}"/> containing the collection of vehicles.
    /// </returns>
    /// <remarks>
    /// This function fetches all available vehicles from the data source or storage and returns them as a list of <see cref="IVehicle"/> objects.
    /// The list is a generic collection of type <see cref="IVehicle"/> and may contain multiple vehicle objects.
    /// </remarks>
    function getVehicles(): TList<IVehicle>;

    function getVehiclesForDriverWith(id: Integer): TList<IVehicle>;

    function getVehicleWith(const id: Integer): IVehicle;
  end;

implementation

uses dmMain_u, SysUtils;
end.
