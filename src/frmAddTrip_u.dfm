object frmAddTrip: TfrmAddTrip
  Left = 0
  Top = 0
  Caption = 'LCM'
  ClientHeight = 761
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 15
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 761
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Alignment = taLeftJustify
    BevelOuter = bvNone
    ColumnCollection = <
      item
        Value = 30.000000000000000000
      end
      item
        Value = 35.000000000000000000
      end
      item
        Value = 35.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = lstVehicleNames
        Row = 1
      end
      item
        Column = 1
        Control = StackPanel2
        Row = 1
      end
      item
        Column = 2
        Control = StackPanel4
        Row = 1
      end
      item
        Column = 2
        Control = Label6
        Row = 0
      end
      item
        Column = 2
        Control = btnAdd
        Row = 2
      end
      item
        Column = 0
        ColumnSpan = 2
        Control = Label1
        Row = 0
      end>
    RowCollection = <
      item
        Value = 10.000000000000000000
      end
      item
        Value = 80.000000000000000000
      end
      item
        Value = 10.000000000000000000
      end
      item
        SizeStyle = ssAuto
      end>
    TabOrder = 0
    DesignSize = (
      984
      761)
    object lstVehicleNames: TListBox
      AlignWithMargins = True
      Left = 10
      Top = 86
      Width = 275
      Height = 589
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      ItemHeight = 15
      TabOrder = 0
      OnClick = lstVehicleNamesClick
    end
    object StackPanel2: TStackPanel
      AlignWithMargins = True
      Left = 298
      Top = 79
      Width = 339
      Height = 603
      Align = alClient
      BevelOuter = bvNone
      ControlCollection = <
        item
          Control = Label3
        end
        item
          Control = edtModel
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpFill
        end
        item
          Control = edtNumberPlate
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpFill
        end
        item
          Control = edtMaxPassengers
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpFill
        end
        item
          Control = edtColor
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpFill
        end
        item
          Control = imgVehicle
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpFill
        end
        item
          Control = btnVehicleImageNext
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpFill
        end>
      HorizontalPositioning = sphpCenter
      TabOrder = 1
      object Label3: TLabel
        Left = 151
        Top = 0
        Width = 37
        Height = 15
        Alignment = taCenter
        Caption = 'Vehicle'
      end
      object edtModel: TLabeledEdit
        AlignWithMargins = True
        Left = 10
        Top = 47
        Width = 319
        Height = 23
        Margins.Left = 10
        Margins.Top = 30
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Alignment = taCenter
        EditLabel.Width = 37
        EditLabel.Height = 15
        EditLabel.Caption = 'Model:'
        ReadOnly = True
        TabOrder = 1
        Text = ''
      end
      object edtNumberPlate: TLabeledEdit
        AlignWithMargins = True
        Left = 10
        Top = 112
        Width = 319
        Height = 23
        Margins.Left = 10
        Margins.Top = 30
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Alignment = taCenter
        EditLabel.Width = 76
        EditLabel.Height = 15
        EditLabel.Caption = 'Number Plate:'
        ReadOnly = True
        TabOrder = 0
        Text = ''
      end
      object edtMaxPassengers: TLabeledEdit
        AlignWithMargins = True
        Left = 10
        Top = 177
        Width = 319
        Height = 23
        Margins.Left = 10
        Margins.Top = 30
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Alignment = taCenter
        EditLabel.Width = 86
        EditLabel.Height = 15
        EditLabel.Caption = 'Max Passengers:'
        ReadOnly = True
        TabOrder = 2
        Text = ''
      end
      object edtColor: TLabeledEdit
        AlignWithMargins = True
        Left = 10
        Top = 242
        Width = 319
        Height = 23
        Margins.Left = 10
        Margins.Top = 30
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Alignment = taCenter
        EditLabel.Width = 39
        EditLabel.Height = 15
        EditLabel.Caption = 'Colour:'
        ReadOnly = True
        TabOrder = 3
        Text = ''
      end
      object imgVehicle: TImage
        AlignWithMargins = True
        Left = 10
        Top = 287
        Width = 319
        Height = 200
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        ParentShowHint = False
        ShowHint = False
        Stretch = True
      end
      object btnVehicleImageNext: TButton
        AlignWithMargins = True
        Left = 10
        Top = 499
        Width = 319
        Height = 61
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Caption = 'Next'
        TabOrder = 4
        OnClick = btnVehicleImageNextClick
      end
    end
    object StackPanel4: TStackPanel
      Left = 640
      Top = 76
      Width = 344
      Height = 609
      Align = alClient
      BevelOuter = bvNone
      ControlCollection = <
        item
          Control = Label5
          HorizontalPositioning = sphpCenter
        end
        item
          Control = edtName
        end
        item
          Control = Label4
          HorizontalPositioning = sphpCenter
        end
        item
          Control = nbxPrice
        end
        item
          Control = Label2
          HorizontalPositioning = sphpCenter
        end
        item
          Control = dtpStartTime
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpFill
        end>
      TabOrder = 2
      object Label5: TLabel
        AlignWithMargins = True
        Left = 154
        Top = 3
        Width = 35
        Height = 15
        Alignment = taCenter
        Caption = 'Name:'
      end
      object edtName: TEdit
        AlignWithMargins = True
        Left = 10
        Top = 33
        Width = 342
        Height = 23
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Alignment = taCenter
        TabOrder = 1
      end
      object Label4: TLabel
        AlignWithMargins = True
        Left = 157
        Top = 71
        Width = 29
        Height = 15
        Alignment = taCenter
        Caption = 'Price:'
      end
      object nbxPrice: TNumberBox
        AlignWithMargins = True
        Left = 10
        Top = 101
        Width = 345
        Height = 23
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Alignment = taCenter
        TabOrder = 2
      end
      object Label2: TLabel
        AlignWithMargins = True
        Left = 143
        Top = 139
        Width = 57
        Height = 15
        Alignment = taCenter
        Caption = 'Start Time:'
      end
      object dtpStartTime: TDateTimePicker
        AlignWithMargins = True
        Left = 10
        Top = 159
        Width = 324
        Height = 44
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Date = 45759.000000000000000000
        Time = 0.637265706020116300
        Kind = dtkDateTime
        TabOrder = 0
      end
    end
    object Label6: TLabel
      Left = 790
      Top = 20
      Width = 44
      Height = 36
      Anchors = []
      Caption = 'Trip'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI Variable Display'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 784
    end
    object btnAdd: TButton
      AlignWithMargins = True
      Left = 650
      Top = 695
      Width = 324
      Height = 56
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      Caption = 'Add'
      TabOrder = 3
      OnClick = btnAddClick
      ExplicitTop = 698
    end
    object Label1: TLabel
      Left = 278
      Top = 20
      Width = 84
      Height = 36
      Anchors = []
      Caption = 'Vehicle'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI Variable Display'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 298
    end
  end
end
