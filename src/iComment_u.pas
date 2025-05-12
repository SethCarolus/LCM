unit iComment_u;

interface

uses iUser_u;

type
  IComment = interface
    function getId(): Integer;
    procedure setId(const id: Integer);

    function getHeader(): string;
    procedure setHeader(const header: string);

    function getContent(): string;
    procedure setContent(const content: string);

    function getUser(): IUser;
    procedure setUser(const User: IUser);

    property Id: Integer read getId write setId;
    property Header: string read getHeader write setHeader;
    property Content: string read getContent write setContent;
    property User: IUser read getUser write setUser;
  end;

implementation

end.
