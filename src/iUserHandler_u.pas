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
  end;

implementation

end.

