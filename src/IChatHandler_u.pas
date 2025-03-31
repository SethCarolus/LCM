unit IChatHandler_u;

interface

uses iChat_u, Generics.Collections, iUser_u;

type
  IChatHandler = interface
    function getChatsForUserWith(const id: Integer): TList<IChat>;

    function getNewPartOfChatsForUserWith(const id: Integer; const chats: TList<IChat>): TList<iChat>;

    function getChatRequestableUsersForUserWith(const id: Integer): TList<IUser>;

    function getUsersInChatHistory(const userId: Integer): TList<IUser>;

    function getUsersForRequestAcceptanceForUserWith(const id: Integer): TList<IUser>;

    procedure acceptRequest(const senderId: Integer; const receiverId: Integer);

    function getNewChatsForUserWith(const id: Integer;const chats: TList<IChat>): TList<IChat>;
  end;

implementation

end.
