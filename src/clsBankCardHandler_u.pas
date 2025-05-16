unit clsBankCardHandler_u;

interface
  uses iBankCardHandler_u, iBankCard_u, iBankHandler_u, Generics.Collections;
    type
      TBankCardHandler = class(TInterfacedObject, IBankCardHandler)
        private
          fBankHandler: IBankHandler;
        public
          function getBankCardWith(const accountNumber : string) : IBankCard;
          procedure insertBankCard(const bankCard : IBankCard);
          function getBankCardBy(const id: Integer): IBankCard;
          procedure updateBankCard(const bankCard: IBankCard);
          function getBankCards(const userId: Integer): TList<IBankCard>;
          constructor Create(const bankHandler: IBankHandler);overload;
      end;

implementation
  uses clsFactory_u, SysUtils, dmMain_u;

{ BankCardHandler }

constructor TBankCardHandler.Create(const bankHandler: IBankHandler);
begin
  fBankHandler := bankHandler;
end;

function TBankCardHandler.getBankCardBy(const id: Integer): IBankCard;
begin
  with dmMain.qryBankCard do
    begin
      Close;
      Sql.Text := 'SELECT * FROM tblBankCard WHERE id = :id';
      Parameters.ParamByName('id').Value := id;
      Open;
      Result := TFactory.createBankCard(FieldByName('id').AsInteger,
                                        FieldByName('account_number').AsString,
                                        FieldByName('name_on_card').AsString,
                                        FieldByName('expirey_date').AsDateTime,
                                        FieldByName('security_code').AsString,
                                        FieldByName('balance').AsCurrency,
                                        fBankHandler.getBankBy(FieldByName('bank_id').AsInteger));
    end;
end;

function TBankCardHandler.getBankCards(const userId: Integer): TList<IBankCard>;
begin
  Result := TList<IBankCard>.Create();
  with dmMain.qryBankCard do
    begin
      SQL.Text :=
      '''
        SELECT *
        FROM tblBankCard
        WHERE id in
        (
          SELECT bank_card_id
          FROM tblUserBankCard
          WHERE user_id = :userId
        )
      ''';
      Parameters.ParamByName('userId').Value := userId;
      Open();

      while not Eof do
        begin
          Result.Add(TFactory.createBankCard(FieldByName('id').AsInteger,
                                        FieldByName('account_number').AsString,
                                        FieldByName('name_on_card').AsString,
                                        FieldByName('expirey_date').AsDateTime,
                                        FieldByName('security_code').AsString,
                                        FieldByName('balance').AsCurrency,
                                        fBankHandler.getBankBy(FieldByName('bank_id').AsInteger)));
          Next();
        end;
    end;

end;

function TBankCardHandler.getBankCardWith(
  const accountNumber: string): IBankCard;
begin
  if (string.IsNullOrWhiteSpace(accountNumber)) then
    raise Exception.Create('accountNumber cannot be null or whitespace');

  with dmMain.qryBankCard do
    begin
      Close;
      Sql.Text := 'SELECT * FROM tblBankCard WHERE account_number = ' +
       QuotedStr(accountNumber);
      ExecSQL;
      Open;
      Result := TFactory.createBankCard(FieldByName('id').AsInteger,
                                        FieldByName('account_number').AsString,
                                        FieldByName('name_on_card').AsString,
                                        FieldByName('expirey_date').AsDateTime,
                                        FieldByName('security_code').AsString,
                                        FieldByName('balance').AsCurrency,
                                        fBankHandler.getBankBy(FieldByName('bank_id').AsInteger));
    end;
end;

procedure TBankCardHandler.insertBankCard(const bankCard: IBankCard);
begin
  if (bankCard = nil) then
    raise EArgumentNilException.Create('bankCard cannot be null');

   if (bankCard.Bank = nil) then
    raise EArgumentNilException.Create('bank cannot be null');

    with dmMain.qryBankCard do
      begin
        Close;
        Sql.Text :=
        '''
            INSERT
            INTO tblBankCard (account_number, name_on_card,expirey_date,security_code,balance, bank_id)
            VALUES (:account_number, :name_one_card, :expirey_date,
                    :security_code, :balance, :bank_id)
        ''';
        Parameters.ParamByName('account_number').Value := bankCard.AccountNumber;
        Parameters.ParamByName('name_on_card').Value := bankCard.NameOnCard;
        Parameters.ParamByName('expirey_date').Value := bankCard.AccountNumber;
        Parameters.ParamByName('security_code').Value := bankCard.SecurityCode;
        Parameters.ParamByName('Balance').Value := bankCard.Balance;
        Parameters.ParamByName('bank_id').Value := bankCard.Bank.Id;
        ExecSQL;
      end;
end;
procedure TBankCardHandler.updateBankCard(const bankCard: IBankCard);
begin
  if (bankCard = nil) then
    raise EArgumentNilException.Create('bankCard cannot be null');

   if (bankCard.Bank = nil) then
    raise EArgumentNilException.Create('bank cannot be null');

  with dmMain.tblBankCard do
    begin
      Open;
      First;
      while not Eof do
        begin
          if (FieldByName('id').AsInteger = bankCard.Id) then
            begin
              Edit;
              FieldByName('name_on_card').AsString := bankCard.NameOnCard;
              FieldByName('account_number').AsString := bankCard.AccountNumber;
              FieldByName('expirey_date').AsDateTime := bankCard.ExpireyDate;
              FieldByName('security_code').AsString := bankCard.SecurityCode;
              FieldByName('balance').AsCurrency := bankCard.Balance;
              FieldByName('bank_id').AsInteger := bankCard.Bank.Id;
              Post;
              Break;
            end;
          Next;
        end;
        Close;
    end;
end;

end.
