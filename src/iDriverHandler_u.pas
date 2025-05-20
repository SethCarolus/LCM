unit iDriverHandler_u;

interface

uses iDriver_u;

type
  IDriverHandler = interface

    /// <summary>
    ///   Retrieves a driver based on their driver ID.
    /// </summary>
    /// <param name="id">The unique identifier of the driver.</param>
    /// <returns>IDriver - The driver object corresponding to the given ID.</returns>
    function getDriverWith(const id: Integer): IDriver;

    /// <summary>
    ///   Retrieves a driver based on the associated user ID.
    /// </summary>
    /// <param name="id">The unique identifier of the user.</param>
    /// <returns>IDriver - The driver object associated with the user ID.</returns>
    function getDriverWithUserId(const id: Integer): IDriver;
  end;

implementation

end.
