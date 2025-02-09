unit clsUser_u;

interface

type
  TUser = class
  private
    fId: Integer;
    fUsername: string;
    fFirstName: string;
    fLastName: string;
    fUserTypeId: Integer;

    function getId: Integer;
    procedure setId(const id: Integer);

    function getUsername: string;
    procedure setUsername(const username: string);

    function getFirstName: string;
    procedure setFirstName(const firstName: string);

    function getLastName: string;
    procedure setLastName(const lastName: string);

    function getUserTypeId: Integer;
    procedure setUserTypeId(const userTypeId: Integer);

  public
    constructor Create(id: Integer; username, firstName, lastName: string; userTypeId: Integer);

    property Id: Integer read getId write setId;
    property Username: string read getUsername write setUsername;
    property FirstName: string read getFirstName write setFirstName;
    property LastName: string read getLastName write setLastName;
    property UserTypeId: Integer read getUserTypeId write setUserTypeId;
  end;

implementation

{ TUser }

constructor TUser.Create(id: Integer; username, firstName, lastName: string; userTypeId: Integer);
begin
  fId := id;
  fUsername := username;
  fFirstName := firstName;
  fLastName := lastName;
  fUserTypeId := userTypeId;
end;

function TUser.getId: Integer;
begin
  Result := fId;
end;

procedure TUser.setId(const id: Integer);
begin
  fId := id;
end;

function TUser.getUsername: string;
begin
  Result := fUsername;
end;

procedure TUser.setUsername(const username: string);
begin
  fUsername := username;
end;

function TUser.getFirstName: string;
begin
  Result := fFirstName;
end;

procedure TUser.setFirstName(const firstName: string);
begin
  fFirstName := firstName;
end;

function TUser.getLastName: string;
begin
  Result := fLastName;
end;

procedure TUser.setLastName(const lastName: string);
begin
  fLastName := lastName;
end;

function TUser.getUserTypeId: Integer;
begin
  Result := fUserTypeId;
end;

procedure TUser.setUserTypeId(const userTypeId: Integer);
begin
  fUserTypeId := userTypeId;
end;

end.

