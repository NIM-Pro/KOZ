unit Unit24;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TListItem = class(Vcl.ComCtrls.TListItem)
    public
      docpath:string;
  end;
  Doc = record
    path:shortstring;
    caption:shortstring;
  end;
  TForm24 = class(TForm)
    ListView1: TListView;
    RichEdit1: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure ListView1Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
  private
    { Private declarations }
  public
    { Public declarations }
    activeDoc:TListItem;
    loaded:boolean;
    procedure loadDoc(Item:TListItem);
  end;

var
  Form24: TForm24;

implementation

{$R *.dfm}

function readString(ini:TIniFile;section,key,default:string):string;
begin
  try
    result:=ini.ReadString(section,key,default);
  except
    result:=default;
  end;
end;

function readInteger(ini:TIniFile;section,key:string;default:integer):integer;
begin
  try
    result:=strtoint(readString(ini,section,key,inttostr(default)));
  except
    result:=default;
  end;
end;

procedure TForm24.FormCreate(Sender: TObject);
var ini: TIniFile; i,count:integer; tmp:TListItem;
begin
  loaded:=false;
  ini:=TIniFile.Create('.\texts.ini');
  count:=readInteger(ini,'Global','Count',0);
  for i:=0 to count-1 do begin
    tmp:=TListItem(ListView1.Items.Add);
    tmp.docpath:=readString(ini,'Doc'+inttostr(i),'path','');
    tmp.Caption:=readString(ini,'Doc'+inttostr(i),'caption',tmp.docpath);
  end;
  ini.Free;
  loaded:=true;
end;

procedure TForm24.ListView1Change(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  loadDoc(Item);
end;

procedure TForm24.loadDoc(Item:TListItem);
begin
  if (activeDoc<>Item) and loaded then begin
    activeDoc:=Item;
    RichEdit1.Lines.LoadFromFile(Item.docpath);
  end;
end;

end.
