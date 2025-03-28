unit iMessageHandler_u;

interface

uses IMessage_u, Generics.Collections, iUser_u;

type
  IMessageHandler = interface

  function getMessages(const currentUserId: Integer; const otherUserId: Integer)
                                                              : TList<IMessage>;
  function getUsersInChatHistory(const userId: Integer): TList<IUser>;
  end;

implementation

end.
