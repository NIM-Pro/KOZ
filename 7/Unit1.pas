unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, ExtDlgs, GIFImage,jpeg;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 if OpenPictureDialog1.Execute then
 begin
   Image1.Picture:=nil;
   Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Image1.Picture:=nil;
end;

end.
