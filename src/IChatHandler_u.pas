unit IChatHandler_u;

interface

uses iChat_u, Generics.Collections;

type
  IChatHandler = interface
    function getChatsForUserWith(const id: Integer): TList<IChat>;
  end;

implementation

end.
