unit clsStudent_u;

interface

uses iStudent_u, iUser_u;

type
  TStudent = class(TInterfacedObject, IStudent)

    private
      /// <summary>
      /// Represents the id of the driver.
      /// </summary>
      fId: Integer;

      /// <summary>
      /// Represents the user associated with the driver.
      /// </summary>
      fUser: IUser;

      /// <summary>
      /// Represents the grade the student is in.
      /// </summary>
      fGrade: Integer;

      /// <summary>
      /// Represents the class the student is in.
      /// </summary>
      fClass: Char;
    public
      /// <summary>
      /// Function that returns the id of the student.
      /// </summary>
      /// <returns>The id of the student.</returns>
      function getId: Integer;

      /// <summary>
      /// Procedure that sets the id of the student.
      /// </summary>
      /// <param name="id">Id to assign to the student.</param>
      procedure setId(const id: Integer);

      /// <summary>
      /// Function that returns the associated user.
      /// </summary>
      /// <returns>The user of the student.</returns>
      function getUser: IUser;

      /// <summary>
      /// Procedure that sets the associated user
      /// </summary>
      /// <param name="user">User to assign to the student.<param>
      procedure setUser(const user: IUser);

      /// <summary>
      /// Function that returns the grade the student is in.
      /// </summary>
      // <returns>The grade the student is in.</returns>
      function getGrade(): Integer;

      /// <summary>
      /// Procedure that sets the grade the student is in.
      /// </summary>
      /// <param name="user">The grade the student is in.<param>
      procedure setGrade(const grade: Integer);

      /// <summary>
      /// Function that returns the class the student is in.
      /// </summary>
      // <returns>The class the student is in. Eg. N, G, T, E</returns>
      function getClass(): Char;

      /// <summary>
      /// Procedure that sets the class the student is in.
      /// </summary>
      /// <param name="class">The class the student is in.<param>
      procedure setClass(const c:  Char);

      /// <summary>
      /// Creates a new Student instance.
      /// </summary>
      /// <param name="id">Id to assign to the student.</param>
      /// <param name="user">User to assign to the student.<param>
      /// <param name="user">The grade the student is in.<param>
      /// <param name="class">The class the student is in.<param>
      constructor create(const id: Integer;const user: IUser;
                         const grade: Integer; const c: Char);

      /// <summary>
      /// Represents the id of the student.
      /// </summary>
      property Id: Integer read getId write setId;

      /// <summary>
      /// Represents the user associated with the student.
      /// </summary>
      property User: IUser read getUser write setUser;

      /// <summary>
      /// Represents the grade the student is in.
      /// </summary>
      property Grade: Integer read getGrade write setGrade;

      /// <summary>
      /// Represents the class the student is in.
      /// </summary>
      property Cls: char read getClass write setClass;

  end;

implementation

{ TStudent }

constructor TStudent.create(const id: Integer; const user: IUser;
                            const grade: Integer; const c: Char);
begin
  Self.Id := id;
  Self.User := user;
  Self.Grade := grade;
  Self.Cls := c;
end;

function TStudent.getClass: Char;
begin
  Result := fClass;
end;

function TStudent.getGrade: Integer;
begin
  Result := fGrade;
end;

function TStudent.getId: Integer;
begin
  Result := fId;
end;

function TStudent.getUser: IUser;
begin
  Result := fUser;
end;

procedure TStudent.setClass(const c: Char);
begin
  fClass := c;
end;

procedure TStudent.setGrade(const grade: Integer);
begin
  fGrade := grade;
end;

procedure TStudent.setId(const id: Integer);
begin
  fId := id;
end;

procedure TStudent.setUser(const user: IUser);
begin
  fUser := user;
end;

end.
