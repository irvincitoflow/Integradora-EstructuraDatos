package mx.edu.utez.integradoraestructuradatos.repository;


import mx.edu.utez.integradoraestructuradatos.estructurasDatos.PilaServicio;
import mx.edu.utez.integradoraestructuradatos.estructurasDatos.tda.Servicio;

import java.time.LocalDate;

public class RepositorioServicios {

    private static PilaServicio historial = new PilaServicio();

    static {
        Servicio s1 = new Servicio("00000001", "Carlos Perez", "irvin", "PXA-123-A", "Lavado Basico", 120.0, LocalDate.of(2026, 11, 20));
        Servicio s2 = new Servicio("00000010", "Ana Gomez", "manu", "RTM-894-B", "Lavado Completo", 200.0, LocalDate.of(2026, 11, 21));
        Servicio s3 = new Servicio("00000001", "Carlos Perez", "eder", "PXA-123-A", "Encerado Premium", 350.0, LocalDate.of(2026, 11, 21));

        historial.apilar(s1);
        historial.apilar(s2);
        historial.apilar(s3);
    }

    public static void registrar(String numeroTarjeta, String nombreCliente, String nombreEmpleado, String matriculas, String paquete, double precio, LocalDate fecha) {
        Servicio nuevo = new Servicio(numeroTarjeta, nombreCliente, nombreEmpleado, matriculas, paquete, precio, fecha);
        historial.apilar(nuevo);
    }

    public static Servicio deshacerUltimo() {
        return historial.desapilar();
    }

    public static PilaServicio obtenerTodos() {
        return historial;
    }

    public static PilaServicio obtenerPorTarjeta(String numeroTarjeta) {
        return historial.filtrarPorTarjeta(numeroTarjeta);
    }

    public static int contarServiciosTarjeta(String numeroTarjeta) {
        return historial.contarPorTarjeta(numeroTarjeta);
    }

    public static double obtenerTotalIngresos() {
        return historial.calcularTotalIngresos();
    }
}