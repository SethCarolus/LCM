unit clsUser_u;

interface

uses iUserType_u, iUser_u;

type

  /// <summary>
  /// Represents a User.
  /// </summary>
  TUser = class(TInterfacedObject, IUser)
  private
    /// <summary>
    /// Represents the id of the user.
    /// </summary>
    fId: Integer;

    /// <summary>
    /// Represents the username of the user.
    /// </summary>
    fUsername: string;

    /// <summary>
    /// Represents the first name of the user.
    /// </summary>
    fFirstName: string;

    /// <summary>
    /// Represents the last name of the user.
    /// </summary>
    fLastName: string;

    /// <summary>
    /// Represents the display name of the user.
    /// </summary>
    fDisplayName: string;

    /// <summary>
    /// Represents the date and time the user account was created on.
    /// </summary>
    fCreatedOn: TDateTime;

    /// <summary>
    /// Represents Represents the date and time the user last logged in on.
    /// </summary>
    fLastLogin: TDateTime;

    /// <summary>
    /// Represents the user-type of the user.
    /// </summary>
    fUserType: IUserType;

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

  public
    /// <summary>
    /// Creates a user with the specified details.
    /// </summary>
    /// <param name="id">User id.</param>
    /// <param name="username">Username.</param>
    /// <param name="firstName">First name.</param>
    /// <param name="lastName">Last name.</param>
    /// <param name="userTypeId">User type id.</param>
    constructor Create(const id: Integer; username, firstName, lastName, displayName: string;
                       const createdOn: TDateTime; const lastLogin: TDateTime; const userType: IUserType);

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
  end;

implementation

{ TUser }

constructor TUser.Create(const id: Integer; username, firstName, lastName, displayName: string;
    const createdOn: TDateTime; const lastLogin: TDateTime;
    const userType: IUserType);
begin
  Self.Id := id;
  Self.Username := username;
  Self.FirstName := firstName;
  Self.LastName := lastName;
  Self.DisplayName := displayName;
  Self.CreatedOn := createdOn;
  Self.LastLogin := lastLogin;
  Self.UserType := userType;
end;

function TUser.getId: Integer;
begin
  Result := fId;
end;

procedure TUser.setId(const id: Integer);
begin
  fId := id;
end;

function TUser.getUsername: string;
begin
  Result := fUsername;
end;

procedure TUser.setUsername(const username: string);
begin
  fUsername := username;
end;

function TUser.getCreatedOn: TDateTime;
begin
  Result := fCreatedOn;
end;

function TUser.getDisplayName: string;
begin
  Result := fDisplayName;
end;

function TUser.getFirstName: string;
begin
  Result := fFirstName;
end;

procedure TUser.setCreatedOn(const createdOn: TDateTime);
begin
  fCreatedOn := createdOn;
end;

procedure TUser.setDisplayName(const displayName: string);
begin
   fDisplayName := displayName;
end;

procedure TUser.setFirstName(const firstName: string);
begin
  fFirstName := firstName;
end;

function TUser.getLastLogin: TDateTime;
begin
  Result := fLastLogin;
end;

function TUser.getLastName: string;
begin
  Result := fLastName;
end;

procedure TUser.setLastLogin(const lastLogin: TDateTime);
begin
  fLastLogin := lastLogin;
end;

procedure TUser.setLastName(const lastName: string);
begin
  fLastName := lastName;
end;

function TUser.getUserType: IUserType;
begin
  Result := fUserType;
end;

procedure TUser.setUserType(const userType: IUserType);
begin
  fUserType := userType;
end;

end.
