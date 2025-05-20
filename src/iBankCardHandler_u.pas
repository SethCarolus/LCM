unit iBankCardHandler_u;

interface
  uses iBankCard_u, Generics.Collections;
  type
    IBankCardHandler = interface
      /// <summary>
      ///  Retrieves a bank card by its account number.
      /// </summary>
      /// <param name="accountNumber">The account number of the bank card to find.</param>
      /// <returns>An IBankCard instance matching the account number.</returns>
      function getBankCardWith(const accountNumber : string) : IBankCard;

      /// <summary>
      ///   Inserts a new bank card into the database.
      /// </summary>
      /// <param name="bankCard">The IBankCard object to be inserted.</param>
      procedure insertBankCard(const bankCard : IBankCard);

      /// <summary>
      ///   Retrieves a bank card using its unique database ID.
      /// </summary>
      /// <param name="id">The unique identifier of the bank card.</param>
      /// <returns>An IBankCard instance that matches the ID.</returns>
      function getBankCardBy(const id: Integer): IBankCard;

      /// <summary>
      ///   Updates the details of an existing bank card in the database.
      /// </summary>
      /// <param name="bankCard">The IBankCard object containing updated values.</param>
      procedure updateBankCard(const bankCard: IBankCard);

      /// <summary>
      ///   Retrieves all bank cards linked to a specific user.
      /// </summary>
      /// <param name="userId">The ID of the user whose bank cards are being requested.</param>
      /// <returns>A list of IBankCard objects associated with the user.</returns>
      function getBankCards(const userId: Integer): TList<IBankCard>;
    end;

implementation

end.
