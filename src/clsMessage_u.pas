unit clsMessage_u;

interface

uses iMessage_u;

type
  ///<summary>
  /// Represents a single message exchanged between two users.
  ///</summary>
  TMessage = class(TInterfacedObject, IMessage)
  private
    fId: Integer;
    fSenderId: Integer;
    fReceiverId: Integer;
    fContent: string;
    fTimeStamp: TDateTime;
    fIsRead: Boolean;

    ///<summary>
    /// Gets the unique ID of the message.
    ///</summary>
    ///<returns>The ID of the message.</returns>
    function getId: Integer;
    ///<summary>
    /// Sets the unique ID of the message.
    ///</summary>
    ///<param name="id">The ID to assign to the message.</param>
    procedure setId(const id: Integer);

    ///<summary>
    /// Gets the sender's user ID.
    ///</summary>
    ///<returns>The sender's user ID.</returns>
    function getSenderId: Integer;

    ///<summary>
    /// Sets the sender's user ID.
    ///</summary>
    ///<param name="senderId">The sender's ID.</param>
    procedure setSenderId(const senderId: Integer);

    ///<summary>
    /// Gets the receiver's user ID.
    ///</summary>
    ///<returns>The receiver's user ID.</returns>
    function getReceiverId: Integer;
    ///<summary>
    /// Sets the receiver's user ID.
    ///</summary>
    ///<param name="receiverId">The receiver's ID.</param>
    procedure setReceiverId(const receiverId: Integer);

    ///<summary>
    /// Gets the content of the message.
    ///</summary>
    ///<returns>The message content as a string.</returns>
    function getContent: string;

    ///<summary>
    /// Sets the content of the message.
    ///</summary>
    ///<param name="content">The message content.</param>
    procedure setContent(const content: string);

    ///<summary>
    /// Gets the timestamp when the message was sent.
    ///</summary>
    ///<returns>The message timestamp.</returns>
    function getTimeStamp: TDateTime;
    ///<summary>
    /// Sets the timestamp for when the message was sent.
    ///</summary>
    ///<param name="timeStamp">The time the message was sent.</param>
    procedure setTimeStamp(const timeStamp: TDateTime);

    ///<summary>
    /// Gets whether the message has been read.
    ///</summary>
    ///<returns>True if the message was read, False otherwise.</returns>
    function getIsRead: Boolean;
    ///<summary>
    /// Sets the read status of the message.
    ///</summary>
    ///<param name="isRead">True if read, False otherwise.</param>
    procedure setIsRead(const isRead: Boolean);

  public
    ///<summary>
    /// Constructs a new message with the given parameters.
    ///</summary>
    ///<param name="id">The unique identifier of the message.</param>
    ///<param name="senderId">The ID of the user sending the message.</param>
    ///<param name="receiverId">The ID of the user receiving the message.</param>
    ///<param name="content">The content of the message.</param>
    ///<param name="timeStamp">The timestamp when the message was sent.</param>
    ///<param name="isRead">Indicates whether the message has been read.</param>
    constructor create(const id: Integer; const senderId: Integer;
                       const receiverId: Integer; const content: string;
                       const timeStamp: TDateTime; const isRead: Boolean);

    ///<summary>
    /// The unique ID of the message.
    ///</summary>
    property Id: Integer read getId write setId;

    ///<summary>
    /// The ID of the sender.
    ///</summary>
    property SenderId: Integer read getSenderId write setSenderId;

    ///<summary>
    /// The ID of the receiver.
    ///</summary>
    property ReceiverId: Integer read getReceiverId write setReceiverId;

    ///<summary>
    /// The textual content of the message.
    ///</summary>
    property Content: string read getContent write setContent;

    ///<summary>
    /// The date and time the message was sent.
    ///</summary>
    property TimeStamp: TDateTime read getTimeStamp write setTimeStamp;

    ///<summary>
    /// Indicates whether the message has been marked as read.
    ///</summary>
    property IsRead: Boolean read getIsRead write setIsRead;
  end;

implementation

{ TMessage }

constructor TMessage.create(const id, senderId, receiverId: Integer;
  const content: string; const timeStamp: TDateTime; const isRead: Boolean);
begin
   Self.Id := id;
   Self.SenderId := senderId;
   Self.ReceiverId := receiverId;
   Self.Content := content;
   Self.TimeStamp :=  timeStamp;
   Self.IsRead := isRead;
end;

function TMessage.getContent: string;
begin
  Result := fContent;
end;

function TMessage.getId: Integer;
begin
  Result := fId;
end;

function TMessage.getIsRead: Boolean;
begin
  Result := fIsRead;
end;

function TMessage.getReceiverId: Integer;
begin
  Result := fReceiverId;
end;

function TMessage.getSenderId: Integer;
begin
  Result := fSenderId;
end;

function TMessage.getTimeStamp: TDateTime;
begin
  Result := fTimeStamp;
end;

procedure TMessage.setContent(const content: string);
begin
  fContent := content;
end;

procedure TMessage.setId(const id: Integer);
begin
  fId := id;
end;

procedure TMessage.setIsRead(const isRead: Boolean);
begin
  fIsRead := isRead;
end;

procedure TMessage.setReceiverId(const receiverId: Integer);
begin
  fReceiverId := receiverId;
end;

procedure TMessage.setSenderId(const senderId: Integer);
begin
  fSenderId := senderId;
end;

procedure TMessage.setTimeStamp(const timeStamp: TDateTime);
begin
  fTimeStamp := timeStamp;
end;

end.
