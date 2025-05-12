unit clsComment_u;

interface

uses iComment_u, iUser_u;

type
  TComment = class(TInterfacedObject, IComment)
    private
      fId: Integer;
      fHeader: string;
      fContent: string;
      fUser: IUser;

      function getId(): Integer;
      procedure setId(const id: Integer);

      function getHeader(): string;
      procedure setHeader(const header: string);

      function getContent(): string;
      procedure setContent(const content: string);

      function getUser(): IUser;
      procedure setUser(const User: IUser);

    public
      constructor create(const id: Integer; const header: string;
                         const content: string; const User: IUser);

      property Id: Integer read getId write setId;
      property Header: string read getHeader write setHeader;
      property Content: string read getContent write setContent;
      property User: IUser read getUser write setUser;
  end;

implementation

{ TTripComment }

constructor TComment.create(const id: Integer; const header: string;
                         const content: string; const User: IUser);
begin
  Self.Id := id;
  Self.Header := header;
  Self.Content := content;
  Self.User := User;
end;

function TComment.getContent: string;
begin
  Result := fContent;
end;

function TComment.getHeader: string;
begin
  Result := fHeader;
end;

function TComment.getId: Integer;
begin
  Result := fId;
end;

function TComment.getUser: IUser;
begin
  Result := fUser;
end;

procedure TComment.setContent(const content: string);
begin
  fContent := content;
end;

procedure TComment.setHeader(const header: string);
begin
  fHeader := header;
end;

procedure TComment.setId(const id: Integer);
begin
  fId := id;
end;

procedure TComment.setUser(const User: IUser);
begin
  fUser := User;
end;

end.
