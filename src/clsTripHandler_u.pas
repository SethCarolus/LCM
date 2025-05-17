unit clsTripHandler_u;

interface

uses iTripHandler_u, iTrip_u, Generics.Collections, iVehicleHandler_u,
     iDriverHandler_u;

type
  TTripHandler = class(TInterfacedObject, ITripHandler)
    private
      fVehicleHandler: IVehicleHandler;
      fDriverHandler: IDriverHandler;
    public
      constructor create(const vehicleHandler: IVehicleHandler;
                         const driverHandler: IDriverHandler);

      function getTrips(const date: TDateTime): TList<ITrip>;overload;
      function getTrips(const date: TDateTime;const driverId: Integer): TList<ITrip>;overload;
      function getTripsForStudent(const studentId: Integer; const date: TDateTime): TList<ITrip>;overload;
      function getTripsForStudent(const studentId: Integer): TList<ITrip>;overload;
      function getTripsForStudentThatNeedPayment(const studentId: Integer): TList<ITrip>;
      function getTripsForDriver(const driverId: Integer): TList<ITrip>;

      procedure addTrip(const trip_name: string; const driverId: Integer;
                        const vehicleId: Integer; const startTime: TDateTime;
                        const costPerPassenger: Currency);
      procedure deleteTrip(const id: Integer);
      procedure updateTrip(const trip: ITrip);
      procedure addTripEnquiry(const studentId: Integer; const tripId: Integer);
      procedure acceptTripEnquiry(const tripId: Integer; const studentId: Integer);
      procedure updateTripRatingForStudent(const studentId: Integer; const tripId: Integer;
                                           const rating: UInt8);
      procedure addTripComment(const header: string;const content: string; const userId: Integer;
                               const tripId: Integer);
      procedure changeTripsToPayed(const trips: TList<ITrip>; const studentId: Integer);
  end;

implementation

uses dmMain_u, clsFactory_u, DateUtils, SysUtils;

{ TTripHandler }

procedure TTripHandler.acceptTripEnquiry(const tripId: Integer;
  const studentId: Integer);
begin
  with dmMain.qryTrip do
    begin
      SQL.Text :=
      '''
        INSERT Into tblStudentTrip (trip_id, student_id)
        VALUES (:trip_id, :student_id)
      ''';
      Parameters.ParamByName('trip_id').Value := tripId;
      Parameters.ParamByName('student_id').Value := studentId;
      ExecSQL();
    end;
end;

procedure TTripHandler.addTrip(const trip_name: string; const driverId,
  vehicleId: Integer; const startTime: TDateTime;
  const costPerPassenger: Currency);
begin
  with dmMain.qryTrip do
    begin
      SQL.Text :=
      '''
        INSERT INTO tblTrip (trip_name, driver_id, vehicle_id, start_time, cost_per_passenger)
        VALUES (:trip_name, :driver_id, :vehicle_id, :start_time, :cost)
      ''';

      Parameters.ParamByName('trip_name').Value := trip_name;
      Parameters.ParamByName('driver_id').Value := driverId;
      Parameters.ParamByName('vehicle_id').Value := vehicleId;
      Parameters.ParamByName('start_time').Value := startTime;
      Parameters.ParamByName('cost').Value := costPerPassenger;
      ExecSQL()
    end;
end;

procedure TTripHandler.addTripComment(const header: string;const content: string; const userId,
  tripId: Integer);
begin
  with dmMain.qryTrip do
    begin
      SQL.Text :=
      '''
        INSERT INTO tblTripComment (header, content, user_id, trip_id)
        VALUES (:header, :content, :userId, :tripId);
      ''';
      Parameters.ParamByName('header').Value := header;
      Parameters.ParamByName('content').Value := content;
      Parameters.ParamByName('userId').Value := userId;
      Parameters.ParamByName('tripId').Value := tripId;
      ExecSQL();
    end;
end;

procedure TTripHandler.addTripEnquiry(const studentId, tripId: Integer);
begin
  with dmMain.qryTrip do
    begin
      SQL.Text :=
      '''
        INSERT INTO tblTripEnquiry (student_id, trip_id)
        VALUES (:student_id, :trip_id)
      ''';
      Parameters.ParamByName('student_id').Value := studentId;
      Parameters.ParamByName('trip_id').Value := tripId;
      ExecSQL();
    end;
end;

procedure TTripHandler.changeTripsToPayed(const trips: TList<ITrip>;
  const studentId: Integer);
