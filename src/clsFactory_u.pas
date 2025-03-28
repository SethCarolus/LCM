unit clsFactory_u;

interface

uses IVehicle_u, IImage_u, Generics.Collections, iVehicleHandler_u,
    iImageHandler_u, iUserHandler_u, iUserType_u, iMessageHandler_u, iMessage_u,
    iUser_u, iUserTypeHandler_u, iChat_u, IChatHandler_u;

type

  TFactory = class
  private
    constructor create;
  public
    // Data Objects

    ///<summary>
    ///Creates and returns a default IVehicle object using the default constructor of TVehicle.
    ///</summary>
    ///<returns>
    ///An instance of IVehicle created using the default constructor.
    /// </returns>
    class function createVehicle(): IVehicle; overload;

    /// <summary>
    /// Creates and returns an IVehicle object with the specified parameters.
    /// </summary>
    /// <param name="id">The ID of the vehicle.</param>
    /// <param name="model">The model of the vehicle.</param>
    /// <param name="numberPlate">The number plate of the vehicle.</param>
    /// <param name="maxPassengers">The maximum number of passengers the vehicle can carry.</param>
    /// <param name="color">The interior color of the vehicle.</param>
    /// <param name="images">A list of images associated with the vehicle.</param>
    /// <returns>
    /// An instance of IVehicle created with the specified attributes.
    /// </returns>
    class function createVehicle(const id: Integer; const model: string;
      const numberPlate: string; const maxPassengers: Integer;
      const color: string; const images: TList<IImage>): IVehicle; overload;

    /// <summary>
    /// Creates and returns a default IImage object using the default constructor of TImage.
    /// </summary>
    /// <returns>
    /// An instance of IImage created with default values.
    /// </returns>
    class function createImage(): IImage;overload;

    /// <summary>
    /// Creates and returns an IImage object with the specified parameters.
    /// </summary>
    /// <param name="id">The ID of the image.</param>
    /// <param name="fileName">The file name of the image.</param>
    /// <param name="uploadedOn">The date the image was uploaded.</param>
    /// <param name="description">The description of the image.</param>
    /// <returns>
    /// An instance of IImage created with the specified attributes.
    /// </returns>
    class function createImage(const id: Integer; const fileName: string;
      const uploadedOn: TDate; const description: string): IImage; overload;


    class function createUserType(const id: Integer; const name: string;
                                          const description: string) : IUserType;

    class function createMessage(const id: Integer; const senderId: Integer;
                                 const receiverId: Integer; const content: string;
                                 const timeStamp: TDateTime; const isRead: Boolean) : IMessage;

    class function createUser(const id: Integer; username, firstName, lastName, displayName: string;
                              const createdOn: TDateTime; const lastLogin: TDateTime;
                              const userType: IUserType): IUser;

    class function createChat(const messages: TList<IMessage>; const displayName: string): IChat;
    // Handlers

    class function createVehicleHandler(): IVehicleHandler;
    class function createImageHandler(): IImageHandler;
    class function createUserHandler(): IUserHandler;
    class function createMessageHandler(): IMessageHandler;
    class function createUserTypeHandler(): IUserTypeHandler;
    class function createChatHandler(): IChatHandler;
  end;

implementation

uses SysUtils, clsVehicle_u, clsVehicleHandler_u, clsImage_u, clsImageHandler_u,
     clsUserHandler_u, clsUserType_u, clsMessageHandler_u, clsMessage_u, clsUser_u,
     clsUserTypeHandler_u, clsChat_u, clsChatHandler_u;

{ TFactory }

constructor TFactory.create;
begin
  raise Exception.Create('Cannot Instatiate TFactory!');
end;

class function TFactory.createChat(const messages: TList<IMessage>;
  const displayName: string): IChat;
begin
  Result := TChat.create(messages, displayName);
end;

class function TFactory.createChatHandler: IChatHandler;
begin
  Result := TChatHandler.Create();
end;

class function TFactory.createImage(const id: Integer; const fileName: string;
  const uploadedOn: TDate; const description: string): IImage;
begin
  Result := TImage.create(id, fileName, uploadedOn, description);
end;

class function TFactory.createImageHandler: IImageHandler;
begin
  Result := TImageHandler.create();
end;

class function TFactory.createMessage(const id, senderId, receiverId: Integer;
  const content: string; const timeStamp: TDateTime;
  const isRead: Boolean): IMessage;
begin
  Result := TMessage.create(id, receiverId, senderId, content, timeStamp, isRead)
end;

class function TFactory.createMessageHandler: IMessageHandler;
begin
  Result := TMessageHandler.create();
end;

class function TFactory.createUser(const id: Integer; username, firstName, lastName, displayName: string;
                              const createdOn: TDateTime; const lastLogin: TDateTime;
                              const userType: IUserType): IUser;
begin
  Result := TUser.create(id, username, firstName, lastName, displayName, createdOn, lastLogin, userType);
end;

class function TFactory.createUserHandler: IUserHandler;
begin
  Result := TUserHandler.create();
end;

class function TFactory.createUserType(const id: Integer; const name,
  description: string): IUserType;
begin
  Result := TUserType.create(id, name, description);
end;

class function TFactory.createUserTypeHandler: IUserTypeHandler;
begin
  Result := TUserTypeHandler.create();
end;

class function TFactory.createImage: IImage;
begin
  Result := TImage.create();
end;

class function TFactory.createVehicle(const id: Integer; const model,
  numberPlate: string; const maxPassengers: Integer; const color: string;
  const images: TList<IImage>): IVehicle;
begin
  Result := TVehicle.create(id, model, numberPlate, maxPassengers, color, images);
end;

class function TFactory.createVehicleHandler: IVehicleHandler;
begin
  Result := TVehicleHandler.create(createImageHandler());
end;

class function TFactory.createVehicle: IVehicle;
begin
  Result := TVehicle.create();
end;
end.
