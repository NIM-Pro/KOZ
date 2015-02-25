object Form5: TForm5
  Left = 0
  Top = 0
  Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1086#1077' '#1080#1079#1076#1072#1085#1080#1077' '#1091#1095#1077#1073#1085#1086#1075#1086' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
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
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView1: TTreeView
    Left = 0
    Top = 0
    Width = 137
    Height = 389
    Align = alLeft
    Indent = 19
    TabOrder = 0
    OnChange = TreeView1Change
  end
  object RichEdit1: TRichEdit
    Left = 137
    Top = 0
    Width = 492
    Height = 389
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Zoom = 100
  end
end
