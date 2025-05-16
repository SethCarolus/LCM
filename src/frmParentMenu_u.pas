unit frmParentMenu_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmParentMenu = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    btnMessages: TButton;
    btnTripPayments: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Panel1: TPanel;
    procedure btnMessagesClick(Sender: TObject);
    procedure btnTripPaymentsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParentMenu: TfrmParentMenu;

implementation

uses frmMessages_u, frmManageTripPayment_u, clsApplicationState_u,
    Generics.Collections, clsFactory_u;

{$R *.dfm}

procedure TfrmParentMenu.btnMessagesClick(Sender: TObject);
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

procedure TfrmParentMenu.btnTripPaymentsClick(Sender: TObject);
begin
  var form := TfrmManagePayment.Create(Self);
  try
    Hide();
    form.ShowModal;
  finally
    FreeAndNil(form);
  end;
  Show;
end;
procedure TfrmParentMenu.FormShow(Sender: TObject);
begin
  var handler := TFactory.createParentHandler();
  TApplicationState.CurrentParent :=
    handler.getParent(TApplicationState.CurrentUser.Id);
end;

end.
