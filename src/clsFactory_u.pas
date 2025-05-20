unit clsFactory_u;

interface

uses IVehicle_u, IImage_u, Generics.Collections, iVehicleHandler_u,
    iImageHandler_u, iUserHandler_u, iUserType_u, iMessageHandler_u, iMessage_u,
    iUser_u, iUserTypeHandler_u, iChat_u, IChatHandler_u, iTrip_u,
    iTripHandler_u, iDriver_u, iDriverHandler_u, iStudent_u, iStudentHandler_u,
    iComment_u, iCommentHandler_u,
    iBankCard_u, iBank_u, iBankCardHandler_u, iBankHandler_u, iParent_u,
    iParentHandler_u, iPaymentHandler_u, IUserHabitHandler_u, ITimer_u;

type

  TFactory = class
  private
    constructor create;
  public
    ///<summary>
    ///Creates and returns a default IVehicle object using the default constructor of TVehicle.
    ///</summary>
    ///<returns>An instance of IVehicle created using the default constructor.</returns>
    class function createVehicle(): IVehicle; overload;

    ///<summary>
    ///Creates and returns an IVehicle object with the specified parameters.
    ///</summary>
    ///<param name="id">The ID of the vehicle.</param>
    ///<param name="model">The model of the vehicle.</param>
    ///<param name="numberPlate">The number plate of the vehicle.</param>
    ///<param name="maxPassengers">The maximum number of passengers the vehicle can carry.</param>
    ///<param name="color">The interior color of the vehicle.</param>
    ///<param name="images">A list of images associated with the vehicle.</param>
    ///<returns>An instance of IVehicle created with the specified attributes.</returns>
    class function createVehicle(const id: Integer; const model: string;
      const numberPlate: string; const maxPassengers: Integer;
      const color: string; const images: TList<IImage>): IVehicle; overload;

    ///<summary>
    ///Creates and returns a default IImage object using the default constructor of TImage.
    ///</summary>
    ///<returns>An instance of IImage created with default values.</returns>
    class function createImage(): IImage; overload;

    ///<summary>
    ///Creates and returns an IImage object with the specified parameters.
    ///</summary>
    ///<param name="id">The ID of the image.</param>
    ///<param name="fileName">The file name of the image.</param>
    ///<param name="uploadedOn">The date the image was uploaded.</param>
    ///<param name="description">The description of the image.</param>
    ///<returns>An instance of IImage created with the specified attributes.</returns>
    class function createImage(const id: Integer; const fileName: string;
      const uploadedOn: TDate; const description: string): IImage; overload;

    ///<summary>Creates a user type with the specified ID, name, and description.</summary>
    ///<param name="id">The unique ID of the user type.</param>
    ///<param name="name">The name of the user type.</param>
    ///<param name="description">A description of the user type.</param>
    ///<returns>An instance of IUserType.</returns>
    class function createUserType(const id: Integer; const name: string;
                                          const description: string) : IUserType;

    ///<summary>Creates a message with full properties.</summary>
    ///<param name="id">The ID of the message.</param>
    ///<param name="senderId">The ID of the sender user.</param>
    ///<param name="receiverId">The ID of the receiver user.</param>
    ///<param name="content">The message content.</param>
    ///<param name="timeStamp">Time the message was sent.</param>
    ///<param name="isRead">Indicates whether the message has been read.</param>
    ///<returns>An instance of IMessage.</returns>
    class function createMessage(const id: Integer; const senderId: Integer;
                                 const receiverId: Integer; const content: string;
                                 const timeStamp: TDateTime; const isRead: Boolean) : IMessage;

    ///<summary>Creates a user with specified attributes.</summary>
    ///<param name="id">The ID of the user.</param>
    ///<param name="username">The username.</param>
    ///<param name="firstName">The first name.</param>
    ///<param name="lastName">The last name.</param>
    ///<param name="displayName">The display name.</param>
    ///<param name="createdOn">Account creation date.</param>
    ///<param name="lastLogin">Last login timestamp.</param>
    ///<param name="userType">The user type instance.</param>
    ///<param name="bankCards">Bank cards associated with the user.</param>
    ///<returns>An instance of IUser.</returns>
    class function createUser(const id: Integer; username, firstName, lastName, displayName: string;
                              const createdOn: TDateTime; const lastLogin: TDateTime;
                              const userType: IUserType;
                              const bankCards: TList<IBankCard>): IUser;

    ///<summary>Creates a chat session instance with messages and display info.</summary>
    ///<param name="messages">List of messages in the chat.</param>
    ///<param name="UserId">The user ID associated with the chat.</param>
    ///<param name="displayName">The display name of the chat user.</param>
    ///<returns>An instance of IChat.</returns>
    class function createChat(const messages: TList<IMessage>;
                                   const UserId: Integer;
                                   const displayName: string): IChat;

    ///<summary>Creates a trip with the specified information.</summary>
    ///<param name="id">Trip ID.</param>
    ///<param name="name">Trip name or label.</param>
    ///<param name="driver">Associated driver object.</param>
    ///<param name="vehicle">Vehicle used in the trip.</param>
    ///<param name="startTime">Start time of the trip.</param>
    ///<param name="costPerPassenger">Cost per passenger.</param>
    ///<returns>An instance of ITrip.</returns>
    class function createTrip(const id: Integer; const name: string;
                              const driver: IDriver;
                              const vehicle: IVehicle;
                              const startTime: TDateTime;
                              const costPerPassenger: Currency): ITrip;

    ///<summary>Creates a driver instance with associated user and image data.</summary>
    ///<param name="id">Driver ID.</param>
    ///<param name="user">Associated user instance.</param>
    ///<param name="images">Images linked to the driver.</param>
    ///<returns>An instance of IDriver.</returns>
    class function createDriver(const id: Integer; const user: IUser;
                                const images: TList<IImage>): IDriver;

    ///<summary>Creates a student instance.</summary>
    ///<param name="id">Student ID.</param>
    ///<param name="user">Associated user instance.</param>
    ///<param name="grade">Student's grade level.</param>
    ///<param name="c">Additional code or type character.</param>
    ///<returns>An instance of IStudent.</returns>
    class function createStudent(const id: Integer; const user: IUser;
                            const grade: Integer; const c: Char): IStudent;

    ///<summary>Creates a comment with content, header, and user data.</summary>
    ///<param name="id">Comment ID.</param>
    ///<param name="header">Comment header/title.</param>
    ///<param name="content">Body of the comment.</param>
    ///<param name="user">User who made the comment.</param>
    ///<returns>An instance of IComment.</returns>
    class function createComment(const id: Integer; const header: string;
                                 const content: string;
                                 const user: IUser): IComment;

    ///<summary>Creates a bank card with the specified data.</summary>
    ///<param name="id">Bank card ID.</param>
    ///<param name="accountNumber">Account number.</param>
    ///<param name="nameOnCard">Name printed on the card.</param>
    ///<param name="expireyDate">Expiration date of the card.</param>
    ///<param name="securityCode">CVV or security code.</param>
    ///<param name="balance">Card balance.</param>
    ///<param name="bank">Associated bank.</param>
    ///<returns>An instance of IBankCard.</returns>
    class function createBankCard(const id: integer; const accountNumber : string;
                            const nameOnCard: string;
                            const expireyDate: TDateTime;
                            const securityCode: string; const balance: Double;
                            const bank: IBank): IBankCard;

    ///<summary>Creates a bank instance.</summary>
    ///<param name="id">Bank ID.</param>
    ///<param name="shortName">Shortened name for display.</param>
    ///<param name="longName">Full name of the bank.</param>
    ///<param name="phoneNumber">Contact number for the bank.</param>
    ///<returns>An instance of IBank.</returns>
    class function createBank(const id: Integer; const shortName: string;
                            const longName: string; const phoneNumber: string) : IBank;

    ///<summary>Creates a parent user instance.</summary>
    ///<param name="id">Parent ID.</param>
    ///<param name="user">Associated user instance.</param>
    ///<returns>An instance of IParent.</returns>
    class function createParent(const id: Integer; const user: IUser): IParent;

    // Handlers
    class function createVehicleHandler(): IVehicleHandler;
    class function createImageHandler(): IImageHandler;
    class function createUserHandler(): IUserHandler;
    class function createMessageHandler(): IMessageHandler;
    class function createUserTypeHandler(): IUserTypeHandler;
    class function createChatHandler(): IChatHandler;
    class function createTripHandler(): ITripHandler;
    class function createDriverHandler(): IDriverHandler;
    class function createStudentHandler(): IStudentHandler;
    class function createCommentHandler(): ICommentHandler;
    class function createBankCardHandler(): IBankCardHandler;
    class function createBankHandler(): IBankHandler;
    class function createParentHandler(): IParentHandler;
    class function createPaymentHandler(): IPaymentHandler;
    class function createUserHabitHandler(): IUserHabitHandler;

    // Other Objects
    ///<summary>Creates and returns an application timer instance.</summary>
    ///<returns>An instance of ITimer.</returns>
    class function createTimer(): ITimer;
  end;

