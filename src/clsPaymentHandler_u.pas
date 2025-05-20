unit clsPaymentHandler_u;

interface

uses iPaymentHandler_u, iBankCardHandler_u, iTrip_u,
  Generics.Collections, iBankCard_u, iTripHandler_u;

type
  TPaymentHandler = class(TInterfacedObject, IPaymentHandler)
  private
    fBankCardHandler: IBankCardHandler;
    fTripHandler: ITripHandler;
  public
    constructor create(const bankCardHandler: IBankCardHandler;
      const tripHandler: ITripHandler);
    procedure makePayment(const studentId: Integer; const bankCard: IBankCard;
      const trips: TList<ITrip>);
  end;

implementation

uses SysUtils, dmMain_u;

{ TPaymentHandler }

constructor TPaymentHandler.create(const bankCardHandler: IBankCardHandler;
  const tripHandler: ITripHandler);
begin
  fBankCardHandler := bankCardHandler;
  fTripHandler := tripHandler;
end;

procedure TPaymentHandler.makePayment(const studentId: Integer;
  const bankCard: IBankCard; const trips: TList<ITrip>);
begin
  if (bankCard = nil) then
    raise EArgumentNilException.create('bankCards cannot be null here!');

  if (trips = nil) then
    raise EArgumentNilException.create('trips cannot be null here!');

  var
    cost: Double := 0;

  for var t in trips do
  begin
    cost := cost + t.CostPerPassenger;
  end;

  bankCard.Balance := bankCard.Balance - cost;

  fTripHandler.changeTripsToPayed(trips, studentId);

  // Update the bank card information in the database
  fBankCardHandler.updateBankCard(bankCard);
end;

end.
