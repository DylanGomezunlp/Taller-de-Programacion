program test;
const
	CORTE = 9999;
type

	venta = record
		codV: integer;
		codP: integer;
		cant: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: venta;
		sig: lista;
	end;

procedure leerVenta (var v:venta);
begin
	writeln('ingrese un cod de venta (9999 para finalizar');
	readln(v.codV);
	if (v.codV<> CORTE) then begin
		writeln('ingrese el codigo del producto');
		readln(v.codP);
		writeln('ingrese la cantidad vendida');
		readln(v.cant);
	end
end;

procedure insertarOrdenado (var L:lista; v:venta);
var
	ant,act,aux:lista;
begin
	new(aux);
	aux^.dato:=v;
	act:=l;
	ant:=l;
	while ((act<>nil) and (v.codV>act^.dato.codV)) do
	begin
		ant:=act;
		act:=act^.sig;
	end;
	if act=ant then
		l:=aux
	else
		ant^.sig:=aux;
	aux^.sig:= act; 
end;
		

procedure generarLista (var L:lista);
var
	v:venta;
begin
	leerVenta(v);
	while v.codV<>CORTE do begin
		insertarOrdenado(l,v);
		leerVenta(v);
	end;
end;

procedure imprimirLista (l:lista);
begin
	while l<>nil do begin
        writeln('--->', l^.dato.codV);
		l:=l^.sig;
end;
end;


var
	l:lista;
begin
	l:=nil;
	generarLista(l);
	imprimirLista(l);
end.

