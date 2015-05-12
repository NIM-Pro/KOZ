unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uLkJSON, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.OleCtrls, SHDocVw, math;

type
  Item = class
    name:string;
    path:string;
    node:TTreeNode;
  end;
  TForm5 = class(TForm)
    TreeView1: TTreeView;
    WebBrowser1: TWebBrowser;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ItemList:array of Item;
    currentNode:TTreeNode;
    canILoad:boolean;
    function newItem(i:Item):Item;
    procedure tree(obj:TlkJSONbase;node:TTreeNode);
    procedure treeCh(obj:TlkJSONbase;node:TTreeNode);
    function findItem(node:TTreeNode):Item;
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

function TForm5.findItem(node: TTreeNode):Item;
var i,l:integer;
begin
  l:=length(ItemList);
  result:=nil;
  for i:=0 to l-1 do begin
    if node=ItemList[i].node then begin
      result:=ItemList[i];
      break;
    end;
  end;
end;

function TForm5.newItem(i: Item):Item;
var l:integer;
begin
  l:=length(ItemList);
  setLength(ItemList,l+1);
  ItemList[l]:=i;
  result:=i;
end;

function getString(obj: TlkJSONbase; name,default:string):string; overload;
begin
  try
    result:=obj.Field[name].Value;
  except
    result:=default;
  end;
end;

function getString(obj: TlkJSONbase; name:string):string; overload;
begin
  result:=getString(obj,name,'');
end;

procedure TForm5.treeCh(obj: TlkJSONbase; node: TTreeNode);
var i:integer; ch:TlkJSONbase;
begin
  try
    ch:=obj.Field['children'];
    for i:=0 to ch.Count-1 do begin
      tree(ch.Child[i],node);
    end;
  except

  end;
end;

procedure TForm5.TreeView1Change(Sender: TObject; Node: TTreeNode);
var i:Item;
begin
  if (currentNode<>Node) and canILoad then begin
    currentNode:=Node;
    i:=findItem(Node);
    if i<>nil then begin
      WebBrowser1.Navigate('file:///'+ExtractFilePath(Application.ExeName)+i.path);
    end;
  end;
end;

procedure TForm5.tree(obj: TlkJSONbase;node:TTreeNode);
var it:Item; n:TTreeNode;
begin
  it:=newItem(Item.create);
  it.path:=getString(obj,'path');
  it.name:=getString(obj,'caption',it.path);
  n:=TreeView1.Items.AddChild(node,it.name);
  it.node:=n;
  treeCh(obj,n);
end;

procedure TForm5.FormCreate(Sender: TObject);
var text:TStringStream; res:TlkJSONbase; i:integer;
begin
  canILoad:=false;
  currentNode:=nil;
  text:=TStringStream.Create;
  text.loadFromFile('documents.json');
  res:=TlkJSON.ParseText(text.DataString);
  for i:=0 to res.Count-1 do
    tree(res.Child[i],nil);
  canILoad:=true;
end;

procedure TForm5.FormResize(Sender: TObject);
begin
  //TreeView1.Width:=floor(Form5.ClientWidth/4);
end;

end.
