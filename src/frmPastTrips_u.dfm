object frmPastTrips: TfrmPastTrips
  Left = 0
  Top = 0
  Caption = 'LCM'
  ClientHeight = 861
  ClientWidth = 979
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI Variable Display'
  Font.Style = []
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  TextHeight = 27
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 979
    Height = 861
    Align = alClient
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
        Control = GridPanel4
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
      Width = 977
      Height = 773
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
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
          Control = lstTrips
          Row = 1
        end
        item
          Column = 0
          Control = Label1
          Row = 0
        end
        item
          Column = 1
          Control = StackPanel3
          Row = 1
        end
        item
          Column = 2
          Control = StackPanel4
          Row = 2
        end
        item
          Column = 0
          Control = btnViewComments
          Row = 2
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
      DesignSize = (
        977
        773)
      object lstTrips: TListBox
        AlignWithMargins = True
        Left = 10
        Top = 87
        Width = 273
        Height = 599
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        ItemHeight = 27
        TabOrder = 0
        OnClick = lstTripsClick
      end
      object Label1: TLabel
        Left = 126
        Top = 25
        Width = 41
        Height = 27
        Anchors = []
        Caption = 'Trips'
        ExplicitLeft = 130
        ExplicitTop = 27
      end
      object StackPanel3: TStackPanel
        Left = 293
        Top = 77
        Width = 342
        Height = 619
        Align = alClient
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = Label2
            HorizontalPositioning = sphpCenter
          end
          item
            Control = dtpStartTime
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end
          item
            Control = Label4
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end
          item
            Control = edtPricePerPassenger
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end>
        TabOrder = 1
        object Label2: TLabel
          AlignWithMargins = True
          Left = 125
          Top = 3
          Width = 92
          Height = 27
          Alignment = taCenter
          Caption = 'Start Time:'
        end
        object dtpStartTime: TDateTimePicker
          AlignWithMargins = True
          Left = 10
          Top = 35
          Width = 322
          Height = 35
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          Date = 45759.000000000000000000
          Time = 0.637265706020116300
          Enabled = False
          Kind = dtkDateTime
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
        end
        object Label4: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 85
          Width = 336
          Height = 27
          Align = alClient
          Alignment = taCenter
          Caption = 'Price:'
        end
        object edtPricePerPassenger: TEdit
          AlignWithMargins = True
          Left = 10
          Top = 117
          Width = 322
          Height = 35
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          Alignment = taCenter
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object StackPanel4: TStackPanel
        Left = 635
        Top = 696
        Width = 342
        Height = 77
        Align = alClient
        BevelOuter = bvNone
        ControlCollection = <>
        TabOrder = 2
      end
      object btnViewComments: TButton
        AlignWithMargins = True
        Left = 10
        Top = 706
        Width = 273
        Height = 57
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Caption = 'Comments'
        TabOrder = 3
        OnClick = btnViewCommentsClick
      end
    end
    object GridPanel4: TGridPanel
      Left = 1
      Top = 774
      Width = 977
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
        Width = 116
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
