program ejercicio1;
const
	dimF=300;
type
	subrango=1..dimF;
	oficina=record
		cod:integer;
		dni:integer;
		valor:real;
	end;
	
	vOficina=array [subrango] of oficina;
	
procedure LeerOficina (var o:oficina);
begin
	writeln('ingrese el codigo de la oficina: ');
	readln(o.cod);
	writeln('ingrese el dni del propietario: ');
	readln(o.dni);
	writeln('ingrese el valor de la expensa: ');
	readln(o.valor);
	end;


procedure cargarVector (var v:vOficina; var dimL:integer);
var
	o:oficina;
begin
	LeerOficina(o);
	while ((o.cod<>-1) and (dimL<dimF)) do begin
		dimL:=dimL+1;
		writeln(dimL);
		v[diml]:=o;
		LeerOficina(o);
	end;
end;

Procedure insercion (var v:vOficina;dimL:integer);

var 
i,j:subrango; 
actual:subrango;	
		
begin
 for i:=2 to dimL do begin actual:= v[i].cod;
     j:= i-1; 
     while ((j>0) and (v[j].cod>actual)) do
      begin
        v[j+1]:= v[j];
        j:=j-1;
      end;  
     v[j+1].cod:= actual; 
end;
end;

Procedure seleccion(var v:vOficina; dimL:subrango); //metodo seleccion

var 
	i,j,p:subrango; dato:oficina;
begin
	for i:=1 to dimL-1 do begin 
          p:=i;
          for j:=i+1 to dimL do
             if (v[j].cod<v[p].cod) then p:=j;
         dato:=v[p];   
         v[p]:=v[i];   
         v[i]:=dato;
      end;
end;

procedure imprimirVector (v:vOficina; dimL:subrango);
var
	i:integer;
begin
	for i:=1 to dimL do begin
		writeln(v[i].cod);
	end;
end;


var
	diml:integer;
	v:vOficina;
begin
	cargarVector(v,dimL);
	insercion(v,dimL);
	imprimirVector(v,dimL);
end.



