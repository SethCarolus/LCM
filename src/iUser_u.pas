unit iUser_u;

interface

uses iUserType_u;

type
  /// <summary>
  /// Represents a User.
  /// </summary>
  IUser = interface

    /// <summary>
    /// Function that returns the id of the user.
    /// </summary>
    /// <returns>The id of the user.</returns>
    function getId: Integer;

    /// <summary>
    /// Procedure that sets the id of the user.
    /// </summary>
    /// <param name="id">Id to assign to the user.</param>
    procedure setId(const id: Integer);

    /// <summary>
    /// Function that returns the username of the user.
    /// </summary>
    /// <returns>The username of the user.</returns>
    function getUsername: string;

    /// <summary>
    /// Procedure that sets the username of the user.
    /// </summary>
    /// <param name="username">Username to assign to the user.</param>
    procedure setUsername(const username: string);

    /// <summary>
    /// Function that returns the first name of the user.
    /// </summary>
    /// <returns>The first name of the user.</returns>
    function getFirstName: string;

    /// <summary>
    /// Procedure that sets the first name of the user.
    /// </summary>
    /// <param name="firstName">First name to assign to the user.</param>
    procedure setFirstName(const firstName: string);

    /// <summary>
    /// Function that returns the last name of the user.
    /// </summary>
    /// <returns>The last name of the user.</returns>
    function getLastName: string;

    /// <summary>
    /// Procedure that sets the last name of the user.
    /// </summary>
    /// <param name="lastName">Last name to assign to the user.</param>
    procedure setLastName(const lastName: string);

    /// <summary>
    /// Function that returns the user-type of the user.
    /// </summary>
    /// <returns>The user-type of the user.</returns>
    function getUserType: IUserType;

    /// <summary>
    /// Procedure that sets the user-type of the user.
    /// </summary>
    /// <param name="userType">User-type to assign to the user.</param>
    procedure setUserType(const userType: IUserType);

    /// <summary>
    /// Represents the id of the user.
    /// </summary>
    property id: Integer read getId write setId;

    /// <summary>
    /// Represents the username of the user.
    /// </summary>
    property username: string read getUsername write setUsername;

    /// <summary>
    /// Represents the first name of the user.
    /// </summary>
    property firstName: string read getFirstName write setFirstName;

    /// <summary>
    /// Represents the last name of the user.
    /// </summary>
    property lastName: string read getLastName write setLastName;

    /// <summary>
    /// Represents the user-type of the user.
    /// </summary>
    property UserType: IUserType read getUserType write setUserType;
  end;

implementation

end.
