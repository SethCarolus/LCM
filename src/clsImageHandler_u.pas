unit clsImageHandler_u;

interface

uses iImageHandler_u, iImage_u, Generics.Collections;

type
  ///<summary>
  /// Handles image retrieval for vehicles and drivers by querying the database.
  ///</summary>
  TImageHandler = class(TInterfacedObject, IImageHandler)
    public
      ///<summary>
      /// Retrieves a list of images associated with a specific vehicle.
      ///</summary>
      ///<param name="id">The ID of the vehicle whose images are to be retrieved.</param>
      ///<returns>A list of IImage objects representing the vehicle's images.</returns>
      function getImagesForVehicleWith(const id: Integer): TList<IImage>;

      ///<summary>
      /// Retrieves a list of images associated with a specific driver.
      ///</summary>
      ///<param name="id">The ID of the driver whose images are to be retrieved.</param>
      ///<returns>A list of IImage objects representing the driver's images.</returns>
      function getImagesForDriverWith(const id: Integer): TList<IImage>;
  end;

implementation

uses dmMain_u, clsFactory_u;

{ TImageHandler }

function TImageHandler.getImagesForDriverWith(const id: Integer): TList<IImage>;
begin
  Result := TList<IImage>.Create();

  with dmMain.qryImage do
    begin
      Close;
      SQL.Text :=
      '''
        SELECT *
        FROM tblDriverImage
        WHERE driver_id = :id;
      ''';
      Parameters.ParamByName('id').Value := id;
      Open;

      while not Eof do
        begin
          Result.Add(TFactory.createImage(FieldByName('ID').AsInteger,
          FieldByName('file_name').AsString, FieldByName('uploaded_on').AsDateTime,
          FieldByName('description').AsString));
          Next();
        end;
    end;
end;

function TImageHandler.getImagesForVehicleWith(const id: Integer)
  : TList<IImage>;
begin
  Result := TList<IImage>.Create();

  with dmMain.qryImage do
    begin
      Close;
      SQL.Text :=
      '''
        SELECT *
        FROM tblVehicleImage
        WHERE vehicle_id = :id;
      ''';
      Parameters.ParamByName('id').Value := id;
      Open;

      while not Eof do
        begin
          Result.Add(TFactory.createImage(FieldByName('ID').AsInteger,
          FieldByName('file_name').AsString, FieldByName('uploaded_on').AsDateTime,
          FieldByName('description').AsString));
          Next;
        end;
    end;

end;

end.
