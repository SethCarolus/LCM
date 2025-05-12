unit iStudent_u;

interface

uses iUser_u;

type
  IStudent = interface

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
  // <returns>The user of the student.</returns>
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
  /// <param name="user">The class the student is in.<param>
  procedure setClass(const c:  Char);

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
  property Grade: Integer read getId write setId;

  /// <summary>
  /// Represents the class the student is in.
  /// </summary>
  property Cls: char read getClass write setClass;

  end;

implementation

end.
