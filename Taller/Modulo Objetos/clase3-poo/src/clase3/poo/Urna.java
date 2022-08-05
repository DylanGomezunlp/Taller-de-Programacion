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
public abstract class Urna {
    private int numero;
    private int votosBlanco;

    public Urna(int U){
      //Setear el nro. de urna a U
      numero=U;
      //votosBlanco a 0
      votosBlanco=0;     
    }
    
    public int getNumero() {
        return numero;
    }

    public int getVotosBlanco() {
        return votosBlanco;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }
    
    public void votarEnBlanco(){
        votosBlanco++;
    } 
    
    
    public abstract int calcularGanador(); 
    public abstract int calcularTotalVotos(); 
    
}
