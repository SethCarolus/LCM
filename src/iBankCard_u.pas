unit iBankCard_u;

interface
  uses iBank_u;
  type
    /// <summary>
    ///   This Interface defines the requirements of an Bank Card
    ///  </summary>
    IBankCard = interface

      function getId(): Integer;
      procedure setId(const id: Integer);

      function getAccountNumber: string;
      procedure setAccountNumber(const accountNumber: string);

      function getNameOnCard(): string;
      procedure setNameOnCard(const nameOnCard: string);

      function getExpireyDate(): TDateTime;
      procedure setExpireyDate(const date: TDateTime);

      function getSecurityCode(): string;
      procedure setSecurityCode(const securityCode: string);

      function getBalance(): Double;
      procedure setBalance(const balance: Double);

      function getBank(): IBank;
      procedure setBank(const bank: IBank);

      property Id: Integer read getId write setId;
      property AccountNumber: string read getAccountNumber write setAccountNumber;
      property NameOnCard: string read getNameOnCard write setNameOnCard;
      property SecurityCode: string read getSecurityCode write setSecurityCode;
      property Balance: Double read getBalance write setBalance;
      property Bank: IBank read getBank write setBank;
      property ExpireyDate: TDateTime read getExpireyDate write setExpireyDate;
    end;


implementation

end.
