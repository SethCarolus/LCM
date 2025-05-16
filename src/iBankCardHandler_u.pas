unit iBankCardHandler_u;

interface
  uses iBankCard_u, Generics.Collections;
  type
    IBankCardHandler = interface
      function getBankCardWith(const accountNumber : string) : IBankCard;
      function getBankCardBy(const id: Integer): IBankCard;
      procedure insertBankCard(const bankCard : IBankCard);
      procedure updateBankCard(const bankCard: IBankCard);
      function getBankCards(const userId: Integer): TList<IBankCard>;
    end;

implementation

end.
