program Project16;

uses
  Vcl.Forms,
  Unit24 in '..\..\..\RAD Studio\Projects\Unit24.pas' {Form24};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm24, Form24);
  Application.Run;
end.
