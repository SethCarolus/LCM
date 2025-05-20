unit iMessageHandler_u;

interface

uses IMessage_u, Generics.Collections, iUser_u;

type
  IMessageHandler = interface

  ///<summary>
  /// Retrieves the full message history between two users, sorted by timestamp.
  ///</summary>
  ///<param name="currentUserId">The ID of the current user.</param>
  ///<param name="otherUserId">The ID of the other user in the conversation.</param>
  ///<returns>A list of IMessage objects representing the conversation history.</returns>
  function getMessages(const currentUserId: Integer; const otherUserId: Integer)
                                                              : TList<IMessage>;

  ///<summary>
  /// Sends a new message from one user to another.
  ///</summary>
  ///<param name="senderId">The ID of the user sending the message.</param>
  ///<param name="receiverId">The ID of the user receiving the message.</param>
  ///<param name="content">The content of the message.</param>
  procedure sendMessage(const senderId, receiverId: Integer; const content: string);

  ///<summary>
  /// Retrieves new messages between two users sent after the last update timestamp.
  ///</summary>
  ///<param name="currentUserId">The ID of the current user.</param>
  ///<param name="otherUserId">The ID of the other user in the conversation.</param>
  ///<param name="lastUpdated">The last time messages were retrieved.</param>
  ///<returns>A list of IMessage objects representing the new messages.</returns>
  function getNewMessages(const currentUserId: Integer; const otherUserId: Integer;
                            const lastUpdated: TDateTime): TList<IMessage>;
  end;

implementation

end.
