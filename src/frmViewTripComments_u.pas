unit frmViewTripComments_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPanels, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons;

type
  TfrmViewTripComments = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    lstComments: TListBox;
    StackPanel3: TStackPanel;
    Label2: TLabel;
    edtName: TLabeledEdit;
    StackPanel4: TStackPanel;
    StackPanel1: TStackPanel;
    memContent: TMemo;
    Label1: TLabel;
    GridPanel4: TGridPanel;
    btnBack: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure lstCommentsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewTripComments: TfrmViewTripComments;

implementation

uses clsFactory_u, clsApplicationState_u;

{$R *.dfm}

procedure TfrmViewTripComments.FormActivate(Sender: TObject);
begin
  lstComments.Clear();
  for var c in TApplicationState.Comments do
    begin
      lstComments.Items.Add(c.Header);
    end;
end;

procedure TfrmViewTripComments.lstCommentsClick(Sender: TObject);
begin
  var index := lstComments.ItemIndex;

  if (index = -1) then
    begin
      ShowMessage('Please select a comment!');
      Exit;
    end;
  TApplicationState.SelectedComment := TApplicationState.Comments[index];
  memContent.Text := TApplicationState.SelectedComment.Content;

  edtName.Text := TApplicationState.SelectedComment.User.FirstName + ' ' +
                  TApplicationState.SelectedComment.User.LastName;

end;

end.
