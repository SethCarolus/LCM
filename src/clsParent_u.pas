unit clsParent_u;

interface

uses iParent_u, iUser_u;

type
  TParent = class(TInterfacedObject, IParent)
    private
      fId : Integer;
      fUser: IUser;

    public
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
      /// Creates a new parent instance.
      /// <param name="id">Id to assign to the parent.</param>
      /// <param name="user">User to assign to the parent.</param>
      /// </summary>
      constructor create(const id: Integer; const user: IUser);

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

{ TParent }

constructor TParent.create(const id: Integer; const user: IUser);
begin
  Self.Id := id;
  Self.User := user;
end;

function TParent.getId: Integer;
begin
  Result := fId;
end;

function TParent.getUser: IUser;
begin
  Result := fUser;
end;

procedure TParent.setId(const id: Integer);
begin
  fId := id;
end;

procedure TParent.setUser(const user: IUser);
begin
  fUser := user;
end;

end.
