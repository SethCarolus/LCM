unit clsComment_u;

interface

uses iComment_u, iUser_u;

type
  /// <summary>
  ///   Represents a comment made by a user, including header, content, and associated user.
  /// </summary>
  TComment = class(TInterfacedObject, IComment)
    private
      fId: Integer;
      fHeader: string;
      fContent: string;
      fUser: IUser;
      /// <summary>Gets the comment ID.</summary>
      /// <returns>Integer - The unique identifier of the comment.</returns>
      function getId(): Integer;

      /// <summary>Sets the comment ID.</summary>
      /// <param name="id">The unique identifier to assign.</param>
      procedure setId(const id: Integer);


      /// <summary>Gets the comment header/title.</summary>
      /// <returns>String - The comment header text.</returns>
      function getHeader: string;

      /// <summary>Sets the comment header/title.</summary>
      /// <param name="header">The new header text for the comment.</param>
      procedure setHeader(const header: string);

      /// <summary>Gets the content/body of the comment.</summary>
      /// <returns>String - The main text/content of the comment.</returns>
      function getContent(): string;

      /// <summary>Sets the content/body of the comment.</summary>
      /// <param name="content">The new main content of the comment.</param>
      procedure setContent(const content: string);

      /// <summary>Gets the user who created the comment.</summary>
      /// <returns>IUser - The user associated with the comment.</returns>
      function getUser(): IUser;

      /// <summary>Sets the user who created the comment.</summary>
      /// <param name="User">The IUser interface representing the author of the comment.</param>
      procedure setUser(const User: IUser);

    public

      /// <summary>
      ///   Constructs a new instance of TComment with the given values.
      /// </summary>
      /// <param name="id">The unique identifier of the comment.</param>
      /// <param name="header">The title or header of the comment.</param>
      /// <param name="content">The body content of the comment.</param>
      /// <param name="User">The user who made the comment.</param>
      constructor create(const id: Integer; const header: string;
                         const content: string; const User: IUser);

      /// <summary>The unique identifier of the comment.</summary>
      property Id: Integer read getId write setId;

      /// <summary>The header or title of the comment.</summary>
      property Header: string read getHeader write setHeader;

      /// <summary>The main text content of the comment.</summary>
      property Content: string read getContent write setContent;

      /// <summary>The user who authored the comment.</summary>
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
