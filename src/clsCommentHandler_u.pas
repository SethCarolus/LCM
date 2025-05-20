unit clsCommentHandler_u;

interface

uses iCommentHandler_u, iComment_u, Generics.Collections, iUserHandler_u;

type
  /// <summary>
  /// Handles operations related to comments, including retrieving trip-specific comments.
  /// </summary>
  TCommentHandler = class(TInterfacedObject, ICommentHandler)
    private
      fUserHandler: IUserHandler;
    public
      /// <summary>
      ///   Retrieves a list of comments associated with a specific trip.
      /// </summary>
      /// <param name="tripId">The unique identifier of the trip.</param>
      /// <returns>A list of IComment objects related to the trip.</returns>
      function getCommentsForTrip(const tripId: Integer): TList<IComment>;

      /// <summary>
      ///   Creates an instance of TCommentHandler with a specified user handler dependency.
      /// </summary>
      /// <param name="userHandler">The user handler used to retrieve user information for comments.</param>
      constructor create(const userHandler: IUserHandler);
  end;

implementation

uses dmMain_u, clsFactory_u;

{ TCommentHandler }

constructor TCommentHandler.create(const userHandler: IUserHandler);
begin
  fUserHandler := userHandler;
end;

function TCommentHandler.getCommentsForTrip(const tripId: Integer): TList<IComment>;
begin
  Result := TList<IComment>.Create();

  with dmMain.qryComment do
    begin
      SQL.Text :=
      '''
        SELECT *
        FROM tblTripComment, tblUser
        WHERE trip_id = :id
        AND tblTripComment.user_id = tblUser.Id
      ''';
      Parameters.ParamByName('id').Value := tripId;

      Open();

      while not Eof do
        begin
          Result.Add(TFactory.createComment(FieldByName('tblTripComment.ID').AsInteger,
                      FieldByName('header').AsString,
                      FieldByName('content').AsString,
                      fUserHandler.getUserWith(FieldByName('user_Id').AsInteger)
                      ));
          Next();
        end;

    end;
end;

end.
