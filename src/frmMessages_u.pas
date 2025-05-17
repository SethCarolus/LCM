unit frmMessages_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Mask, Generics.Collections, Vcl.Buttons;

type
  TfrmMessages = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    Label1: TLabel;
    redChat: TRichEdit;
    edtMessage: TEdit;
    btnSendMessage: TButton;
    pnlChatName: TPanel;
    lstChatDisplayNames: TListBox;
    btnRequest: TButton;
    btnViewMessageRequests: TButton;
    btnRefresh: TButton;
    Timer1: TTimer;
    GridPanel4: TGridPanel;
    btnBack: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure lstChatDisplayNamesClick(Sender: TObject);
    procedure btnSendMessageClick(Sender: TObject);
    procedure edtMessageChange(Sender: TObject);
    procedure btnRequestClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnViewMessageRequestsClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
    function getContent(): string;
    procedure setContent(const content: string);
    property Content: string read getContent write setContent;

    function getSearch(): string;
    procedure setSearch(const search: string);
    property Search: string read getSearch write setSearch;

    procedure DisplayDisplayNames();
    procedure DisplayChat();
    procedure RefreshAsync();
    procedure DisplayNewMessages();
  public
    { Public declarations }
  end;

var
  frmMessages: TfrmMessages;
  sContent: string;
  sSearch: string;
implementation

uses clsFactory_u, clsApplicationState_u, IChatHandler_u, frmRequest_u,
     System.Threading, frmViewRequests_u;

{$R *.dfm}

procedure TfrmMessages.btnRefreshClick(Sender: TObject);
begin
  var handler := TFactory.createChatHandler();
  TApplicationState.Chats := handler.getChatsForUserWith(TApplicationState.CurrentUser.Id);

  DisplayDisplayNames();
end;

procedure TfrmMessages.btnRequestClick(Sender: TObject);
begin
  var handler := TFactory.createChatHandler();
  TApplicationState.UsersForRequest := handler.getChatRequestableUsersForUserWith(TApplicationState.CurrentUser.Id);

  var form := TfrmRequest.Create(Self);
  form.Show();

end;

procedure TfrmMessages.btnSendMessageClick(Sender: TObject);
begin
  var handler := TFactory.createMessageHandler();

  if (TApplicationState.SelectedChat = nil) then
    begin
      ShowMessage('You need to be in a chat to send a message.');
    end;

  handler.sendMessage(TApplicationState.CurrentUser.Id,
                      TApplicationState.SelectedChat.UserId,
                      Content);
  Content := '';
end;

procedure TfrmMessages.btnViewMessageRequestsClick(Sender: TObject);
begin
  var handler := TFactory.createChatHandler();

  TApplicationState.UsersForRequestAcceptance :=
    handler.getUsersForRequestAcceptanceForUserWith(TApplicationState.CurrentUser.Id);

  var form := TfrmViewRequests.Create(Self);
  form.Show();
end;

procedure TfrmMessages.DisplayChat;
begin
  pnlChatName.Caption := TApplicationState.SelectedChat.DisplayName;

  redChat.Clear;
  for var m in TApplicationState.SelectedChat.Messages do
    begin
      var sMessage := m.Content;
      if (m.SenderId = TApplicationState.CurrentUser.Id) then
        begin
          sMessage := 'You:' + #9 + sMessage;
        end
      else if (m.SenderId = TApplicationState.SelectedChat.UserId) then
        begin
          sMessage := TApplicationState.SelectedChat.DisplayName + ':' + #9 + sMessage;
        end;

      redChat.Lines.Add(sMessage);
    end;

end;

procedure TfrmMessages.DisplayDisplayNames;
begin
  if (TApplicationState.Chats = nil) then
    Exit;
  lstChatDisplayNames.Clear;
  for var c in TApplicationState.Chats do
    begin
      lstChatDisplayNames.Items.Add(c.DisplayName);
    end;
end;

procedure TfrmMessages.DisplayNewMessages;
begin
  if (TApplicationState.Chats = nil) or (TApplicationState.SelectedChat = nil) then
    Exit;

  for var m in TApplicationState.NewPartOfSelectedChat.Messages do
    begin
      var sMessage := m.Content;
      if (m.SenderId = TApplicationState.CurrentUser.Id) then
        begin
          sMessage := 'You:' + #9 + sMessage;
        end
      else if (m.SenderId = TApplicationState.SelectedChat.UserId) then
        begin
          sMessage := TApplicationState.SelectedChat.DisplayName + ':' + #9 + sMessage;
        end;

      redChat.Lines.Add(sMessage);
    end;
end;

procedure TfrmMessages.edtMessageChange(Sender: TObject);
begin
  Content := edtMessage.Text;
end;

procedure TfrmMessages.FormActivate(Sender: TObject);
begin
  var handler := TFactory.createChatHandler();
  TApplicationState.Chats := handler.getChatsForUserWith(TApplicationState.CurrentUser.Id);

  DisplayDisplayNames();

  redChat.Paragraph.TabCount := 2;
  redChat.Paragraph.Tab[0] := 100;
end;
function TfrmMessages.getContent: string;
begin
  Result := sContent;
end;

function TfrmMessages.getSearch: string;
begin
  Result := sSearch;
end;

procedure TfrmMessages.lstChatDisplayNamesClick(Sender: TObject);
begin
  var index := lstChatDisplayNames.ItemIndex;

  if (index = -1) then
    Exit;

  TApplicationState.SelectedChat := TApplicationState.Chats[index];
  DisplayChat();
end;

procedure TfrmMessages.RefreshAsync;
begin
  var handler := TFactory.createChatHandler();
  TTask.Run(
    procedure
      begin
        if (TApplicationState.CurrentUser = nil) then
          Exit;
       TApplicationState.Chats.AddRange(handler.getNewChatsForUserWith(
                                        TApplicationState.CurrentUser.Id,
                                        TApplicationState.Chats));
        TApplicationState.NewPartOfChats := handler.getNewPartOfChatsForUserWith(TApplicationState.CurrentUser.Id, TApplicationState.Chats);

        if (TApplicationState.SelectedChat <> nil) then
          begin
            var i := 0;
            for var c in TApplicationState.Chats do
              begin
                if (TApplicationState.SelectedChat.UserId = c.UserId) then
                  begin
                    TApplicationState.SelectedChat := c;
                    TApplicationState.NewPartOfSelectedChat := TApplicationState.NewPartOfChats[i];
                    break;
                  end;
                Inc(i);
              end;
          end;
      end
  ).Wait();
  DisplayDisplayNames();
  DisplayNewMessages();
  
  for var i := 0  to TApplicationState.Chats.Count - 1 do
    begin
      TApplicationState.Chats[i].Messages.AddRange(TApplicationState.NewPartOfChats[i].Messages)
    end;
  TApplicationState.NewPartOfChats := nil;
end;

procedure TfrmMessages.setContent(const content: string);
begin
  sContent := content;
  edtMessage.Text := sContent;
end;

procedure TfrmMessages.setSearch(const search: string);
begin
  sSearch := search;
end;

procedure TfrmMessages.Timer1Timer(Sender: TObject);
begin
  if (Self.Showing) then
    RefreshAsync();
end;

end.
