object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 459
  ClientWidth = 760
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 760
    Height = 418
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 760
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 312
    ExplicitTop = 33
    ExplicitWidth = 185
    object Button1: TButton
      Left = 16
      Top = 10
      Width = 75
      Height = 25
      Caption = #1055#1088#1077#1076#1084#1077#1090#1099
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 97
      Top = 10
      Width = 75
      Height = 25
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=db.accdb;Persist S' +
      'ecurity Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 640
    Top = 360
  end
  object ADOTableItems: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'items'
    Left = 576
    Top = 360
  end
  object ADOTableCats: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'cats'
    Left = 512
    Top = 360
  end
  object DataSource1: TDataSource
    DataSet = ADOTableItems
    Left = 440
    Top = 368
  end
end
