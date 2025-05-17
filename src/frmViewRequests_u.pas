unit frmViewRequests_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmViewRequests = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    Label1: TLabel;
    btnSend: TButton;
    lstDisplayNames: TListBox;
    GridPanel4: TGridPanel;
    btnBack: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure lstDisplayNamesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewRequests: TfrmViewRequests;

implementation

uses clsApplicationState_u, clsFactory_u;

{$R *.dfm}

procedure TfrmViewRequests.btnSendClick(Sender: TObject);
begin
  var handler := TFactory.createChatHandler();
  handler.acceptRequest(TApplicationState.SelectedUserForRequestAcceptance.Id, TApplicationState.CurrentUser.Id);

  Close();
end;

procedure TfrmViewRequests.FormActivate(Sender: TObject);
begin
  lstDisplayNames.Clear();
  for var u in TApplicationState.UsersForRequestAcceptance do
    begin
      lstDisplayNames.Items.Add(u.DisplayName);
    end;
end;

procedure TfrmViewRequests.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TApplicationState.UsersForRequestAcceptance := nil;
  TApplicationState.SelectedUserForRequestAcceptance := nil;
end;

procedure TfrmViewRequests.lstDisplayNamesClick(Sender: TObject);
begin
  var index := lstDisplayNames.ItemIndex;

  if (index = -1) then
    begin
      Exit;
    end;

  TApplicationState.SelectedUserForRequestAcceptance :=
    TApplicationState.UsersForRequestAcceptance[index];
end;

end.
