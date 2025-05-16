unit iParentHandler_u;

interface

uses iParent_u;

type
  IParentHandler = interface
    function getParent(const userId: Integer): IParent;
  end;

implementation

end.
