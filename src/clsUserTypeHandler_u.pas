unit clsUserTypeHandler_u;

interface

  uses iUserTypeHandler_u, iUserType_u, Generics.Collections;

type
  TUserTypeHandler = class(TInterfacedObject, IUserTypeHandler)

    function getUserTypes(): TList<IUserType>;
  end;

implementation

{ TUserTypeHandler }

uses dmMain_u, clsFactory_u;

function TUserTypeHandler.getUserTypes: TList<IUserType>;
begin
  Result := TList<IUserType>.Create();
  with dmMain.qryMain do
    begin
      Close();
      SQL.Text :=
      '''
        SELECT *
        FROM tblUsertype;
      ''';
      Open();

      while not Eof do
        begin
          Result.Add(TFactory.createUserType(
                                              FieldByName('ID').AsInteger,
                                              FieldByName('user_type_name').AsString,
                                              FieldByName('description').AsString));
          Next();
        end;
    end;
end;

end.
