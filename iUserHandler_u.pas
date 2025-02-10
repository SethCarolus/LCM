unit iUserHandler_u;

interface

type
  IUserHandler = interface
    function userExists(const username : string) : Boolean;
    function passwordCorrect(const username : string; const password : string) : Boolean;
  end;

implementation

end.
