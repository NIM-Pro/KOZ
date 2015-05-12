program Project3;

uses
  Vcl.Forms,
  Unit5 in 'Unit5.pas' {Form5},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Light');
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
