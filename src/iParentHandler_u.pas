unit iParentHandler_u;

interface

uses iParent_u;

type
  IParentHandler = interface

    ///<summary>
    /// Retrieves the parent record associated with a given user ID.
    ///</summary>
    ///<param name="userId">The ID of the user to find the parent for.</param>
    ///<returns>An IParent object containing parent details.</returns>
    function getParent(const userId: Integer): IParent;
  end;

implementation

end.