implementation

uses SysUtils, clsVehicle_u, clsVehicleHandler_u, clsImage_u, clsImageHandler_u,
     clsUserHandler_u, clsUserType_u, clsMessageHandler_u, clsMessage_u,
     clsUser_u, clsUserTypeHandler_u, clsChat_u, clsChatHandler_u, clsTrip_u,
     clsTripHandler_u, clsDriverHandler_u, clsDriver_u, clsStudent_u,
     clsStudentHandler_u, clsComment_u, clsCommentHandler_u,
     clsBank_u, clsBankCard_u, clsBankHandler_u, clsBankCardHandler_u,
     clsParent_u, clsParentHandler_u, clsPaymentHandler_u, clsUserHabitHandler_u,
     clsTimer_u;

{ TFactory }

constructor TFactory.create;
begin
  raise Exception.Create('Cannot Instatiate TFactory!');
end;

class function TFactory.createBank(const id: Integer; const shortName, longName,
  phoneNumber: string): IBank;
begin
  Result := TBank.create(id, shortName, longName, phoneNumber);
end;

class function TFactory.createBankCard(const id: integer; const accountNumber,
  nameOnCard: string; const expireyDate: TDateTime; const securityCode: string;
  const balance: Double; const bank: IBank): IBankCard;
begin
  Result := TBankCard.Create(id, accountNumber, nameOnCard, expireyDate,
                             securityCode, balance, bank);
