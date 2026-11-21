package mx.edu.utez.integradoraestructuradatos.estructurasDatos.nodos;

import mx.edu.utez.integradoraestructuradatos.estructurasDatos.tda.Usuario;

public class NodoUsuario {
    public Usuario dato;
    public NodoUsuario siguiente;

    public NodoUsuario(Usuario dato) {
        this.dato = dato;
        this.siguiente = null;
    }
}