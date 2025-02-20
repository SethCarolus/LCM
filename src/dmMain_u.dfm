object dmMain: TdmMain
  Height = 480
  Width = 640
  object conMain: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=LCM.mdb;Persist Sec' +
      'urity Info=False'
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
