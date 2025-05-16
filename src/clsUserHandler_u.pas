unit clsUserHandler_u;

interface
  uses iUserHandler_u, iUser_u,  Generics.Collections, iUserTypeHandler_u,
       iBankCardHandler_u;

type
  /// <summary>
  /// Represents a concrete implementation of the IUserHandler interface.
  /// </summary>
  TUserHandler = class(TInterfacedObject, IUserHandler)
    private
      fUserTypeHandler: IUserTypeHandler;
      fBankCardHandler: IBankCardHandler;
    public
      constructor create(const userTypeHandler: IUserTypeHandler;
                         const bankCardHandler: IBankCardHandler);

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

    function getUserWith(const username: string): IUser ;overload;

    function getUserWith(const id: Integer): IUser ;overload;

    function getAllUsers(): TList<IUser>;

    procedure sendMessageRequest(const senderId: Integer; const receiverId: Integer);
  end;

implementation
  uses dmMain_u, SysUtils, clsFactory_u;

{ TUserHandler }

constructor TUserHandler.create(const userTypeHandler: IUserTypeHandler;
                                const bankCardHandler: IBankCardHandler);
begin
  fUserTypeHandler := userTypeHandler;
  fBankCardHandler := bankCardHandler;
end;

function TUserHandler.getAllUsers: TList<IUser>;
begin
  Result := TList<IUser>.Create();

  with dmMain.qryUser do
    begin
      Close;
      SQL.Text :=
      '''
        SELECT *
        FROM tblUser
      ''';
      Open;
      while not Eof do
        begin
          Result.Add(TFactory.createUser(
                                        FieldByName('id').AsInteger,
                                        FieldByName('username').AsString,
                                        FieldByName('first_name').AsString,
                                        FieldByName('last_name').AsString,
                                        FieldByName('display_name').AsString,
                                        FieldByName('created_on').AsDateTime,
                                        FieldByName('last_login').AsDateTime,
                                        fUserTypeHandler.getUserTypeWith(FieldByName('user_type_id').AsInteger),
                                        fBankCardHandler.getBankCards(FieldByName('id').AsInteger)));
          Next();
        end;
   end;
end;

function TUserHandler.getUserTypeIdWith(const username: string): Integer;
begin
  with dmMain.qryUser do
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

function TUserHandler.getUserWith(const id: Integer): IUser;
begin

  with dmMain.qryUser do
    begin
      Close;
      SQL.Text :=
      '''
        SELECT *
        FROM tblUser
        WHERE id = :id;
      ''';

      Parameters.ParamByName('id').Value := id;
      Open;

      Result := TFactory.createUser(
                                    FieldByName('id').AsInteger,
                                    FieldByName('username').AsString,
                                    FieldByName('first_name').AsString,
                                    FieldByName('last_name').AsString,
                                    FieldByName('display_name').AsString,
                                    FieldByName('created_on').AsDateTime,
                                    FieldByName('last_login').AsDateTime,
                                    fUserTypeHandler.getUserTypeWith(FieldByName('user_type_id').AsInteger),
                                    fBankCardHandler.getBankCards(FieldByName('id').AsInteger));
   end;

end;

function TUserHandler.getUserWith(const username: string): IUser;
begin
  if (string.IsNullOrEmpty(username)) then
    raise Exception.Create('username cannot be null');

  with dmMain.qryUser do
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

      Result := TFactory.createUser(
                                    FieldByName('id').AsInteger,
                                    FieldByName('username').AsString,
                                    FieldByName('first_name').AsString,
                                    FieldByName('last_name').AsString,
                                    FieldByName('display_name').AsString,
                                    FieldByName('created_on').AsDateTime,
                                    FieldByName('last_login').AsDateTime,
                                    fUserTypeHandler.getUserTypeWith(FieldByName('user_type_id').AsInteger),
                                    fBankCardHandler.getBankCards(FieldByName('id').AsInteger));
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

  with dmMain.qryUser do
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

procedure TUserHandler.sendMessageRequest(const senderId, receiverId: Integer);
begin
  with dmMain.qryUser do
    begin
      Close;
      Sql.Text :=
      '''
        INSERT INTO tblMessageRequest (sender_id, receiver_id)
        VALUES (:senderId, :receiverId)
      ''';
      Parameters.ParamByName('senderId').Value := senderId;
      Parameters.ParamByName('receiverId').Value := receiverId;
      ExecSQL();
    end;
end;

function TUserHandler.userExists(const username: string): Boolean;
begin
  if (string.IsNullOrEmpty(username)) then
    raise Exception.Create('username cannot be null');

  With dmMain.qryUser do
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
