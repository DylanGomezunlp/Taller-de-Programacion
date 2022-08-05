//Ejercicio1.class
/* 1-  Escriba  un  programa  que  imprima  en  consola  el  factorial  de  un  número  N 
(ingresado por teclado, N > 0).  Ejemplo: para N=5 debería imprimir 5! = 120 */

//Autor/a: 
import PaqueteLectura.Lector;

public Class Ejercicio1 {
 
  public static void main(String[] args)
  {
    System.out.println("Ingrese un numero");	// writeln()
    int num = Lector.leerInt();
    int result = 1; 
    while (num != 0){
       result = result * (num--); 
    }
    System.out.println(result);//Programa principal
  }
  
}
//Autor/a: Luca Maffeo
import PaqueteLectura.Lector;
public class ejercicio1p2 {
    public static void main(String[] args) {
        int N=Lector.leerInt(),x;
        while(N>0){
        x=1;
        System.out.println("EL NUMERO ES: "+N);
        for (int i = 1; i <= N; i++) 
            x=x*i;
        System.out.println("Y EL FACTORIAL ES: "+x);
        N=Lector.leerInt();
        } 
    System.out.println("EL PROGRAMA FINALIZO");
    }
}

/* 2- Escriba un programa que imprima en consola el factorial de todos los números 
entre 1 y 9. ¿Qué modificación debe hacer para imprimir el factorial de los 
números impares solamente? */
//Autor/a: Federico Pellegrino

//del 1 al 9
        System.out.println("factorial de numeros entre 1 y 9");
    int i, num, res;
    for (i=1; i<10; i++) {
        num = i;
        res = 1;
        while (num != 0) {
          res = res * num;
            num--;
        }
        System.out.println(i+"! = "+res);
    }
    System.out.println();
    
// impares
    System.out.println("factorial de numeros impares entre 1 y 9");
    for (i=1; i<10; i+=2) {
            num = i;
            res = 1;
            while (num != 0) {
                res = res * num;
                num--;
            }
        System.out.println(i+"! = "+res);
        }
    }


/*3-  Escriba  un  programa  que  lea  las  alturas  de  los  15  jugadores  de  un  equipo  de 
básquet y las almacene en un vector.  Luego informe:  - la altura promedio - la cantidad de jugadores 
con altura por encima del promedio */

