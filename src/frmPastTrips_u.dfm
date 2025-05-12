object frmPastTrips: TfrmPastTrips
  Left = 0
  Top = 0
  Caption = 'LCM'
  ClientHeight = 761
  ClientWidth = 979
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI Variable Display'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 27
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 979
    Height = 761
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
    ExplicitWidth = 977
    ExplicitHeight = 753
    DesignSize = (
      979
      761)
    object lstTrips: TListBox
      AlignWithMargins = True
      Left = 10
      Top = 86
      Width = 274
      Height = 589
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
      Top = 24
      Width = 41
      Height = 27
      Anchors = []
      Caption = 'Trips'
      ExplicitLeft = 130
      ExplicitTop = 27
    end
    object StackPanel3: TStackPanel
      Left = 294
      Top = 76
      Width = 342
      Height = 609
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
      Left = 636
      Top = 685
      Width = 343
      Height = 76
      Align = alClient
      BevelOuter = bvNone
      ControlCollection = <>
      TabOrder = 2
    end
    object btnViewComments: TButton
      AlignWithMargins = True
      Left = 10
      Top = 695
      Width = 274
      Height = 56
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
end
