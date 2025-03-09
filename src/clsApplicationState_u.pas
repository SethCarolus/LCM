unit clsApplicationState_u;

interface

uses Generics.Collections, iDriver_u;

type
  TApplicationState = class
    public
      class var Driver: IDriver;
  end;

implementation

end.
