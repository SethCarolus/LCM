unit frmParentMenu_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmParentMenu = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    GridPanel3: TGridPanel;
    btnMessages: TButton;
    btnTripPayments: TButton;
    btnHabits: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Panel1: TPanel;
    GridPanel4: TGridPanel;
    btnBack: TBitBtn;
    procedure btnMessagesClick(Sender: TObject);
    procedure btnTripPaymentsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnHabitsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParentMenu: TfrmParentMenu;

implementation

uses frmMessages_u, frmManageTripPayment_u, clsApplicationState_u,
    Generics.Collections, clsFactory_u, frmViewHabits_u;

{$R *.dfm}

procedure TfrmParentMenu.btnHabitsClick(Sender: TObject);
begin
  var form := TfrmViewHabits.Create(Self);
  try
    Hide();
    form.ShowModal;
  finally
    FreeAndNil(form);
  end;
  Show;
end;

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
