object Form9: TForm9
  Left = 0
  Top = 0
  Caption = 'Protection DataBase'
  ClientHeight = 407
  ClientWidth = 663
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 663
    Height = 33
    Align = alTop
    TabOrder = 0
    object ComboBox1: TComboBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 655
      Height = 21
      Align = alClient
      TabOrder = 0
      OnChange = ComboBox1Change
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 33
    Width = 663
    Height = 374
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=db.accdb;Mode=Read' +
      'Write;Persist Security Info=False;'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 592
    Top = 40
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    Left = 520
    Top = 40
  end
  object MainMenu1: TMainMenu
    Left = 376
    Top = 48
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N6: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100
        OnClick = N6Click
      end
      object N2: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = N2Click
      end
      object N4: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = N4Click
      end
      object N7: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
        OnClick = N7Click
      end
      object N3: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N3Click
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 448
    Top = 48
  end
  object OpenDialog1: TOpenDialog
    Left = 424
    Top = 152
  end
  object SaveDialog1: TSaveDialog
    Left = 512
    Top = 168
  end
end
