package mx.edu.utez.integradoraestructuradatos.estructurasDatos;

import mx.edu.utez.integradoraestructuradatos.estructurasDatos.nodos.NodoPaquete;
import mx.edu.utez.integradoraestructuradatos.estructurasDatos.tda.Paquete;

public class ListaDoblePaquetes {
    public NodoPaquete cabeza;
    public NodoPaquete cola;

    public ListaDoblePaquetes() {
        this.cabeza = null;
        this.cola = null;
    }

    public boolean estaVacia() {
        if (this.cabeza == null) {
            return true;
        } else {
            return false;
        }
    }

    public void insertar(Paquete nuevoPaquete) {
        NodoPaquete nuevoNodo = new NodoPaquete(nuevoPaquete);
        if (this.cabeza == null) {
            this.cabeza = nuevoNodo;
            this.cola = nuevoNodo;
        } else {
            this.cola.siguiente = nuevoNodo;
            nuevoNodo.anterior = this.cola;
            this.cola = nuevoNodo;
        }
    }

    public Paquete buscar(String nombre) {
        NodoPaquete actual = this.cabeza;
        while (actual != null) {
            if (actual.dato.nombre.equals(nombre)) {
                return actual.dato;
            }
            actual = actual.siguiente;
        }
        return null;
    }

    public boolean actualizar(String nombreOriginal, String nuevoNombre, String nuevaDescripcion, double nuevoPrecio, int nuevaDuracion) {
        NodoPaquete actual = this.cabeza;
        while (actual != null) {
            if (actual.dato.nombre.equals(nombreOriginal)) {
                actual.dato.nombre = nuevoNombre;
                actual.dato.descripcion = nuevaDescripcion;
                actual.dato.precio = nuevoPrecio;
                actual.dato.duracionMinutos = nuevaDuracion;
                return true;
            }
            actual = actual.siguiente;
        }
        return false;
    }

    public boolean eliminar(String nombre) {
        if (this.cabeza == null) {
            return false;
        }

        NodoPaquete actual = this.cabeza;
        while (actual != null) {
            if (actual.dato.nombre.equals(nombre)) {
                if (actual == this.cabeza && actual == this.cola) {
                    this.cabeza = null;
                    this.cola = null;
                } else if (actual == this.cabeza) {
                    this.cabeza = this.cabeza.siguiente;
                    this.cabeza.anterior = null;
                } else if (actual == this.cola) {
                    this.cola = this.cola.anterior;
                    this.cola.siguiente = null;
                } else {
                    actual.anterior.siguiente = actual.siguiente;
                    actual.siguiente.anterior = actual.anterior;
                }
                return true;
            }
            actual = actual.siguiente;
        }

        return false;
    }

    public void mostrarAdelante() {
        if (this.cabeza == null) {
            System.out.println("Lista de paquetes vacia");
            return;
        }
        NodoPaquete actual = this.cabeza;
        while (actual != null) {
            System.out.println("Paquete: " + actual.dato.nombre + " | Precio: " + actual.dato.precio + " | Duracion: " + actual.dato.duracionMinutos + " min");
            actual = actual.siguiente;
        }
    }

    public void mostrarAtras() {
        if (this.cola == null) {
            System.out.println("Lista de paquetes vacia");
            return;
        }
        NodoPaquete actual = this.cola;
        while (actual != null) {
            System.out.println("Paquete: " + actual.dato.nombre + " | Precio: " + actual.dato.precio + " | Duracion: " + actual.dato.duracionMinutos + " min");
            actual = actual.anterior;
        }
    }
}