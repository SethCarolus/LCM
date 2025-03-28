unit clsMessageHandler_u;

interface

uses iMessageHandler_u, Generics.Collections, iMessage_u, iUser_u;

type
  TMessageHandler = class(TInterfacedObject, IMessageHandler)

  public
    function GetMessages(const currentUserId: Integer; const otherUserId: Integer)
                                                              : TList<IMessage>;
    function getUsersInChatHistory(const userId: Integer): TList<IUser>;
  end;

implementation

uses dmMain_u, clsFactory_u;

{ TMessageHandler }

function TMessageHandler.getUsersInChatHistory(const userId: Integer): TList<IUser>;
begin
  Result := TList<IUser>.Create();

  var ids := TList<Integer>.Create();

  // get ids
  with dmMain.qryMain do
    begin
      Sql.Text :=
      '''
        SELECT DISTINCT sender_id, receiver_id
        FROM tblMessage
        WHERE (sender_id = ?) OR
              (receiver_id = ?)
      ''';
       Parameters[0].Value := userId;
       Parameters[1].Value := userId;
       Open();

       First();
       while not Eof do
        begin
          if (FieldByName('sender_id').AsInteger = userId) then
            begin
              if not ids.Contains(FieldByName('receiver_id').AsInteger) then
                ids.Add(FieldByName('receiver_id').AsInteger);
            end
          else if (FieldByName('receiver_id').AsInteger = userId) then
            begin
              if not ids.Contains(FieldByName('sender_id').AsInteger) then
                ids.Add(FieldByName('sender_id').AsInteger);
            end;
          Next();
        end;
    end;
  // get users
  var userHandler := TFactory.createUserHandler();
  for var id in ids do
    begin
      Result.Add(userHandler.getUserWith(id));
    end;
end;

function TMessageHandler.GetMessages(const currentUserId,
  otherUserId: Integer): TList<IMessage>;
begin
  Result := TList<IMessage>.Create();

  With dmMain.qryMain do
    begin
       SQL.Text :=
       '''
          SELECT *
          FROM tblMessage
          WHERE (sender_id = ? AND receiver_id = ?) OR
                (sender_id = ? AND receiver_id = ?)
          ORDER BY time_stamp ASC
       ''';
       // Bind parameters by position
       Parameters[0].Value := currentUserId;
       Parameters[1].Value := otherUserId;
       Parameters[2].Value := otherUserId;
       Parameters[3].Value := currentUserId;
       Open();

       First();
       while not Eof do
        begin
          Result.Add(TFactory.createMessage(
                                              FieldByName('id').AsInteger,
                                              FieldByName('sender_id').AsInteger,
                                              FieldByName('receiver_id').AsInteger,
                                              FieldByName('content').AsString,
                                              FieldByName('time_stamp').AsDateTime,
                                              FieldByName('is_read').AsBoolean));
          Next();
        end;
    end;
end;

end.
