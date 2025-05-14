unit clsDriverHandler_u;

interface

uses iDriverHandler_u, iDriver_u, iUserHandler_u, iImageHandler_u;

type
  TDriverHandler = class(TInterfacedObject, IDriverHandler)
    private
      fUserHandler: IUserHandler;
      fImageHandler: IImageHandler;
    public
      constructor create(const userHandler: IUserHandler; const imageHandler: IImageHandler);
      function getDriverWith(const id: Integer): IDriver;
      function getDriverWithUserId(const id: Integer): IDriver;
  end;
implementation

uses dmMain_u, clsFactory_u;

{ TDriverHandler }

constructor TDriverHandler.create(const userHandler: IUserHandler; const imageHandler: IImageHandler);
begin
  fUserHandler := userHandler;
  fImageHandler := imageHandler;
end;
function TDriverHandler.getDriverWith(const id: Integer): IDriver;
begin
  with dmMain.qryDriver do
    begin
      SQL.Text :=
      '''
        SELECT *
        FROM tblDriver
        WHERE ID = :id;
      ''';
      Parameters.ParamByName('id').Value := id;
      Open();

      Result := TFactory.createDriver(FieldByName('ID').AsInteger,
        fUserHandler.getUserWith(FieldByName('user_id').AsInteger),
        fImageHandler.getImagesForDriverWith(FieldByName('ID').AsInteger));
    end;
end;

function TDriverHandler.getDriverWithUserId(const id: Integer): IDriver;
begin
  with dmMain.qryDriver do
    begin
      SQL.Text :=
      '''
        SELECT *
        FROM tblDriver
        WHERE user_id = :id
      ''';
      Parameters.ParamByName('id').Value := id;
      Open();
      Result := TFactory.createDriver(FieldByName('ID').AsInteger,
                                      fUserHandler.getUserWith(id),
                                      fImageHandler.getImagesForDriverWith(FieldByName('ID').AsInteger));
    end;
end;

end.
