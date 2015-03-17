object Form9: TForm9
  Left = 0
  Top = 0
  Caption = 'Form9'
  ClientHeight = 361
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 0
    Top = 0
    Width = 622
    Height = 361
    Align = alClient
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListBox1Click
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 121
    ExplicitHeight = 97
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=db.accdb;Persist S' +
      'ecurity Info=False'
    LoginPrompt = False
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 368
    Top = 24
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Microsoft Access DataBase|*.accdb|All files|*'
    Left = 312
    Top = 120
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 288
    Top = 24
  end
end
