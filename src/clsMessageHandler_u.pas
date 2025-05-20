unit clsMessageHandler_u;

interface

uses iMessageHandler_u, Generics.Collections, iMessage_u, iUser_u;

type

  ///<summary>
  /// Handles sending and retrieving messages between users.
  ///</summary>
  TMessageHandler = class(TInterfacedObject, IMessageHandler)

  public

    ///<summary>
    /// Retrieves the full message history between two users, sorted by timestamp.
    ///</summary>
    ///<param name="currentUserId">The ID of the current user.</param>
    ///<param name="otherUserId">The ID of the other user in the conversation.</param>
    ///<returns>A list of IMessage objects representing the conversation history.</returns>
    function getMessages(const currentUserId: Integer; const otherUserId: Integer)
                                                              : TList<IMessage>;
    ///<summary>
    /// Sends a new message from one user to another.
    ///</summary>
    ///<param name="senderId">The ID of the user sending the message.</param>
    ///<param name="receiverId">The ID of the user receiving the message.</param>
    ///<param name="content">The content of the message.</param>
    procedure sendMessage(const senderId, receiverId: Integer; const content: string);

    ///<summary>
    /// Retrieves new messages between two users sent after the last update timestamp.
    ///</summary>
    ///<param name="currentUserId">The ID of the current user.</param>
    ///<param name="otherUserId">The ID of the other user in the conversation.</param>
    ///<param name="lastUpdated">The last time messages were retrieved.</param>
    ///<returns>A list of IMessage objects representing the new messages.</returns>
    function getNewMessages(const currentUserId: Integer; const otherUserId: Integer;
                            const lastUpdated: TDateTime): TList<IMessage>;
  end;

implementation

uses dmMain_u, clsFactory_u, SysUtils;

{ TMessageHandler }

procedure TMessageHandler.sendMessage(const senderId, receiverId: Integer;
  const content: string);
begin
  with dmMain.qryMessage do
    begin
      Close();
      SQL.Text :=
      '''
        INSERT
        INTO tblMessage
        (sender_id, receiver_id, content, time_stamp, is_read)
        VALUES (:senderId, :receiverId, :content, :timeStamp, No);
      ''';
      Parameters.ParamByName('senderId').Value := senderId;
      Parameters.ParamByName('receiverId').Value := receiverId;
      Parameters.ParamByName('content').Value := content;
      Parameters.ParamByName('timeStamp').Value := Now;
      ExecSQL();
    end;
end;

function TMessageHandler.GetMessages(const currentUserId,
  otherUserId: Integer): TList<IMessage>;
begin
  Result := TList<IMessage>.Create();

  with dmMain.qryMessage do
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

function TMessageHandler.getNewMessages(const currentUserId,
  otherUserId: Integer; const lastUpdated: TDateTime): TList<IMessage>;
begin
  Result := TList<IMessage>.Create();

  with dmMain.qryMessage do
    begin
       SQL.Text :=
       '''
          SELECT *
          FROM tblMessage
          WHERE ((sender_id = ? AND receiver_id = ?) OR
                (sender_id = ? AND receiver_id = ?) ) AND
                time_stamp > ?
          ORDER BY time_stamp ASC
       ''';
       // Bind parameters by position
       Parameters[0].Value := currentUserId;
       Parameters[1].Value := otherUserId;
       Parameters[2].Value := otherUserId;
       Parameters[3].Value := currentUserId;
       Parameters[4].Value := lastUpdated;
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
