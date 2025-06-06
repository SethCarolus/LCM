unit iUser_u;

interface

uses iUserType_u, iBankCard_u, Generics.Collections;

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
    /// Function that returns the last name of the user.
    /// </summary>
    /// <returns>The last name of the user.</returns>
    function getDisplayName: string;

    /// <summary>
    /// Procedure that sets the display name of the user.
    /// </summary>
    /// <param name="displayName">Display name to assign to the user.</param>
    procedure setDisplayName(const displayName: string);

    /// <summary>
    /// Function that returns the date and time the user account was created on.
    /// </summary>
    /// <returns>the date and time the user account was created on</returns>
    function getCreatedOn(): TDateTime;

    /// <summary>
    /// Procedure that sets the date and time the user account was created on.
    /// </summary>
    /// <param name="createdOn">the date and time the user account was created on.</param>
    procedure setCreatedOn(const createdOn: TDateTime);

    /// <summary>
    /// Function that returns the date and time the user last logged on.
    /// </summary>
    /// <returns>The date and time the user last logged on.</returns>
    function getLastLogin(): TDateTime;

    /// <summary>
    /// Procedure that sets the date and time the user last logged on.
    /// </summary>
    /// <param name="lastLogin">The date and time the user last logged on.</param>
    procedure setLastLogin(const lastLogin: TDateTime);

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
    /// Function that returns the bank cards assiocated with the user.
    /// </summary>
    /// <returns>The bank cards associated with the user.</returns>
    function getBankCards(): TList<IBankCard>;

    /// <summary>
    /// Procedure that sets the bank cards associated wtih the user.
    /// </summary>
    /// <param name="bankCards">the bank cards to assign to the user.</param>
    procedure setBankCards(const bankCards: TList<IBankCard>);

    /// <summary>
    /// Represents the id of the user.
    /// </summary>
    property Id: Integer read getId write setId;

    /// <summary>
    /// Represents the username of the user.
    /// </summary>
    property Username: string read getUsername write setUsername;

    /// <summary>
    /// Represents the first name of the user.
    /// </summary>
    property FirstName: string read getFirstName write setFirstName;

    /// <summary>
    /// Represents the last name of the user.
    /// </summary>
    property LastName: string read getLastName write setLastName;

    /// <summary>
    /// Represents the display name of the user.
    /// </summary>
    property DisplayName: string read getDisplayName write setDisplayName;

    /// <summary>
    /// Represents the date and time the user account was created on.
    /// </summary>
    property CreatedOn: TDateTime read getCreatedOn write setCreatedOn;

    /// <summary>
    /// Represents Represents the date and time the user last logged in on.
    /// </summary>
    property LastLogin: TDateTime read getLastLogin write setLastLogin;

    /// <summary>
    /// Represents the user-type of the user.
    /// </summary>
    property UserType: IUserType read getUserType write setUserType;

    /// <summary>
    /// Represents the bank cards assiociated with the user.
    /// </summary>
    property BankCards: TList<IBankCard> read getBankCards write setBankCards;
  end;

implementation

end.
