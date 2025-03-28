unit clsMessage_u;

interface

uses iMessage_u;

type
  TMessage = class(TInterfacedObject, IMessage)
    private
      fId: Integer;
      fSenderId: Integer;
      fReceiverId: Integer;
      fContent: string;
      fTimeStamp: TDateTime;
      fIsRead: Boolean;

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
    public

      constructor create(const id: Integer; const senderId: Integer;
                         const receiverId: Integer; const content: string;
                         const timeStamp: TDateTime; const isRead: Boolean);
      property Id: Integer read getId write setId;
      property SenderId: Integer read getSenderId write setSenderId;
      property ReceiverId: Integer read getReceiverId write setReceiverId;
      property Content: string read getContent write setContent;
      property TimeStamp: TDateTime read getTimeStamp write setTimeStamp;
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
