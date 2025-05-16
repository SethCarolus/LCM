unit clsApplicationState_u;

interface

uses Generics.Collections, iUser_u, iChat_u, iTrip_u, iDriver_u, iStudent_u,
     iComment_u, iBankCard_u, iParent_u;

type
  TApplicationState = class
    public
      class var CurrentUser: IUser;
      class var CurrentDriver: IDriver;
      class var CurrentStudent: IStudent;
      class var CurrentParent: IParent;

      class var Chats: TList<IChat>;
      class var NewPartOfChats: TList<iChat>;

      class var SelectedChat: IChat;
      class var NewPartOfSelectedChat: iChat;

      class var UsersForRequest: TList<IUser>;
      class var SelectedUserForRequest: IUser;

      class var UsersForRequestAcceptance: TList<IUser>;
      class var SelectedUserForRequestAcceptance: IUser;

      class var Trips: TList<ITrip>;
      class var SelectedTrip: ITrip;

      class var StudentsEnquiringAboutTrip: TList<IStudent>;
      class var SelectedStudentEnquiringAboutTrip: IStudent;

      class var Comments: TList<IComment>;
      class var SelectedComment: IComment;

      class var BankCards: TList<IBankCard>;
      class var SelectedBankCard: IBankCard;

      class var Students: TList<IStudent>;
      class var SelectedStudent: IStudent;

      class var SelectedTripsForPayment: TList<ITrip>;
  end;

implementation

end.
