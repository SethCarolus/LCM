unit iStudentHandler_u;

interface

uses Generics.Collections, iStudent_u;

type
  IStudentHandler = interface
    function getStudentsEnquiringAboutTripWith(const id: Integer): TList<IStudent>;
    function getStudentForUserWith(const id: Integer): IStudent;
  end;

implementation

end.
