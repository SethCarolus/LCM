unit clsUserHandler_u;

interface
  uses iUserHandler_u;

type
  /// <summary>
  /// Represents a concrete implementation of the IUserHandler interface.
  /// </summary>
  TUserHandler = class(TInterfacedObject, IUserHandler)
    public
      constructor create();

    /// <summary>
    /// Checks if a user exists in the system.
    /// </summary>
    /// <param name="username">The username of the user to check.</param>
    /// <returns>True if the user exists, otherwise False.</returns>
    function userExists(const username: string): Boolean;

    /// <summary>
    /// Verifies if the password entered by the user is correct.
    /// </summary>
    /// <param name="username">The username of the user whose password is being checked.</param>
    /// <param name="password">The password entered by the user.</param>
    /// <returns>True if the password matches the user's stored password, otherwise False.</returns>
    function passwordCorrect(const username: string; const password: string): Boolean;

    /// <summary>
    /// Retrieves the user type ID associated with the specified username from the database.
    /// </summary>
    /// <param name="username">The username for which the user type ID is to be retrieved.</param>
    /// <returns>
    /// The user type ID as an integer. Returns 0 if the username is not found or if an error occurs.
    /// </returns>
    function getUserTypeIdWith(const username: string): Integer;
  end;

implementation
  uses dmMain_u, SysUtils;

{ TUserHandler }

constructor TUserHandler.create;
begin
end;

function TUserHandler.getUserTypeIdWith(const username: string): Integer;
begin
  with dmMain.qryMain do
    begin
      Close;
      SQL.Text :=
      '''
        SELECT *
        FROM tblUser
        WHERE username = :username;
      ''';

      Parameters.ParamByName('username').Value := username.Trim();
      Open;

      Result := FieldByName('user_type_id').AsInteger;
   end;
end;

function TUserHandler.passwordCorrect(const username,
  password: string): Boolean;
begin
  if (string.IsNullOrEmpty(username)) then
    raise Exception.Create('username cannot be null');

  if (string.IsNullOrEmpty(password)) then
    raise Exception.Create('password cannot be null');

  if not userExists(username) then
    begin
      Result := False;
      Exit;
    end;

  with dmMain.qryMain do
    begin
      Close;
      SQL.Text :=
      '''
        SELECT *
        FROM tblUser
        WHERE username = :username;
      ''';
      Parameters.ParamByName('username').Value := username.Trim();
      Open;

      Result := FieldByName('password').AsString.Trim() = password.Trim()
    end;
end;

function TUserHandler.userExists(const username: string): Boolean;
begin
  if (string.IsNullOrEmpty(username)) then
    raise Exception.Create('username cannot be null');

  With dmMain.qryMain do
    begin
      Close;
      SQL.Text :=
      '''
        SELECT *
        FROM tblUser
        WHERE username = :username;
      ''';
      Parameters.ParamByName('username').Value := username.Trim();
      Open;

      Result := RecordCount <> 0
    end;
end;

end.
