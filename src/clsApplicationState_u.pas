unit clsApplicationState_u;

interface

uses Generics.Collections, iUser_u, iChat_u, iTrip_u, iDriver_u, iStudent_u,
     iComment_u, iBankCard_u, iParent_u, ITimer_u;

type
  /// <summary>
  /// Represents the global application state shared across different modules.
  /// </summary>
  TApplicationState = class
    public
      /// <summary>
      /// Currently logged-in user (general type).
      /// </summary>
      class var CurrentUser: IUser;

      /// <summary>
      /// Currently logged-in driver.
      /// </summary>
      class var CurrentDriver: IDriver;

      /// <summary>
      /// Currently logged-in student.
      /// </summary>
      class var CurrentStudent: IStudent;

      /// <summary>
      /// Currently logged-in parent.
      /// </summary>
      class var CurrentParent: IParent;

      /// <summary>
      /// Timer object used for habit-related functionality.
      /// </summary>
      class var HabitTimer: ITimer;

      /// <summary>
      /// List of lengths (minutes) of sessions.
      /// </summary>
      class var Habits: TList<UInt64>;

      /// <summary>
      /// List of all chats of current user.
      /// </summary>
      class var Chats: TList<IChat>;

      /// <summary>
      /// List of updated parts of chats.
      /// </summary>
      class var NewPartOfChats: TList<iChat>;

      /// <summary>
      /// Currently selected chat.
      /// </summary>
      class var SelectedChat: IChat;

      /// <summary>
      /// Newly loaded or added content of the selected chat.
      /// </summary>
      class var NewPartOfSelectedChat: iChat;

      /// <summary>
      /// List of users shown in a request UI for chats.
      /// </summary>
      class var UsersForRequest: TList<IUser>;

      /// <summary>
      /// The user currently selected from the request list.
      /// </summary>
      class var SelectedUserForRequest: IUser;

      /// <summary>
      /// List of users awaiting acceptance for chat request.
      /// </summary>
      class var UsersForRequestAcceptance: TList<IUser>;

      /// <summary>
      /// User selected from the list of users awaiting acceptance for chat request.
      /// </summary>
      class var SelectedUserForRequestAcceptance: IUser;

      /// <summary>
      /// List of trips to be displayed in UI.
      /// </summary>
      class var Trips: TList<ITrip>;

      /// <summary>
      /// Currently selected trip.
      /// </summary>
      class var SelectedTrip: ITrip;

      /// <summary>
      /// Students who are enquiring about a trip.
      /// </summary>
      class var StudentsEnquiringAboutTrip: TList<IStudent>;

      /// <summary>
      /// Selected student from the enquiry list.
      /// </summary>
      class var SelectedStudentEnquiringAboutTrip: IStudent;

      /// <summary>
      /// List of comments in UI. (eg. Trip Comments)
      /// </summary>
      class var Comments: TList<IComment>;

      /// <summary>
      /// Currently selected comment.
      /// </summary>
      class var SelectedComment: IComment;

      /// <summary>
      /// List of bank cards in UI.
      /// </summary>
      class var BankCards: TList<IBankCard>;

      /// <summary>
      /// Currently selected bank card.
      /// </summary>
      class var SelectedBankCard: IBankCard;

      /// <summary>
      /// List of all students in UI.
      /// </summary>
      class var Students: TList<IStudent>;

      /// <summary>
      /// Currently selected student.
      /// </summary>
      class var SelectedStudent: IStudent;

      /// <summary>
      /// List of trips selected for payment processing.
      /// </summary>
      class var SelectedTripsForPayment: TList<ITrip>;
  end;

implementation

end.
