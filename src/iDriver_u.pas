unit iDriver_u;

interface

uses iUser_u;

type
  /// <summary>
  /// Represents a Driver.
  /// </summary>
  IDriver = interface

    /// <summary>
    /// Function that returns the id of the driver.
    /// </summary>
    /// <returns>The id of the driver.</returns>
    function getId: Integer;

    /// <summary>
    /// Procedure that sets the id of the driver.
    /// </summary>
    /// <param name="id">Id to assign to the driver.</param>
    procedure setId(const id: Integer);

    /// <summary>
    /// Function that returns the associated user.
    /// </summary>
    /// <returns>The user of the driver.</returns>
    function getUser: IUser;

    /// <summary>
    /// Procedure that sets the associated user
    /// </summary>
    /// <param name="user">User to assign to the driver.</param>
    procedure setUser(const user: IUser);

    /// <summary>
    /// Represents the id of the driver.
    /// </summary>
    property id: Integer read getId write setId;

    /// <summary>
    /// Represents the user associated with the driver.
    /// </summary>
    property user: IUser read getUser write setUser;

  end;

implementation

end.
