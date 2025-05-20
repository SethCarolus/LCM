unit iVehicleHandler_u;

interface

uses iVehicle_u, Generics.Collections;

type
  /// <summary>
  /// Represents an interface for handling vehicle data interactions.
  /// </summary>
  IVehicleHandler = interface

    /// <summary>
    /// Returns a list of all the vehicles in the database.
    /// </summary>
    /// <returns>A list of IVehicle</returns>
    function getVehicles(): TList<IVehicle>;

    /// <summary>
    /// Returns a list of all the vehicles for a particular driver.
    /// </summary>
    /// <param name="id">The drivers ID.</param>
    /// <returns>A list of IVehicle</returns>
    function getVehiclesForDriverWith(id: Integer): TList<IVehicle>;

    /// <summary>
    /// Returns a particular vehicle.
    /// </summary>
    /// <param name="id">The vehicle's id.</param>
    /// <returns>A Vehicle</returns>
    function getVehicleWith(const id: Integer): IVehicle;
  end;

implementation

uses dmMain_u, SysUtils;

end.
