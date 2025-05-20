unit iChat_u;

interface

uses Generics.Collections, iMessage_u;

type
  /// <summary>
  /// An interface for a chat between two users
  /// </summary>
  IChat = interface
    /// <summary>
    /// Gets the user ID of the chat.
    /// </summary>
    /// <returns>The user ID.</returns>
    function getUserId: Integer;

    /// <summary>
    /// Sets the user ID of the chat.
    /// </summary>
    /// <param name="userId">The user ID to set.</param>
    procedure setUserId(const userId: Integer);

    /// <summary>
    /// Gets the list of messages in the chat.
    /// </summary>
    /// <returns>A TList of IMessage.</returns>
    function getMessages(): TList<IMessage>;

    /// <summary>
    /// Sets the list of messages in the chat.
    /// </summary>
    /// <param name="message">The list of messages to set.</param>
    procedure setMessages(const message: TList<IMessage>);

    /// <summary>
    /// Gets the display name for the chat.
    /// </summary>
    /// <returns>The display name string.</returns>
    function getDisplayName(): string;

    /// <summary>
    /// Sets the display name for the chat.
    /// </summary>
    /// <param name="displayName">The display name to set.</param>
    procedure setDisplayName(const displayName: string);

    /// <summary>
    /// Represents the user's id of the chat
    /// </summary>
    property userId: Integer read getUserId write setUserId;

    /// <summary>
    /// Represents the messages of a chat
    /// </summary>
    property Messages: TList<IMessage> read getMessages write setMessages;

    /// <summary>
    /// Represents the display name of a chat
    /// </summary>
    property displayName: string read getDisplayName write setDisplayName;
  end;

implementation

end.
