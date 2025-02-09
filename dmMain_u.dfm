object dmMain: TdmMain
  Height = 480
  Width = 640
  object conMain: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\source\Coding Pr' +
      'ojects\Delphi Projects\LCM\LCM\Win64\Debug\LCM.mdb;Persist Secur' +
      'ity Info=False'
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 64
  end
  object qryMain: TADOQuery
    Connection = conMain
    Parameters = <>
    Left = 104
    Top = 64
  end
end
