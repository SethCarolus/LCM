unit clsBankCard_u;

interface

uses iBankCard_u, iBank_u;

type
  /// <summary>
  /// This class represents a Bank Card.
  /// </summary>
  TBankCard = class(TInterfacedObject, IBankCard)
  private
    fId: Integer;
    fAccountNumber: string;
    fNameOnCard: string;
    fExpireyDate: TDateTime;
    fSecurityCode: String;
    fBalance: Double;
    fBank: IBank;

    /// <summary>Gets the ID of the bank card.</summary>
    /// <returns>Integer - The ID of the bank card.</returns>
    function getId: Integer;

    /// <summary>Sets the ID of the bank card.</summary>
    /// <param name="id">The ID to be assigned to the bank card.</param>
    procedure setId(const id: Integer);

    /// <summary>Gets the account number of the bank card.</summary>
    /// <returns>String - The bank card's account number.</returns>
    function getAccountNumber: string;

    /// <summary>Sets the account number of the bank card.</summary>
    /// <param name="accountNumber">The new account number.</param>
    procedure setAccountNumber(const accountNumber: string);

    /// <summary>Gets the name on the bank card.</summary>
    /// <returns>String - The name printed on the card.</returns>
    function getNameOnCard(): string;

    /// <summary>Sets the name on the bank card.</summary>
    /// <param name="nameOnCard">The name to appear on the card.</param>
    procedure setNameOnCard(const nameOnCard: string);

    /// <summary>Gets the expiry date of the card.</summary>
    /// <returns>TDateTime - The expiry date.</returns>
    function getExpireyDate(): TDateTime;

    /// <summary>Sets the expiry date of the card.</summary>
    /// <param name="date">The new expiry date.</param>
    procedure setExpireyDate(const date: TDateTime);

    /// <summary>Gets the security code of the card.</summary>
    /// <returns>String - The security code (CVV).</returns>
    function getSecurityCode(): string;

    /// <summary>Sets the security code of the card.</summary>
    /// <param name="securityCode">The new security code (CVV).</param>
    procedure setSecurityCode(const securityCode: string);

    /// <summary>Gets the balance of the card.</summary>
    /// <returns>Double - The card's balance.</returns>
    function getBalance(): Double;

    /// <summary>Sets the balance of the card.</summary>
    /// <param name="balance">The new balance amount.</param>
    procedure setBalance(const balance: Double);

    /// <summary>Gets the bank associated with the card.</summary>
    /// <returns>IBank - The bank interface linked to this card.</returns>
    function getBank: IBank;

    /// <summary>Sets the bank associated with the card.</summary>
    /// <param name="bank">The bank interface to link.</param>
    procedure setBank(const bank: IBank);
  public
    /// <summary>
    /// The unique identifier of the bank card.
    /// </summary>
    property id: Integer read getId write setId;

    /// <summary>
    /// The account number linked to the card.
    /// </summary>
    property accountNumber: string read getAccountNumber write setAccountNumber;

    /// <summary>
    /// The name printed on the bank card.
    /// </summary>
    property nameOnCard: string read getNameOnCard write setNameOnCard;

    /// <summary>
    /// The expiry date of the bank card.
    /// </summary>
    property ExpireyDate: TDateTime read getExpireyDate write setExpireyDate;

    /// <summary>
    /// The card's CVV or security code.
    /// </summary>
    property securityCode: string read getSecurityCode write setSecurityCode;

    /// <summary>
    /// The current balance of the card.
    /// </summary>
    property balance: Double read getBalance write setBalance;
    /// <summary>
    /// The bank associated with the card.
    /// </summary>
    property bank: IBank read getBank write setBank;

    /// <summary>
    /// Creates and initializes a new TBankCard instance.
    /// </summary>
    /// <param name="id">The ID of the bank card.</param>
    /// <param name="accountNumber">The card's account number.</param>
    /// <param name="nameOnCard">The name displayed on the card.</param>
    /// <param name="expireyDate">The expiry date of the card.</param>
    /// <param name="securityCode">The security code (CVV) of the card.</param>
    /// <param name="balance">The balance available on the card.</param>
    /// <param name="bank">The bank interface associated with the card.</param>
    constructor Create(const id: Integer; const accountNumber: string;
      const nameOnCard: string; const ExpireyDate: TDateTime;
      const securityCode: string; const balance: Double; const bank: IBank);
  end;

implementation

uses SysUtils;

{ TBankCard }

constructor TBankCard.Create(const id: Integer; const accountNumber: string;
  const nameOnCard: string; const ExpireyDate: TDateTime;
  const securityCode: string; const balance: Double; const bank: IBank);
begin
  Self.id := id;
  Self.accountNumber := accountNumber;
  Self.ExpireyDate := ExpireyDate;
  Self.nameOnCard := nameOnCard;
  Self.securityCode := securityCode;
  Self.balance := balance;
  Self.bank := bank;
end;

function TBankCard.getAccountNumber: string;
begin
  Result := fAccountNumber;
end;

function TBankCard.getBalance: Double;
begin
  Result := fBalance;
end;

function TBankCard.getBank: IBank;
begin
  Result := fBank;
end;

function TBankCard.getExpireyDate: TDateTime;
begin
  Result := fExpireyDate;
end;

function TBankCard.getId: Integer;
begin
  Result := fId;
end;

function TBankCard.getNameOnCard: string;
begin
  Result := fNameOnCard;
end;

function TBankCard.getSecurityCode: string;
begin
  Result := fSecurityCode;
end;

procedure TBankCard.setAccountNumber(const accountNumber: string);
begin
  if string.IsNullOrWhiteSpace(accountNumber) then
    raise EArgumentNilException.Create
      ('accountNumber cannot be null or whitespace');

  fAccountNumber := accountNumber;
end;

procedure TBankCard.setBalance(const balance: Double);
begin
  if balance < 0 then
    raise EArgumentOutOfRangeException.Create('balance cannot be negative');

  fBalance := balance;
end;

procedure TBankCard.setBank(const bank: IBank);
begin
  fBank := bank;
end;

procedure TBankCard.setExpireyDate(const date: TDateTime);
begin
  fExpireyDate := date;
end;

procedure TBankCard.setId(const id: Integer);
begin
  fId := id;
end;

procedure TBankCard.setNameOnCard(const nameOnCard: string);
begin
  if string.IsNullOrWhiteSpace(nameOnCard) then
    raise EArgumentNilException.Create
      ('nameOnCard cannot be null or whitespace');

  fNameOnCard := nameOnCard;
end;

procedure TBankCard.setSecurityCode(const securityCode: string);
begin
  if string.IsNullOrWhiteSpace(securityCode) then
    raise EArgumentNilException.Create
      ('securityCode cannot be null or whitespace');

  fSecurityCode := securityCode;
end;

end.
