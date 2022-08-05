program DylanGomez;  
const 
	DIMF=4;
type
	subrango=1..DIMF;
	En=record
		cod:integer;
		codDestino:integer;
		peso:real;
		precio:real;
		tipo:subrango;
	end;	
	lista =^nodo;
	nodo = record
		dato:En;
		sig:lista;
	end; 
	Envio=record
		pesoTot:real;
		codLocal:integer;
	end;
 
	arbol= ^nodo2;
	nodo2= record
		dato: Envio;
		hi: arbol;
		hd: arbol;
	end;

	
	vector= array [subrango] of lista;
	
procedure envios (var v:vector); //se dispone

procedure insertarArbol(var a: arbol; c: Envio);
	begin
		if a= nil then begin
			new(a);
			a^.dato:= c;
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else begin
			if a^.dato.peso<c.peso then
				insertarArbol(a^.hd,c)
			else
				insertarArbol(a^.hi,c)
		end;
end;
	
Procedure minimo ( var v:vector; var min:En);
Var
 indiceMin,i:integer;
Begin
  min.codDestino:=9999;
  indiceMin:= -1;
  for i:= 1 to dimF do 
     if (v[i] <> nil) then 
       if (v[i]^.dato.codDestino <= min.codDestino) then begin
           indiceMin:= i;
           min:= v[i]^.dato;
       end; 
  if (indiceMin <> -1) then 
    begin
      v[indiceMin]:= v[indiceMin]^.sig;
    end;
End;

procedure mergeAcumulador(v:vector; var abb:arbol);
var
  codLocal:integer;
  pesoTot:real;
  peso:real;
  min:En;
  c:Envio;
begin
  abb:=nil;
  minimo(v,min);
  while(min.codLocal<>9999)do begin
    codLocal:=min.codDestino;
    pesoTot:=0;
    while(min.codLocal<>9999)and(codLocal=min.codDestino))do begin
      pesoTot:=pesoTot+min.peso;
      minimo(v,min);
    end;
    c.pesoTot:=pesoTot;
    c.codLocal:=codLocal;
    insertarArbol(abb, c);
  end;
end;

function Buscar (a:arbol; d:real); integer;
var
	tot:integer;
 begin
	tot:=0;
  if (a=nil) then Buscar:=tot+0
  else if (d = a^.dato.pesoTot) then Buscar:=tot+1;
       else  
        if (d < a^.dato.pesoTot) then 
          Buscar:=Buscar(a^.hi ,d)
        else  
          Buscar:=Buscar(a^.hd ,d)
end;

var
abb:arbol;
v:vector;
n:real;
begin
	abb:=nil;
	envios(v);
	mergeAcumulador(v,abb);
	writeln('ingrese un valor a buscar: ');
	readln(n);
	writeln('la cantidad total de veces que se encontro el modulo es de: ', Buscar(abb,n));
end.





	
