/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clase3.poo;

/**
 *
 * @author Victoria
 */
public class UrnaElectoral extends Urna{
    private int cantListas;      //Dimf
    private int []votosPorLista; //Vector de contadores

    public UrnaElectoral(int U, int L){
        super(U);
        cantListas = L;
        votosPorLista = new int[cantListas];
        for(int i=0;i<cantListas;i++)
            votosPorLista[i]=0;
        
    }
    
    
    public int getCantListas() {
        return cantListas;
    }
    
    public boolean validarNumeroDeLista(int N){
       return ((N>=0)&&(N<cantListas));
    }

    public void votarPorLista(int I){
       votosPorLista[I]++;
    }
    
    public int devolverVotosPorLista(int I){
       return votosPorLista[I];
    }

     public  int calcularGanador(){
        int max=-1; int lmax=0;
        for(int i=0;i<cantListas;i++){
           if (votosPorLista[i] > max){
              max= votosPorLista[i];
              lmax= i;
           }
        }
        return lmax;
     }
     
     public int calcularTotalVotos(){
        int suma= this.getVotosBlanco();
        //Recorro el vector sumando los votos de cada lista
        // a suma
        for (int i=0;i<cantListas;i++){
           suma= suma + votosPorLista[i];
        }
        return suma;
     }
    
}
