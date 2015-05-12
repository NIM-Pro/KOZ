unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, comobj;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Button2: TButton;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Button3: TButton;
    Edit4: TEdit;
    Label4: TLabel;
    Button4: TButton;
    Label5: TLabel;
    Edit5: TEdit;
    Button5: TButton;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  XL: Variant;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
XL := CreateOLEObject('Excel.Application');
XL.WorkBooks.Open(Edit1.text);
XL.visible := true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
try
XL.ActiveWorkbook.protect(Edit2.text);
except

end;
end;
procedure TForm1.Button3Click(Sender: TObject);
begin
XL.ActiveWorkbook.Unprotect(Edit3.text);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
Xl.ActiveSheet.protect(Edit4.text);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
XL.ActiveSheet.Unprotect(Edit5.text);
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Edit1.Text:=OpenDialog1.FileName;
end;

end.
