unit frmMessages_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Mask, Generics.Collections;

type
  TfrmMessages = class(TForm)
    GridPanel1: TGridPanel;
    Label1: TLabel;
    edtSearch: TLabeledEdit;
    redChat: TRichEdit;
    edtMessage: TEdit;
    btnSendMessage: TButton;
    pnlChatName: TPanel;
    lstChatDisplayNames: TListBox;
    procedure FormActivate(Sender: TObject);
    procedure lstChatDisplayNamesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMessages: TfrmMessages;

implementation

uses clsFactory_u, clsApplicationState_u, IChatHandler_u;

{$R *.dfm}

procedure TfrmMessages.FormActivate(Sender: TObject);
begin
  var handler := TFactory.createChatHandler();
  TApplicationState.Chats := handler.getChatsForUserWith(TApplicationState.CurrentUser.Id);

  for var c in TApplicationState.Chats do
    begin
      lstChatDisplayNames.Items.Add(c.DisplayName);
    end;

  redChat.Paragraph.TabCount := 1;
  redChat.Paragraph.Tab[0] := 50;

end;
procedure TfrmMessages.lstChatDisplayNamesClick(Sender: TObject);
begin
  var index := lstChatDisplayNames.ItemIndex;

  if (index = -1) then
    Exit;

  pnlChatName.Caption := TApplicationState.Chats[index].DisplayName;

  redChat.Clear;
  for var m in TApplicationState.Chats[index].Messages do
    begin
      var sMessage := m.Content;
      if (m.ReceiverId = TApplicationState.CurrentUser.Id) then
        begin
          sMessage := lstChatDisplayNames.Items[index] + #9 + sMessage;
        end
      else
        begin
          sMessage := 'You' + #9 + sMessage;
        end;

      redChat.Lines.Add(sMessage);
    end;

end;

end.
