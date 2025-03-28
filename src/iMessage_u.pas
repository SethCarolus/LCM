unit iMessage_u;

interface

type
  IMessage = interface

  function getId: Integer;
  procedure setId(const id: Integer);

  function getSenderId: Integer;
  procedure setSenderId(const senderId: Integer);

  function getReceiverId: Integer;
  procedure setReceiverId(const receiverId: Integer);

  function getContent: string;
  procedure setContent(const content: string);

  function getTimeStamp: TDateTime;
  procedure setTimeStamp(const timeStamp: TDateTime);

  function getIsRead: Boolean;
  procedure setIsRead(const isRead: Boolean);

  property Id: Integer read getId write setId;
  property SenderId: Integer read getSenderId write setSenderId;
  property ReceiverId: Integer read getReceiverId write setReceiverId;
  property Content: string read getContent write setContent;
  property TimeStamp: TDateTime read getTimeStamp write setTimeStamp;
  property IsRead: Boolean read getIsRead write setIsRead;
  end;

implementation

end.
