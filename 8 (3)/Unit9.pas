unit Unit9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtnrs, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Excel2010, comobj;

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
    function ColToText(aCol: integer): string;
    function CellToRange(aRow, aCol: integer): string;
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
var i:integer;
table:string;
sheet:variant;
//sheet:_Worksheet;
begin
  table:=getTableName;
  showmessage(Table);
  if (length(table)>0) then begin
    ADOQUery1.SQL.Text:='SELECT * FROM '+getTableName;
    ADOQuery1.Open;
    ListBox1.Visible:=false;
    sheet:=CreateOLEObject('Excel.Application');
    sheet.visible:=true;
    sheet:=sheet.WorkBooks.Add;
    sheet:=sheet.ActiveSheet;
    for i:=0 to ADOQuery1.FieldCount-1 do
      sheet.Range[CellToRange(1,i)].Value:=ADOQuery1.FieldList.Fields[i].Name;
      //sheet.Get_Range(CellToRange(1,i)).Value2:=ADOQuery1.FieldList.Fields[i].Name;
  end;
end;

function TForm9.ColToText(aCol: integer): string;
var
  d,m:integer;
begin
  result:='';
  if aCol<=0 then exit;


  aCol:=aCol-1;
  d:=aCol div 26;
  m:=aCol mod 26;
  result:=Char(ord('A')+m);
  if d>0 then
  begin
    result:=Char(ord('A')+d-1)+result;
  end;
end;

function TForm9.CellToRange(aRow, aCol: integer): string;
begin
  result:='';
  result:=ColToText(aCol)+IntToStr(aRow);
end;

end.
