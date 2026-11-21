package mx.edu.utez.integradoraestructuradatos;

import java.util.ArrayList;
import java.util.List;

public class ClienteTarjeta {
    private String codigoTarjeta;
    private String nombreCliente;
    private int visitas;
    private List<String> historialServicios;

    public ClienteTarjeta(String codigoTarjeta, String nombreCliente, int visitas) {
        this.codigoTarjeta = codigoTarjeta;
        this.nombreCliente = nombreCliente;
        this.visitas = visitas;
        this.historialServicios = new ArrayList<>();
    }

    public void agregarServicio(String servicioConCosto) {
        this.historialServicios.add(servicioConCosto);
    }

    public void registrarVisita() {
        this.visitas++;
    }

    public String getCodigoTarjeta() { return codigoTarjeta; }
    public String getNombreCliente() { return nombreCliente; }
    public void setNombreCliente(String nombreCliente) { this.nombreCliente = nombreCliente; }
    public int getVisitas() { return visitas; }
    public List<String> getHistorialServicios() { return historialServicios; }
}