unit clsDriver_u;

interface

uses iDriver_u, iUser_u;

type
  /// <summary>
  /// Represents a Driver
  /// </summary>
  TDriver = class(TInterfacedObject, IDriver)

  private
    /// <summary>
    /// Represents the id of the driver.
    /// </summary>
    fId: Integer;

    /// <summary>
    /// Represents the user associated with the driver.
    /// </summary>
    fUser: IUser;

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

  public

    /// <summary>
    /// Creates a new Driver instance.
    /// </summary>
    constructor create(id: Integer; user: IUser);

    /// <summary>
    /// Destroys the Driver instance.
    /// </summary>
    destructor Destroy; override;

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

{ TDriver }

constructor TDriver.create(id: Integer; user: IUser);
begin
  fId := id;
  fUser := user;
end;

destructor TDriver.Destroy;
begin
  fUser := nil;
  inherited;
end;

function TDriver.getId: Integer;
begin
  Result := fId;
end;

function TDriver.getUser: IUser;
begin
  Result := fUser;
end;

procedure TDriver.setId(const id: Integer);
begin
  fId := id;
end;

procedure TDriver.setUser(const user: IUser);
begin
  fUser := user;
end;

end.
