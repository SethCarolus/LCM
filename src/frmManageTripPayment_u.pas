unit frmManageTripPayment_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPanels, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmManagePayment = class(TForm)
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    StackPanel1: TStackPanel;
    Label1: TLabel;
    cmbStudent: TComboBox;
    Label2: TLabel;
    lstTrips: TListBox;
    lblTotal: TLabel;
    btnMakePayment: TButton;
    Panel1: TPanel;
    StackPanel3: TStackPanel;
    Label3: TLabel;
    cmbBankCard: TComboBox;
    Label4: TLabel;
    edtBalance: TEdit;
    Label6: TLabel;
    edtNameOnCard: TEdit;
    Label5: TLabel;
    edtBankName: TEdit;
    GridPanel4: TGridPanel;
    btnBack: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure cmbBankCardChange(Sender: TObject);
    procedure cmbStudentChange(Sender: TObject);
    procedure lstTripsClick(Sender: TObject);
    procedure btnMakePaymentClick(Sender: TObject);
  private
    { Private declarations }
    procedure DisplayBankCard();
    procedure DisplayStudent();
  public
    { Public declarations }
  end;

var
  frmManagePayment: TfrmManagePayment;

implementation

uses clsApplicationState_u, clsFactory_u, iTrip_u, Generics.Collections;

{$R *.dfm}

procedure TfrmManagePayment.btnMakePaymentClick(Sender: TObject);
begin
  if (TApplicationState.SelectedBankCard = nil) then
    begin
      ShowMessage('You need to selected a bank card!');
      Exit;
    end;

  if (TApplicationState.SelectedStudent = nil) then
    begin
      ShowMessage('You need to selected a student!');
      Exit;
    end;

  var handler := TFactory.createPaymentHandler();
  handler.makePayment(TApplicationState.SelectedStudent.Id,
                      TApplicationState.SelectedBankCard,
                      TApplicationState.SelectedTripsForPayment);

  ShowMessage('Payment has been successful!');
  Close();
end;

procedure TfrmManagePayment.cmbBankCardChange(Sender: TObject);
begin
  var index := cmbBankCard.ItemIndex;

  if (index = -1) then
    Exit;

  if TApplicationState.BankCards = nil then
    begin
      ShowMessage('No Available Bank Cards');
      Exit;
    end;

  TApplicationState.SelectedBankCard := TApplicationState.BankCards[index];
  DisplayBankCard();
end;

procedure TfrmManagePayment.cmbStudentChange(Sender: TObject);
begin
  var index := cmbStudent.ItemIndex;

  if (index = -1) then
    Exit;

  if TApplicationState.Students = nil then
    begin
      ShowMessage('You do not have any students registered with us.');
      Exit;
    end;

  TApplicationState.SelectedStudent := TApplicationState.Students[index];
  DisplayStudent();
end;

procedure TfrmManagePayment.DisplayBankCard;
begin
  edtBalance.Text := CurrToStrF(TApplicationState.SelectedBankCard.Balance, ffCurrency, 2);
  edtNameOnCard.Text := TApplicationState.SelectedBankCard.NameOnCard;
  edtBankName.Text := TApplicationState.SelectedBankCard.Bank.ShortName;
end;

procedure TfrmManagePayment.DisplayStudent;
begin
  var handler := TFactory.createTripHandler();
  var trips := handler.getTripsForStudentThatNeedPayment(TApplicationState.SelectedStudent.Id);

  TApplicationState.Trips := trips;
  lstTrips.Clear;

  for var t in TApplicationState.Trips do
    begin
      lstTrips.Items.Add(t.Name);
    end;
end;

procedure TfrmManagePayment.FormActivate(Sender: TObject);
begin
  if (TApplicationState.CurrentUser.BankCards = nil) then
    begin
      ShowMessage('User has no bank cards');
      Exit;
    end;

  TApplicationState.BankCards := TApplicationState.CurrentUser.BankCards;

  cmbBankCard.Clear;
  for var b in TApplicationState.BankCards do
    begin
      cmbBankCard.items.Add(b.AccountNumber);
    end;

  var studentHandler := TFactory.createStudentHandler();

  TApplicationState.Students :=
    studentHandler.getStudentsForParentWith(TApplicationState.CurrentParent.Id);

  cmbStudent.Clear;
  for var s in TApplicationState.Students do
    begin
      cmbStudent.items.Add(s.User.FirstName + ' ' + s.User.LastName);
    end;
end;
procedure TfrmManagePayment.lstTripsClick(Sender: TObject);
begin
  if lstTrips.ItemIndex = -1  then
    begin
      ShowMessage('Select a trip to pay for.');
      Exit;
    end;

  // Get Selected Trips
  TApplicationState.SelectedTripsForPayment := TList<ITrip>.create();
  for var i := 0 to lstTrips.Items.Count - 1 do
    begin
      if lstTrips.Selected[i] then
      begin
        TApplicationState.SelectedTripsForPayment.Add(TApplicationState.Trips[i]);
      end;
    end;
  // Calaculate Cost
  var cost: Currency := 0;
  for var t in TApplicationState.SelectedTripsForPayment do
    begin
     cost := cost + t.CostPerPassenger;
    end;

  lblTotal.Caption := 'Cost: ' + CurrToStrF(cost, ffCurrency, 2);
end;

end.
