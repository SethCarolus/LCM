unit iMessage_u;

interface

type
  IMessage = interface
    /// <summary>
    /// Gets the unique ID of the message.
    /// </summary>
    /// <returns>The ID of the message.</returns>
    function getId: Integer;
    /// <summary>
    /// Sets the unique ID of the message.
    /// </summary>
    /// <param name="id">The ID to assign to the message.</param>
    procedure setId(const id: Integer);

    /// <summary>
    /// Gets the sender's user ID.
    /// </summary>
    /// <returns>The sender's user ID.</returns>
    function getSenderId: Integer;

    /// <summary>
    /// Sets the sender's user ID.
    /// </summary>
    /// <param name="senderId">The sender's ID.</param>
    procedure setSenderId(const senderId: Integer);

    /// <summary>
    /// Gets the receiver's user ID.
    /// </summary>
    /// <returns>The receiver's user ID.</returns>
    function getReceiverId: Integer;

    /// <summary>
    /// Sets the receiver's user ID.
    /// </summary>
    /// <param name="receiverId">The receiver's ID.</param>
    procedure setReceiverId(const receiverId: Integer);

    /// <summary>
    /// Gets the content of the message.
    /// </summary>
    /// <returns>The message content as a string.</returns>
    function getContent: string;

    /// <summary>
    /// Sets the content of the message.
    /// </summary>
    /// <param name="content">The message content.</param>
    procedure setContent(const content: string);

    /// <summary>
    /// Gets the timestamp when the message was sent.
    /// </summary>
    /// <returns>The message timestamp.</returns>
    function getTimeStamp: TDateTime;

    /// <summary>
    /// Sets the timestamp for when the message was sent.
    /// </summary>
    /// <param name="timeStamp">The time the message was sent.</param>
    procedure setTimeStamp(const timeStamp: TDateTime);

    /// <summary>
    /// Gets whether the message has been read.
    /// </summary>
    /// <returns>True if the message was read, False otherwise.</returns>
    function getIsRead: Boolean;

    /// <summary>
    /// Sets the read status of the message.
    /// </summary>
    /// <param name="isRead">True if read, False otherwise.</param>
    procedure setIsRead(const isRead: Boolean);

    /// <summary>
    /// The unique ID of the message.
    /// </summary>
    property id: Integer read getId write setId;

    /// <summary>
    /// The ID of the sender.
    /// </summary>
    property senderId: Integer read getSenderId write setSenderId;

    /// <summary>
    /// The ID of the receiver.
    /// </summary>
    property receiverId: Integer read getReceiverId write setReceiverId;

    /// <summary>
    /// The textual content of the message.
    /// </summary>
    property content: string read getContent write setContent;

    /// <summary>
    /// The date and time the message was sent.
    /// </summary>
    property timeStamp: TDateTime read getTimeStamp write setTimeStamp;

    /// <summary>
    /// Indicates whether the message has been marked as read.
    /// </summary>
    property isRead: Boolean read getIsRead write setIsRead;
  end;

implementation

end.
