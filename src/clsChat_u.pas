unit clsChat_u;

interface

uses iChat_u, Generics.Collections, iMessage_u;

type
  /// <summary>
  /// Represents a chat between two users
  /// </summary>
  TChat = class(TInterfacedObject, iChat)
  private
    fUserId: Integer;
    fMessages: TList<IMessage>;
    fDisplayName: string;

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

  public
    /// <summary>
    /// Constructor to create a chat instance.
    /// </summary>
    /// <param name="messages">The list of messages in the chat.</param>
    /// <param name="userId">The user ID involved in the chat.</param>
    /// <param name="displayName">The display name of the chat.</param>
    constructor create(const messages: TList<IMessage>; const userId: Integer;
      const displayName: string);

    /// <summary>
    /// Represents the user's id of the chat
    /// </summary>
    property userId: Integer read getUserId write setUserId;

    /// <summary>
    /// Represents the messages of a chat
    /// </summary>
    property messages: TList<IMessage> read getMessages write setMessages;

    /// <summary>
    /// Represents the display name of a chat
    /// </summary>
    property displayName: string read getDisplayName write setDisplayName;
  end;

implementation

{ TChat }

constructor TChat.create(const messages: TList<IMessage>; const userId: Integer;
  const displayName: string);
begin
  Self.messages := messages;
  Self.userId := userId;
  Self.displayName := displayName;
end;

function TChat.getDisplayName: string;
begin
  Result := fDisplayName;
end;

function TChat.getMessages: TList<IMessage>;
begin
  Result := fMessages;
end;

function TChat.getUserId: Integer;
begin
  Result := fUserId;
end;

procedure TChat.setDisplayName(const displayName: string);
begin
  fDisplayName := displayName;
end;

procedure TChat.setMessages(const message: TList<IMessage>);
begin
  fMessages := message;
end;

procedure TChat.setUserId(const userId: Integer);
begin
  fUserId := userId;
end;

end.