begin
  if (trips = nil) then
    raise EArgumentNilException.Create('trips cannot be nil');

  var tripIds := TList<Integer>.Create();


  with dmMain.qryTrip do
    begin
      SQL.Text :=
      '''
        UPDATE tblStudentTrip
        SET has_payed = True
        WHERE student_id = :studentId AND trip_id = :tripId
      ''';
      Parameters.ParamByName('studentId').Value := studentId;

      for var t in trips do
        begin
          Parameters.ParamByName('tripId').Value := t.Id;
          ExecSQL();
        end;
    end;
end;

constructor TTripHandler.create(const vehicleHandler: IVehicleHandler;
  const driverHandler: IDriverHandler);
begin
  fVehicleHandler := vehicleHandler;
  fDriverHandler := driverHandler;
end;

procedure TTripHandler.deleteTrip(const id: Integer);
begin
  with dmMain.qryTrip do
    begin
      SQL.Text :=
      '''
        DELETE
        FROM tblStudentTrip
        WHERE trip_id = :id;
      ''';
      Parameters.ParamByName('id').Value := id;
      ExecSQL();

      SQL.Text :=
      '''
        DELETE
        FROM tblTripComment
        WHERE trip_id = :id;
      ''';
      ExecSQL();

      SQL.Text :=
      '''
        DELETE
        FROM tblTripEnquiry
        WHERE trip_id = :id;
      ''';
      ExecSQL();

      SQL.Text :=
      '''
        DELETE FROM tblTrip
        WHERE id = :id;
      ''';
      ExecSQL();
    end;
end;

function TTripHandler.getTrips(const date: TDateTime): TList<ITrip>;
begin
  Result := TList<ITrip>.Create();

  with dmMain.qryTrip do
    begin
      SQL.Text :=
      '''
        SELECT *
        FROM tblTrip
        WHERE DateValue(start_time) = :date;
      ''';
      Parameters.ParamByName('date').Value :=  DateOf(date);
      Open();

      while not Eof do
        begin
          Result.Add(TFactory.createTrip(FieldByName('Id').AsInteger,
                                         FieldByName('trip_name').AsString ,
                                         fDriverHandler.getDriverWith(FieldByName('driver_id').AsInteger),
                                         fVehicleHandler.getVehicleWith(FieldByName('vehicle_id').AsInteger),
                                         FieldByName('start_time').AsDateTime,
                                         FieldByName('cost_per_passenger').AsCurrency));

          Next();
        end;
    end;
end;

function TTripHandler.getTrips(const date: TDateTime;
  const driverId: Integer): TList<ITrip>;
begin
  Result := TList<ITrip>.Create();


  var driver := fDriverHandler.getDriverWith(driverId);
  with dmMain.qryTrip do
    begin
      SQL.Text :=
      '''
        SELECT *
        FROM tblTrip
        WHERE DateValue(start_time) = :date AND driver_id = :id;
      ''';
      Parameters.ParamByName('date').Value :=  DateOf(date);
      Parameters.ParamByName('id').Value :=  driverId;
      Open();
      while not Eof do
        begin
          Result.Add(TFactory.createTrip(FieldByName('Id').AsInteger,
                                         FieldByName('trip_name').AsString,
                                         driver,
                                         fVehicleHandler.getVehicleWith(FieldByName('vehicle_id').AsInteger),
                                         FieldByName('start_time').AsDateTime,
                                         FieldByName('cost_per_passenger').AsCurrency));
          Next();
        end;
    end;
end;

function TTripHandler.getTripsForDriver(const driverId: Integer): TList<ITrip>;
begin
  Result := TList<ITrip>.Create();

  var driver := fDriverHandler.getDriverWith(driverId);

  with dmMain.qryTrip do
    begin
      SQL.Text :=
      '''
        SELECT *
        FROM tblTrip
        WHERE driver_id = :driverId
      ''';
      Parameters.ParamByName('driverId').Value := driverId;

      Open();

      while not Eof do
        begin
          Result.Add(TFactory.createTrip(FieldByName('Id').AsInteger,
                                         FieldByName('trip_name').AsString,
                                         driver,
                                         fVehicleHandler.getVehicleWith(FieldByName('vehicle_id').AsInteger),
                                         FieldByName('start_time').AsDateTime,
                                         FieldByName('cost_per_passenger').AsCurrency));
          Next();
        end;
    end;
end;

