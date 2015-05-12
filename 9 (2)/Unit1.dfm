object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 292
  ClientWidth = 270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 164
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1091#1090#1100' '#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1091' exel:'
  end
  object Label2: TLabel
    Left = 8
    Top = 60
    Width = 107
    Height = 39
    Align = alCustom
    Caption = #1042#1074#1077#1076#1077#1090#1077' '#1087#1072#1088#1086#1083#1100' '#1076#1083#1103' '#1091#1089#1090#1072#1085#1086#1074#1082#1080' '#1079#1072#1097#1080#1090#1099' '#1085#1072' '#1082#1085#1080#1075#1091':'
    ParentShowHint = False
    ShowHint = False
    WordWrap = True
  end
  object Label3: TLabel
    Left = 152
    Top = 60
    Width = 107
    Height = 39
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100' '#1076#1083#1103' '#1090#1086#1075#1086', '#1095#1090#1086' '#1073#1099' '#1089#1085#1103#1090#1100' '#1079#1072#1097#1080#1090#1091' '#1089' '#1082#1085#1080#1075#1080':'
    WordWrap = True
  end
  object Label4: TLabel
    Left = 8
    Top = 180
    Width = 107
    Height = 39
    Caption = #1042#1074#1077#1076#1077#1090#1077' '#1087#1072#1088#1086#1083#1100' '#1076#1083#1103' '#1091#1089#1090#1072#1085#1086#1074#1082#1080' '#1079#1072#1097#1080#1090#1099' '#1085#1072' '#1072#1082#1090#1080#1074#1085#1099#1081' '#1083#1080#1089#1090':'
    WordWrap = True
  end
  object Label5: TLabel
    Left = 152
    Top = 180
    Width = 107
    Height = 39
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100' '#1076#1083#1103' '#1090#1086#1075#1086', '#1095#1090#1086' '#1073#1099' '#1089#1085#1103#1090#1100' '#1079#1072#1097#1080#1090#1091' '#1089' '#1083#1080#1089#1090#1072':'
    WordWrap = True
  end
  object Button1: TButton
    Left = 184
    Top = 29
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 27
    Width = 163
    Height = 21
    TabOrder = 1
    OnClick = Edit1Click
  end
  object Button2: TButton
    Left = 8
    Top = 132
    Width = 107
    Height = 25
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 105
    Width = 107
    Height = 21
    TabOrder = 3
  end
  object Edit3: TEdit
    Left = 152
    Top = 105
    Width = 107
    Height = 21
    TabOrder = 4
  end
  object Button3: TButton
    Left = 152
    Top = 132
    Width = 107
    Height = 25
    Caption = #1057#1085#1103#1090#1100' '#1087#1072#1088#1086#1083#1100
    TabOrder = 5
    OnClick = Button3Click
  end
  object Edit4: TEdit
    Left = 8
    Top = 225
    Width = 107
    Height = 21
    TabOrder = 6
  end
  object Button4: TButton
    Left = 8
    Top = 252
    Width = 107
    Height = 25
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
    TabOrder = 7
    OnClick = Button4Click
  end
  object Edit5: TEdit
    Left = 152
    Top = 225
    Width = 107
    Height = 21
    TabOrder = 8
  end
  object Button5: TButton
    Left = 152
    Top = 252
    Width = 107
    Height = 25
    Caption = #1057#1085#1103#1090#1100' '#1087#1072#1088#1086#1083#1100
    TabOrder = 9
    OnClick = Button5Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Excel Book|*.xls*|All files|*'
    Left = 312
    Top = 200
  end
end
