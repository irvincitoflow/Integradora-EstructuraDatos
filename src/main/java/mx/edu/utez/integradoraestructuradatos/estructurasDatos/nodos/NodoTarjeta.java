package mx.edu.utez.integradoraestructuradatos.estructurasDatos.nodos;


import mx.edu.utez.integradoraestructuradatos.estructurasDatos.tda.Tarjeta;

public class NodoTarjeta {
    public Tarjeta dato;
    public NodoTarjeta siguiente;

    public NodoTarjeta(Tarjeta dato) {
        this.dato = dato;
        this.siguiente = null;
    }
}