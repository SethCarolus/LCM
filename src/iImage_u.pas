unit iImage_u;

interface

type
  /// <summary>
  ///   Represents an Image.
  /// </summary>
  IImage = interface

    /// <summary>
    /// Function that returns the id of the image.
    /// </summary>
    /// <returns>The id of the Image.</returns>
    function getId: Integer;

    /// <summary>
    /// Procedure that sets the id of the image.
    /// </summary>
    /// <param name="id">Id to assign to the image.</param>
    procedure setId(const id: Integer);

    /// <summary>
    /// Function that returns the file name of the Image.
    /// </summary>
    /// <returns>The file name of the image.</returns>
    function getFileName: string;

    /// <summary>
    /// Procedure that sets the file name of the image.
    /// </summary>
    /// <param name="fileName">File name to assign to the image.</param>
    procedure setFileName(const fileName: string);

    /// <summary>
    /// Function that returns the date the image was uploaded on.
    /// </summary>
    /// <returns>The date the image was uploaded on.</returns>
    function getUploadedOn(): TDate;

    /// <summary>
    /// Procedure that sets the date the image was uploaded on.
    /// </summary>
    /// <param name="uploadedOn">The date the image was uploaded on.</param>
    procedure setUploadedOn(const uploadedOn: TDate);

    /// <summary>
    /// Function that returns the description of the image.
    /// </summary>
    /// <returns>The description of the image.</returns>
    function getDescription: string;

    /// <summary>
    /// Procedure that sets the description of the image.
    /// </summary>
    /// <param name="description">The description to assign to the image.</param>
    procedure setDescription(const description: string);

    /// <summary>
    /// Represents the id of the image.
    /// </summary>
    property Id: Integer read getId write setId;

    /// <summary>
    /// Represents the file name of the image.
    /// </summary>
    property FileName: string read getFileName write setFileName;

    /// <summary>
    /// Represents the date the image was uploaded on.
    /// </summary>
    property UploadedOn: TDate read getUploadedOn write setUploadedOn;

    /// <summary>
    /// Represents the description of the image.
    /// </summary>
    property Description: string read getDescription write setDescription;

  end;

implementation

end.
