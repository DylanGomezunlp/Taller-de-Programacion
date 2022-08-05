program ejercicio8;
type
    arbol= ^nodo;
	nodo= record
		dato: integer;
		hi: arbol;
		hd: arbol;
	end;

procedure crearArbol(var a: arbol; n: integer);
	begin
		if a= nil then begin
			new(a); a^.dato:= n;  a^.hi:= nil;	a^.hd:= nil;
		end
		else begin
			if n<a^.dato then
				crearArbol(a^.hi,n)
			else
				crearArbol(a^.hd,n)
		end;
	end;

function buscarMaximo(a:arbol) : integer;
begin
  if (a = nil) or (a^.hd = nil) then   
		buscarMaximo:= a^.dato
   else 
		buscarMaximo := buscarMaximo(a^.hd);
end;

function buscarMinimo(a:arbol) : integer;
begin
  if (a = nil) or (a^.hi = nil) then    
		buscarMinimo:=a^.dato
   else 
		buscarMinimo:=buscarMinimo(a^.hi);
end;

{Procedure imprimirDerecho (a:arbol);
begin
   if ( a<> nil ) then begin
    imprimirDerecho(a^.HI);
    writeln('   ',a^.dato);   
    imprimirDerecho (a^.HD);
   end;
end;}

Procedure imprimirDerecho (a:arbol); //test
begin
   if ( a<> nil ) then begin
	writeln('   ',a^.dato);  
    imprimirDerecho(a^.HI);  
    imprimirDerecho (a^.HD);
    writeln('   ',a^.dato);  
   end;
end;



Procedure imprimirAlReves (a:arbol);
begin
   if ( a<> nil ) then begin 
    imprimirAlReves (a^.HI);
    imprimirAlReves (a^.HD);
    {if ((a^.dato mod 2) = 0) then}
     writeln('   ',a^.dato);  
   end;
end;


Procedure cantElementos ( a : arbol; var Cant:integer );
begin
   if ( a<> nil ) then begin
    cant:=cant+1;  
    cantElementos (a^.HI,cant);
    cantElementos (a^.HD,cant);
   end;
end;

procedure armarArbol (var a:arbol);
var
	n:integer;
begin
    writeln('ingrese un numero');
    readln(n);
    while n<>0 do begin
        crearArbol(a,n);
        writeln('ingrese un numero');
        readln(n);
    end;
end;



var 
    a:arbol;
    cant:integer;
begin
    a:=nil;
    cant:=0;
    armarArbol(a);
    cantElementos(a,cant);
    writeln('la cantidad de elementos es: ', cant);
    writeln('--------------------------');
    writeln('el numero minimo es: ',buscarMinimo(a));
    writeln('--------------------------');
    writeln('el numero maximo es: ',buscarMaximo(a));
    writeln('--------------------------');
    writeln('-----aca---------');
    writeln('--------------------------');
    imprimirDerecho(a);
    writeln('--------------------------');
    writeln('----ter-------------');
    writeln('--------------------------');
    writeln('--------------------------');
    imprimirAlReves(a);
end.
