unit Unit22;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, comobj,
  Vcl.OleCtnrs;

type
  TForm22 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    FontD: TFontDialog;
    RichEdit1: TRichEdit;
    Ole: TOleContainer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form22: TForm22;

implementation

{$R *.dfm}

procedure TForm22.Button1Click(Sender: TObject);
begin
  Button2.Enabled:=FontD.Execute;
end;

procedure TForm22.Button2Click(Sender: TObject);
var _:variant; a:TFont;
begin
  ole.CreateObject('Word.Document',false);
  _:=ole.OleObject.Paragraphs.Add.Range;
  _.Text:=RichEdit1.Lines.Text;
  _:=_.Font;
  a:=FontD.Font;
  try _.Size:=a.Size; except end;
  try _.NameAscii:=a.Name; except end;
  try _.Color:=a.Color; except end;
  RichEdit1.Visible:=false;
  Panel1.Visible:=false;
  Ole.Visible:=true;
end;

end.
