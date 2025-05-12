unit iCommentHandler_u;

interface

uses iComment_u, Generics.Collections;

type
  ICommentHandler = interface
    function getCommentsForTrip(const tripId: Integer): TList<IComment>;
  end;

implementation

end.