function TTripHandler.getTripsForStudent(
  const studentId: Integer): TList<ITrip>;
begin
  Result := TList<ITrip>.Create();
  with dmMain.qryTrip do
    begin
      SQL.Text :=
      '''
        SELECT *
        FROM tblTrip
        WHERE id in
        (
          SELECT trip_id
          FROM tblStudentTrip
          WHERE student_id = :id
        )
      ''';

      Parameters.ParamByName('id').Value := studentId;
      Open();

      while not Eof do
        begin
          Result.Add(TFactory.createTrip(FieldByName('Id').AsInteger,
                                         FieldByName('trip_name').AsString ,
                                         fDriverHandler.getDriverWith(FieldByName('driver_id').AsInteger),
                                         fVehicleHandler.getVehicleWith(FieldByName('vehicle_id').AsInteger),
                                         FieldByName('start_time').AsDateTime,
                                         FieldByName('cost_per_passenger').AsCurrency));

          Next();
        end;
    end;
end;

function TTripHandler.getTripsForStudentThatNeedPayment(
  const studentId: Integer): TList<ITrip>;
begin
  Result := TList<ITrip>.Create();
  with dmMain.qryTrip do
    begin
      SQL.Text :=
      '''
        SELECT *
        FROM tblTrip
        WHERE id in
        (
          SELECT trip_id
          FROM tblStudentTrip
          WHERE student_id = :id
          AND has_payed = false
        )
        ORDER BY trip_name ASC
      ''';

      Parameters.ParamByName('id').Value := studentId;
      Open();

      while not Eof do
        begin
          Result.Add(TFactory.createTrip(FieldByName('Id').AsInteger,
                                         FieldByName('trip_name').AsString ,
                                         fDriverHandler.getDriverWith(FieldByName('driver_id').AsInteger),
                                         fVehicleHandler.getVehicleWith(FieldByName('vehicle_id').AsInteger),
                                         FieldByName('start_time').AsDateTime,
                                         FieldByName('cost_per_passenger').AsCurrency));

          Next();
        end;
    end;
    
end;

function TTripHandler.getTripsForStudent(const studentId: Integer;
  const date: TDateTime): TList<ITrip>;
begin
  Result := TList<ITrip>.Create();
  with dmMain.qryTrip do
    begin
      SQL.Text :=
      '''
        SELECT *
        FROM tblTrip
        WHERE id in
        (
          SELECT trip_id
          FROM tblStudentTrip
          WHERE student_id = :id
        )
        AND DateValue(start_time) = :date
      ''';

      Parameters.ParamByName('id').Value := studentId;
      Parameters.ParamByName('date').Value := DateOf(date);

      Open();

      while not Eof do
        begin
          Result.Add(TFactory.createTrip(FieldByName('Id').AsInteger,
                                         FieldByName('trip_name').AsString ,
                                         fDriverHandler.getDriverWith(FieldByName('driver_id').AsInteger),
                                         fVehicleHandler.getVehicleWith(FieldByName('vehicle_id').AsInteger),
                                         FieldByName('start_time').AsDateTime,
                                         FieldByName('cost_per_passenger').AsCurrency));

          Next();
        end;
    end;
end;

procedure TTripHandler.updateTrip(const trip: ITrip);
begin
  with dmMain.qryTrip do
    begin
      SQL.Text :=
      '''
        UPDATE tblTrip SET
        trip_name = :trip_name,
        driver_id = :driver_id,
        vehicle_id = :vehicle_id,
        start_time = :start_time,
        cost_per_passenger = :cost
        WHERE id = :id
      ''';

      Parameters.ParamByName('id').Value := trip.Id;
      Parameters.ParamByName('trip_name').Value := trip.Name;
      Parameters.ParamByName('driver_id').Value := trip.Driver.Id;
      Parameters.ParamByName('vehicle_id').Value := trip.Vehicle.Id;
      Parameters.ParamByName('start_time').Value := trip.StartTime;
      Parameters.ParamByName('cost').Value := trip.CostPerPassenger;
      ExecSQL()
    end;

end;

procedure TTripHandler.updateTripRatingForStudent(const studentId,
  tripId: Integer; const rating: UInt8);
begin
  with dmMain.qryTrip do
    begin
      SQL.Text :=
      '''
        UPDATE tblStudentTrip SET
        rating  = :rating
      ''';

      Parameters.ParamByName('rating').Value := rating;
      ExecSQL();
    end;
end;

end.
