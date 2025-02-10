unit clsUserHandler_u;

interface
  uses iUserHandler_u;
  type
    TUserHandler = class(TInterfacedObject, IUserHandler)
      public
        constructor create();
        function userExists(const username : string) : Boolean;
        function passwordCorrect(const username : string; const password : string) : Boolean;
    end;
implementation
  uses dmMain_u, SysUtils;

{ TUserHandler }

constructor TUserHandler.create;
begin

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