end;

class function TFactory.createBankCardHandler: IBankCardHandler;
begin
  Result := TBankCardHandler.Create(createBankHandler());
end;

class function TFactory.createBankHandler: IBankHandler;
begin
  Result := TBankHandler.Create();
end;

class function TFactory.createChat(const messages: TList<IMessage>;
                                   const UserId: Integer;
                                   const displayName: string): IChat;
begin
  Result := TChat.create(messages, userId,displayName);
end;

class function TFactory.createChatHandler: IChatHandler;
begin
  Result := TChatHandler.Create(createUserHandler(), createUserTypeHandler(),
                                createMessageHandler());
end;

class function TFactory.createComment(const id: Integer; const header: string;
                                 const content: string;
                                 const user: IUser): IComment;
begin
  Result := TComment.create(id, header , content, user);
end;

class function TFactory.createCommentHandler: ICommentHandler;
begin
  Result := TCommentHandler.Create(createUserHandler());
end;

class function TFactory.createDriver(const id: Integer; const user: IUser;
                                const images: TList<IImage>): IDriver;
begin
  Result := TDriver.create(id, user, images);
end;

class function TFactory.createDriverHandler: IDriverHandler;
begin
  Result := TDriverHandler.Create(createUserHandler(), createImageHandler());
end;

class function TFactory.createImage(const id: Integer; const fileName: string;
  const uploadedOn: TDate; const description: string): IImage;
begin
  Result := TLCMImage.create(id, fileName, uploadedOn, description);
end;

class function TFactory.createImageHandler: IImageHandler;
begin
  Result := TImageHandler.create();
end;

class function TFactory.createMessage(const id, senderId, receiverId: Integer;
  const content: string; const timeStamp: TDateTime;
  const isRead: Boolean): IMessage;
begin
  Result := TMessage.create(id, senderId, receiverId, content, timeStamp, isRead)
end;

class function TFactory.createMessageHandler: IMessageHandler;
begin
  Result := TMessageHandler.create();
end;

class function TFactory.createParent(const id: Integer;
  const user: IUser): IParent;
begin
  Result := TParent.create(id, user);
end;

class function TFactory.createParentHandler: IParentHandler;
begin
  Result := TParentHandler.create(createUserHandler(), createBankCardHandler());
end;

class function TFactory.createPaymentHandler: IPaymentHandler;
begin
  Result := TPaymentHandler.create(createBankCardHandler(), createTripHandler());
end;

class function TFactory.createStudent(const id: Integer; const user: IUser;
                            const grade: Integer; const c: Char): IStudent;
begin
  Result := TStudent.create(id, user, grade, c);
end;

class function TFactory.createStudentHandler: IStudentHandler;
begin
  Result := TStudentHandler.Create(createUserHandler());
end;

class function TFactory.createTimer: ITimer;
begin
  Result := TTimer.create();
end;

class function TFactory.createTrip(const id: Integer; const name: string;
                              const driver: IDriver;
                              const vehicle: IVehicle;
                              const startTime: TDateTime;
                              const costPerPassenger: Currency): ITrip;
begin
  Result := TTrip.Create(id, name,driver, vehicle, startTime, costPerPassenger);
end;

class function TFactory.createTripHandler: ITripHandler;
begin
  Result := TTripHandler.Create(createVehicleHandler(), createDriverHandler());
end;

class function TFactory.createUser(const id: Integer; username, firstName, lastName, displayName: string;
                              const createdOn: TDateTime; const lastLogin: TDateTime;
                              const userType: IUserType;
                              const bankCards: TList<IBankCard>): IUser;
begin
  Result := TUser.create(id, username, firstName, lastName, displayName,
                         createdOn, lastLogin, userType, bankCards);
end;

class function TFactory.createUserHandler: IUserHandler;
begin
  Result := TUserHandler.create(createUserTypeHandler(),
                                createBankCardHandler());
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
  Result := TLCMImage.create();
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

class function TFactory.createUserHabitHandler: IUserHabitHandler;
begin
   Result := TUserHabitHandler.create();
end;
end.
