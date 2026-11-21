package mx.edu.utez.integradoraestructuradatos.estructurasDatos.tda;

public class Paquete {
    public String nombre;
    public String descripcion;
    public double precio;
    public int duracionMinutos;

    public Paquete(String nombre, String descripcion, double precio, int duracionMinutos) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.duracionMinutos = duracionMinutos;
    }
}