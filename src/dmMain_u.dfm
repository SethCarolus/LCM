object dmMain: TdmMain
  Height = 673
  Width = 828
  object conMain: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=LCM.mdb;Persist Sec' +
      'urity Info=False'
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 64
  end
  object qryUser: TADOQuery
    Connection = conMain
    Parameters = <>
    Left = 40
    Top = 192
  end
  object qryDriver: TADOQuery
    Connection = conMain
    Parameters = <>
    Left = 40
    Top = 264
  end
  object qryParent: TADOQuery
    Connection = conMain
    Parameters = <>
    Left = 112
    Top = 192
  end
  object qryStudent: TADOQuery
    Connection = conMain
    Parameters = <>
    Left = 112
    Top = 264
  end
  object qryTrip: TADOQuery
    Connection = conMain
    Parameters = <>
    Left = 184
    Top = 440
  end
  object qryVehicle: TADOQuery
    Connection = conMain
    Parameters = <>
    Left = 120
    Top = 336
  end
  object qryUserType: TADOQuery
    Connection = conMain
    Parameters = <>
    Left = 256
    Top = 192
  end
  object qryImage: TADOQuery
    Connection = conMain
    Parameters = <>
    Left = 40
    Top = 408
  end
  object qryMessage: TADOQuery
    Connection = conMain
    Parameters = <>
    Left = 560
    Top = 200
  end
  object qryChat: TADOQuery
    Connection = conMain
    Parameters = <>
    Left = 560
    Top = 296
  end
  object qryComment: TADOQuery
    Connection = conMain
    Parameters = <>
    Left = 264
    Top = 440
  end
end
