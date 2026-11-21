package mx.edu.utez.integradoraestructuradatos.estructurasDatos.nodos;

import mx.edu.utez.integradoraestructuradatos.estructurasDatos.tda.Paquete;

public class NodoPaquete {
    public Paquete dato;
    public NodoPaquete siguiente;
    public NodoPaquete anterior;

    public NodoPaquete(Paquete dato) {
        this.dato = dato;
        this.siguiente = null;
        this.anterior = null;
    }
}