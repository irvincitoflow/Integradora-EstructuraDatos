package mx.edu.utez.integradoraestructuradatos.estructurasDatos;
import mx.edu.utez.integradoraestructuradatos.estructurasDatos.nodos.*;
import mx.edu.utez.integradoraestructuradatos.estructurasDatos.tda.Usuario;

public class ListaUsuario {
    public NodoUsuario cabeza;

    public ListaUsuario() {
        this.cabeza = null;
    }

    public boolean estaVacia() {
        if (this.cabeza == null) {
            return true;
        } else {
            return false;
        }
    }

    public void insertar(Usuario nuevoUsuario) {
        NodoUsuario nuevoNodo = new NodoUsuario(nuevoUsuario);
        if (this.cabeza == null) {
            this.cabeza = nuevoNodo;
        } else {
            NodoUsuario actual = this.cabeza;
            while (actual.siguiente != null) {
                actual = actual.siguiente;
            }
            actual.siguiente = nuevoNodo;
        }
    }

    public Usuario buscar(String nombreUsuario) {
        NodoUsuario actual = this.cabeza;
        while (actual != null) {
            if (actual.dato.usuario.equals(nombreUsuario)) {
                return actual.dato;
            }
            actual = actual.siguiente;
        }
        return null;
    }

    public boolean validarLogin(String nombreUsuario, String contrasena) {
        NodoUsuario actual = this.cabeza;
        while (actual != null) {
            if (actual.dato.usuario.equals(nombreUsuario) && actual.dato.contrasena.equals(contrasena)) {
                return true;
            }
            actual = actual.siguiente;
        }
        return false;
    }

    public boolean actualizarContrasena(String nombreUsuario, String nuevaContrasena) {
        NodoUsuario actual = this.cabeza;
        while (actual != null) {
            if (actual.dato.usuario.equals(nombreUsuario)) {
                actual.dato.contrasena = nuevaContrasena;
                return true;
            }
            actual = actual.siguiente;
        }
        return false;
    }

    public boolean eliminar(String nombreUsuario) {
        if (this.cabeza == null) {
            return false;
        }

        if (this.cabeza.dato.usuario.equals(nombreUsuario)) {
            this.cabeza = this.cabeza.siguiente;
            return true;
        }

        NodoUsuario anterior = this.cabeza;
        NodoUsuario actual = this.cabeza.siguiente;

        while (actual != null) {
            if (actual.dato.usuario.equals(nombreUsuario)) {
                anterior.siguiente = actual.siguiente;
                return true;
            }
            anterior = actual;
            actual = actual.siguiente;
        }

        return false;
    }

    public void mostrar() {
        if (this.cabeza == null) {
            System.out.println("Lista vacia");
            return;
        }
        NodoUsuario actual = this.cabeza;
        while (actual != null) {
            System.out.println("Usuario: " + actual.dato.usuario + " | Contrasena: " + actual.dato.contrasena);
            actual = actual.siguiente;
        }
    }
}