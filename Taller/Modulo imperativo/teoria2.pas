program teoria;
Type
  arbol = ^nodo;

  nodo = record
   dato: integer;
   HI: arbol;
   HD: arbol;
  end;


{procedure agregarAdelante (var l:lista; n:integer);
var
	nue:lista;
begin
	new(nue); nue^.dato:=n; nue^.sig:=l;
	l:=nue;

end;
procedure leerDatos (var l:lista);
var
	i,num:integer;
begin
	for i:=1 to 7 do begin
		writeln('--');
		readln(num);
		agregarAdelante(l,num);
	end;
end;
procedure imprimirRecursivo (l:lista);
begin
	if l<>nil then begin	
		writeln(l^.dato);
		l:=l^.sig;
		imprimirRecursivo(l);
	end;
end;}

procedure descomponer (var num:integer);
begin
	while (num<>0) do begin
		writeln (num mod 10);
		num:=num div 10;
	end;
end;
{var
	A:arbol;
	num,suma:integer;
begin
	A:=nil;
	suma:=0;
	randomize;
	num:=random(20);
	while(num <> 0) do
	begin
		CrearArbol(A,num);
		num:=random(20);
	end;}

	
procedure descomponer (var num:integer);
begin
	if (num<>0) then begin
		num:=num div 10;
		descomponer(num);
		writeln (num mod 10);
	end;
end;





Procedure crear (var A:arbol; num:integer);
Begin
  if (A = nil) then
   begin
      new(A);
      A^.dato:= num; A^.HI:= nil; A^.HD:= nil;
   end
   else
    if (num < A^.dato) then 
		crear(A^.HI,num)
    else crear(A^.HD,num)   
End;

{Procedure preOrden (a:arbol; var cont:integer);

begin
   if (a<>nil) then begin
    write ('---',a^.dato);
    cont:=cont+a^.dato;   
    preOrden (a^.HI,cont);
    preOrden (a^.HD,cont);
   end;
end;}

Procedure multiplicar (var a:arbol);

begin
   if (a<>nil) then begin
    a^.dato:=a^.dato*2;
    writeln('...',a^.dato);
    multiplicar (a^.HI);
    multiplicar (a^.HD);
   end;
end;

procedure comparacion (var max:integer; dato:integer);
begin
	if (dato>max) then
		max:=dato;
end;


Procedure maximo (a:arbol; var max:integer);
begin
   if (a<>nil) then begin
    comparacion(max,a^.dato);
    //maximo(a^.HI,max) no es necesario ir por la rama izquierda cuando es maximo xd
    maximo (a^.HD,max);
   end;
end;

Procedure imprimirArbol (a:arbol);
begin
   if (a<>nil) then begin
    write ('---',a^.dato);   
    imprimirArbol (a^.HI);
    imprimirArbol (a^.HD);
   end;
end;


{function preOrden (a:arbol):integer;
var
	cont:integer;
begin
	cont:=0;
   if (a<>nil) then begin
    cont:=cont+a^.dato;
	cont:=cont+preOrden(a^.HI);
    cont:=cont+preOrden(a^.HD);
   end;
   preOrden:=cont;
end;
}
function contadorArbol (a:arbol):integer;
begin
	if a<>nil then begin
		contadorArbol:= a^.dato+ contadorArbol(a^.HI)+contadorArbol(a^.HD);
	else
		contadorArbol:=0;
end;





procedure crearArbol (var a:arbol);
var
	n:integer;
begin
	writeln('ingrese un numero: ');
	readln(n);
	while (n<>58) do begin
	crear(a,n);
	writeln('ingrese un numero: ');
	readln(n);
	end;
end;

Var
 a:arbol; cont,n,max:integer;
begin
	{l:=nil;
	leerDatos(l);
	imprimirRecursivo(l);
}
	{writeln('num');
	readln(num);
	while num<>0 do begin
		descomponer(num);
		writeln('num');
		readln(num);
	end;}
	a:=nil;
	crearArbol(a);
	//writeln(preOrden(a));
	{imprimirArbol(a);
	writeln(' ');
	multiplicar(a);}
	max:=-9999;
	maximo(a,max);
	writeln(' ');
	writeln(max);
end.
