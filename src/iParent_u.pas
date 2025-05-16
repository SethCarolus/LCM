unit iParent_u;

interface

uses iUser_u;

type
  IParent = interface
    /// <summary>
    /// Function that returns the id of the parent.
    /// </summary>
    /// <returns>The id of the parent.</returns>
    function getId: Integer;

    /// <summary>
    /// Procedure that sets the id of the parent.
    /// </summary>
    /// <param name="id">Id to assign to the parent.</param>
    procedure setId(const id: Integer);

    /// <summary>
    /// Function that returns the associated user.
    /// </summary>
    /// <returns>The user of the parent.</returns>
    function getUser: IUser;

    /// <summary>
    /// Procedure that sets the associated user
    /// </summary>
    /// <param name="user">User to assign to the parent.</param>
    procedure setUser(const user: IUser);

    /// <summary>
    /// Represents the id of the parent.
    /// </summary>
    property Id: Integer read getId write setId;

    /// <summary>
    /// Represents the user associated with the parent.
    /// </summary>
    property User: IUser read getUser write setUser;

  end;

implementation

end.
