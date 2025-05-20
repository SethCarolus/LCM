unit clsParentHandler_u;

interface

uses iParentHandler_u, iUserHandler_u, iParent_u,
     iBankCardHandler_u;

type
  ///<summary>
  /// Handles retrieval of parent data including associated user and optional bank card info.
  ///</summary>
  TParentHandler = class(TInterfacedObject, IParentHandler)
  private
    fUserHandler: IUserHandler;
    fBankCardHandler: IBankCardHandler;
  public
    ///<summary>
    /// Creates a new instance of TParentHandler with dependencies injected.
    ///</summary>
    ///<param name="userHandler">An object that implements IUserHandler for retrieving user data.</param>
    ///<param name="bankCardHandler">An object that implements IBankCardHandler for retrieving bank card data.</param>
    constructor create(const userHandler: IUserHandler;
                       const bankCardHandler: IBankCardHandler);

    ///<summary>
    /// Retrieves the parent record associated with a given user ID.
    ///</summary>
    ///<param name="userId">The ID of the user to find the parent for.</param>
    ///<returns>An IParent object containing parent details.</returns>
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
