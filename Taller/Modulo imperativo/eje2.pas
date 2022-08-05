program ejercicio2;
const
	dimF=8;
type
	subrango=1..dimF;
  
	pelicula=record
		cod:integer;
		genero:subrango;
		promedio:real;
	end;
	
	lista=^nodo;
	nodo=record
		dato:pelicula;
		sig:lista;
	end;
	
	vPelicula=array [subrango] of lista;
  
  
	vPuntaje=array [subrango] of real;

procedure inicializarListas (var v:vPelicula);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		v[i]:=nil;
	end;
end;

procedure agregarAtras(var L, ULT:lista; j:pelicula);
var
 nue: lista;
begin
 new (nue); 
 nue^.dato := j; 
 nue^.sig := nil; 
 if( L = nil) then 
 		L:= nue
 else 
 		ULT^.sig := nue; 
 ULT := nue; 
end;

procedure leerPelicula (var p:pelicula);
begin
	writeln('ingrese el codigo de la pelicula: ');
	readln(p.cod);
	if p.cod<>-1 then begin
		writeln('ingrese el genero de la pelicula (entre 1 y 8)');
		readln(p.genero);
		writeln('ingrese el puntaje promedio de la pelicula: ');
		readln(p.promedio);
	end;
end;

procedure imprimirLista(L:lista);
begin
	while l<>nil do begin
		writeln(l^.dato.cod);
		writeln(l^.dato.genero);
		writeln(l^.dato.promedio:2:2);
		l:=l^.sig;
	end;
end;

procedure cargarVector (var v:vPelicula);
var
	p:pelicula;
	vecUlt:vPelicula;
begin
	inicializarListas(vecUlt);
	leerPelicula(p);
	while (p.cod<>-1) do begin
		agregarAtras(v[p.genero], vecUlt[p.genero], p);
		leerPelicula(p);
	end;
end;


procedure maximo (var max:real; var codMax:integer; var min:real; var codMin:integer; puntaje:real; codigo:integer);
begin
	if (puntaje>max) then begin
		max:=puntaje;
		codMax:=codigo;
	end;
	if (puntaje<min) then begin
		min:=puntaje;
		codMin:=codigo;
	end;
end;

procedure recorrerLista (l:lista; var codMax:integer; var codMin:integer);
var
	max,min:real;
begin
	max:=-9999;
	min:=9999;
	while (l<>nil) do begin
		maximo(max,codMax,min,codMin,l^.dato.promedio,l^.dato.cod);
		l:=l^.sig;
	end;
end;

procedure recorrerVector (v:vPelicula; var p:vPuntaje);
var
	i:integer;
	codMax,codMin:integer;
begin
	for i:=1 to dimF do begin
		recorrerLista(v[i],codMax,codMin);
		p[i]:=codMax;
	end;
	writeln('El codigo de pelicula con mejor puntuacion en la critica fue: ', codMax, ' y el codigo de pelicula con menor puntuacion es el: ', codMin);
end;

Procedure insercion (var v:vPuntaje);
var 
i,j:subrango; 
actual:real;	
		
begin
 for i:=2 to dimF do begin actual:= v[i];
     j:= i-1; 
     while ((j>0) and (v[j]>actual)) do
      begin
        v[j+1]:= v[j];
        j:=j-1;
      end;  
     v[j+1]:= actual; 
end;
end;
	
var
	v:vPelicula;
	vector:vPuntaje;
begin
	inicializarListas(v);
	cargarVector(v);
	recorrerVector(v,vector);
end.


