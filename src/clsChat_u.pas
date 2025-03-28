unit clsChat_u;

interface
  uses iChat_u, Generics.Collections, iMessage_u;
type
  /// <summary>
  /// Represents a chat between two users
  /// </summary>
  TChat = class(TInterfacedObject, iChat)
    private
      fMessages: TList<IMessage>;
      fDisplayName: string;

      function getMessages(): TList<IMessage>;
      procedure setMessages(const message: TList<IMessage>);

      function getDisplayName(): string;
      procedure setDisplayName(const displayName: string);
    public

      constructor create(const messages: TList<IMessage>; const displayName: string);

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

constructor TChat.create(const messages: TList<IMessage>;
  const displayName: string);
begin
  Self.Messages := messages;
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

procedure TChat.setDisplayName(const displayName: string);
begin
  fDisplayName := displayName;
end;

procedure TChat.setMessages(const message: TList<IMessage>);
begin
  fMessages := message;
end;

end.
