program Project4;

uses
  Vcl.Forms,
  Unit9 in 'Unit9.pas' {Form9},
  UnitCrypt in 'UnitCrypt.pas',
  CryptFile in 'CryptFile.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
