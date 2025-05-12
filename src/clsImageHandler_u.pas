unit clsImageHandler_u;

interface

uses iImageHandler_u, iImage_u, Generics.Collections;

type
  TImageHandler = class(TInterfacedObject, IImageHandler)
    public
      function getImagesForVehicleWith(const id: Integer): TList<IImage>;
      function getImagesForDriverWith(const id: Integer): TList<IImage>;
  end;

implementation

uses dmMain_u, clsFactory_u;

{ TImageHandler }

function TImageHandler.getImagesForDriverWith(const id: Integer): TList<IImage>;
begin
  Result := TList<IImage>.Create();

  with dmMain.qryMain do
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

  with dmMain.qryMain do
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
