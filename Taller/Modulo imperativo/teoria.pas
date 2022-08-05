program modulo1;
const
	dimf=20;
type
	subrango=1..dimf;
	vector= array [subrango] of integer;
	
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
	end;
	
//procedure leerRandom (?);

procedure agregarAtras (var L:lista; ult:lista; num:integer);
var
	nue:lista;
begin
	new(nue); nue^.dato:=num; nue^.sig:=nil;
	if L=nil then begin
		L:=nue;
	end
	else
		ult^.sig:=nue;
	ult:=nue;
end;

procedure cargarVector (var v:vector; var dimL:subrango);
var
	num:integer;
begin
	dimL:=0;
	writeln('ingrese un numero: ');
	readln(num);
	while ((dimL<dimf) and (num<>0)) do begin
		dimL:=dimL+1;
		v[dimL]:=num;
		writeln('ingrese un numero: ');
		readln(num);
	end;
end;

procedure imprimirVector (v:vector;	dimL:subrango);
var
	i:integer;
begin
	for i:=1 to dimL do begin
		writeln(v[i]);
	end;
end;

function buscarNum (v:vector;numero:integer; diml:subrango):integer;
var
	pos,i:integer;
	ok:boolean;
begin
	pos:=-1;
	ok:=false;
	i:=1;
	while ((i<=dimL) and (not ok)) do begin
		if v[i]=numero then begin
			ok:=true;
			pos:=i;
		end
		else
			i:=i+1;
		end;
	buscarNum:=pos;
end;


procedure borrarNumEnVector (var v:vector; var ok:boolean; var diml:integer; numero:integer);
var
	i,pos:integer;
begin
	pos:=buscarNum(v,numero,dimL);
	if (pos=-1) then begin
		writeln('el elemento no esta en el vector');
	end
	else begin
	ok:=false;
	if ((pos>=1) and (pos<=diml)) then begin
		for i:=pos to diml-1 do
			v[i]:=v[i+1];
		ok:=true;
		diml:=diml-1;
		end;
	end;
end;

Procedure Ordenar(var v:vector; dimL:subrango);

var 
	i,j,p:subrango; dato:integer;
begin
	for i:=1 to dimL-1 do begin 
          p:=i;
          for j:=i+1 to dimL do
             if (v[j]<v[p]) then p:=j;
         dato:=v[p];   
         v[p]:=v[i];   
         v[i]:=dato;
      end;
end;
procedure agregarNodo(var l, ult: lista; num: integer);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= num;
	aux^.sig:= nil;
	if(l = nil) then
		l:= aux
	else
		ult^.sig:= aux;
	ult:= aux;
end;
//punto random; agregar al inicio l:=nil;
{procedure listaAleatoria(var l: lista);
var num: integer; ult: lista;
begin
	Randomize;
	num:= Random(16);
	while(num <> 15) do
	begin
		agregarNodo(l, ult, num);
		num:= Random(16);
	end;
end;

procedure imprimirLista(l: lista);
var i: integer;
begin
	i:= 1;
	while(l<>nil) do
	begin
		writeln(l^.dato, ' es el valor de la posicion ', i, ' de la lista');
		l:= l^.sig;
		i:= i + 1;
	end;
end;
}




var
	v:vector;
	ok:boolean;
	numero:integer;
	dimL:subrango;
begin
	cargarVector(v,dimL);
	imprimirVector(v,dimL);
	Ordenar(v,dimL);
	{writeln('ingrese un numero a eliminar: ');
	readln(numero);
	borrarNumEnVector(v,ok,dimL,numero);}
	{writeln(ok);}
	imprimirVector(v,dimL);
end.


	
		
