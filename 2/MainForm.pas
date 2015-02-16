unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Menus;

type
  TMForm = class(TForm)
    MainMenu1: TMainMenu;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    RichEdit1: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure RichEdit1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    changed:boolean;
    filename:string;
  end;

var
  MForm: TMForm;

implementation

{$R *.dfm}

procedure TMForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if changed then
    case MessageDlg('File is changed! Do you want to save it?',mtConfirmation, mbYesNoCancel, 0) of
      mrYes:N4Click(Sender);
      mrCancel:CanClose:=false;
    end;
end;

procedure TMForm.FormCreate(Sender: TObject);
begin
  filename:='';
  changed:=false;
end;

procedure TMForm.N2Click(Sender: TObject);
begin
  FormCreate(Sender);
  RichEdit1.Lines.Clear;
end;

procedure TMForm.N3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    filename:=OpenDialog1.FileName;
    changed:=false;
    RichEdit1.Lines.LoadFromFile(filename);
  end;
end;

procedure TMForm.N4Click(Sender: TObject);
begin
  if length(filename)=0 then N5Click(Sender) else begin
    RichEdit1.Lines.SaveToFile(filename);
    changed:=false;
  end;
end;

procedure TMForm.N5Click(Sender: TObject);
begin
  if SaveDialog1.Execute then begin
    filename:=SaveDialog1.FileName;
    N4Click(Sender);
  end;
end;

procedure TMForm.RichEdit1Change(Sender: TObject);
begin
  changed:=true;
end;

end.
