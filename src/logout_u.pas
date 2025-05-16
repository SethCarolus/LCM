unit logout_u;

interface

procedure LogTimeSpent(const userId: Integer;
                                const timeSpentInMinutes : Integer);

implementation

uses clsFactory_u;

procedure LogTimeSpent(const userId: Integer;
                                const timeSpentInMinutes : Integer);
begin
  var handler := TFactory.createUserHabitHandler();
  handler.insertTimeSpentOnApplicationFor(userId, timeSpentInMinutes);
end;

end.
