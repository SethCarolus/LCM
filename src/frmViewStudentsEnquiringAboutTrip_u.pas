unit frmViewStudentsEnquiringAboutTrip_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.NumberBox,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.WinXPanels, Vcl.Buttons;

type
  TfrmViewStudentsEnquiringAboutTrip = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    StackPanel1: TStackPanel;
    edtGrade: TLabeledEdit;
    edtClass: TLabeledEdit;
    GridPanel3: TGridPanel;
    lstStudents: TListBox;
    btnAccept: TButton;
    GridPanel4: TGridPanel;
    btnBack: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure lstStudentsClick(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewStudentsEnquiringAboutTrip: TfrmViewStudentsEnquiringAboutTrip;

implementation

uses clsFactory_u, clsApplicationState_u;

{$R *.dfm}

procedure TfrmViewStudentsEnquiringAboutTrip.btnAcceptClick(Sender: TObject);
begin
  var index := lstStudents.ItemIndex;
  if index = - 1 then
    begin
      ShowMessage('Select a Student!');
      Exit;
    end;

  var handler := TFactory.createTripHandler();

  handler.acceptTripEnquiry(TApplicationState.SelectedTrip.Id,
    TApplicationState.SelectedStudentEnquiringAboutTrip.Id)
end;

procedure TfrmViewStudentsEnquiringAboutTrip.FormActivate(Sender: TObject);
begin
  var handler := TFactory.createStudentHandler();

  TApplicationState.StudentsEnquiringAboutTrip :=
    handler.getStudentsEnquiringAboutTripWith(TApplicationState.SelectedTrip.Id);

  lstStudents.Clear;

  for var s in TApplicationState.StudentsEnquiringAboutTrip do
    begin
      lstStudents.Items.Add(s.User.FirstName + ' ' + s.User.LastName);
    end;

end;

procedure TfrmViewStudentsEnquiringAboutTrip.lstStudentsClick(Sender: TObject);
begin
  var index := lstStudents.ItemIndex;
  if index = - 1 then
    begin
      ShowMessage('Select a Student!');
      Exit;
    end;

  TApplicationState.SelectedStudentEnquiringAboutTrip :=
    TApplicationState.StudentsEnquiringAboutTrip[index];

  edtClass.Text := TApplicationState.SelectedStudentEnquiringAboutTrip.Cls;
  edtGrade.Text := TApplicationState.SelectedStudentEnquiringAboutTrip.Grade.ToString();
end;

end.
