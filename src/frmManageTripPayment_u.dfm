object frmManagePayment: TfrmManagePayment
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
      Width = 982
      Height = 773
      Align = alClient
      BevelOuter = bvNone
      ColumnCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = StackPanel1
          Row = 1
        end
        item
          Column = 0
          ColumnSpan = 2
          Control = Panel1
          Row = 0
        end
        item
          Column = 1
          Control = StackPanel3
          Row = 1
        end>
      RowCollection = <
        item
          Value = 20.000000000000000000
        end
        item
          Value = 60.000000000000000000
        end
        item
          Value = 20.000000000000000000
        end>
      TabOrder = 0
      object StackPanel1: TStackPanel
        AlignWithMargins = True
        Left = 3
        Top = 158
        Width = 485
        Height = 457
        Align = alClient
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = Label1
            HorizontalPositioning = sphpCenter
          end
          item
            Control = cmbStudent
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end
          item
            Control = Label2
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end
          item
            Control = lstTrips
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end
          item
            Control = lblTotal
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end
          item
            Control = btnMakePayment
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end>
        TabOrder = 0
        object Label1: TLabel
          Left = 215
          Top = 0
          Width = 55
          Height = 21
          Alignment = taCenter
          Caption = 'Student'
        end
        object cmbStudent: TComboBox
          AlignWithMargins = True
          Left = 10
          Top = 33
          Width = 465
          Height = 29
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          Style = csDropDownList
          TabOrder = 0
          OnChange = cmbStudentChange
        end
        object Label2: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 77
          Width = 479
          Height = 21
          Align = alClient
          Alignment = taCenter
          Caption = 'Trips'
        end
        object lstTrips: TListBox
          AlignWithMargins = True
          Left = 3
          Top = 106
          Width = 479
          Height = 247
          Align = alClient
          ItemHeight = 21
          MultiSelect = True
          TabOrder = 2
          OnClick = lstTripsClick
        end
        object lblTotal: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 361
          Width = 479
          Height = 21
          Align = alClient
          Alignment = taCenter
          Caption = 'Total:'
        end
        object btnMakePayment: TButton
          AlignWithMargins = True
          Left = 3
          Top = 390
          Width = 479
          Height = 51
          Align = alClient
          Caption = 'Make Payment'
          TabOrder = 1
          OnClick = btnMakePaymentClick
        end
      end
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 50
        Top = 25
        Width = 882
        Height = 105
        Margins.Left = 50
        Margins.Top = 25
        Margins.Right = 50
        Margins.Bottom = 25
        Align = alClient
        Caption = 'Payments'
        TabOrder = 1
      end
      object StackPanel3: TStackPanel
        AlignWithMargins = True
        Left = 494
        Top = 158
        Width = 485
        Height = 457
        Align = alClient
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = Label3
            HorizontalPositioning = sphpCenter
          end
          item
            Control = cmbBankCard
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end
          item
            Control = Label4
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end
          item
            Control = edtBalance
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end
          item
            Control = Label6
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end
          item
            Control = edtNameOnCard
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end
          item
            Control = Label5
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end
          item
            Control = edtBankName
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpFill
          end>
        TabOrder = 2
        object Label3: TLabel
          Left = 206
          Top = 0
          Width = 72
          Height = 21
          Alignment = taCenter
          Caption = 'Bank Card'
        end
        object cmbBankCard: TComboBox
          AlignWithMargins = True
          Left = 10
          Top = 33
          Width = 465
          Height = 29
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          Style = csDropDownList
          TabOrder = 0
          OnChange = cmbBankCardChange
        end
        object Label4: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 77
          Width = 479
          Height = 21
          Align = alClient
          Alignment = taCenter
          Caption = 'Balance'
        end
        object edtBalance: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 106
          Width = 479
          Height = 29
          Align = alClient
          Alignment = taCenter
          ReadOnly = True
          TabOrder = 1
        end
        object Label6: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 143
          Width = 479
          Height = 21
          Align = alClient
          Alignment = taCenter
          Caption = 'Name On Card'
        end
        object edtNameOnCard: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 172
          Width = 479
          Height = 29
          Align = alClient
          Alignment = taCenter
          ReadOnly = True
          TabOrder = 3
        end
        object Label5: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 209
          Width = 479
          Height = 21
          Align = alClient
          Alignment = taCenter
          Caption = 'Bank'
        end
        object edtBankName: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 238
          Width = 479
          Height = 29
          Align = alClient
          Alignment = taCenter
          ReadOnly = True
          TabOrder = 2
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
