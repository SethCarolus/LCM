unit dmMain_u;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmMain = class(TDataModule)
    conMain: TADOConnection;
    qryUser: TADOQuery;
    qryDriver: TADOQuery;
    qryParent: TADOQuery;
    qryStudent: TADOQuery;
    qryTrip: TADOQuery;
    qryVehicle: TADOQuery;
    qryUserType: TADOQuery;
    qryImage: TADOQuery;
    qryMessage: TADOQuery;
    qryChat: TADOQuery;
    qryComment: TADOQuery;
    qryBank: TADOQuery;
    qryBankCard: TADOQuery;
    tblBankCard: TADOTable;
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
