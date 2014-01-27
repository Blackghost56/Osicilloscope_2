object Form1: TForm1
  Left = 301
  Top = 112
  Width = 874
  Height = 541
  Caption = 'Oscillograph'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 10
    Top = 10
    Width = 255
    Height = 407
    Caption = #1060#1091#1085#1082#1094#1080#1086#1085#1072#1083#1100#1085#1099#1081' '#1075#1077#1085#1077#1088#1072#1090#1086#1088' '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 32
      Width = 42
      Height = 13
      Caption = #1063#1072#1089#1090#1086#1090#1072
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 56
      Width = 233
      Height = 113
      Caption = #1057#1080#1085#1091#1089#1086#1080#1076#1072#1083#1100#1085#1099#1081
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 55
        Height = 13
        Caption = #1040#1084#1087#1083#1080#1090#1091#1076#1072
      end
      object Label3: TLabel
        Left = 8
        Top = 88
        Width = 87
        Height = 13
        Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1092#1072#1079#1072' '
      end
      object Label4: TLabel
        Left = 176
        Top = 80
        Width = 25
        Height = 13
        Caption = '('#1056#1072#1076')'
      end
      object CheckBox1: TCheckBox
        Left = 8
        Top = 16
        Width = 153
        Height = 17
        Caption = #1042#1082#1083'/'#1042#1099#1082#1083
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 104
        Top = 40
        Width = 49
        Height = 21
        TabOrder = 1
        Text = '5'
      end
      object Edit3: TEdit
        Left = 104
        Top = 80
        Width = 49
        Height = 21
        TabOrder = 2
        Text = '0'
      end
      object ComboBox2: TComboBox
        Left = 176
        Top = 40
        Width = 49
        Height = 21
        ItemHeight = 13
        ItemIndex = 2
        TabOrder = 3
        Text = #1042
        OnChange = ComboBox2Change
        Items.Strings = (
          #1084#1082#1042
          #1084#1042
          #1042
          #1082#1042
          #1052#1042)
      end
      object UpDown2: TUpDown
        Left = 153
        Top = 40
        Width = 16
        Height = 21
        Associate = Edit2
        Max = 1000
        Position = 5
        TabOrder = 4
      end
      object UpDown3: TUpDown
        Left = 153
        Top = 80
        Width = 16
        Height = 21
        Associate = Edit3
        Min = -100
        TabOrder = 5
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 176
      Width = 233
      Height = 97
      Caption = #1058#1088#1077#1091#1075#1086#1083#1100#1085#1099#1081
      TabOrder = 1
      object Label5: TLabel
        Left = 8
        Top = 56
        Width = 55
        Height = 13
        Caption = #1040#1084#1087#1083#1080#1090#1091#1076#1072
      end
      object CheckBox2: TCheckBox
        Left = 8
        Top = 24
        Width = 97
        Height = 17
        Caption = #1042#1082#1083'/'#1042#1099#1082#1083
        TabOrder = 0
      end
      object UpDown4: TUpDown
        Left = 153
        Top = 56
        Width = 16
        Height = 21
        Associate = Edit4
        Max = 1000
        Position = 5
        TabOrder = 1
      end
      object ComboBox3: TComboBox
        Left = 176
        Top = 56
        Width = 49
        Height = 21
        ItemHeight = 13
        ItemIndex = 2
        TabOrder = 2
        Text = #1042
        OnChange = ComboBox3Change
        Items.Strings = (
          #1084#1082#1042
          #1084#1042
          #1042
          #1082#1042
          #1052#1042)
      end
      object Edit4: TEdit
        Left = 104
        Top = 56
        Width = 49
        Height = 21
        TabOrder = 3
        Text = '5'
      end
    end
    object Edit1: TEdit
      Left = 112
      Top = 24
      Width = 49
      Height = 21
      TabOrder = 2
      Text = '1'
    end
    object UpDown1: TUpDown
      Left = 161
      Top = 24
      Width = 16
      Height = 21
      Associate = Edit1
      Max = 1000
      Position = 1
      TabOrder = 3
    end
    object ComboBox1: TComboBox
      Left = 184
      Top = 24
      Width = 49
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = #1043#1094
      OnChange = ComboBox1Change
      Items.Strings = (
        #1043#1094
        #1082#1043#1094
        #1052#1043#1094)
    end
    object Button1: TButton
      Left = 64
      Top = 368
      Width = 121
      Height = 25
      Caption = #1042#1082#1083'/'#1042#1099#1082#1083' '#1075#1077#1085#1077#1088#1072#1090#1086#1088
      TabOrder = 5
      OnClick = Button1Click
    end
    object GroupBox5: TGroupBox
      Left = 8
      Top = 280
      Width = 233
      Height = 81
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1083#1086#1078#1085#1086#1075#1086' '#1089#1080#1075#1085#1072#1083#1072
      TabOrder = 6
      object Label6: TLabel
        Left = 8
        Top = 24
        Width = 93
        Height = 13
        Caption = #1057#1088#1077#1076#1085#1077#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
      end
      object Label7: TLabel
        Left = 8
        Top = 56
        Width = 64
        Height = 13
        Caption = #1057#1050' '#1079#1085#1072#1095#1077#1085#1080#1077
      end
      object Edit5: TEdit
        Left = 120
        Top = 16
        Width = 73
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object Edit6: TEdit
        Left = 120
        Top = 48
        Width = 73
        Height = 21
        Enabled = False
        TabOrder = 1
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 272
    Top = 10
    Width = 566
    Height = 479
    Caption = #1054#1089#1094#1080#1083#1083#1086#1075#1088#1072#1092
    TabOrder = 1
    object Button2: TButton
      Left = 8
      Top = 352
      Width = 137
      Height = 25
      Caption = #1042#1082#1083'/'#1042#1099#1082#1083' '#1086#1089#1094#1080#1083#1083#1086#1075#1088#1072#1092
      TabOrder = 0
      OnClick = Button2Click
    end
    object GroupBox6: TGroupBox
      Left = 8
      Top = 392
      Width = 137
      Height = 81
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 1
      object Button3: TButton
        Left = 8
        Top = 16
        Width = 121
        Height = 25
        Caption = #1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
        TabOrder = 0
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 8
        Top = 48
        Width = 121
        Height = 25
        Caption = #1044#1072#1085#1085#1099#1077
        TabOrder = 1
        OnClick = Button4Click
      end
    end
    object GroupBox7: TGroupBox
      Left = 152
      Top = 344
      Width = 409
      Height = 129
      Caption = #1052#1072#1089#1096#1090#1072#1073
      TabOrder = 2
      object GroupBox8: TGroupBox
        Left = 16
        Top = 16
        Width = 169
        Height = 105
        Caption = #1054#1089#1100' '#1074#1088#1077#1084#1077#1085#1080
        TabOrder = 0
        object Min: TLabel
          Left = 8
          Top = 32
          Width = 17
          Height = 13
          Caption = 'Min'
        end
        object Max: TLabel
          Left = 8
          Top = 80
          Width = 20
          Height = 13
          Caption = 'Max'
        end
        object ComboBox4: TComboBox
          Left = 112
          Top = 48
          Width = 49
          Height = 21
          ItemHeight = 13
          ItemIndex = 2
          TabOrder = 0
          Text = #1057
          OnChange = ComboBox4Change
          Items.Strings = (
            #1084#1082#1057
            #1084#1057
            #1057)
        end
        object Edit7: TEdit
          Left = 32
          Top = 24
          Width = 50
          Height = 21
          TabOrder = 1
          Text = '0'
        end
        object Edit8: TEdit
          Left = 32
          Top = 72
          Width = 50
          Height = 21
          TabOrder = 2
          Text = '5'
        end
        object UpDown5: TUpDown
          Left = 82
          Top = 24
          Width = 16
          Height = 21
          Associate = Edit7
          Min = -1000
          Max = 1000
          TabOrder = 3
        end
        object UpDown6: TUpDown
          Left = 82
          Top = 72
          Width = 16
          Height = 21
          Associate = Edit8
          Min = -1000
          Max = 1000
          Position = 5
          TabOrder = 4
        end
      end
      object GroupBox9: TGroupBox
        Left = 224
        Top = 16
        Width = 169
        Height = 105
        Caption = #1054#1089#1100' '#1072#1084#1087#1083#1080#1090#1091#1076#1099
        TabOrder = 1
        object Label8: TLabel
          Left = 8
          Top = 32
          Width = 17
          Height = 13
          Caption = 'Min'
        end
        object Label9: TLabel
          Left = 8
          Top = 80
          Width = 20
          Height = 13
          Caption = 'Max'
        end
        object ComboBox5: TComboBox
          Left = 112
          Top = 48
          Width = 49
          Height = 21
          ItemHeight = 13
          ItemIndex = 2
          TabOrder = 0
          Text = #1042
          OnChange = ComboBox5Change
          Items.Strings = (
            #1084#1082#1042
            #1084#1042
            #1042
            #1082#1042
            #1052#1042)
        end
        object Edit9: TEdit
          Left = 32
          Top = 24
          Width = 50
          Height = 21
          TabOrder = 1
          Text = '-10'
        end
        object Edit10: TEdit
          Left = 32
          Top = 72
          Width = 50
          Height = 21
          TabOrder = 2
          Text = '10'
        end
        object UpDown7: TUpDown
          Left = 82
          Top = 24
          Width = 16
          Height = 21
          Associate = Edit9
          Min = -1000
          Max = 1000
          Position = -10
          TabOrder = 3
        end
        object UpDown8: TUpDown
          Left = 82
          Top = 72
          Width = 16
          Height = 21
          Associate = Edit10
          Min = -1000
          Max = 1000
          Position = 10
          TabOrder = 4
        end
      end
    end
    object Chart1: TChart
      Left = 8
      Top = 16
      Width = 553
      Height = 321
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Title.Text.Strings = (
        'TChart')
      Title.Visible = False
      Legend.Visible = False
      View3D = False
      TabOrder = 3
      object Series1: TLineSeries
        Marks.ArrowLength = 8
        Marks.Visible = False
        SeriesColor = 4227072
        LinePen.Width = 2
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        Pointer.Visible = False
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 448
    Width = 145
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkClose
  end
  object Timer2: TTimer
    Interval = 1
    OnTimer = Timer2Timer
    Left = 280
    Top = 336
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 224
    Top = 376
  end
  object Timer3: TTimer
    Interval = 100
    OnTimer = Timer3Timer
    Left = 616
    Top = 378
  end
  object SaveDialog1: TSaveDialog
    FileName = 'C:\Os_graph'
    Filter = #1043#1088#1072#1092#1080#1095#1077#1089#1082#1080#1081' (*.bmp)|*.bmp'
    Left = 240
    Top = 416
  end
  object SaveDialog2: TSaveDialog
    FileName = 'C:\Os_data'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1081' (*.txt)|*.txt'
    Left = 240
    Top = 448
  end
end
