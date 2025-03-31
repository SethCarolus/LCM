unit frmRequest_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmRequest = class(TForm)
    GridPanel1: TGridPanel;
    Label1: TLabel;
    btnSend: TButton;
    lstDisplayNames: TListBox;
    procedure FormActivate(Sender: TObject);
    procedure lstDisplayNamesClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRequest: TfrmRequest;

implementation

uses clsApplicationState_u, clsFactory_u;

{$R *.dfm}

procedure TfrmRequest.btnSendClick(Sender: TObject);
begin
  if (TApplicationState.SelectedUserForRequest = nil) then
    begin
      ShowMessage('You need to select a user');
      Exit;
    end;

  var handler := TFactory.createUserHandler();
  handler.sendMessageRequest(TApplicationState.CurrentUser.Id,
                             TApplicationState.SelectedUserForRequest.Id);
end;

procedure TfrmRequest.FormActivate(Sender: TObject);
begin
  for var u in TApplicationState.UsersForRequest do
    begin
      lstDisplayNames.Items.Add(u.DisplayName);
    end;
end;

procedure TfrmRequest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TApplicationState.SelectedUserForRequest := nil;
  TApplicationState.UsersForRequest := nil;
end;

procedure TfrmRequest.lstDisplayNamesClick(Sender: TObject);
begin
  var index := lstDisplayNames.ItemIndex;

  if (index = -1) then
    Exit;

  TApplicationState.SelectedUserForRequest := TApplicationState.UsersForRequest[index];
end;

end.
