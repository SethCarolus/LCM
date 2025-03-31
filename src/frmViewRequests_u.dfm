object frmViewRequests: TfrmViewRequests
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
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
  OnClose = FormClose
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
        Value = 20.000000000000000000
      end
      item
        Value = 60.000000000000000000
      end
      item
        Value = 20.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 1
        Control = Label1
        Row = 0
      end
      item
        Column = 1
        Control = btnSend
        Row = 2
      end
      item
        Column = 1
        Control = lstDisplayNames
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
    DesignSize = (
      984
      761)
    object Label1: TLabel
      Left = 407
      Top = 20
      Width = 170
      Height = 36
      Anchors = []
      Caption = 'View Requests'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI Variable Display'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 215
      ExplicitTop = 12
    end
    object btnSend: TButton
      AlignWithMargins = True
      Left = 207
      Top = 695
      Width = 570
      Height = 56
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      Caption = 'Accept'
      TabOrder = 0
      OnClick = btnSendClick
    end
    object lstDisplayNames: TListBox
      AlignWithMargins = True
      Left = 207
      Top = 86
      Width = 570
      Height = 589
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      Columns = 1
      ItemHeight = 15
      TabOrder = 1
      OnClick = lstDisplayNamesClick
    end
  end
end
