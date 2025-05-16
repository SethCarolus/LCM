unit iStudentHandler_u;

interface

uses Generics.Collections, iStudent_u;

type
  IStudentHandler = interface
    function getStudentsEnquiringAboutTripWith(const id: Integer): TList<IStudent>;
    function getStudentForUserWith(const id: Integer): IStudent;
    function getStudent(const id: Integer): IStudent;
    function getStudentsForParentWith(const id: Integer): TList<IStudent>;
  end;

implementation

end.
