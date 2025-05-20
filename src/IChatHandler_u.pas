unit IChatHandler_u;

interface

uses iChat_u, Generics.Collections, iUser_u;

type
  IChatHandler = interface

    /// <summary>
    ///   Retrieves the list of chats for a specific user.
    /// </summary>
    /// <param name="id">The user ID to retrieve chats for.</param>
    /// <returns>A TList of IChat representing the user's chats.</returns>
    function getChatsForUserWith(const id: Integer): TList<IChat>;

    /// <summary>
    ///   Gets the new parts of chats for a user compared to existing chats.
    /// </summary>
    /// <param name="id">The user ID.</param>
    /// <param name="chats">The list of existing chats to compare.</param>
    /// <returns>A TList of IChat containing only new messages.</returns>
    function getNewPartOfChatsForUserWith(const id: Integer;
      const chats: TList<IChat>): TList<IChat>;

    /// <summary>
    ///   Retrieves users available for chat requests for a specific user.
    /// </summary>
    /// <param name="id">The user ID.</param>
    /// <returns>A TList of IUser who can be requested for chat.</returns>
    function getChatRequestableUsersForUserWith(const id: Integer)
      : TList<IUser>;

    /// <summary>
    ///   Retrieves all users who have had chat history with the specified user.
    /// </summary>
    /// <param name="userId">The user ID.</param>
    /// <returns>A TList of IUser who have chatted with the user.</returns>
    function getUsersInChatHistory(const userId: Integer): TList<IUser>;

    /// <summary>
    ///   Retrieves users who have sent chat requests that the specified user can accept.
    /// </summary>
    /// <param name="id">The user ID.</param>
    /// <returns>A TList of IUser who sent pending chat requests.</returns>
    function getUsersForRequestAcceptanceForUserWith(const id: Integer)
      : TList<IUser>;

    /// <summary>
    ///   Accepts a chat request from a sender to a receiver.
    /// </summary>
    /// <param name="senderId">The ID of the user who sent the request.</param>
    /// <param name="receiverId">The ID of the user accepting the request.</param>
    procedure acceptRequest(const senderId: Integer; const receiverId: Integer);

    /// <summary>
    ///   Retrieves new chats for a user compared to an existing list of chats.
    /// </summary>
    /// <param name="id">The user ID.</param>
    /// <param name="chats">The list of existing chats.</param>
    /// <returns>A TList of IChat containing chats not in the existing list.</returns>
    function getNewChatsForUserWith(const id: Integer;
      const chats: TList<IChat>): TList<IChat>;
  end;

implementation

end.
