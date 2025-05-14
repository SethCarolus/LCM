unit clsStudentHandler_u;

interface

uses iStudentHandler_u, Generics.Collections, iStudent_u;

type
  TStudentHandler = class(TInterfacedObject, IStudentHandler)
  public
    function getStudentsEnquiringAboutTripWith(const id: Integer): TList<IStudent>;
    function getStudentForUserWith(const id: Integer): IStudent;
  end;

implementation

uses dmMain_u, clsFactory_u;

{ TStudentHandler }

function TStudentHandler.getStudentsEnquiringAboutTripWith(
  const id: Integer): TList<IStudent>;
begin
  Result := TList<IStudent>.Create();

  with dmMain.qryStudent do
    begin
      SQL.Text :=
      '''
        SELECT *
        FROM tblStudent, tblUser, tblUserType
        WHERE tblStudent.id IN
        (
          SELECT student_id
          FROM tblTripEnquiry
          WHERE trip_id = :id
        )
        AND tblStudent.user_id = tblUser.id
        AND tblUser.user_type_id = tblUserType.id
      ''';
      Parameters.ParamByName('id').Value := id;
      Open();

      while not Eof do
        begin

          Result.Add(TFactory.createStudent(FieldByName('tblStudent.ID').AsInteger,
                     TFactory.createUser(
                                        FieldByName('tblUser.id').AsInteger,
                                        FieldByName('username').AsString,
                                        FieldByName('first_name').AsString,
                                        FieldByName('last_name').AsString,
                                        FieldByName('display_name').AsString,
                                        FieldByName('created_on').AsDateTime,
                                        FieldByName('last_login').AsDateTime,
                                        TFactory.createUserType(FieldByName('tblUserType.Id').AsInteger,
                                                                FieldByName('user_type_name').AsString,
                                                                FieldByName('description').AsString)),
                     FieldByName('grade').AsInteger,
                     FieldByName('class').AsString[1]));
          Next();
        end;
    end;
end;

function TStudentHandler.getStudentForUserWith(const id: Integer): IStudent;
begin
  with dmMain.qryStudent do
    begin
      SQL.Text :=
      '''
        SELECT *
        FROM tblStudent, tblUser, tblUserType
        WHERE tblStudent.user_id = ?
        AND tblStudent.user_id = tblUser.id
        AND tblUser.user_type_id = tblUserType.id
      ''';
      Parameters[0].Value := id;
      Open();
      Result := TFactory.createStudent(
                FieldByName('tblStudent.ID').AsInteger,
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
                                                            FieldByName('description').AsString)),
              FieldByName('grade').AsInteger,
              FieldByName('class').AsString[1]);
    end;
end;

end.
