unit clsChatHandler_u;

interface

uses IChatHandler_u, Generics.Collections, iChat_u, iMessage_u, iUser_u;

type
  TChatHandler = class(TInterfacedObject, IChatHandler)
    function getChatsForUserWith(const id: Integer): TList<IChat>;

    function getNewPartOfChatsForUserWith(const id: Integer; const chats: TList<IChat>): TList<iChat>;

    function getChatRequestableUsersForUserWith(const id: Integer): TList<IUser>;

    function getUsersInChatHistory(const userId: Integer): TList<IUser>;

    function getUsersForRequestAcceptanceForUserWith(const id: Integer): TList<IUser>;

    procedure acceptRequest(const senderId: Integer; const receiverId: Integer);

    function getNewChatsForUserWith(const id: Integer;const chats: TList<IChat>): TList<IChat>;
  end;

implementation

uses iMessageHandler_u, clsFactory_u, dmMain_u;

{ TChatHandler }

procedure TChatHandler.acceptRequest(const senderId, receiverId: Integer);
begin
  with dmMain.qryMain do
    begin
      SQL.Text :=
      '''
        UPDATE tblMessageRequest
        SET accepted = Yes
        WHERE sender_id = :senderId AND receiver_id = :receiverId;
      ''';
      Parameters.ParamByName('senderId').Value := senderId;
      Parameters.ParamByName('receiverID').Value := receiverId;
      ExecSQL();
    end;

  var handler := TFactory.createMessageHandler();

  handler.sendMessage(senderId, receiverId, 'Request Accepted. Enjoy using LCM Messaging');
end;

function TChatHandler.getChatRequestableUsersForUserWith(
  const id: Integer): TList<IUser>;
begin
  Result := TList<IUser>.Create();

   var usersInChatHistory := getUsersInChatHistory(id);

   var handler := TFactory.createUserHandler();

   var users := handler.getAllUsers();

   for var u in users do
      begin
        var bFound := false;
        for var uc in usersInChatHistory do
          begin
            if u.id = uc.Id then
              begin
                bFound := True;
                Break;
              end;
          end;
        if (not bFound) and (u.id <> id) then
          Result.Add(u);
      end;
end;

function TChatHandler.getChatsForUserWith(const id: Integer): TList<IChat>;
begin
  Result := TList<IChat>.Create();
  var handler := TFactory.createMessageHandler();

  var users := getUsersInChatHistory(id);

  for var u in users do
    begin
       Result.Add(TFactory.createChat(handler.getMessages(id, u.Id), u.Id, u.DisplayName))
    end;

end;

function TChatHandler.getNewChatsForUserWith(const id: Integer;const chats: TList<IChat>): TList<IChat>;
begin
  Result := TList<IChat>.Create();
  var chatsFromDB := getChatsForUserWith(id);

  for var cDB in chatsFromDB do
    begin
      var bFound := true;
      for var c in chats do
        begin
          if cDB.UserId = c.UserId then
            begin
              bFound := True;  // Found
            end;
        end;
      if (not bFound) then
        Result.Add(cDB);
    end;
end;

function TChatHandler.getNewPartOfChatsForUserWith(const id: Integer; const chats: TList<IChat>): TList<iChat>;
begin
  Result := TList<IChat>.Create();

  var handler := TFactory.createMessageHandler();

  var users := getUsersInChatHistory(id);

  for var c in chats do
    begin
      var messages := handler.getMessages(id, c.UserId);
      var newMessages := TList<IMessage>.Create();

      for var i := c.Messages.Count to messages.Count -1 do
          begin
            newMessages.Add(messages[i]);
          end;

      Result.Add(TFactory.createChat(newMessages, c.UserId, c.DisplayName))
    end;
end;
function TChatHandler.getUsersForRequestAcceptanceForUserWith(
  const id: Integer): TList<IUser>;
begin
  Result := TList<IUser>.Create();
  var userTypeIds := TList<Integer>.Create();

  var userTypeHandler := TFactory.createUserTypeHandler();

  with dmMain.qryMain do
    begin
      SQL.Text :=
      '''
        SELECT sender_id, tblUser.ID, username, first_name, last_name,
                display_name, created_on, last_login, user_type_id
        FROM tblUser, tblMessageRequest
        WHERE (tblUser.ID = tblMessageRequest.sender_id) AND NOT accepted AND
          tblMessageRequest.receiver_id = :id
      ''';
      Parameters.ParamByName('id').Value := id;
      Open;
      while not Eof do
        begin
          Result.Add(TFactory.createUser(
                                        FieldByName('id').AsInteger,
                                        FieldByName('username').AsString,
                                        FieldByName('first_name').AsString,
                                        FieldByName('last_name').AsString,
                                        FieldByName('display_name').AsString,
                                        FieldByName('created_on').AsDateTime,
                                        FieldByName('last_login').AsDateTime, nil));
          userTypeIds.Add(FieldByName('user_type_id').AsInteger);
          Next();
        end;
    end;

   for var i := 0 to Result.Count - 1 do
    begin
      Result[i].UserType := userTypeHandler.getUserTypeWith(userTypeIds[i]);
    end;
end;

function TChatHandler.getUsersInChatHistory(
  const userId: Integer): TList<IUser>;
begin
  Result := TList<IUser>.Create();

  var ids := TList<Integer>.Create();

  // get ids
  with dmMain.qryMain do
    begin
      SQL.Text :=
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

end.
