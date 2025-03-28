unit login_u;

interface

uses iUserType_u, iUser_u;

function login(const username: string; const password: string): Boolean;
function getUserTypeIdWith(const username: string): Integer;
function getUserWith(const username: string): IUser;

implementation

uses iUserHandler_u, clsFactory_u, iUserTypeHandler_u;

function login(const username: string; const password: string): Boolean;
begin
  var userHandler := TFactory.createUserHandler();

  Result := userHandler.userExists(username) and
            userHandler.passwordCorrect(username, password);
end;

function getUserTypeIdWith(const username: string): Integer;
begin
  var handler := TFactory.createUserHandler();

  Result := handler.getUserTypeIdWith(username);
end;

function getUserWith(const username: string): IUser;
begin
  var handler := TFactory.createUserHandler();
  Result := handler.getUserWith(username);
end;

end.
