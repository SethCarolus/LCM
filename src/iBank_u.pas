unit iBank_u;

interface

type
  /// <summary>
  ///   This Interface defines the requirements of a Bank
  /// </summary>
  IBank = interface
    /// <summary>
    ///   Gets the unique identifier of the bank.
    /// </summary>
    /// <returns>The bank's ID as an Integer.</returns>
    function getId(): Integer;

    /// <summary>
    ///   Sets the unique identifier of the bank.
    /// </summary>
    /// <param name="id">The ID to assign to the bank.</param>
    procedure setId(const id: Integer);

    /// <summary>
    ///   Gets the short name of the bank.
    /// </summary>
    /// <returns>The bank's short name as a string.</returns>
    function getShortName(): string;

    /// <summary>
    ///   Sets the short name of the bank.
    /// </summary>
    /// <param name="name">The short name to assign to the bank.</param>
    procedure setShortName(const name: string);

    /// <summary>
    ///   Gets the long name of the bank.
    /// </summary>
    /// <returns>The bank's long name as a string.</returns>
    function getLongName(): string;

    /// <summary>
    ///   Sets the long name of the bank.
    /// </summary>
    /// <param name="name">The long name to assign to the bank.</param>
    procedure setLongName(const name: string);

    /// <summary>
    ///   Gets the phone number of the bank.
    /// </summary>
    /// <returns>The bank's phone number as a string.</returns>
    function getPhoneNumber(): string;

    /// <summary>
    ///   Sets the phone number of the bank.
    /// </summary>
    /// <param name="number">The phone number to assign to the bank.</param>
    procedure setPhoneNumber(const number: string);

    /// <summary>The unique identifier of the bank.</summary>
    property Id: Integer read getId write setId;

    /// <summary>The short name of the bank.</summary>
    property ShortName: string read getShortName write setShortName;

    /// <summary>The long name of the bank.</summary>
    property LongName: string read getLongName write setLongName;

    /// <summary>The phone number of the bank.</summary>
    property PhoneNumber: string read getPhoneNumber write setPhoneNumber;
  end;

implementation

end.

