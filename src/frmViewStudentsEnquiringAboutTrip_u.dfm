object frmViewStudentsEnquiringAboutTrip: TfrmViewStudentsEnquiringAboutTrip
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
        Value = 9.999999999999998000
      end>
    TabOrder = 0
    object GridPanel2: TGridPanel
      Left = 1
      Top = 1
      Width = 982
      Height = 773
      Align = alClient
      ColumnCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 1
          Control = StackPanel1
          Row = 0
        end
        item
          Column = 0
          Control = GridPanel3
          Row = 0
        end>
      RowCollection = <
        item
          Value = 100.000000000000000000
        end>
      TabOrder = 0
      object StackPanel1: TStackPanel
        Left = 491
        Top = 1
        Width = 490
        Height = 771
        Align = alClient
        ControlCollection = <
          item
            Control = edtGrade
          end
          item
            Control = edtClass
          end>
        TabOrder = 0
        object edtGrade: TLabeledEdit
          AlignWithMargins = True
          Left = 11
          Top = 31
          Width = 478
          Height = 29
          Margins.Left = 10
          Margins.Top = 30
          Margins.Right = 10
          Margins.Bottom = 10
          Alignment = taCenter
          EditLabel.Width = 45
          EditLabel.Height = 21
          EditLabel.Caption = 'Grade:'
          TabOrder = 1
          Text = ''
        end
        object edtClass: TLabeledEdit
          AlignWithMargins = True
          Left = 11
          Top = 102
          Width = 478
          Height = 29
          Margins.Left = 10
          Margins.Top = 30
          Margins.Right = 10
          Margins.Bottom = 10
          Alignment = taCenter
          EditLabel.Width = 39
          EditLabel.Height = 21
          EditLabel.Caption = 'Class:'
          TabOrder = 0
          Text = ''
        end
      end
      object GridPanel3: TGridPanel
        Left = 1
        Top = 1
        Width = 490
        Height = 771
        Align = alClient
        ColumnCollection = <
          item
            Value = 100.000000000000000000
          end>
        ControlCollection = <
          item
            Column = 0
            Control = lstStudents
            Row = 0
          end
          item
            Column = 0
            Control = btnAccept
            Row = 1
          end>
        RowCollection = <
          item
            Value = 90.000000000000000000
          end
          item
            Value = 10.000000000000000000
          end>
        TabOrder = 1
        object lstStudents: TListBox
          AlignWithMargins = True
          Left = 11
          Top = 11
          Width = 468
          Height = 672
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          ItemHeight = 21
          TabOrder = 0
          OnClick = lstStudentsClick
        end
        object btnAccept: TButton
          AlignWithMargins = True
          Left = 11
          Top = 703
          Width = 468
          Height = 57
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          Caption = 'Accept'
          TabOrder = 1
          OnClick = btnAcceptClick
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
