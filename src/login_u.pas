unit login_u;

interface

function Login(const username: string; const password: string): Boolean;

implementation

uses iUserHandler_u, clsFactory_u;


function Login(const username: string; const password: string): Boolean;
begin
  var userHandler := TFactory.createUserHandler();

  Result := userHandler.userExists(username) and 
            userHandler.passwordCorrect(username, password);
  
end;

end.
