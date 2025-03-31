unit clsMessageHandler_u;

interface

uses iMessageHandler_u, Generics.Collections, iMessage_u, iUser_u;

type
  TMessageHandler = class(TInterfacedObject, IMessageHandler)

  public
    function getMessages(const currentUserId: Integer; const otherUserId: Integer)
                                                              : TList<IMessage>;

    procedure sendMessage(const senderId, receiverId: Integer; const content: string);

    function getNewMessages(const currentUserId: Integer; const otherUserId: Integer;
                            const lastUpdated: TDateTime): TList<IMessage>;
  end;

implementation

uses dmMain_u, clsFactory_u, SysUtils;

{ TMessageHandler }

procedure TMessageHandler.sendMessage(const senderId, receiverId: Integer;
  const content: string);
begin
  with dmMain.qryMain do
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

  with dmMain.qryMain do
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

  with dmMain.qryMain do
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
