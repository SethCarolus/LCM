unit iUserType_u;

interface

type
  /// <summary>
  /// Represents a type of user.
  /// </summary>
  IUserType = Interface

    /// <summary>
    /// Function that returns the id of the user-type.
    /// </summary>
    /// <returns>The id of the user-type.</returns>
    function getId: Integer;

    /// <summary>
    /// Procedure that sets the id of the user-type.
    /// </summary>
    /// <param name="id">The id to assign to the user-type.</param>
    procedure setId(const id: Integer);

    /// <summary>
    /// Function that returns the name of the user-type.
    /// </summary>
    /// <returns>The name of the user-type.</returns>
    function getName: string;

    /// <summary>
    /// Procedure that sets the name of the user-type.
    /// </summary>
    /// <param name="name">The name to assign to the user-type.</param>
    procedure setName(const name: string);

    /// <summary>
    /// Function that returns the description of the user-type.
    /// </summary>
    /// <returns>The name of the user-type.</returns>
    function getDescription: string;

    /// <summary>
    /// Procedure that sets the description of the user-type.
    /// </summary>
    /// <param name="name">The description to assign to the user-type.</param>
    procedure setDescription(const description: string);

    /// <summary>
    /// Represents the id of the user-type.
    /// </summary>
    property Id: Integer read getId write setId;

    /// <summary>
    /// Represents the name of the user-type.
    /// </summary>
    property Name: string read getName write setName;

    /// <summary>
    /// Represents the description of the user-type.
    /// </summary>
    property Description: string read getDescription write setDescription;

  End;

implementation

end.

