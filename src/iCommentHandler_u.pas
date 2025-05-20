unit iCommentHandler_u;

interface

uses iComment_u, Generics.Collections;

type
  /// <summary>
  ///  An Interface for handling comment data interactions
  /// </summary>
  ICommentHandler = interface
    /// <summary>
    ///   Retrieves a list of comments associated with a specific trip.
    /// </summary>
    /// <param name="tripId">The unique identifier of the trip.</param>
    /// <returns>A list of IComment objects related to the trip.</returns>
    function getCommentsForTrip(const tripId: Integer): TList<IComment>;
  end;

implementation

end.
