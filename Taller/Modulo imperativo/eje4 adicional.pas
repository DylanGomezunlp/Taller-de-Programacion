{4. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
información de los autos en venta.
Implementar un programa que:
a.Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en
venta. Cada nodo del árbol debe contener patente, año de fabricación (2010..2018), la
marca y el modelo.
b.Contenga un módulo que recibe el árbol generado en a) y una marca y devuelva la
cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado.
c.Contenga un módulo que reciba el árbol generado en a) y retorne una estructura con la
información de los autos agrupados por año de fabricación.
d.Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el
año de fabricación del auto con dicha patente. Mostrar el resultado.}
//Autor:Fabio Espejo

program Pr1EjAd4;
type
    rAnioFab = 2010..2018;
    tAuto = record
        patente:string;
        anioFab:rAnioFab;
        marca:string;
        modelo:string;
    end;
    arbol = ^nodo;
    nodo = record 
        dato:tAuto;
        HI:arbol;
        HD:arbol;
    end;
    vAutos = array[rAnioFab] of arbol;

procedure LeerAuto (var auto:tAuto);
begin
    with auto do 
    begin
        writeln('Ingrese la patente: ');
        readln(patente);
        if (patente <> 'FIN') then
        begin
            writeln('Ingrese el año de fabricación: ');
            readln(anioFab);
            writeln('Ingrese la marca: ');
            readln(marca);
            writeln('Ingrese el modelo: ');
            readln(modelo);
        end;
    end;
end;

procedure CrearArbol (var A:arbol;auto:tAuto);
var 
    nuevo:arbol;
begin
    if(A = nil) then
    begin 
        new(nuevo);
        nuevo^.dato := auto;
        A^.HI:=nil;
        A^.HD:=nil;
    end
    else 
    begin
        if (auto.patente < A^.dato.patente) then
            CrearArbol(A^.HI,auto)
        else
            CrearArbol(A^.HD,auto);
    end;
end;
{a.------------------}
procedure CargarArbol(var A:arbol);
var 
    auto:tAuto;
begin
    LeerAuto(auto);
    while(auto.patente <> 'FIN') do
    begin
        CrearArbol(A,auto);
        LeerAuto(auto);
    end;
end;
{b.------------------------}
procedure CantMarca (A:arbol;marca:string;var cant:integer);
begin
    if(A <> nil) then
    begin
        if(A^.dato.marca = marca) then
            cant:=cant + 1;
        CantMarca(A^.HI,marca,cant);
        CantMarca(A^.HD,marca,cant);
    end;
end;
function CantMarca (A:arbol;marca:string):integer;
begin
    if(A <> nil) then
    begin
        if(A^.dato.marca = marca) then
        begin
             CantMarca := 1 + CantMarca(A^.HI, marca) + CantMarca(A^.HD, marca);
        end;
        else
             CantMarca := CantMarca(A^.HI, marca) + CantMarca(A^.HD, marca);
    end;
    else
    	CantMarca := 0;
end;
procedure InicializarVectorAutos(var autos:vAutos);
var 
    i:rAnioFab;
begin
    for i in (rAnioFab) do
    begin
        autos[i]:=nil;
    end;
end;
{c.---------------------}
procedure GenerarVectorAutos (A:arbol;var autos:vAutos);
begin
    if(A <> nil) then
    begin
        CrearArbol(autos[A^.dato.anioFab],A^.dato);
        GenerarVectorAutos(A^.HI,autos);
        GenerarVectorAutos(A^.HD,autos);
    end;
end;
{d.------------------}
procedure BuscarPorPatente(A:arbol;patente:string);
begin
    if(A<>nil)then
    begin
        if(A^.dato.patente = patente) then
            writeln('El año de fabricación del auto con patente: ',patente,' es: ',A^.dato.anioFab)
        else
        begin
            if(A^.dato.patente < patente) then
                BuscarPorPatente(A^.HI,patente)
            else
                BuscarPorPatente(A^.HD,patente);
        end;
    end;
end;

function BuscarPorPatente(A:arbol;patente:string):integer;
begin
    if(A<>nil)then
    begin
        if(A^.dato.patente = patente) then
            BuscarPorPatente := A^.dato.anioFab;
        else
        begin
            if(A^.dato.patente < patente) then
                BusarPorPatente := BuscarPorPatente(A^.HI,patente)
            else
                BusarPorPatente := BuscarPorPatente(A^.HD,patente);
        end;
    end;
    else 
    	BuscarPorPatente := -1;
end;


var 
    A:arbol;
    autos:vAutos;
    marca,patente:string;
    cant:integer;
begin
    A:=nil;
    cant:=0;
    CargarArbol(A);
    writeln('Ingrese la marca a consultar: ');
    readln(marca);
    CantMarca(A,marca,cant);
    writeln('La cantidad de autos de la marca ',marca,' es ',cant);
    InicializarVectorAutos(autos);
    GenerarVectorAutos(A,autos);
    writeln('Ingrese la patente a consultar: ');
    readln(patente);
    BuscarPorPatente(A,patente);
end.


function promedio (v:vector; diml:integer; i:integer):real;
begin
	if (i <= dimL) then
  	promedio := v[i].dni / dimL + promedio(v, dimL, i+1)
  else
  	promedio := 0;
end;

promedio(1) --> v[1].dni / dimL +  v[2].dni / dimL +  v[3].dni / dimL +  v[4].dni / dimL ... +  v[dimL].dni / dimL + 0

								 ( v[1].dni + v[2].dni + v[3].dni + ... + v[dimL].dni ) / dimL = Promedio de los dni del vector
