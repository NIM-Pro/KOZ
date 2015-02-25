unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uLkJSON, Vcl.StdCtrls, Vcl.ComCtrls;

type
  Item = class
    name:string;
    path:string;
    node:TTreeNode;
  end;
  TForm5 = class(TForm)
    TreeView1: TTreeView;
    RichEdit1: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  public
    { Public declarations }
    ItemList:array of Item;
    currentNode:TTreeNode;
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
  if currentNode<>Node then begin
    currentNode:=Node;
    i:=findItem(Node);
    if i<>nil then
      RichEdit1.Lines.LoadFromFile(i.path);
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
  currentNode:=nil;
  text:=TStringStream.Create;
  text.loadFromFile('test.json');
  res:=TlkJSON.ParseText(text.DataString);
  for i:=0 to res.Count-1 do
    tree(res.Child[i],nil);
end;

end.
