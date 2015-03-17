unit Unit9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Menus,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, UnitCrypt;

type
  TForm9 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    DataSource1: TDataSource;
    N1: TMenuItem;
    N2: TMenuItem;
    N6: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N7: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure N6Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    filename:string;
    crypt:outFn;
    pass:byte;
    procedure getTables(xout:TStrings);
    procedure disconnect;
    procedure connect;
    function getPassByte:Byte;
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

function TForm9.getPassByte:Byte;
var s:string; i,l,r:integer;
begin
  s:=InputBox('ÇÀÙÈÒÀ','Óêàæèòå ïàðîëü','');
  l:=length(s);
  r:=0;
  for i:=1 to l do
    r:=r+ORD(s[i]);
  result:=r mod 256;
end;

procedure TForm9.disconnect;
begin
  ADOConnection1.Connected:=false;
  ADOTable1.Active:=false;
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Disconnect;
  DeleteFile('db.accdb');
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
  filename:='';
  crypt:=getCryptByByteFn(function(inb:Byte):Byte
  begin
    result:=inb XOR pass;
  end);
end;

procedure TForm9.ComboBox1Change(Sender: TObject);
begin
  if ADOConnection1.Connected then begin
    ADOTable1.Active:=false;
    ADOTable1.TableName:=ComboBox1.Text;
    ADOTable1.Active:=true;
  end;
end;

procedure TForm9.connect;
begin
  ADOConnection1.Connected:=true;
  getTables(ComboBox1.Items);
end;

procedure TForm9.getTables(xout:TStrings);
begin
  ADOConnection1.GetTableNames(xout);
end;

procedure TForm9.N2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    disconnect;
    filename:=OpenDialog1.FileName;
    pass:=getPassByte;
    crypt(filename,'db.accdb');
    connect;
  end;
end;

procedure TForm9.N3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm9.N4Click(Sender: TObject);
begin
  if length(filename)>0 then begin
    disconnect;
    pass:=getPassByte;
    crypt('db.accdb',filename);
    connect;
  end else
    N7Click(Sender);
end;

procedure TForm9.N6Click(Sender: TObject);
begin
  filename:='';
  disconnect;
  CopyFile('null.accdb','db.accdb',false);
  connect;
end;

procedure TForm9.N7Click(Sender: TObject);
begin
  if SaveDialog1.Execute then begin
    filename:=SaveDialog1.FileName;
    N4Click(Sender);
  end;
end;

end.
