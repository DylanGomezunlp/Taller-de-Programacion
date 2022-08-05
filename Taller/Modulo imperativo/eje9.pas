program ejercicio9;
type
arbol= ^nodo;
	nodo= record
		dato: string;
		hi: arbol;
		hd: arbol;
	end;

procedure insertarArbol(var a: arbol; d: string);
	begin
		if a= nil then begin
			new(a);
			a^.dato:= d;
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else begin
			if a^.dato<d then
				insertarArbol(a^.hd,d)
			else
				insertarArbol(a^.hi,d)
		end;
	end;

    procedure armarArbol (var a:arbol);
var
	n:string;
begin
    writeln('ingrese un nombre');
    readln(n);
    while (n<>'zzz') do begin
        insertarArbol(a,n);
        writeln('ingrese un nombre');
        readln(n);
    end;
end;

Function Buscar (a:arbol; d:string): boolean; 
 begin
  if (a=nil) then Buscar:=false
  else if (d = a^.dato) then Buscar:=true
       else 
        if (d < a^.dato) then 
          Buscar:=Buscar(a^.hi ,d)
        else  
          Buscar:=Buscar(a^.hd ,d)
end;

var
	a:arbol; nombre:string;
begin
	a:=nil;
	armarArbol(a);
	writeln('ngrese un nombre a buscar: ');
	readln(nombre);
	writeln(Buscar(a,nombre));
end.
	
