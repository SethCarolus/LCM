unit IUserHabitHandler_u;

interface
  uses Generics.Collections;
  type
    IUserHabitHandler = interface
      function getUserHabitsFor(const id: Integer) :  TList<Uint64>;
      procedure insertTimeSpentOnApplicationFor(const userId: Integer; const elapsedMinutes: Integer);
    end;
implementation

end.
