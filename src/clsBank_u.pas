unit clsBank_u;

interface

uses iBank_u;

type
  /// <summary>
  ///   Represents a Bank entity with its details.
  /// </summary>
  TBank = class(TInterfacedObject, IBank)
  private
    fId: Integer;
    fShortName: string;
    fLongName: string;
    fPhoneNumber: string;

    /// <summary>Gets the bank's unique identifier.</summary>
    /// <returns>The bank's ID as an integer.</returns>
    function getId(): Integer;
    /// <summary>Sets the bank's unique identifier.</summary>
    /// <param name="id">The new ID to assign to the bank.</param>
    procedure setId(const id: Integer);

    /// <summary>Gets the short name of the bank.</summary>
    /// <returns>The bank's short name as a string.</returns>
    function getShortName(): string;
    /// <summary>Sets the short name of the bank.</summary>
    /// <param name="name">The new short name for the bank.</param>
    procedure setShortName(const name: string);

    /// <summary>Gets the full name of the bank.</summary>
    /// <returns>The bank's full long name as a string.</returns>
    function getLongName(): string;
    /// <summary>Sets the full name of the bank.</summary>
    /// <param name="name">The new long name for the bank.</param>
    procedure setLongName(const name: string);

    /// <summary>Gets the phone number of the bank.</summary>
    /// <returns>The bank's contact phone number as a string.</returns>
    function getPhoneNumber(): string;
    /// <summary>Sets the phone number of the bank.</summary>
    /// <param name="number">The new phone number for the bank.</param>
    procedure setPhoneNumber(const number: string);

  public
    /// <summary>The unique identifier of the bank.</summary>
    property Id: Integer read getId write setId;
    /// <summary>The short name of the bank.</summary>
    property ShortName: string read getShortName write setShortName;
    /// <summary>The full long name of the bank.</summary>
    property LongName: string read getLongName write setLongName;
    /// <summary>The contact phone number of the bank.</summary>
    property PhoneNumber: string read getPhoneNumber write setPhoneNumber;

    /// <summary>
    ///   Constructs a new instance of the TBank class.
    /// </summary>
    /// <param name="id">The unique identifier of the bank.</param>
    /// <param name="ShortName">The short name of the bank.</param>
    /// <param name="LongName">The full long name of the bank.</param>
    /// <param name="PhoneNumber">The contact phone number of the bank.</param>
    constructor create(const id: Integer; const shortName: string;
      const LongName: string; const PhoneNumber: string);
  end;

implementation

{ TBank }

constructor TBank.create(const id: Integer; const ShortName, LongName,
  PhoneNumber: string);
begin
  Self.id := id;
  Self.ShortName := ShortName;
  Self.LongName := LongName;
  Self.PhoneNumber := PhoneNumber;
end;

function TBank.getId: Integer;
begin
  result := fId;
end;

function TBank.getLongName: string;
begin
  result := fLongName;
end;

function TBank.getPhoneNumber: string;
begin
  result := fPhoneNumber;
end;

function TBank.getShortName: string;
begin
  result := fShortName;
end;

procedure TBank.setId(const id: Integer);
begin
  fId := id;
end;

procedure TBank.setLongName(const name: string);
begin
  fLongName := name;
end;

procedure TBank.setPhoneNumber(const number: string);
begin
  fPhoneNumber := number;
end;

procedure TBank.setShortName(const name: string);
begin
  fShortName := name;
end;

end.
