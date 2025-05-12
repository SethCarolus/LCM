unit clsTrip_u;

interface

uses iTrip_u, iDriver_u, iVehicle_u;

type
  TTrip = class(TInterfacedObject, ITrip)
    private
      fId: Integer;
      fName: string;
      fDriver: IDriver;
      fVehicle: IVehicle;
      fStartTime: TDateTime;
      fCostPerPassenger: Currency;

      function getId(): Integer;
      procedure setId(const id: Integer);

      function getName(): string;
      procedure setName(const name: string);

      function getDriver(): IDriver;
      procedure setDriver(const driver: IDriver);

      function getVehicle(): IVehicle;
      procedure setVehicle(const Vehicle: IVehicle);

      function getStartTime(): TDateTime;
      procedure setStartTime(const startTime: TDateTime);

      function getCostPerPassenger(): Currency;
      procedure setCostPerPassenger(const costPerPassenger: Currency);

    public

      constructor create(const id: Integer; const name: string; const driver: IDriver;
                         const vehicle: IVehicle; const startTime: TDateTime;
                         const costPerPassenger: Currency);

      property Id: Integer read getId write setId;
      property Name: string read getName write setName;
      property Driver: IDriver read getDriver write setDriver;
      property Vehicle: IVehicle read getVehicle write setVehicle;
      property StartTime: TDateTime read getStartTime write setStartTime;
      property CostPerPassenger: Currency read getCostPerPassenger write setCostPerPassenger;
  end;

implementation

{ TTrip }

constructor TTrip.create(const id: Integer; const name: string; const driver: IDriver;
                         const vehicle: IVehicle; const startTime: TDateTime;
                         const costPerPassenger: Currency);
begin
  Self.Id := id;
  Self.Name := name;
  Self.Driver := driver;
  Self.Vehicle := vehicle;
  Self.StartTime := startTime;
  Self.CostPerPassenger := costPerPassenger;
end;

function TTrip.getCostPerPassenger: Currency;
begin
  Result := fCostPerPassenger;
end;

function TTrip.getDriver: IDriver;
begin
  Result := fDriver;
end;

function TTrip.getId: Integer;
begin
  Result := fId;
end;

function TTrip.getName: string;
begin
  Result := fName;
end;

function TTrip.getStartTime: TDateTime;
begin
  Result := fStartTime;
end;

function TTrip.getVehicle: IVehicle;
begin
  Result := fVehicle;
end;

procedure TTrip.setCostPerPassenger(const costPerPassenger: Currency);
begin
  fCostPerPassenger := costPerPassenger;
end;

procedure TTrip.setDriver(const driver: IDriver);
begin
  fDriver := driver;
end;

procedure TTrip.setId(const id: Integer);
begin
  fId := id;
end;

procedure TTrip.setName(const name: string);
begin
  fName := name;
end;

procedure TTrip.setStartTime(const startTime: TDateTime);
begin
  fStartTime := startTime;
end;

procedure TTrip.setVehicle(const Vehicle: IVehicle);
begin
  fVehicle := Vehicle;
end;

end.
