program ejercicio11;
const
    DIMF=8;
type    
    subrango=1..DIMF;
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
    vPeliculas=array [subrango] of lista;

procedure inicializarListas (var v:vPeliculas);
var 
    i:integer;
begin
    for i:=1 to DIMF do begin   
        v[i]:=nil;
    end;
end;


procedure leerPelicula (var p:pelicula);
begin   
    writeln('ingrese el cod de pelicula:');
    readln(p.cod);
    if (p.cod<>-1) then begin 
        writeln('ingrese el genero de pelicula: ');
        readln(p.genero);
        writeln('ingrese el puntaje de pelicula:');
        readln(p.promedio);
    end;
end;

procedure insertarOrdenado(var L:lista; j:pelicula);
var
  nue: lista; 
  act, ant: lista; 
begin
  new (nue); 
  nue^.dato := j; 
  act := L; 
  ant := L; 
  while( act <> nil)and(j.cod > act^.dato.cod)do 
  begin
    ant := act;
    act:= act^.sig;
  end;
  if (act = ant) then 
    L:= nue
  else 
    ant^.sig:= nue;
  nue^.sig:= act; 
end;


procedure leerlISTAS (var v:vPeliculas);
var
    p:pelicula;
begin
    leerPelicula(p);
    while p.cod<>-1 do begin
        insertarOrdenado(v[p.genero],p);
        leerPelicula(p);
    end;
end;

procedure imprimirLista (l:lista);
begin
	while l<>nil do begin
		writeln(l^.dato.cod);
		l:=l^.sig;
	end;
end;

procedure imprimirVecLista (v:vPeliculas);
var
    i:integer;
begin
    for i:=1 to DIMF do begin
		writeln('lista: ', i);
        imprimirLista(v[i]);
        writeln('--------');
    end;
end;



Procedure minimo ( var todos:vPeliculas; var codMin:integer; var min:pelicula);

Var
 indiceMin,i:integer;

Begin
    codMin:=9999;
  indiceMin:= -1;
  for i:= 1 to DIMF do 
     if (todos[i] <> nil) then 
       if (todos[i]^.dato.cod <= codMin) then begin
           indiceMin:= i;
           codMin:= todos[i]^.dato.cod;  
       end; 
  if (indiceMin <> -1) then 
    begin
      codMin:= todos[indiceMin]^.dato.cod;
      min:=todos[indiceMin]^.dato;
      todos[indiceMin]:= todos[indiceMin]^.sig;
    end;
End;

Procedure agregarAtras (var pI:lista; num:pelicula); //poner puntero al ultimo para que dejen de hinchar las bolas
Var
  nuevo,act,ant:lista;
Begin
  new (nuevo); nuevo^.dato:= num; nuevo^.sig:=nil;
  if (pI = nil) then
    pI:= nuevo
  else begin
    act:= pI; ant:=pI;
    while (act <> nil) do begin
      ant:=act;
      act:= act^.sig;
    end;
    ant^.sig:= nuevo;
  end;
End;


Procedure merge (todos:vPeliculas ; var Lnuevo:lista);
var
	min:pelicula;
	minii:integer;
Begin
  Lnuevo:= nil;
  minimo(todos,minii,min);
  while (minii <> 9999) do
    begin
     agregarAtras(Lnuevo,min);
     minimo (todos,minii,min);
    end;
End; 

var
    v:vPeliculas;
    l:lista;
begin
    inicializarListas(v);
    leerlISTAS(v);
    merge(v,l);
    imprimirVecLista(v);
    writeln('----------');
    imprimirLista(l);
end.
