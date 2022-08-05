  { Una cadena de gimnasios que tiene 5 sucursales necesita procesar las asistencias de los clientes. 
  * Implementar un programa con:
a. Un módulo que lea la información de las asistencias realizadas en 
las sucursales y genere una estructura con código de cliente, dni de 
cliente, fecha y cantidad de minutos que asistió a la sucursal, agrupados por sucursal. Para 
cada sucursal, los clientes deben estar ordenados por código de cliente. 
De cada asistencia se lee: código de sucursal (1..5), dni del cliente, código 
del cliente, fecha y cantidad de minutos que asistió. La lectura finaliza con el código 
de cliente -1, el cual no se procesa.
b. Un módulo que reciba la estructura generada en a) y utilizando la técnica de merge o 
merge acumulador genere un árbol ordenado por dni que contenga el dni de cliente y la 
cantidad total de veces que asistió a las sucursales del gimnasio.}




program ejercicio5adicional;
const
  dimF=5;
type
  subrango=1..dimF;
  cadena=string[20];
  asistencia=record
    codSucursal:subrango;
    dni:integer;
    cod:integer;
    fecha:cadena;
    minutos:integer;
  end;
  cliente=record
    dni:integer;
    cantVeces:integer;
  end;
  lista=^nodo;
	nodo=record
		dato:asistencia;
		sig:lista;
  end;
  arbol= ^nodo2;
	nodo2= record
		dato: cliente;
		hi: arbol;
		hd: arbol;
	end;
  sucursales=array [subrango] of lista;

procedure leerAsistencia (var a:asistencia);
begin
  writeln('ingrese un cod de cliente');
  readln(a.cod);
  if (a.cod<>-1) then begin
    writeln('ingrese la sucursal del cliente de 1 a 5: ');
    readln(a.codSucursal);
    writeln('ingrese el dni del cliente: ');
    readln(a.dni);
    writeln('ingrese la fecha del ingreso: ' );
    readln(a.fecha);
    writeln('ingrese la cantidad de minutos que estuvo el cliente: ');
    readln(a.minutos);
    end;
end;

Procedure minimo ( var v:sucursales; var min:asistencia);
Var
 indiceMin,i:integer;
Begin
  min.dni:=9999;
  indiceMin:= -1;
  for i:= 1 to dimF do 
     if (v[i] <> nil) then 
       if (v[i]^.dato.dni <= min.dni) then begin
           indiceMin:= i;
           min:= v[i]^.dato;
       end; 
  if (indiceMin <> -1) then 
    begin
      v[indiceMin]:= v[indiceMin]^.sig;
    end;
End;

procedure insertarArbol(var a: arbol; d: cliente);
	begin
		if a= nil then begin
			new(a);
			a^.dato:= d;
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else begin
			if a^.dato.dni<d.dni then
				insertarArbol(a^.hd,d)
			else
				insertarArbol(a^.hi,d)
		end;
	end;

procedure mergeAcumulador(v:sucursales; var abb:arbol);
var
  dni:integer;
  CantVeces:integer;
  min:asistencia;
  c:cliente;
begin
  abb:=nil;
  minimo(v,min);
  while(min.dni<>9999)do begin
    dni:=min.dni;
    CantVeces:=0;
    while((min.dni<>9999)and(dni=min.dni))do begin
      CantVeces:=CantVeces+1;
      minimo(v,min);
    end;
    c.dni:=dni;
    c.cantVeces:=cantVeces;
    insertarArbol(abb, c);
  end;
end;

procedure InsertarOrdenado (var L:lista; v:asistencia);
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

Procedure enOrden ( a: arbol ); 
begin
   if ( a<> nil ) then begin
    enOrden (a^.HI);
    writeln ('---',a^.dato.dni,'---',a^.dato.cantVeces);
    enOrden (a^.HD);
   end;
end;

procedure cargarVecListas (var v:sucursales);
var
  a:asistencia;
begin
  leerAsistencia(a);
  while (a.cod<>-1) do begin
    InsertarOrdenado(v[a.codSucursal], a);
    leerAsistencia(a);
  end;
end;

procedure queLetra (x:char; n:integer);
begin
	if x='a' or  then
		n:=1;
	


procedure contarEnVec (var v:vector; Vi:vectorOrigi);
var
	i:integer;
	n:integer;
begin
	n:=0;
	for i:=1 to 100 do begin
		queLetra(Vi[i],n);
		if n>0 and n<27 then
			insertar(v,n);
	end;
end;

var 
  abb:arbol;
  arreglo:sucursales;
begin
  cargarVecListas(arreglo);
  mergeAcumulador(arreglo,abb); 
  enOrden(abb);
end.