//Autor/a: Luca Maffeo

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej03Jugadores {

  
    public static void main(String[] args) {
        int DIMF=15;
        //Paso 2: Declarar la variable vector de double 
        double[] vector;
        //Paso 3: Crear el vector para 15 double 
        vector = new double[DIMF];
        //Paso 4: Declarar indice 
               
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        double total=0;
        for (int i = 0; i < DIMF; i++) {
           double altura=Lector.leerDouble();
           total=total+altura;
           vector[i]=altura;
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        double promedio=(total/DIMF);
        System.out.println("EL PROMEDIO ES: "+promedio);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        int cant=0;
        for (int j = 0; j < DIMF; j++){
            if(vector[j]>promedio)
                cant++;
        }
        System.out.println("LA CANTIDAD DE ALTURAS QUE ESTA POR ENCIMA DEL PROMEDIO SON: "+cant);
        //Paso 9: Informar la cantidad.
        for (int k = 0; k < DIMF; k++) 
            System.out.println("ALTURA POSICION "+k+": "+vector[k]);
        
    }
    
}

/* 4 -  Escriba  un  programa  que  defina  una  matriz  de  enteros  de  tamaño  10x10. 
Inicialice la matriz con números aleatorios entre 0 y 200.   Luego realice las siguientes operaciones:  
- Mostrar el contenido de la matriz en consola.  
- Calcular  e  informar  la  suma  de  todos  los  elementos  almacenados  entre  las 
filas 2 y 9 y las columnas 0 y 3 
- Generar un vector de 10 posiciones donde cada posición i contiene la suma 
de los elementos de la columna i de la matriz. 
- Lea  un  valor  entero  e  indique  si  se  encuentra o  no  en  la  matriz.  En  caso  de 
encontrarse indique su ubicación (fila y columna) en caso contrario 
imprima “No se encontró el elemento”.  */

//Autor/a: Fede Pellegrino

package tema1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Objetos_E4 {

    public static void main(String[] args) {
     
    //1. definir la matriz de enteros de tamaño 10x10 e iniciarla con números aleatorios entre 0 y 200 
    int [][] matriz = new int[10][10];
    int i, j;
    
    for (i=0; i<=9; i++)
        for (j=0; j<=9; j++)
            matriz[i][j] = GeneradorAleatorio.generarInt(200);
    
    //2. mostrar el contenido de la matriz en consola
    System.out.println("--------------- MATRIZ ---------------");
    for (i=0; i<=9; i++) {
        for (j=0; j<=9; j++) {
            System.out.print(matriz[i][j]+" ");
        }   
        System.out.println();
    }
    System.out.println("_____________________________________");
    
    //3. calcular e informar la suma de todos los elementos almacenados entre las filas 2 y 9 y las columnas 0 y 3
    int acu = 0;
    
    for (i=2; i<=9; i++)
        for (j=0; j<=3; j++)
            acu = (acu + matriz[i][j]);
    System.out.println("la suma de los objetos almacenados entre la fila 2 y 9 y las columnas 0 y 3 es: "+acu);
    System.out.println("_____________________________________");
    
    //4. generar un vector de 10 posiciones donde cada posición i contiene la suma de la columna i de la matriz 
    int [] v = new int[10];
    //Inicializar el vector contador
    int columna = 0;
    for (i=0; i<=9; i++){
        v[i] = 0;
        for (j=0; j<=9; j++)
            v[i] = (v[i] + matriz[j][i]);
        System.out.println("la suma de la columna "+i+" es: "+v[i]);
    }
    
    //5. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
    //   y en caso contrario imprima "No se encontró el elemento".
    System.out.println();
    System.out.print("ingrese el numero a buscar en la matriz: ");
    int num = Lector.leerInt();
    boolean encontro = false;
 
    for (i=0; (i<=9) && (!encontro); i++)
        for (j=0; (j<=9) && (!encontro); j++)
            if (num == matriz[i][j]) {
                System.out.println("el numero buscado se encuentra en la fila "+i+" columna "+j);
                encontro = true;
            }
      
    if (!encontro) 
        System.out.println("no se encontro el elemento");

    }
}

/*5. Un edificio de oficinas está conformado por 8 pisos y 4 oficinas por piso. Realice 
un  programa  que  permita  informar  la  cantidad  de  personas  que  concurrieron  a 
cada  oficina  de  cada  piso.  Para  esto,  simule  la llegada  de  personas  al edificio  de  la 
siguiente manera: a cada persona se le pide el nro. de piso y nro. de oficina a la cual 
quiere  concurrir.  La  llegada  de  personas  finaliza  al  indicar  un  nro.  de  piso  9.  Al 
finalizar la llegada de personas, informe lo pedido.   */
//Autor/a: Fede Pellegrino

package tema1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Objetos_E5 {
    
public static void main(String[] args) {

    
    int [][] m = new int[9][5];
    int piso, ofi;
    
    for (piso=1; piso<9; piso++) {
        for (ofi=1; ofi<5; ofi++)
            m[piso][ofi] = 0;
    }
    
    System.out.print("ingrese numero de piso: ");
    piso = Lector.leerInt();
    if (piso != 9) {
        System.out.print("ingrese numero de oficina: ");
        ofi = Lector.leerInt();
        while (piso != 9) {
            m[piso][ofi]++;
            System.out.print("ingrese numero de piso: ");
            piso = Lector.leerInt();
            if (piso != 9) {
                System.out.print("ingrese numero de oficina: ");
                ofi = Lector.leerInt();
            }
        }
    }

    for (piso=0; piso<8; piso++) {
        for (ofi=0; ofi<4; ofi++) {
            if (m[piso][ofi] != 0)
                System.out.println("concurrencia a la oficina "+ofi+" en el piso "+piso+": "+m[piso][ofi]);
        }
    }
    System.out.println("la oficinas que no aparecen en la lista no tuvieron concurrencia");
}
    
}

/*6-  Escriba  un  programa  que  simule  el  ingreso  de  personas  a  un  banco.  Cada 
persona que ingresa indica la operación que desea realizar (0: “cobro de cheque” 1: 
“depósito/ extracción en cuenta” 2: “pago de impuestos o servicios” 3: “cobro de 
jubilación” 4: “cobro de planes”). La recepción de personas  culmina  cuando  un 
empleado ingresa la operación 5 (cierre del banco). Informar la cantidad de 
personas atendidas por cada operación y la operación más solicitada.*/

//Autor/a: 

package tema1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Objetos_E6 {
    
public static void main(String [] args) {
/*    
6- Escriba un programa que simule el ingreso de personas a un banco. Cada 
persona que ingresa indica la operación que desea realizar (0: “cobro de cheque” 1: 
“depósito/ extracción en cuenta” 2: “pago de impuestos o servicios” 3: “cobro de 
jubilación” 4: “cobro de planes”). La recepción de personas culmina cuando un 
empleado ingresa la operación 5 (cierre del banco). Informar la cantidad de 
personas atendidas por cada operación y la operación más solicitada. 
*/  
    
    int [] vecOp = new int[5];
    int i, maxOp, maxCant; 
    
    for (i=0; i<5; i++)
        vecOp[i] = 0;
    
    System.out.println("0- cobro de cheque");
    System.out.println("1- deposito/extraccion");
    System.out.println("2- pagos de impuestos/servicios");
    System.out.println("3- cobro de jubilacion");
    System.out.println("4- cobro de planes");
    System.out.print("ingrese la operacion que desea realizar: ");
    i = Lector.leerInt();
    while (i != 5) {
        vecOp[i]++;
        System.out.print("ingrese la operacion que desea realizar: ");
        i = Lector.leerInt();
    }
    
    maxOp = -1;
    maxCant = -1;
    for (i=0; i<5; i++){
        System.out.println("la operacion "+i+" se realizo "+vecOp[i]+" veces"); 
        if (vecOp[i] > maxCant) {
            maxCant = vecOp[i];
            maxOp = i;
        }
    }
    System.out.println("la operacion mas realizada fue la numero "+maxOp);

    
}
    
}
