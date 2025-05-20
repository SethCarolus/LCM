unit iBankCard_u;

interface

uses iBank_u;

type
  /// <summary>
  /// This Interface defines the requirements of an Bank Card
  /// </summary>
  IBankCard = interface

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
  end;

implementation

end.
