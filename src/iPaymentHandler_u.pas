unit iPaymentHandler_u;

interface
  uses iBankCard_u, Generics.Collections, iTrip_u;
  type
    IPaymentHandler = interface
      procedure makePayment(const studentId: Integer; const bankCard: IBankCard; const trips: TList<ITrip>);
    end;

implementation

end.
