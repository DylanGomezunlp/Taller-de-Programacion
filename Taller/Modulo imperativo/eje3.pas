program ejercicio3;
const
	dimF=8;
	R=30;
type
	subrango=1..dimF;
	subrango2=1..R;
	producto=record 
		cod:integer;
		rubro:subrango;
		precio:real;
	end;
	lista=^nodo;
	nodo=record
		dato:producto;
		sig:lista;
	end;
	vProducto=array[subrango]of lista;
	vRublo=array [subrango2] of producto;
	
procedure inicializarListas (var v:vProducto);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		v[i]:=nil;
	end;
end;
	
procedure leerProducto (var p:producto);
begin
	writeln('ingrese el cod del producto: ');
	readln(p.cod);
	if (p.cod<>0) then begin
		writeln('ingrese el rubro del producto: ');
		readln(p.rubro);
		writeln('ingrese el precio del producto: ');
		readln(p.precio);
	end;
end;
procedure InsertarOrdenado (var L:lista; v:producto);
var
	nuevo,actual,ant:lista;
begin
    new(nuevo); nuevo^.dato:=v;
    actual:=L;
    ant:=L;
    while (actual<>nil) and (v.cod>actual^.dato.cod) do begin
        ant:=actual;
        actual:=actual^.sig;
    end;
    if (actual=ant)then begin
        L:=nuevo;
    end else
        ant^.sig:=nuevo;
    nuevo^.sig:=actual;
end;
procedure cargarDatos (var v:vProducto);
var
	p:producto;
begin
	leerProducto(p);
	while p.cod<>0 do begin
		InsertarOrdenado(v[p.rubro],p);;
		leerProducto(P);
	end;
end;

procedure imprimirLista (L:lista);
begin
	while (l<>nil) do begin
		writeln('-> ',l^.dato.cod);
		l:=l^.sig;
	end;
end;

procedure imprimirVector (v:vProducto);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		if (v[i]<>nil) then begin
			writeln('productos del rublo: ', i);
			imprimirLista(v[i]);
		end;
	end;
end;

procedure armarSubvector (l:lista; var v:vRublo; var dimL:integer);
var
	i:integer;
begin
	i:=1;
	while ((l<>nil) and (i<R)) do begin
		v[i]:=l^.dato;
		dimL:=dimL+1;
		l:=l^.sig;
		i:=i+1;
	end;
end;

procedure generarSubvector (v:vProducto; var k:vRublo; rublo:integer; var dimL:integer);
begin
	armarSubvector(v[rublo],k,dimL);
end;

Procedure insercion (var v:vRublo; dimL:integer);
var 
i,j:subrango2; 
actual:producto;	
		
begin
 for i:=2 to dimL do begin actual:= v[i];
     j:= i-1; 
     while ((j>0) and (v[j].precio>actual.precio)) do
      begin
        v[j+1]:= v[j];
        j:=j-1;
      end;  
     v[j+1]:= actual; 
end;
end;

procedure imprimirPrecios (v:vRublo; dimL:integer);
var
	i:integer;
begin
	for i:=1 to dimL do begin//en realidad va todo con dimL
		writeln(v[i].precio:2:2);
	end;
end;

var
	v:vProducto;
	k:vRublo;
	rublo:subrango;
	dimL:integer;
begin
	inicializarListas(v);
	dimL:=0;
	cargarDatos(v);
	imprimirVector(v);
	writeln('ingrese de cual rublo quiere generar un subVector: ');
	readln(rublo);
	generarSubvector(v,k,rublo,dimL);
	insercion(k,dimL);
	imprimirPrecios(k,dimL);
end.

		
		
