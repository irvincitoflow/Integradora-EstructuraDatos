package mx.edu.utez.integradoraestructuradatos.estructurasDatos.nodos;


import mx.edu.utez.integradoraestructuradatos.estructurasDatos.tda.Servicio;

public class NodoServicio {
    public Servicio dato;
    public NodoServicio siguiente;

    public NodoServicio(Servicio dato) {
        this.dato = dato;
        this.siguiente = null;
    }
}