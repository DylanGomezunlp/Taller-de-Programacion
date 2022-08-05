/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clase3.poo;

import PaqueteLectura.Lector;

/**
 *
 * @author Victoria
 */
public class Clase3Poo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        UrnaElectoral urnaE = new UrnaElectoral(203,5);
        UrnaReferendum urnaR = new UrnaReferendum(203);
        
        System.out.println("Ingrese el DNI");
        int DNI = Lector.leerInt();
        while (DNI != 0){
            //Votar en urna electoral
            //Para la urna electoral, la persona ingresa un nro. 
            //“N”: si “N” corresponde a  una lista válida 
            //se debe votar por la lista “N” 
            //y en caso contrario se debe votar en blanco
            System.out.println("Ingrese la lista a votar");
            int N = Lector.leerInt();
            if (urnaE.validarNumeroDeLista(N)){
               urnaE.votarPorLista(N);
            }
            else
               urnaE.votarEnBlanco();
            
            //Votar en la urna referendum
            //la persona ingresa un número  “M”: 
            //si “M”  es positivo se debe votar a favor, 
            //si es negativo se debe votar en contra, 
            //y si es 0 debe votar en blanco. 
            System.out.println("Ingrese un nro (+) para votar a favor (-) para votar en contra (0) para votar en blanco");
            int M = Lector.leerInt();
            if (M>0)
                urnaR.votarAFavor();
            else if (M<0)
                urnaR.votarEnContra();
            else urnaR.votarEnBlanco();
            
            System.out.println("Ingrese el DNI");
            DNI = Lector.leerInt();       
        }
        
        //URNA ELECTORAL
        System.out.println("URNA ELECTORAL");
        int ganador = urnaE.calcularGanador();
        System.out.println("Ganador: "+ganador);
        //Calculo del porcentaje que obtuvo el ganador
        int votosGanador = urnaE.devolverVotosPorLista(ganador);
        int totalVotos= urnaE.calcularTotalVotos();
        double porcentaje = (double)(votosGanador *100)/totalVotos;
        System.out.println("Procentaje Ganador: "+porcentaje);
        
        //URNA REFERENDUM
        System.out.println("URNA REFERENDUM");
        ganador = urnaR.calcularGanador();
        System.out.println("Ganador: "+ganador); //-1 empate, 
                                                //0 En Contra, 
                                                //1 A Favor. 
         //Calculo del porcentaje que obtuvo el ganador
         if (ganador != -1){
            if (ganador == 0) // Gano la opcion en contra
               votosGanador = urnaR.getVotosEnContra();
            else              // Gano la opcion a favor
               votosGanador = urnaR.getVotosAFavor();
            totalVotos= urnaR.calcularTotalVotos();
            porcentaje = (double)(votosGanador *100)/totalVotos;
            System.out.println("Procentaje Ganador: "+porcentaje);
         }
    }
    
}
