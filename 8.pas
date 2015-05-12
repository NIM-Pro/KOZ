unit Unit1;
 
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids, ComOBJ,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Samples.Spin;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    DBGrid1: TDBGrid;
    ADOTable1: TADOTable;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);





  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}





procedure TForm1.Button1Click(Sender: TObject);
begin
Button2.Enabled:=false;
Button3.Enabled:=true;
if OpenDialog1.Execute then
ADOCOnnection1.Connected:=false; ADOTable1.Active:=false;
ADOConnection1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+OpenDialog1.FileName+';Persist Security Info=False';
ADOCOnnection1.Connected:=true;
ADOTable1.Active:=true;
end;
procedure TForm1.Button2Click(Sender: TObject);
begin
ADOTable1.TableName:=Edit1.text;
Button1.Enabled:=true;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
i,j,index: Integer;
ExcelApp, sheet: Variant;
begin
ExcelApp := CreateOleObject('Excel.Application');
ExcelApp.Visible := False;
ExcelApp.WorkBooks.Add(-4167);
ExcelApp.WorkBooks[1].WorkSheets[1].name := 'Export';
sheet:=ExcelApp.WorkBooks[1].WorkSheets['Export'];
index:=1;
DBGrid1.DataSource.DataSet.First;
for i:=1 to  DBGrid1.DataSource.DataSet.RecordCount do
begin
for j:=1 to DBGrid1.FieldCount do
sheet.cells[index,j]:=DBGrid1.fields[j-1].asstring;
inc(index);
DBGrid1.DataSource.DataSet.Next;
end;
ExcelApp.Visible := true;
end;




procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if ADOConnection1.Connected then ADOConnection1.Close;
end;

end.
