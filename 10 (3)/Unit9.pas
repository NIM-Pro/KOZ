unit Unit9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtnrs, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, comobj;

type
  TForm9 = class(TForm)
    OpenDialog1: TOpenDialog;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

procedure TForm9.FormCreate(Sender: TObject);
var WordApp, table, ExcelApp, sheet: Variant; i,j:integer;
begin
  if OpenDialog1.Execute then begin
    WordApp := CreateOleObject('Word.Application');
    WordApp.Visible:=false;
    table:=WordApp.Documents.Open(OpenDialog1.FileName);
    table:=table.tables[1];
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.Visible := False;
    sheet:=ExcelApp.WorkBooks.Add(-4167);
    sheet:=sheet.WorkSheets[1];
    sheet.name := 'Export';

    for i:=1 to table.rows.count do
      for j:=1 to table.columns.count do
        sheet.cells[i,j]:=trim(table.cell(i,j).range.text);
      
    WordApp.Visible:=true;
    ExcelApp.Visible:=true;
  end else
    showmessage('Файл не указан. Завершение работы приложения');
  Application.Terminate;
end;

end.
