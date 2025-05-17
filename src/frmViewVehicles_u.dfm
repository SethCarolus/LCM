object frmViewVehicles: TfrmViewVehicles
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
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
        Value = 10.000000000000000000
      end>
    TabOrder = 0
    object GridPanel2: TGridPanel
      Left = 1
      Top = 1
      Width = 982
      Height = 773
      Align = alClient
      Alignment = taLeftJustify
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
          Column = -1
          Row = -1
        end
        item
          Column = 0
          Control = lstVehicleNames
          Row = 0
          RowSpan = 2
        end
        item
          Column = 1
          Control = ImgVehicleImage
          Row = 0
        end
        item
          Column = 0
          Control = GridPanel3
          Row = 1
        end>
      RowCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000010000
        end>
      ShowCaption = False
      TabOrder = 0
      object lstVehicleNames: TListBox
        Left = 0
        Top = 0
        Width = 491
        Height = 773
        Align = alClient
        ItemHeight = 21
        TabOrder = 0
        OnClick = lstVehicleNamesClick
      end
      object ImgVehicleImage: TImage
        Left = 491
        Top = 0
        Width = 491
        Height = 386
        Align = alClient
        Center = True
        Stretch = True
        ExplicitLeft = 498
        ExplicitTop = -6
        ExplicitWidth = 492
        ExplicitHeight = 380
      end
      object GridPanel3: TGridPanel
        Left = 492
        Top = 380
        Width = 492
        Height = 381
        Align = alClient
        ColumnCollection = <
          item
            Value = 100.000000000000000000
          end>
        ControlCollection = <
          item
            Column = 0
            Control = btnNext
            Row = 2
          end
          item
            Column = 0
            Control = pnlDescription
            Row = 0
          end
          item
            Column = 0
            Control = pnlUploadedOn
            Row = 1
          end>
        RowCollection = <
          item
            Value = 33.333333333333340000
          end
          item
            Value = 33.333333333333340000
          end
          item
            Value = 33.333333333333310000
          end>
        ShowCaption = False
        TabOrder = 1
        object btnNext: TButton
          Left = 1
          Top = 254
          Width = 490
          Height = 126
          Align = alClient
          Anchors = []
          Caption = 'Next'
          TabOrder = 0
          OnClick = btnNextClick
        end
        object pnlDescription: TPanel
          Left = 1
          Top = 1
          Width = 490
          Height = 126
          Align = alClient
          TabOrder = 1
        end
        object pnlUploadedOn: TPanel
          Left = 1
          Top = 127
          Width = 490
          Height = 127
          Align = alClient
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
