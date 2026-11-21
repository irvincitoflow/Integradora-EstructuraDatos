package mx.edu.utez.integradoraestructuradatos.estructurasDatos;


import mx.edu.utez.integradoraestructuradatos.estructurasDatos.nodos.NodoServicio;
import mx.edu.utez.integradoraestructuradatos.estructurasDatos.tda.Servicio;

public class PilaServicio {
    public NodoServicio cima;

    public PilaServicio() {
        this.cima = null;
    }

    public boolean estaVacia() {
        if (this.cima == null) {
            return true;
        } else {
            return false;
        }
    }

    public void apilar(Servicio nuevoServicio) {
        NodoServicio nuevoNodo = new NodoServicio(nuevoServicio);
        nuevoNodo.siguiente = this.cima;
        this.cima = nuevoNodo;
    }

    public Servicio desapilar() {
        if (this.cima == null) {
            return null;
        }
        Servicio eliminado = this.cima.dato;
        this.cima = this.cima.siguiente;
        return eliminado;
    }

    public Servicio verCima() {
        if (this.cima == null) {
            return null;
        }
        return this.cima.dato;
    }

    public int contarPorTarjeta(String numeroTarjeta) {
        int contador = 0;
        NodoServicio actual = this.cima;
        while (actual != null) {
            if (actual.dato.numeroTarjeta.equals(numeroTarjeta)) {
                contador = contador + 1;
            }
            actual = actual.siguiente;
        }
        return contador;
    }

    public PilaServicio filtrarPorTarjeta(String numeroTarjeta) {
        PilaServicio auxiliar = new PilaServicio();
        NodoServicio actual = this.cima;
        while (actual != null) {
            if (actual.dato.numeroTarjeta.equals(numeroTarjeta)) {
                auxiliar.apilar(actual.dato);
            }
            actual = actual.siguiente;
        }

        PilaServicio resultado = new PilaServicio();
        NodoServicio actualAux = auxiliar.cima;
        while (actualAux != null) {
            resultado.apilar(actualAux.dato);
            actualAux = actualAux.siguiente;
        }

        return resultado;
    }

    public double calcularTotalIngresos() {
        double total = 0;
        NodoServicio actual = this.cima;
        while (actual != null) {
            total = total + actual.dato.precio;
            actual = actual.siguiente;
        }
        return total;
    }

    public void mostrar() {
        if (this.cima == null) {
            System.out.println("Historial vacio");
            return;
        }
        NodoServicio actual = this.cima;
        while (actual != null) {
            System.out.println("Tarjeta: " + actual.dato.numeroTarjeta + " | Cliente: " + actual.dato.nombreCliente + " | Placas: " + actual.dato.matriculas + " | Paquete: " + actual.dato.paquete + " | Precio: " + actual.dato.precio + " | Fecha: " + actual.dato.fecha);
            actual = actual.siguiente;
        }
    }
}