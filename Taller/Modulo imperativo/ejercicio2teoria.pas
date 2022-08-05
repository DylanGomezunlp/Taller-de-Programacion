Program teoria;
const
cantE=2; 
Type 

 lista =^nodo;
 nodo = record
  dato:string;
  sig:lista;
 end; 
 
 estantes=array[1..cantE] of lista;
 
Procedure agregarAtras (var pI:lista; num:string);
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
 
procedure cargarLista (var L:lista);
var
	n:string;
begin
	writeln('ingrese un nombre');
	readln(n);
	while n<>'zzz' do begin
		agregarAtras(l,n);
		writeln('ingrese un nombre');
		readln(n);
	end;
end;

procedure inicializarLista (var v:estantes);
var
	i:integer;
begin
	for i:=1 to cantE do begin
		v[i]:=nil;
	end;
end;
 
procedure cargarVectorListas (var v:estantes);
var
	i:integer;
begin
	for i:=1 to cantE do begin
		cargarLista(v[i]);
	end;
end;

Procedure minimo ( var todos:estantes; var nomM:string);

Var
 indiceMin,i:integer;

Begin
nomM:='zzz';
  indiceMin:= -1;
  for i:= 1 to cantE do 
     if (todos[i] <> nil) then 
       if (todos[i]^.dato <= nomM) then begin
           indiceMin:= i;
           nomM:= todos[i]^.dato;  
       end; 
  if (indiceMin <> -1) then 
    begin
      nomM:= todos[indiceMin]^.dato;
      todos[indiceMin]:= todos[indiceMin]^.sig;
    end;
End;


procedure imprimirLista (l:lista);
begin
	while l<>nil do begin
		writeln(l^.dato);
		l:=l^.sig;
	end;
end;

Procedure merge (todos:estantes; var Enuevo:lista);
var
	min:string;
Begin
  Enuevo:= nil;
  minimo(todos,min);
  while (min <> 'zzz') do
    begin
     agregarAtras (Enuevo,min);
     minimo (todos,min);
    end;
End;  

var
	v:estantes;
	i:integer;
	e:lista;
begin
	inicializarLista(v);
	cargarVectorListas(v);
	{for i:=1 to cantE do
		imprimirLista(v[i]);}
	writeln('----------');
	merge(v,e);
	imprimirLista(e);
	writeln('----------');
end.
// ejercicio 2 teoria
	
