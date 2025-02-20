unit clsVehicleHandler_u;

interface

uses iVehicleHandler_u, iVehicle_u ,Generics.Collections, iImageHandler_u;

type
  TVehicleHandler = class(TInterfacedObject, IVehicleHandler)
    private
      fImageHandler: IImageHandler;
    public
      constructor create(const imageHandler: IImageHandler);
      function getVehicles(): TList<IVehicle>;
      function getVehiclesForDriverWith(id: Integer): TList<IVehicle>;
  end;

implementation

uses dmMain_u, clsFactory_u, iImage_u;

{ TVehicleHandler }

constructor TVehicleHandler.create(const imageHandler: IImageHandler);
begin
  fImageHandler := TFactory.createImageHandler();
end;

function TVehicleHandler.getVehicles: TList<IVehicle>;
begin
  Result := TList<IVehicle>.Create();
  With dmMain.qryMain do
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
                                                  nil);
          Result.Add(vehicle);
          Next();
        end;
    end;

  for var i := 0 to Result.Count - 1 do
    begin
      Result[i].Images := fImageHandler.getImagesForVehicleWith(Result[i].id)
    end;
end;

function TVehicleHandler.getVehiclesForDriverWith(id: Integer): TList<IVehicle>;
begin
  Result := TList<IVehicle>.Create();
  With dmMain.qryMain do
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


      Close();
      Sql.Text :=
      '''
        SELECT *
        FROM tblVehicle
        WHERE id = :id;
      ''';
      Parameters.ParamByName('id').Value := id;
      Open();

      var vehicles := TList<IVehicle>.Create();

      while not Eof do
        begin
          var vehicle :=  TFactory.createVehicle(
                                                  FieldByName('ID').AsInteger,
                                                  FieldByName('model').AsString,
                                                  FieldByName('number_plate').AsString,
                                                  FieldByName('max_passengers').AsInteger,
                                                  FieldByName('color').AsString,
                                                  nil);
          Result.Add(vehicle);
          Next();
        end;

      for var i := 0 to Result.Count - 1 do
        begin
          Result[i].Images := fImageHandler.getImagesForVehicleWith(Result[i].id)
        end;

    end;
end;

end.

