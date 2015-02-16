program TextEditor;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {MForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMForm, MForm);
  Application.Run;
end.
