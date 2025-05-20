unit clsVehicleHandler_u;

interface

uses iVehicleHandler_u, iVehicle_u ,Generics.Collections, iImageHandler_u;

type
   /// <summary>
   /// A class representing a away to deal with Vehicle data interactions.
   /// </summary>
TVehicleHandler = class(TInterfacedObject, IVehicleHandler)
  private
    fImageHandler: IImageHandler;
  public
    constructor create(const imageHandler: IImageHandler);

    /// <summary>
    /// Returns a list of all the vehicles in the database.
    /// </summary>
    /// <returns>A list of IVehicle</returns>
    function getVehicles(): TList<IVehicle>;

    /// <summary>
    /// Returns a list of all the vehicles for a particular driver.
    /// </summary>
    ///  <param name="id">The drivers ID.</param>
    /// <returns>A list of IVehicle</returns>
    function getVehiclesForDriverWith(id: Integer): TList<IVehicle>;

    /// <summary>
    /// Returns a particular vehicle.
    /// </summary>
    /// <param name="id">The vehicle's id.</param>
    /// <returns>A Vehicle</returns>
    function getVehicleWith(const id: Integer): IVehicle;
  end;

implementation

uses dmMain_u, clsFactory_u, iImage_u;

{ TVehicleHandler }

constructor TVehicleHandler.create(const imageHandler: IImageHandler);
begin
  fImageHandler := imageHandler;
end;

function TVehicleHandler.getVehicles: TList<IVehicle>;
begin
  Result := TList<IVehicle>.Create();
  With dmMain.qryVehicle do
    begin
      Close();
      SQL.Text :=
      '''
        SELECT *
        FROM tblVehicle;
      ''';
      Open;
      while not Eof do
        begin
          var vehicle :=  TFactory.createVehicle(
                                                  FieldByName('ID').AsInteger,
                                                  FieldByName('model').AsString,
                                                  FieldByName('number_plate').AsString,
                                                  FieldByName('max_passengers').AsInteger,
                                                  FieldByName('color').AsString,
                                                  fImageHandler.getImagesForVehicleWith(FieldByName('ID').AsInteger));
          Result.Add(vehicle);
          Next();
        end;
    end;
end;

function TVehicleHandler.getVehiclesForDriverWith(id: Integer): TList<IVehicle>;
begin
  Result := TList<IVehicle>.Create();
  With dmMain.qryVehicle do
    begin
      Close;
      Sql.Text :=
      '''
        SELECT *
        FROM tblDriverVehicle
        WHERE driver_id = :id;
      ''';
      Parameters.ParamByName('id').Value := id;
      Open();

      var vehicleIds := TList<Integer>.Create();

      while not Eof do
        begin
          vehicleIds.Add(FieldByName('vehicle_id').AsInteger);
          Next();
        end;

      for var vID in vehicleIds do
        begin
          Result.Add(getVehicleWith(vID));
        end;
    end;
end;

function TVehicleHandler.getVehicleWith(const id: Integer): IVehicle;
begin
  With dmMain.qryVehicle do
    begin
      Close();
      Sql.Text :=
      '''
        SELECT *
        FROM tblVehicle
        WHERE id = :id;
      ''';
      Parameters.ParamByName('id').Value := id;
      Open();

      Result := TFactory.createVehicle(FieldByName('ID').AsInteger,
                                      FieldByName('model').AsString,
                                      FieldByName('number_plate').AsString,
                                      FieldByName('max_passengers').AsInteger,
                                      FieldByName('color').AsString,
                                      fImageHandler.getImagesForVehicleWith(FieldByName('ID').AsInteger));
    end;
end;

end.
