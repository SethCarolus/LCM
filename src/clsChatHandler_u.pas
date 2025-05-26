unit clsChatHandler_u;

interface

uses IChatHandler_u, Generics.Collections, iChat_u, iMessage_u, iUser_u,
  iUserHandler_u, iMessageHandler_u, iUserTypeHandler_u;

type
  TChatHandler = class(TInterfacedObject, IChatHandler)
  private
    fUserHandler: IUserHandler;
    fUserTypeHandler: IUserTypeHandler;
    fMessageHandler: iMessageHandler;
  public
    /// <summary>
    /// Retrieves the list of chats for a specific user.
    /// </summary>
    /// <param name="id">The user ID to retrieve chats for.</param>
    /// <returns>A TList of IChat representing the user's chats.</returns>
    function getChatsForUserWith(const id: Integer): TList<IChat>;

    /// <summary>
    /// Gets the new parts of chats for a user compared to existing chats.
    /// </summary>
    /// <param name="id">The user ID.</param>
    /// <param name="chats">The list of existing chats to compare.</param>
    /// <returns>A TList of IChat containing only new messages.</returns>
    function getNewPartOfChatsForUserWith(const id: Integer;
      const chats: TList<IChat>): TList<IChat>;

    /// <summary>
    /// Retrieves users available for chat requests for a specific user.
    /// </summary>
    /// <param name="id">The user ID.</param>
    /// <returns>A TList of IUser who can be requested for chat.</returns>
    function getChatRequestableUsersForUserWith(const id: Integer)
      : TList<IUser>;

    /// <summary>
    /// Retrieves all users who have had chat history with the specified user.
    /// </summary>
    /// <param name="userId">The user ID.</param>
    /// <returns>A TList of IUser who have chatted with the user.</returns>
    function getUsersInChatHistory(const userId: Integer): TList<IUser>;

    /// <summary>
    /// Retrieves users who have sent chat requests that the specified user can accept.
    /// </summary>
    /// <param name="id">The user ID.</param>
    /// <returns>A TList of IUser who sent pending chat requests.</returns>
    function getUsersForRequestAcceptanceForUserWith(const id: Integer)
      : TList<IUser>;

    function getNumberOfRequestsForUserWith(const id: Integer): Integer;

    /// <summary>
    /// Accepts a chat request from a sender to a receiver.
    /// </summary>
    /// <param name="senderId">The ID of the user who sent the request.</param>
    /// <param name="receiverId">The ID of the user accepting the request.</param>
    procedure acceptRequest(const senderId: Integer; const receiverId: Integer);

    /// <summary>
    /// Retrieves new chats for a user compared to an existing list of chats.
    /// </summary>
    /// <param name="id">The user ID.</param>
    /// <param name="chats">The list of existing chats.</param>
    /// <returns>A TList of IChat containing chats not in the existing list.</returns>
    function getNewChatsForUserWith(const id: Integer;
      const chats: TList<IChat>): TList<IChat>;

    /// <summary>
    /// Constructor for TChatHandler.
    /// </summary>
    /// <param name="userHandler">Instance of IUserHandler.</param>
    /// <param name="userTypeHandler">Instance of IUserTypeHandler.</param>
    /// <param name="messageHandler">Instance of IMessageHandler.</param>
    constructor create(const userHandler: IUserHandler;
      const userTypeHandler: IUserTypeHandler;
      const messageHandler: iMessageHandler);
  end;

implementation

uses clsFactory_u, dmMain_u;

{ TChatHandler }

procedure TChatHandler.acceptRequest(const senderId, receiverId: Integer);
begin
  with dmMain.qryChat do
  begin
    SQL.Text :=
    '''
      UPDATE tblMessageRequest SET accepted = Yes WHERE sender_id = : senderId AND
      receiver_id = : receiverId;
    ''';
    Parameters.ParamByName(' senderId ').Value := senderId; Parameters.
    ParamByName('receiverID').Value := receiverId;
    ExecSQL();
  end;

  var
  handler := TFactory.createMessageHandler();

  handler.sendMessage(senderId, receiverId,
    'Request Accepted. Enjoy using LCM Messaging');
