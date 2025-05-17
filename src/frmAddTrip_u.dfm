object frmAddTrip: TfrmAddTrip
  Left = 0
  Top = 0
  Caption = 'LCM'
  ClientHeight = 861
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI Variable Display'
  Font.Style = []
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  TextHeight = 21
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 861
    Align = alClient
    Caption = 'GridPanel1'
    ColumnCollection = <
      item
        Value = 100.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = GridPanel2
        Row = 0
      end
      item
        Column = 0
        Control = GridPanel3
        Row = 1
      end>
    RowCollection = <
      item
        Value = 90.000000000000000000
      end
      item
        Value = 10.000000000000000000
      end>
    TabOrder = 0
    object GridPanel2: TGridPanel
      Left = 1
      Top = 1
      Width = 982
      Height = 773
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
        982
        773)
      object lstVehicleNames: TListBox
        AlignWithMargins = True
        Left = 10
        Top = 87
        Width = 275
        Height = 599
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        ItemHeight = 21
        TabOrder = 0
        OnClick = lstVehicleNamesClick
      end
      object StackPanel2: TStackPanel
        AlignWithMargins = True
        Left = 298
        Top = 80
        Width = 337
        Height = 613
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
          Left = 143
          Top = 0
          Width = 50
          Height = 21
          Alignment = taCenter
          Caption = 'Vehicle'
        end
        object edtModel: TLabeledEdit
          AlignWithMargins = True
          Left = 10
          Top = 53
          Width = 317
          Height = 29
          Margins.Left = 10
          Margins.Top = 30
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          Alignment = taCenter
          EditLabel.Width = 47
          EditLabel.Height = 21
          EditLabel.Caption = 'Model:'
          ReadOnly = True
          TabOrder = 1
          Text = ''
        end
        object edtNumberPlate: TLabeledEdit
          AlignWithMargins = True
          Left = 10
          Top = 124
          Width = 317
          Height = 29
          Margins.Left = 10
          Margins.Top = 30
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          Alignment = taCenter
          EditLabel.Width = 100
          EditLabel.Height = 21
          EditLabel.Caption = 'Number Plate:'
          ReadOnly = True
          TabOrder = 0
          Text = ''
        end
        object edtMaxPassengers: TLabeledEdit
          AlignWithMargins = True
          Left = 10
          Top = 195
          Width = 317
          Height = 29
          Margins.Left = 10
          Margins.Top = 30
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          Alignment = taCenter
          EditLabel.Width = 113
          EditLabel.Height = 21
          EditLabel.Caption = 'Max Passengers:'
          ReadOnly = True
          TabOrder = 2
          Text = ''
        end
        object edtColor: TLabeledEdit
          AlignWithMargins = True
          Left = 10
          Top = 266
          Width = 317
          Height = 29
          Margins.Left = 10
          Margins.Top = 30
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          Alignment = taCenter
          EditLabel.Width = 51
          EditLabel.Height = 21
          EditLabel.Caption = 'Colour:'
          ReadOnly = True
          TabOrder = 3
          Text = ''
        end
        object imgVehicle: TImage
          AlignWithMargins = True
          Left = 10
          Top = 317
          Width = 317
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
          Top = 529
          Width = 317
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
        Left = 638
        Top = 77
        Width = 344
        Height = 619
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
          Left = 149
          Top = 3
          Width = 45
          Height = 21
          Alignment = taCenter
          Caption = 'Name:'
        end
        object edtName: TEdit
          AlignWithMargins = True
          Left = 10
          Top = 39
          Width = 342
          Height = 29
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Alignment = taCenter
          TabOrder = 1
        end
        object Label4: TLabel
          AlignWithMargins = True
          Left = 153
          Top = 83
          Width = 38
          Height = 21
          Alignment = taCenter
          Caption = 'Price:'
        end
        object nbxPrice: TNumberBox
          AlignWithMargins = True
          Left = 10
          Top = 119
          Width = 345
          Height = 29
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Alignment = taCenter
          TabOrder = 2
        end
        object Label2: TLabel
          AlignWithMargins = True
          Left = 134
          Top = 163
          Width = 75
          Height = 21
          Alignment = taCenter
          Caption = 'Start Time:'
        end
        object dtpStartTime: TDateTimePicker
          AlignWithMargins = True
          Left = 10
          Top = 189
          Width = 324
          Height = 29
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
        Left = 788
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
        Left = 648
        Top = 706
        Width = 324
        Height = 57
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Caption = 'Add'
        TabOrder = 3
        OnClick = btnAddClick
      end
      object Label1: TLabel
        Left = 277
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
    object GridPanel3: TGridPanel
      Left = 1
      Top = 774
      Width = 982
      Height = 86
      Align = alClient
      BevelOuter = bvNone
      ColumnCollection = <
        item
          Value = 33.333333333333340000
        end
        item
          Value = 33.333333333333340000
        end
        item
          Value = 33.333333333333310000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = btnBack
          Row = 0
        end>
      RowCollection = <
        item
          Value = 100.000000000000000000
        end>
      TabOrder = 1
      object btnBack: TBitBtn
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 117
        Height = 66
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 200
        Margins.Bottom = 10
        Align = alClient
        Caption = '&Back'
        Kind = bkClose
        NumGlyphs = 2
        TabOrder = 0
      end
    end
  end
end
