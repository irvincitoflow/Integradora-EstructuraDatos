package mx.edu.utez.integradoraestructuradatos.estructurasDatos;


import mx.edu.utez.integradoraestructuradatos.estructurasDatos.nodos.NodoTarjeta;
import mx.edu.utez.integradoraestructuradatos.estructurasDatos.tda.Tarjeta;

public class ListaTarjeta {
    public NodoTarjeta cabeza;

    public ListaTarjeta() {
        this.cabeza = null;
    }

    public boolean estaVacia() {
        if (this.cabeza == null) {
            return true;
        } else {
            return false;
        }
    }

    public void insertar(Tarjeta nuevaTarjeta) {
        NodoTarjeta nuevoNodo = new NodoTarjeta(nuevaTarjeta);
        if (this.cabeza == null) {
            this.cabeza = nuevoNodo;
        } else {
            NodoTarjeta actual = this.cabeza;
            while (actual.siguiente != null) {
                actual = actual.siguiente;
            }
            actual.siguiente = nuevoNodo;
        }
    }

    public Tarjeta buscar(String numeroBinario) {
        NodoTarjeta actual = this.cabeza;
        while (actual != null) {
            if (actual.dato.numeroBinario.equals(numeroBinario)) {
                return actual.dato;
            }
            actual = actual.siguiente;
        }
        return null;
    }

    public boolean eliminar(String numeroBinario) {
        if (this.cabeza == null) {
            return false;
        }

        if (this.cabeza.dato.numeroBinario.equals(numeroBinario)) {
            this.cabeza = this.cabeza.siguiente;
            return true;
        }

        NodoTarjeta anterior = this.cabeza;
        NodoTarjeta actual = this.cabeza.siguiente;

        while (actual != null) {
            if (actual.dato.numeroBinario.equals(numeroBinario)) {
                anterior.siguiente = actual.siguiente;
                return true;
            }
            anterior = actual;
            actual = actual.siguiente;
        }

        return false;
    }

    public int contar() {
        int contador = 0;
        NodoTarjeta actual = this.cabeza;
        while (actual != null) {
            contador = contador + 1;
            actual = actual.siguiente;
        }
        return contador;
    }

    public void mostrar() {
        if (this.cabeza == null) {
            System.out.println("Lista de tarjetas vacia");
            return;
        }
        NodoTarjeta actual = this.cabeza;
        while (actual != null) {
            System.out.println("Tarjeta: " + actual.dato.numeroBinario);
            actual = actual.siguiente;
        }
    }
}