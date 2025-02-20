unit clsUserType_u;

interface

uses iUserType_u;

type
  /// <summary>
  /// Represents a type of user.
  /// </summary>
  TUserType = class(TInterfacedObject, IUserType)

  private
    fId: Integer;
    fName: string;
    fDescription: string;

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
    /// <returns>The description of the user-type.</returns>
    function getDescription: string;

    /// <summary>
    /// Procedure that sets the description of the user-type.
    /// </summary>
    /// <param name="description">The description to assign to the user-type.</param>
    procedure setDescription(const description: string);

  public
    {TODO -oOwner -cUserType : Create Constructor}
    /// <summary>
    /// Represents the id of the user-type.
    /// </summary>
    property id: Integer read getId write setId;

    /// <summary>
    /// Represents the name of the user-type.
    /// </summary>
    property Name: string read getName write setName;

    /// <summary>
    /// Represents the description of the user-type.
    /// </summary>
    property description: string read getDescription write setDescription;

  end;

implementation

{ TUserType }

{ TUserType }

function TUserType.getDescription: string;
begin
  Result := fDescription;
end;

function TUserType.getId: Integer;
begin
  Result := fId;
end;

function TUserType.getName: string;
begin
  Result := fName;
end;

procedure TUserType.setDescription(const description: string);
begin
  fDescription := description;
end;

procedure TUserType.setId(const id: Integer);
begin
  fId := id;
end;

procedure TUserType.setName(const name: string);
begin
  fName := name;
end;

end.
