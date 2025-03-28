unit frmDriverMenu_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask;

type
  TfrmDriverMenu = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    Panel1: TPanel;
    btnMessages: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure btnMessagesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDriverMenu: TfrmDriverMenu;

implementation

uses frmMessages_u;

{$R *.dfm}

procedure TfrmDriverMenu.btnMessagesClick(Sender: TObject);
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
