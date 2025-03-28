unit iUserHandler_u;

interface

type
  /// <summary>
  /// Represents an interface for handling user data interactions.
  /// </summary>
  IUserHandler = interface

    /// <summary>
    /// Checks if a user exists in the system.
    /// </summary>
    /// <param name="username">The username of the user to check.</param>
    /// <returns>True if the user exists, otherwise False.</returns>
    function userExists(const username: string): Boolean;

    /// <summary>
    /// Verifies if the password entered by the user is correct.
    /// </summary>
    /// <param name="username">The username of the user whose password is being checked.</param>
    /// <param name="password">The password entered by the user.</param>
    /// <returns>True if the password matches the user's stored password, otherwise False.</returns>
    function passwordCorrect(const username: string; const password: string): Boolean;

    /// <summary>
    /// Retrieves the user type ID associated with the specified username from the database.
    /// </summary>
    /// <param name="username">The username for which the user type ID is to be retrieved.</param>
    /// <returns>
    /// The user type ID as an integer. Returns 0 if the username is not found or if an error occurs.
    /// </returns>
    function getUserTypeIdWith(const username: string): Integer;
  end;

implementation

end.

