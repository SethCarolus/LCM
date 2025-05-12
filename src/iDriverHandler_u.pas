unit iDriverHandler_u;

interface

uses iDriver_u;

type
  IDriverHandler = interface
    function getDriverWith(const id: Integer): IDriver;
    function getDriverWithUserId(const id: Integer): IDriver;
  end;

implementation

end.
