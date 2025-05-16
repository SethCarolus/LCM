unit clsStudentHandler_u;

interface

uses iStudentHandler_u, Generics.Collections, iStudent_u, iUserHandler_u;

type
  TStudentHandler = class(TInterfacedObject, IStudentHandler)
    private
      fUserHandler: IUserHandler;
    public
      function getStudentsEnquiringAboutTripWith(const id: Integer): TList<IStudent>;
      function getStudentForUserWith(const id: Integer): IStudent;
      function getStudent(const id: Integer): IStudent;
      function getStudentsForParentWith(const id: Integer): TList<IStudent>;

      constructor create(const userHandler: IUserHandler);
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
        FROM tblStudent
        WHERE tblStudent.id IN
        (
          SELECT student_id
          FROM tblTripEnquiry
          WHERE trip_id = :id
        )
      ''';
      Parameters.ParamByName('id').Value := id;
      Open();

      while not Eof do
        begin

          Result.Add(TFactory.createStudent(FieldByName('tblStudent.ID').AsInteger,
                     fUserHandler.getUserWith(FieldByName('user_id').AsInteger),
                     FieldByName('grade').AsInteger,
                     FieldByName('class').AsString[1]));
          Next();
        end;
    end;
end;

function TStudentHandler.getStudentsForParentWith(
  const id: Integer): TList<IStudent>;
begin
  Result := TList<IStudent>.Create();
  with dmMain.qryParent do
    begin
      SQL.Text :=
      '''
        SELECT *
        FROM tblStudent
        WHERE id in
        (
          SELECT student_id
          FROM tblStudentParent
          WHERE parent_id = :id
        )
      ''';
      Parameters.ParamByName('id').Value := id;
      Open();
      while not Eof do
        begin
          Result.add(getStudent(FieldByName('id').AsInteger));
          Next();
        end;
    end;
end;

constructor TStudentHandler.create(const userHandler: IUserHandler);
begin
  fUserHandler := userHandler;
end;

function TStudentHandler.getStudent(const id: Integer): IStudent;
begin
  with dmMain.qryStudent do
    begin
      SQL.Text :=
      '''
        SELECT *
        FROM tblStudent
        WHERE id = ?
      ''';
      Parameters[0].Value := id;
      Open();
      Result := TFactory.createStudent(
                FieldByName('ID').AsInteger,
                fUserHandler.getUserWith(FieldByName('user_id').AsInteger),
                FieldByName('grade').AsInteger,
                FieldByName('class').AsString[1]);
    end;
end;

function TStudentHandler.getStudentForUserWith(const id: Integer): IStudent;
begin
  with dmMain.qryStudent do
    begin
      SQL.Text :=
      '''
        SELECT *
        FROM tblStudent
        WHERE tblStudent.user_id = ?
      ''';
      Parameters[0].Value := id;
      Open();
      Result := TFactory.createStudent(
                FieldByName('ID').AsInteger,
                fUserHandler.getUserWith(FieldByName('user_id').AsInteger),
                FieldByName('grade').AsInteger,
                FieldByName('class').AsString[1]);
    end;
end;

end.
