unit iTripHandler_u;

interface
  uses iTrip_u, Generics.Collections;
type
  ITripHandler = interface
    function getTrips(const date: TDateTime): TList<ITrip>;overload;
    function getTrips(const date: TDateTime;const driverId: Integer): TList<ITrip>;overload;
    function getTripsForDriver(const driverId: Integer): TList<ITrip>;
    procedure addTrip(const tripName: string; const driverId: Integer;
                      const vehicleId: Integer; const startTime: TDateTime;
                      const costPerPassenger: Currency);
    procedure deleteTrip(const id: Integer);
    procedure updateTrip(const trip: ITrip);
    procedure addTripEnquiry(const studentId: Integer; const tripId: Integer);
    procedure acceptTripEnquiry(const tripId: Integer; const studentId: Integer);
    function getTripsForStudent(const studentId: Integer; const date: TDateTime): TList<ITrip>;
    procedure updateTripRatingForStudent(const studentId: Integer; const tripId: Integer;
                                         const rating: UInt8);
    procedure addTripComment(const header: string; const content: string; const userId: Integer;
                             const tripId: Integer);
  end;

implementation

end.
