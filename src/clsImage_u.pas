unit clsImage_u;

interface

uses iImage_u;

type
  /// <summary>
  /// Represents an Image.
  /// </summary>
  TLCMImage = class(TInterfacedObject, IImage)

  private
    fId: Integer;
    fFileName: string;
    fUploadedOn: TDate;
    fDescription: string;

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

  public
    /// <summary>
    /// Constructor for creating an image with default values.
    /// </summary>
    constructor Create; overload;

    /// <summary>
    /// Constructor for creating an image with specified parameters.
    /// </summary>
    /// <param name="id">The ID of the image.</param>
    /// <param name="fileName">The file name of the image.</param>
    /// <param name="uploadedOn">The date the image was uploaded.</param>
    /// <param name="description">The description of the image.</param>
    constructor Create(const id: Integer; const fileName: string;
      const uploadedOn: TDate; const description: string); overload;

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

constructor TLCMImage.Create(const id: Integer; const fileName: string;
  const uploadedOn: TDate; const description: string);
begin
  Self.Id := id;
  Self.FileName := fileName;
  Self.UploadedOn := uploadedOn;
  Self.Description := description;
end;

constructor TLCMImage.Create;
begin

end;

{ TVehicleImage }

function TLCMImage.getDescription: string;
begin
  Result := fDescription;
end;

function TLCMImage.getFileName: string;
begin
  Result := fFileName;
end;

function TLCMImage.getId: Integer;
begin
  Result := fId;
end;

function TLCMImage.getUploadedOn: TDate;
begin
  Result := fUploadedOn;
end;

procedure TLCMImage.setDescription(const description: string);
begin
  fDescription := description;
end;

procedure TLCMImage.setFileName(const fileName: string);
begin
  fFileName := fileName;
end;

procedure TLCMImage.setId(const id: Integer);
begin
  fId := id;
end;

procedure TLCMImage.setUploadedOn(const uploadedOn: TDate);
begin
  fUploadedOn := uploadedOn;
end;

end.
