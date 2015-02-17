object Form22: TForm22
  Left = 0
  Top = 0
  Caption = #1044#1086#1082#1091#1084#1077#1085#1090
  ClientHeight = 405
  ClientWidth = 676
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Ole: TOleContainer
    Left = 0
    Top = 49
    Width = 676
    Height = 356
    Align = alClient
    TabOrder = 2
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 676
    Height = 49
    Align = alTop
    TabOrder = 0
    object Button1: TButton
      Left = 8
      Top = 9
      Width = 137
      Height = 25
      Caption = #1060#1086#1088#1084#1072#1090#1080#1088#1086#1074#1072#1085#1080#1077
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 168
      Top = 9
      Width = 137
      Height = 25
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100'!'
      Enabled = False
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object RichEdit1: TRichEdit
    Left = 0
    Top = 49
    Width = 676
    Height = 356
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    Zoom = 100
  end
  object FontD: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 432
    Top = 8
  end
end
