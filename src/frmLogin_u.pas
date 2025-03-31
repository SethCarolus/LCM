unit frmLogin_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Imaging.pngimage;

type
  TfrmMain = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    btnLogin: TButton;
    Image1: TImage;
    edtUsername: TEdit;
    edtPassword: TEdit;
    procedure btnLoginClick(Sender: TObject);
    procedure edtUsernameChange(Sender: TObject);
    procedure edtPasswordChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    function getUsername(): string;
    procedure setUsername(const username: string);
    property Username: string read getUsername write setUsername;

    function getPassword(): string;
    procedure setPassword(const password: string);
    property Password: string read getPassword write setPassword;

    procedure navigate();
  end;

var
  frmMain: TfrmMain;

implementation
{$R *.dfm}

uses login_u, iUserTypeHandler_u, clsApplicationState_u, iUserHandler_u,
     frmDriverMenu_u, frmStudentMenu_u, frmParentMenu_u;

var
  sUsername: string;
  sPassword: string;

procedure TfrmMain.btnLoginClick(Sender: TObject);
begin
  if not login(Username, Password) then
    begin
      ShowMessage('Login Failed!');
      Exit;
    end;
  ShowMessage('Welcome to LCM');

  TApplicationState.CurrentUser := getUserWith(Username);

  Navigate();
end;

procedure TfrmMain.edtPasswordChange(Sender: TObject);
begin
  Password := edtPassword.Text;
end;

procedure TfrmMain.edtUsernameChange(Sender: TObject);
begin
  Username := edtUsername.Text;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  Username := edtUsername.Text;
  Password := edtPassword.Text;
end;

function TfrmMain.getPassword: string;
begin
  Result := sPassword;
end;

function TfrmMain.getUsername: string;
begin
  Result := sUsername;
end;

procedure TfrmMain.navigate;
begin
  var userTypeId := GetUserTypeIdWith(Username);

  case userTypeId of
    // Driver
    1:
      begin
        ShowMessage('Welcome Driver!');
        var form := TFrmDriverMenu.Create(Self);
        try
          Hide();
          form.ShowModal();
        finally
          FreeAndNil(form)
        end;
        Show();
      end;
    // Learner
    2:
      begin
        ShowMessage('Welcome Parent!');
        var form := TFrmParentMenu.Create(Self);
        try
          Hide();
          form.ShowModal();
        finally
          FreeAndNil(form)
        end;
        Show();
      end;
    // Parent
    3:
      begin
        ShowMessage('Welcome Student!');
        var form := TfrmStudentMenu.Create(Self);
        try
          Hide();
          form.ShowModal();
        finally
          FreeAndNil(form);
        end;
        Show();
      end;
    else
      begin
        ShowMessage('Something went wrong!: {User type doesn''t exist}. Contact Help.');
        Exit;
      end;
  end;
end;

procedure TfrmMain.setPassword(const password: string);
begin
  sPassword := password;
end;

procedure TfrmMain.setUsername(const username: string);
begin
  sUsername := username;
end;

end.
