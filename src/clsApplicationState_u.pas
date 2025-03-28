unit clsApplicationState_u;

interface

uses Generics.Collections, iUser_u, iChat_u;

type
  TApplicationState = class
    public
      class var CurrentUser: IUser;
      class var Chats: TList<IChat>;
  end;

implementation

end.
