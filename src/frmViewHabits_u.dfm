object frmViewHabits: TfrmViewHabits
  Left = 0
  Top = 0
  Caption = 'LCM'
  ClientHeight = 761
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI Variable Display'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 21
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 761
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
      Top = 162
      Width = 571
      Height = 437
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
      Width = 551
      Height = 112
      Margins.Left = 20
      Margins.Top = 20
      Margins.Right = 20
      Margins.Bottom = 20
      Align = alClient
      Caption = 'User Habits'
      TabOrder = 1
    end
  end
end
