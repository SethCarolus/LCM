unit iDriver_u;

interface

uses iUser_u, iImage_u, Generics.Collections;

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
    /// Function that returns the images of the driver.
    /// </summary>
    /// <returns>The iamges of the driver.</returns>
    function getImages(): TList<IImage>;

    /// <summary>
    /// Procedure that sets the images of the driver.
    /// </summary>
    /// <param name="images">images to assign to the driver.</param>
    procedure setImages(const images: TList<IImage>);

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

end.
