unit clsApplicationState_u;

interface

uses Generics.Collections, iUser_u, iChat_u;

type
  TApplicationState = class
    public
      class var CurrentUser: IUser;

      class var Chats: TList<IChat>;
      class var NewPartOfChats: TList<iChat>;

      class var SelectedChat: IChat;
      class var NewPartOfSelectedChat: iChat;

      class var UsersForRequest: TList<IUser>;
      class var SelectedUserForRequest: IUser;

      class var UsersForRequestAcceptance: TList<IUser>;
      class var SelectedUserForRequestAcceptance: IUser;
  end;

implementation

end.
