program Project15;

uses
  Vcl.Forms,
  Unit22 in 'Unit22.pas' {Form22},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm22, Form22);
  Application.Run;
end.
