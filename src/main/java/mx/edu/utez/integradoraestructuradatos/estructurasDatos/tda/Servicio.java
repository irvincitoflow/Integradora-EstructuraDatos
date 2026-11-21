package mx.edu.utez.integradoraestructuradatos.estructurasDatos.tda;


import java.time.LocalDate;

public class Servicio {
    public String numeroTarjeta;
    public String nombreCliente;
    public String nombreEmpleado;
    public String matriculas;
    public String paquete;
    public double precio;
    public LocalDate fecha;

    public Servicio(String numeroTarjeta, String nombreCliente, String nombreEmpleado, String matriculas, String paquete, double precio, LocalDate fecha) {
        this.numeroTarjeta = numeroTarjeta;
        this.nombreCliente = nombreCliente;
        this.nombreEmpleado = nombreEmpleado;
        this.matriculas = matriculas;
        this.paquete = paquete;
        this.precio = precio;
        this.fecha = fecha;
    }
}