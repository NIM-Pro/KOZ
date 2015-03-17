unit UnitCrypt;

interface

uses System.SysUtils, System.Classes;

type
  TFn<IN_, OUT_> = reference to function(X: IN_): OUT_;
  TPr<IN_> = reference to procedure(X,Y: IN_);
  outFn=TPr<string>;
  cryptFn=TPr<TFileStream>;
  byteFn=TFn<Byte,Byte>;

function getCryptFn(inFn:cryptFn):outFn;
function getCryptByByteFn(inFn:byteFn):outFn;

implementation

function getCryptFn(inFn:cryptFn):outFn;
begin
  result:=procedure(inf,outf:string)
  var ins,outs:TFileStream;
  begin
    ins:=TFileStream.Create(inf,fmOpenRead);
    outs:=TFileStream.Create(outf,fmCreate);
    inFn(ins,outs);
    ins.Free;
    outs.Free;
  end;
end;

function getCryptByByteFn(inFn:byteFn):outFn;
begin
  result:=getCryptFn(procedure(ins,outs:TFileStream)
  var i:integer; b:byte;
  begin
    for i:=0 to ins.Size do begin
      ins.Read(b,sizeof(b));
      b:=inFn(b);
      outs.Write(b,sizeof(b));
    end;
  end);
end;

end.
