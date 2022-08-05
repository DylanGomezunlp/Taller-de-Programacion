program eje5;
const
    dimF=2;
type    
    subrango=1..dimF;
    vector=array [subrango] of integer;

procedure cargarVector (var v:vector);
var 
    i,n:integer;
begin
  for i:=1 to dimF do begin
        n:=random(21);
        v[i]:=n
    end;
end;

procedure maximo (v:vector; i:integer; var max:integer);
begin   
    if v[i]>max then
        max:=v[i];
    if (i<dimf) then
        maximo(v,i+1,max);
end;

function MaxVR (V:vector; dimL: integer):integer;var  aux: integer;begin     if(dimL > 0) then     begin           aux:= MaxVR(V,dimL-1);          if (V[dimL]> aux) then              MaxVR:= V[dimL]          else           MaxVR := aux;    end      else        MaxVR:= -1;end;

procedure sumarDatos (v:vector; i:integer; var contador:integer);
begin   
    if (i<=dimf) then begin
       contador:= contador+v[i];
       if i<>dimf then
       sumarDatos(v,i+1,contador);
end;
end;

procedure imprimirVector (v:vector);
var 
    i:integer;
begin
    for i:=1 to dimF do begin
        write('|',v[i],'|');
    end;
end;

var 
    v:vector;
    contador:integer;
    max,i:integer;
begin
    Randomize
    cargarVector(v);
    imprimirVector(v);
    i:=1;
    maximo(v,i,max);
    writeln('el maximo fue: ',max);
    contador:=0;
    sumarDatos(v,i,contador);
    writeln(contador);
end.
