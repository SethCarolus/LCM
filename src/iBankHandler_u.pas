unit iBankHandler_u;

interface

uses iBank_u, Generics.Collections;

type
  IBankHandler = interface
    /// <summary>
    /// Retrieves a list of all banks from the database.
    /// </summary>
    /// <returns>
    /// TList&lt;IBank&gt; - A list containing all bank interfaces.
    /// </returns>
    function getAllBanks(): TList<IBank>;

    /// <summary>
    ///   Retrieves a bank by its unique identifier.
    /// </summary>
    /// <param name="id">The unique identifier of the bank to retrieve.</param>
    /// <returns>
    ///   IBank - The bank interface corresponding to the specified id.
    /// </returns>
    function getBankBy(const id: Integer): IBank;
  end;

implementation

end.
