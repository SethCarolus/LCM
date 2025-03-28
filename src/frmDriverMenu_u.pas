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
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDriverMenu: TfrmDriverMenu;

implementation

{$R *.dfm}

end.
