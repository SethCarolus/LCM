unit iUserTypeHandler_u;

interface

uses Generics.Collections, iUserType_u;

type
  /// <summary>
  /// Represents an interface for handling user-type data interactions.
  /// </summary>
  IUserTypeHandler = interface
    function getUserTypes(): TList<IUserType>;
    function getUserTypeWith(const id: Integer): IUserType;
  end;

implementation

end.
