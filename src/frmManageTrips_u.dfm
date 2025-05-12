object frmManageTrips: TfrmManageTrips
  Left = 0
  Top = 0
  Caption = 'LCM'
  ClientHeight = 761
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 21
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
        Control = Label1
        Row = 0
      end
      item
        Column = 0
        Control = btnEdit
        Row = 2
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
        Column = 1
        Control = StackPanel1
        Row = 0
      end
      item
        Column = 1
        Control = btnAdd
        Row = 2
      end
      item
        Column = 2
        Control = btnDelete
        Row = 2
      end
      item
        Column = 0
        Control = GridPanel2
        Row = 1
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
      end>
    TabOrder = 0
    ExplicitWidth = 982
    ExplicitHeight = 753
    DesignSize = (
      984
      761)
    object Label1: TLabel
      Left = 119
      Top = 20
      Width = 56
      Height = 36
      Anchors = []
      Caption = 'Trips'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI Variable Display'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 792
      ExplicitTop = 15
    end
    object btnEdit: TButton
      AlignWithMargins = True
      Left = 10
      Top = 695
      Width = 275
      Height = 56
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      Caption = 'Edit'
      TabOrder = 0
      OnClick = btnEditClick
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
        Left = 145
        Top = 0
        Width = 49
        Height = 21
        Alignment = taCenter
        Caption = 'Vehicle'
      end
      object edtModel: TLabeledEdit
        AlignWithMargins = True
        Left = 10
        Top = 53
        Width = 319
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
        Width = 319
        Height = 29
        Margins.Left = 10
        Margins.Top = 30
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Alignment = taCenter
        EditLabel.Width = 99
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
        Width = 319
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
        Width = 319
        Height = 29
        Margins.Left = 10
        Margins.Top = 30
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Alignment = taCenter
        EditLabel.Width = 50
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
        Top = 529
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
          Control = Label4
          HorizontalPositioning = sphpCenter
        end
        item
          Control = edtPricePerPassenger
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpFill
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
      object Label4: TLabel
        AlignWithMargins = True
        Left = 153
        Top = 3
        Width = 37
        Height = 21
        Alignment = taCenter
        Caption = 'Price:'
      end
      object edtPricePerPassenger: TEdit
        AlignWithMargins = True
        Left = 10
        Top = 29
        Width = 324
        Height = 29
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Alignment = taCenter
        ReadOnly = True
        TabOrder = 0
      end
      object Label2: TLabel
        AlignWithMargins = True
        Left = 135
        Top = 73
        Width = 73
        Height = 21
        Alignment = taCenter
        Caption = 'Start Time:'
      end
      object dtpStartTime: TDateTimePicker
        AlignWithMargins = True
        Left = 10
        Top = 99
        Width = 324
        Height = 29
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Date = 45759.000000000000000000
        Time = 0.637265706020116300
        Enabled = False
        Kind = dtkDateTime
        TabOrder = 1
      end
    end
    object StackPanel1: TStackPanel
      AlignWithMargins = True
      Left = 298
      Top = 3
      Width = 339
      Height = 70
      Align = alClient
      BevelOuter = bvNone
      ControlCollection = <>
      HorizontalPositioning = sphpCenter
      TabOrder = 3
    end
    object btnAdd: TButton
      AlignWithMargins = True
      Left = 305
      Top = 695
      Width = 325
      Height = 56
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      Caption = 'Add'
      TabOrder = 4
      OnClick = btnAddClick
    end
    object btnDelete: TButton
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
      Caption = 'Delete'
      TabOrder = 5
      OnClick = btnDeleteClick
    end
    object GridPanel2: TGridPanel
      Left = 0
      Top = 76
      Width = 295
      Height = 609
      Align = alClient
      BevelOuter = bvNone
      ColumnCollection = <
        item
          Value = 100.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = lstTrips
          Row = 0
        end
        item
          Column = 0
          Control = btnEnquiries
          Row = 1
        end>
      RowCollection = <
        item
          Value = 85.000000000000000000
        end
        item
          Value = 15.000000000000000000
        end>
      TabOrder = 6
      object lstTrips: TListBox
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 275
        Height = 498
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        ItemHeight = 21
        TabOrder = 0
        OnClick = lstTripsClick
      end
      object btnEnquiries: TButton
        AlignWithMargins = True
        Left = 10
        Top = 528
        Width = 275
        Height = 71
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Caption = 'Enquiries'
        TabOrder = 1
        OnClick = btnEnquiriesClick
      end
    end
  end
end
