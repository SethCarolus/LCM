unit clsDriverHandler_u;

interface

uses iDriverHandler_u, iDriver_u, iUserHandler_u, iImageHandler_u;

type
  /// <summary>
  ///   Handles driver-related operations such as retrieving drivers by ID or user ID.
  /// </summary>
  TDriverHandler = class(TInterfacedObject, IDriverHandler)
    private
      fUserHandler: IUserHandler;
      fImageHandler: IImageHandler;
    public
      /// <summary>
      ///   Creates a new instance of TDriverHandler.
      /// </summary>
      /// <param name="userHandler">Handler responsible for user-related operations.</param>
      /// <param name="imageHandler">Handler responsible for image-related operations.</param>
      constructor create(const userHandler: IUserHandler; const imageHandler: IImageHandler);

      /// <summary>
      ///   Retrieves a driver based on their driver ID.
      /// </summary>
      /// <param name="id">The unique identifier of the driver.</param>
      /// <returns>IDriver - The driver object corresponding to the given ID.</returns>
      function getDriverWith(const id: Integer): IDriver;

      /// <summary>
      ///   Retrieves a driver based on the associated user ID.
      /// </summary>
      /// <param name="id">The unique identifier of the user.</param>
      /// <returns>IDriver - The driver object associated with the user ID.</returns>
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
