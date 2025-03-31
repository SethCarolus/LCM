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

      function getUserId: Integer;
      procedure setUserId(const userId: Integer);

      function getMessages(): TList<IMessage>;
      procedure setMessages(const message: TList<IMessage>);

      function getDisplayName(): string;
      procedure setDisplayName(const displayName: string);
    public

      constructor create(const messages: TList<IMessage>;const userId: Integer
                         ;const displayName: string);

      /// <summary>
      /// Represents the user's id of the chat
      /// </summary>
      property UserId: Integer read getUserId write setUserId;

      /// <summary>
      /// Represents the messages of a chat
      /// </summary>
      property Messages: TList<IMessage> read getMessages write setMessages;

      /// <summary>
      /// Represents the display name of a chat
      /// </summary>
      property DisplayName: string read getDisplayName write setDisplayName;
  end;

implementation

{ TChat }

constructor TChat.create(const messages: TList<IMessage>;const userId: Integer
                         ;const displayName: string);
begin
  Self.Messages := messages;
  Self.UserId := userId;
  Self.DisplayName := displayName;
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