end;

constructor TChatHandler.create(const userHandler: IUserHandler;
  const userTypeHandler: IUserTypeHandler;
  const messageHandler: iMessageHandler);
begin
  fUserHandler := userHandler;
  fUserTypeHandler := userTypeHandler;
  fMessageHandler := messageHandler;
end;

function TChatHandler.getChatRequestableUsersForUserWith(const id: Integer)
  : TList<IUser>;
begin
  Result := TList<IUser>.create();

  var
  usersInChatHistory := getUsersInChatHistory(id);

  var
  handler := TFactory.createUserHandler();

  var
  users := handler.getAllUsers();

  for var u in users do
  begin
    var
    bFound := false;
    for var uc in usersInChatHistory do
    begin
      if u.id = uc.id then
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
  Result := TList<IChat>.create();

  var
  users := getUsersInChatHistory(id);

  for var u in users do
  begin
    Result.Add(TFactory.createChat(fMessageHandler.getMessages(id, u.id), u.id,
      u.DisplayName))
  end;

end;

function TChatHandler.getNewChatsForUserWith(const id: Integer;
  const chats: TList<IChat>): TList<IChat>;
begin
  Result := TList<IChat>.create();
  var
  chatsFromDB := getChatsForUserWith(id);

  for var cDB in chatsFromDB do
  begin
    var
    bFound := True;
    for var c in chats do
    begin
      if cDB.userId = c.userId then
      begin
        bFound := True; // Found
      end;
    end;
    if (not bFound) then
      Result.Add(cDB);
  end;
end;

function TChatHandler.getNewPartOfChatsForUserWith(const id: Integer;
  const chats: TList<IChat>): TList<IChat>;
begin
  Result := TList<IChat>.create();

  var
  users := getUsersInChatHistory(id);

  for var c in chats do
  begin
    var
    messages := fMessageHandler.getMessages(id, c.userId);
    var
    newMessages := TList<IMessage>.create();

    for var i := c.messages.Count to messages.Count - 1 do
    begin
      newMessages.Add(messages[i]);
    end;

    Result.Add(TFactory.createChat(newMessages, c.userId, c.DisplayName))
  end;
end;

function TChatHandler.getNumberOfRequestsForUserWith(
  const id: Integer): Integer;
begin
  with dmMain.qryChat do
    begin
    SQL.Text :=
      '''
        SELECT COUNT(*) AS requests
        FROM tblUser, tblMessageRequest
        WHERE(tblUser.id = tblMessageRequest.sender_id) AND
        NOT accepted AND tblMessageRequest.receiver_id = :id
    ''';
    Parameters.ParamByName('id').Value := id;
    Open;
    Result := FieldByName('requests').Value;
    end;
end;

function TChatHandler.getUsersForRequestAcceptanceForUserWith(const id: Integer)
  : TList<IUser>;
begin
  Result := TList<IUser>.create();

  with dmMain.qryChat do
  begin
    SQL.Text :=
    '''
      SELECT sender_id, tblUser.id, username, first_name, last_name, display_name,
      created_on, last_login, user_type_id FROM tblUser,
      tblMessageRequest WHERE(tblUser.id = tblMessageRequest.sender_id) AND
      NOT accepted AND tblMessageRequest.receiver_id =
      :id
    ''';
      Parameters.ParamByName('id').Value := id;
    Open;
    while not Eof do
    begin
      Result.Add(fUserHandler.getUserWith(FieldByName('id').AsInteger));
      Next();
    end;
  end;
end;

function TChatHandler.getUsersInChatHistory(const userId: Integer)
  : TList<IUser>;
begin
  Result := TList<IUser>.create();

  var
  ids := TList<Integer>.create();

  // get ids
  with dmMain.qryChat do
  begin
    SQL.Text :=
    '''
      SELECT DISTINCT sender_id, receiver_id FROM tblMessage WHERE(sender_id = ?) OR
      (receiver_id = ?)
    ''';
    Parameters[0].Value := userId; Parameters[1].Value := userId;
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
  for var id in ids do
  begin
    Result.Add(fUserHandler.getUserWith(id));
  end;
end;

end.
