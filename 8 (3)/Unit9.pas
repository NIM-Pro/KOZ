unit Unit9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtnrs, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, comobj;

type
  TForm9 = class(TForm)
    ADOConnection1: TADOConnection;
    OpenDialog1: TOpenDialog;
    ADOQuery1: TADOQuery;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function getTableName:string;
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

procedure TForm9.FormCreate(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    ADOCOnnection1.ConnectionString:='Provider=Microsoft.ACE.OLEDB.12.0;Data Source='+OpenDialog1.FileName+';Persist Security Info=False';
    ADOCOnnection1.Connected:=true;
    ADOConnection1.GetTableNames(ListBox1.Items);
  end else begin
    showmessage('Файл не указан. Завершение работы приложения');
    Application.Terminate;
  end;
end;

function TForm9.getTableName:string;
var i:integer;
begin
  for i:=1 to ListBox1.Items.Count do
    if ListBox1.Selected[i] then begin
      result:=ListBox1.Items.Strings[i];
      break;
    end;
end;

procedure TForm9.ListBox1Click(Sender: TObject);
var i,j:integer;
table:string;
ExcelApp, sheet: Variant;
begin
  table:=getTableName;
  if (length(table)>0) then begin
    ADOQUery1.SQL.Text:='SELECT * FROM '+table;
    ADOQuery1.Open;
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.Visible := False;
    sheet:=ExcelApp.WorkBooks.Add(-4167);
    sheet:=sheet.WorkSheets[1];
    sheet.name := 'Export';
    for i:=1 to ADOQuery1.FieldCount do
      sheet.Cells[1,i]:=ADOQuery1.FieldList.Fields[i-1].FieldName;
    j:=2;
    while not ADOQuery1.Eof do begin
      for i:=1 to ADOQuery1.FieldCount do
        sheet.Cells[j,i]:=ADOQuery1.FieldList.Fields[i-1].AsString;
      ADOQuery1.Next;
      inc(j);
    end;
    ADOQuery1.Close;
    ExcelApp.Visible := true;
    Close;
  end;
end;

end.
