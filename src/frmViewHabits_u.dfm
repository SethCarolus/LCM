object frmViewHabits: TfrmViewHabits
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
          Value = 19.748905078425870000
        end
        item
          Value = 60.000000000000000000
        end
        item
          Value = 20.251094921574130000
        end>
      ControlCollection = <
        item
          Column = 1
          Control = redViewHabits
          Row = 1
        end
        item
          Column = 1
          Control = Panel1
          Row = 0
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
      object redViewHabits: TRichEdit
        AlignWithMargins = True
        Left = 204
        Top = 165
        Width = 569
        Height = 443
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        HideScrollBars = False
        TabOrder = 0
      end
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 214
        Top = 20
        Width = 549
        Height = 115
        Margins.Left = 20
        Margins.Top = 20
        Margins.Right = 20
        Margins.Bottom = 20
        Align = alClient
        Caption = 'User Habits'
        TabOrder = 1
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
