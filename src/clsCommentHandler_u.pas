unit clsCommentHandler_u;

interface

uses iCommentHandler_u, iComment_u, Generics.Collections;

type
  TCommentHandler = class(TInterfacedObject, ICommentHandler)
    function getCommentsForTrip(const tripId: Integer): TList<IComment>;
  end;

implementation

uses dmMain_u, clsFactory_u;

{ TCommentHandler }

function TCommentHandler.getCommentsForTrip(const tripId: Integer): TList<IComment>;
begin
  Result := TList<IComment>.Create();

  with dmMain.qryMain do
    begin
      SQL.Text :=
      '''
        SELECT *
        FROM tblTripComment, tblUser, tblUserType
        WHERE trip_id = :id
        AND tblTripComment.user_id = tblUser.Id
        AND tblUser.user_type_id = tblUserType.Id;
      ''';
      Parameters.ParamByName('id').Value := tripId;

      Open();

      while not Eof do
        begin
          Result.Add(TFactory.createComment(FieldByName('tblTripComment.ID').AsInteger,
                      FieldByName('header').AsString,
                      FieldByName('content').AsString,
                      TFactory.createUser(
                                    FieldByName('tblUser.ID').AsInteger,
                                    FieldByName('username').AsString,
                                    FieldByName('first_name').AsString,
                                    FieldByName('last_name').AsString,
                                    FieldByName('display_name').AsString,
                                    FieldByName('created_on').AsDateTime,
                                    FieldByName('last_login').AsDateTime,
                                    TFactory.createUserType(FieldByName('tblUserType.ID').AsInteger,
                                                            FieldByName('user_type_name').AsString,
                                                            FieldByName('description').AsString))));
          Next();
        end;

    end;
end;

end.
