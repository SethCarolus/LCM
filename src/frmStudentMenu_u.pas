unit frmStudentMenu_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmStudentMenu = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    btnMessages: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Panel1: TPanel;
    procedure btnMessagesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStudentMenu: TfrmStudentMenu;

implementation

uses frmMessages_u;

{$R *.dfm}

procedure TfrmStudentMenu.btnMessagesClick(Sender: TObject);
begin
  var form := TfrmMessages.Create(Self);
  try
    Hide();
    form.ShowModal;
  finally
    FreeAndNil(form);
  end;
  Show;
end;

end.
