unit dmMain_u;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmMain = class(TDataModule)
    conMain: TADOConnection;
    qryMain: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMain: TdmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
