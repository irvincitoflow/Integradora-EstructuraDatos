package mx.edu.utez.integradoraestructuradatos.repository;


import mx.edu.utez.integradoraestructuradatos.estructurasDatos.ListaDoblePaquetes;
import mx.edu.utez.integradoraestructuradatos.estructurasDatos.tda.Paquete;

public class RepositorioPaquetes {

    private static ListaDoblePaquetes paquetes = new ListaDoblePaquetes();

    static {

        Paquete p1 = new Paquete("Lavado Basico", "Lavado exterior, aspirado interior y brillo en llantas", 120.0, 20);
        Paquete p2 = new Paquete("Lavado Completo", "Lavado exterior, aspirado profundo, limpieza de tablero y aromatizante", 200.0, 35);
        Paquete p3 = new Paquete("Encerado Premium", "Lavado completo mas aplicacion de cera protectora y limpieza de motor", 350.0, 60);
        Paquete p4 = new Paquete("Lavado de Vestiduras", "Lavado profundo de asientos, alfombras y cielo con desinfeccion", 500.0, 90);

        paquetes.insertar(p1);
        paquetes.insertar(p2);
        paquetes.insertar(p3);
        paquetes.insertar(p4);
    }

    public static boolean existePaquete(String nombre) {
        Paquete encontrado = paquetes.buscar(nombre);
        if (encontrado != null) {
            return true;
        } else {
            return false;
        }
    }

    public static void registrar(String nombre, String descripcion, double precio, int duracionMinutos) {
        Paquete nuevo = new Paquete(nombre, descripcion, precio, duracionMinutos);
        paquetes.insertar(nuevo);
    }

    public static Paquete buscar(String nombre) {
        return paquetes.buscar(nombre);
    }

    public static boolean actualizar(String nombreOriginal, String nuevoNombre, String nuevaDescripcion, double nuevoPrecio, int nuevaDuracion) {
        return paquetes.actualizar(nombreOriginal, nuevoNombre, nuevaDescripcion, nuevoPrecio, nuevaDuracion);
    }

    public static boolean eliminar(String nombre) {
        return paquetes.eliminar(nombre);
    }

    public static ListaDoblePaquetes obtenerTodos() {
        return paquetes;
    }
}