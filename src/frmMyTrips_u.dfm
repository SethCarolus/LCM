object frmMyTrips: TfrmMyTrips
  Left = 0
  Top = 0
  Caption = 'LCM'
  ClientHeight = 861
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
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
        Value = 9.999999999999995000
      end>
    TabOrder = 0
    object GridPanel2: TGridPanel
      Left = 1
      Top = 1
      Width = 982
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
          Column = 2
          Control = StackPanel1
          Row = 1
        end>
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Variable Display'
      Font.Style = []
      ParentFont = False
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
        982
        773)
      object lstTrips: TListBox
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
        OnClick = lstTripsClick
      end
      object Label1: TLabel
        Left = 131
        Top = 28
        Width = 33
        Height = 21
        Anchors = []
        Caption = 'Trips'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI Variable Display'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 119
        ExplicitTop = 20
      end
      object StackPanel3: TStackPanel
        Left = 295
        Top = 77
        Width = 343
        Height = 619
        Align = alClient
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = edtStartTime
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
        object edtStartTime: TLabel
          AlignWithMargins = True
          Left = 134
          Top = 3
          Width = 75
          Height = 21
          Alignment = taCenter
          Caption = 'Start Time:'
        end
        object dtpStartTime: TDateTimePicker
          AlignWithMargins = True
          Left = 10
          Top = 29
          Width = 323
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
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
        end
        object Label4: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 73
          Width = 337
          Height = 21
          Align = alClient
          Alignment = taCenter
          Caption = 'Price:'
        end
        object edtPricePerPassenger: TEdit
          AlignWithMargins = True
          Left = 10
          Top = 99
          Width = 323
          Height = 29
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          Alignment = taCenter
          ReadOnly = True
          TabOrder = 1
        end
      end
      object StackPanel4: TStackPanel
        Left = 638
        Top = 696
        Width = 344
        Height = 77
        Align = alClient
        BevelOuter = bvNone
        ControlCollection = <>
        TabOrder = 2
      end
      object StackPanel1: TStackPanel
        Left = 638
        Top = 77
        Width = 344
        Height = 619
        Hint = 'Comment on the trip!'
        Align = alClient
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = Label3
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end
          item
            Control = edtHeader
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end
          item
            Control = redTripComment
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end
          item
            Control = Label5
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end
          item
            Control = Label2
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end
          item
            Control = nbxRating
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end
          item
            Control = btnSubmit
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end>
        TabOrder = 3
        object Label3: TLabel
          Left = 0
          Top = 0
          Width = 344
          Height = 21
          Align = alClient
          Alignment = taCenter
          Caption = 'How was the trip?'
        end
        object edtHeader: TEdit
          AlignWithMargins = True
          Left = 10
          Top = 33
          Width = 324
          Height = 29
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          Alignment = taCenter
          TabOrder = 3
          TextHint = 'Subject'
        end
        object redTripComment: TRichEdit
          AlignWithMargins = True
          Left = 10
          Top = 84
          Width = 324
          Height = 200
          Hint = 'Comment on the trip!'
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          TabOrder = 0
        end
        object Label5: TLabel
          Left = 0
          Top = 296
          Width = 344
          Height = 21
          Align = alClient
          Alignment = taCenter
          Caption = 'Statified?'
        end
        object Label2: TLabel
          Left = 0
          Top = 319
          Width = 344
          Height = 21
          Align = alClient
          Alignment = taCenter
          Caption = 'Give a rating ( 1- 10)'
        end
        object nbxRating: TNumberBox
          AlignWithMargins = True
          Left = 10
          Top = 352
          Width = 324
          Height = 29
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          Alignment = taCenter
          MinValue = 1.000000000000000000
          MaxValue = 10.000000000000000000
          TabOrder = 1
          Value = 1.000000000000000000
        end
        object btnSubmit: TButton
          AlignWithMargins = True
          Left = 10
          Top = 403
          Width = 324
          Height = 41
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          Caption = 'Submit'
          TabOrder = 2
          OnClick = btnSubmitClick
        end
      end
    end
    object GridPanel4: TGridPanel
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
