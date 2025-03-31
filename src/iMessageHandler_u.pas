unit iMessageHandler_u;

interface

uses IMessage_u, Generics.Collections, iUser_u;

type
  IMessageHandler = interface

  function getMessages(const currentUserId: Integer; const otherUserId: Integer)
                                                              : TList<IMessage>;

  procedure sendMessage(const senderId, receiverId: Integer; const content: string);

  function getNewMessages(const currentUserId: Integer; const otherUserId: Integer;
                            const lastUpdated: TDateTime): TList<IMessage>;
  end;

implementation

end.
