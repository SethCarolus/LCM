unit iChat_u;

interface

uses Generics.Collections, iMessage_u;

type
  /// <summary>
  /// An interface a chat between two users
  /// </summary>
  iChat = interface
    function getMessages(): TList<IMessage>;
    procedure setMessages(const message: TList<IMessage>);

    function getDisplayName(): string;
    procedure setDisplayName(const displayName: string);

    /// <summary>
    ///   Represents the messages of a chat
    /// </summary>
    property Messages: TList<IMessage> read getMessages write setMessages;

    /// <summary>
    ///   Represents the display name of a chat
    /// </summary>
    property DisplayName: string read getDisplayName write setDisplayName;
  end;

implementation

end.
