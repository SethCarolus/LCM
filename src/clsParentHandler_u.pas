unit clsParentHandler_u;

interface

uses iParentHandler_u, iUserHandler_u, iParent_u,
     iBankCardHandler_u;

type
  TParentHandler = class(TInterfacedObject, IParentHandler)
    private
      fUserHandler: IUserHandler;
      fBankCardHandler: IBankCardHandler;
    public
      constructor create(const userHandler: IUserHandler;
                         const bankCardHandler: IBankCardHandler);
      function getParent(const userId: Integer): IParent;
  end;

implementation

uses dmMain_u, clsFactory_u;

{ TParentHandler }

constructor TParentHandler.create(const userHandler: IUserHandler;
                         const bankCardHandler: IBankCardHandler);
begin
  fUserHandler := userHandler;
  fBankCardHandler := bankCardHandler;
end;

function TParentHandler.getParent(const userId: Integer): IParent;
begin
  with dmMain.qryParent do
    begin
      SQL.Text :=
      '''
        SELECT *
        FROM tblUser, tblParent
        WHERE tblParent.user_id = tblUser.Id AND tblUser.Id = :user_id
       ''';
       Parameters.ParamByName('user_id').Value := userId;
       Open();

       Result := TFactory.createParent(FieldByName('tblParent.ID').AsInteger,
                                       fUserHandler.getUserWith(userId));
    end;
end;

end.
