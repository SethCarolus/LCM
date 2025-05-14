unit clsDriver_u;

interface

uses iDriver_u, iUser_u, iImage_u, Generics.Collections;

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
    /// Represents the images associated with the driver.
    /// </summary>
    fImages: TList<IImage>;

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
    /// Function that returns the images of the driver.
    /// </summary>
    /// <returns>The iamges of the driver.</returns>
    function getImages(): TList<IImage>;

    /// <summary>
    /// Procedure that sets the images of the driver.
    /// </summary>
    /// <param name="images">images to assign to the driver.</param>
    procedure setImages(const images: TList<IImage>);

  public

    /// <summary>
    /// Creates a new Driver instance.
    /// </summary>
    constructor create(const id: Integer; const user: IUser; const images: TList<IImage>);

    /// <summary>
    /// Destroys the Driver instance.
    /// </summary>
    destructor Destroy; override;

    /// <summary>
    /// Represents the id of the driver.
    /// </summary>
    property Id: Integer read getId write setId;

    /// <summary>
    /// Represents the user associated with the driver.
    /// </summary>
    property User: IUser read getUser write setUser;

    /// <summary>
    /// Represents the images associated with the driver.
    /// </summary>
    property Images: TList<IImage> read getImages write setImages;
  end;

implementation

{ TDriver }

constructor TDriver.create(const id: Integer; const user: IUser;
                           const images: TList<IImage>);
begin
  fId := id;
  fUser := user;
  fImages := images;
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

function TDriver.getImages: TList<IImage>;
begin
  Result := fImages;
end;

function TDriver.getUser: IUser;
begin
  Result := fUser;
end;

procedure TDriver.setId(const id: Integer);
begin
  fId := id;
end;

procedure TDriver.setImages(const images: TList<IImage>);
begin
  fImages := images;
end;

procedure TDriver.setUser(const user: IUser);
begin
  fUser := user;
end;

end.
