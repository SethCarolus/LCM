unit login_u;

interface

uses iUserType_u;

function Login(const username: string; const password: string): Boolean;
function GetUserTypeIdWith(const username: string): Integer;

implementation

uses iUserHandler_u, clsFactory_u, iUserTypeHandler_u;

function Login(const username: string; const password: string): Boolean;
begin
  var userHandler := TFactory.createUserHandler();

  Result := userHandler.userExists(username) and
            userHandler.passwordCorrect(username, password);
  
end;

function GetUserTypeIdWith(const username: string): Integer;
begin
  var handler := TFactory.createUserHandler();

  Result := handler.getUserTypeIdWith(username);
end;

end.
