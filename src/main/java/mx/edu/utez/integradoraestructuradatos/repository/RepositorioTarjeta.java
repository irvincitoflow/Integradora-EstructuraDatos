package mx.edu.utez.integradoraestructuradatos.repository;


import mx.edu.utez.integradoraestructuradatos.estructurasDatos.ListaTarjeta;
import mx.edu.utez.integradoraestructuradatos.estructurasDatos.tda.Tarjeta;

public class RepositorioTarjeta {

    private static ListaTarjeta tarjetas = new ListaTarjeta();

    static {
        Tarjeta t1 = new Tarjeta("00000001");
        Tarjeta t2 = new Tarjeta("00000010");
        Tarjeta t3 = new Tarjeta("00000011");
        Tarjeta t4 = new Tarjeta("00000100");

        tarjetas.insertar(t1);
        tarjetas.insertar(t2);
        tarjetas.insertar(t3);
        tarjetas.insertar(t4);
    }

    public static boolean existeTarjeta(String numeroBinario) {
        Tarjeta encontrada = tarjetas.buscar(numeroBinario);
        if (encontrada != null) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean esBinarioValido(String numeroBinario) {
        if (numeroBinario == null) {
            return false;
        }
        if (numeroBinario.length() != 8) {
            return false;
        }
        int i = 0;
        while (i < numeroBinario.length()) {
            char c = numeroBinario.charAt(i);
            if (c != '0' && c != '1') {
                return false;
            }
            i = i + 1;
        }
        return true;
    }

    public static void registrar(String numeroBinario) {
        Tarjeta nueva = new Tarjeta(numeroBinario);
        tarjetas.insertar(nueva);
    }

    public static boolean eliminar(String numeroBinario) {
        return tarjetas.eliminar(numeroBinario);
    }

    public static ListaTarjeta obtenerTodas() {
        return tarjetas;
    }
}