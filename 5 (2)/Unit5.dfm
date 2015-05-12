object Form5: TForm5
  Left = 0
  Top = 0
  Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1091#1095#1077#1073#1085#1086'-'#1084#1077#1090#1086#1076#1080#1095#1077#1089#1082#1080#1081' '#1082#1086#1084#1087#1083#1077#1082#1089
  ClientHeight = 389
  ClientWidth = 629
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView1: TTreeView
    Left = 0
    Top = 0
    Width = 250
    Height = 389
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Indent = 19
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    OnChange = TreeView1Change
  end
  object WebBrowser1: TWebBrowser
    Left = 250
    Top = 0
    Width = 379
    Height = 389
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 176
    ExplicitTop = 144
    ExplicitWidth = 300
    ExplicitHeight = 150
    ControlData = {
      4C0000002C270000342800000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126209000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
end
