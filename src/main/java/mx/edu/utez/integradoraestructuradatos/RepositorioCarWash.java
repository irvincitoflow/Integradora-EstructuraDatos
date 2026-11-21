package mx.edu.utez.integradoraestructuradatos;

import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.Map;
import java.util.Queue;

public class RepositorioCarWash {
    // DICCIONARIO: clave = número de tarjeta, valor = datos del cliente y su LISTA de compras
    private static final Map<String, ClienteTarjeta> tarjetas = new HashMap<>();

    // COLA (FIFO): turnos de autos pendientes por lavar
    private static final Queue<String> colaLavado = new ArrayDeque<>();

    static {
        ClienteTarjeta c1 = new ClienteTarjeta("1009876542", "Francisco Emanuel Fuentes Perez", 3);
        c1.agregarServicio("Lavado Express - $50");
        c1.agregarServicio("Lavado Detallado - $160");
        c1.agregarServicio("Lavado Intenso - $250");

        ClienteTarjeta c2 = new ClienteTarjeta("923847922", "Andrea López Martínez", 4);
        c2.agregarServicio("Lavado Plus - $80");
        c2.agregarServicio("Full Pack - $250");

        tarjetas.put(c1.getCodigoTarjeta(), c1);
        tarjetas.put(c2.getCodigoTarjeta(), c2);
    }

    public static ClienteTarjeta buscarTarjeta(String codigo) {
        if (codigo == null) return null;
        return tarjetas.get(codigo.trim());
    }

    // REGISTRA LA VENTA EN EL DICCIONARIO, LISTA Y COLA
    public static void registrarVenta(String codigoTarjeta, String nombreCliente, String paquete, String precio) {
        String codigo = codigoTarjeta.trim();
        ClienteTarjeta cliente = tarjetas.get(codigo);

        if (cliente == null) {
            // Si la tarjeta no existía, se registra nueva en el HashMap
            String nombreFinal = (nombreCliente == null || nombreCliente.trim().isEmpty())
                    ? "Cliente General"
                    : nombreCliente.trim();
            cliente = new ClienteTarjeta(codigo, nombreFinal, 0);
            tarjetas.put(codigo, cliente);
        } else if (nombreCliente != null && !nombreCliente.trim().isEmpty()) {
            cliente.setNombreCliente(nombreCliente.trim());
        }

        // 1. Agrega el servicio a la LISTA de compras de la tarjeta y suma visita
        cliente.agregarServicio(paquete + " - $" + precio);
        cliente.registrarVisita();

        // 2. Encola el servicio en la COLA de lavado (FIFO)
        colaLavado.offer("Tarjeta " + codigo + " (" + cliente.getNombreCliente() + ") - " + paquete);
    }

    public static Queue<String> getColaLavado() {
        return colaLavado;
    }

    public static String atenderSiguienteAuto() {
        return colaLavado.poll();
    }
}