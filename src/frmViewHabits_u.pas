unit frmViewHabits_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons;

type
  TfrmViewHabits = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    redViewHabits: TRichEdit;
    Panel1: TPanel;
    GridPanel4: TGridPanel;
    btnBack: TBitBtn;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewHabits: TfrmViewHabits;

implementation

uses clsFactory_u, clsApplicationState_u;

{$R *.dfm}


procedure TfrmViewHabits.FormActivate(Sender: TObject);
begin
  var handler := TFactory.createUserHabitHandler();
  TApplicationState.Habits := handler.getUserHabitsFor(TApplicationState.CurrentUser.Id);

  if (TApplicationState.Habits.IsEmpty) then
    begin
      ShowMessage('Welcome to LCM. This is your first Time using our App! We truly apprieciate your support!');
      btnBack.SetFocus();
      Exit;
    end;

  // Displaying the habits
  HideCaret(redViewHabits.Handle);
  redViewHabits.Paragraph.TabCount := 1;
  redViewHabits.Paragraph.Tab[0] := 100;
  redViewHabits.Clear;
  for var i := 0 to High(TApplicationState.Habits.ToArray()) do
    begin
      redViewHabits.Lines.Add('Session ' + (i + 1).ToString()+ ' :' + #9 + TApplicationState.Habits[i].ToString + ' minute/s')
    end;
end;

end.
