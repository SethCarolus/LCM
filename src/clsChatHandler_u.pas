unit clsChatHandler_u;

interface

uses IChatHandler_u, Generics.Collections, iChat_u;

type
  TChatHandler = class(TInterfacedObject, IChatHandler)
    function getChatsForUserWith(const id: Integer): TList<IChat>;
  end;

implementation

uses iMessageHandler_u, clsFactory_u;

{ TChatHandler }

function TChatHandler.getChatsForUserWith(const id: Integer): TList<IChat>;
begin

  Result := TList<IChat>.Create();

  var messageHandler := TFactory.createMessageHandler();

  var users := messageHandler.getUsersInChatHistory(id);

  for var u in users do
    begin
       Result.Add(TFactory.createChat(messageHandler.getMessages(id, u.Id),u.DisplayName))
    end;

end;

end.
