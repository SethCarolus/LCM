unit iTrip_u;

interface

uses iDriver_u, iVehicle_u;

type
  ITrip = interface

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

    property Id: Integer read getId write setId;
    property Name: string read getName write setName;
    property Driver: IDriver read getDriver write setDriver;
    property Vehicle: IVehicle read getVehicle write setVehicle;
    property StartTime: TDateTime read getStartTime write setStartTime;
    property CostPerPassenger: Currency read getCostPerPassenger write setCostPerPassenger;

  end;
implementation

end.
