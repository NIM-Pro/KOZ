unit CryptFile;

interface

uses System.SysUtils, System.Classes, Vcl.Dialogs;

type
  refCryptProc<data> = reference to procedure(ins,outs:data);
  XCryptFile = class
    protected
      procedure doCrypt(en:boolean);
    public
      filename,tmpfilename,_password:string;
      changed:boolean;
      encryptFn,decryptFn:refCryptProc<TFileStream>;
      openDialog:TOpenDialog;
      saveDialog:TSaveDialog;
      procedure open;
      procedure save;
      procedure saveAs;
      procedure close;
      function getPass:string;
      Constructor Create;
      property password:string read getPass write _password;
  end;

implementation

constructor XCryptFile.Create;
begin
  changed:=false;
  filename:='';
  tmpfilename:='';
  password:='';
end;

function XCryptFile.getPass:string;
begin
  while length(password)=0 do
    password:=InputBox('Crypt File','Write a pass, please...','');
  result:=password;
end;

procedure XCryptFile.doCrypt(en:boolean);
var ins,outs:TFileStream;
begin
  if (length(filename)>0) and (length(tmpfilename)>0) then begin
    if en then begin
      ins:=TFileStream.Create(tmpfilename,fmOpenRead);
      outs:=TFileStream.Create(filename,fmCreate);
      encryptFn(ins,outs);
    end else begin
      ins:=TFileStream.Create(filename,fmOpenRead);
      outs:=TFileStream.Create(tmpfilename,fmCreate);
      decryptFn(ins,outs);
    end;
    ins.Free;
    outs.Free;
  end else
    Raise 'Filename(s) are null!';
end;

procedure XCryptFile.open;
begin
  if OpenDialog.Execute then begin
    filename:=OpenDialog.FileName;
    tmpfilename:=filename;
    while FileExists(tmpfilename) do
      tmpfilename:=filename+'.tmp';
    doCrypt(false);
    changed:=false;
  end;
end;

procedure XCryptFile.save;
begin
  if length(filename)=0 then
    saveAs
  else begin
    doCrypt(true);
    changed:=false;
  end;
end;

procedure XCryptFile.saveAs;
begin
  if SaveDialog.Execute then begin
    filename:=SaveDialog.FileName;
    save;
  end;
end;

procedure XCryptFile.close;
begin
  DeleteFile(tmpfilename);
end;

end.
