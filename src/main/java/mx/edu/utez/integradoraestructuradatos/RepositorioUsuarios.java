package mx.edu.utez.integradoraestructuradatos;


import java.util.HashMap;
import java.util.Map;

public class RepositorioUsuarios {

    private static final Map<String, String> usuarios = new HashMap<>();

    static {
        // Usuario de prueba precargado para tus demostraciones
        usuarios.put("empleado", "1234");
    }

    public static boolean existeUsuario(String usuario) {
        return usuarios.containsKey(usuario);
    }

    public static void registrar(String usuario, String password) {
        usuarios.put(usuario, password);
    }

    public static boolean validarLogin(String usuario, String password) {
        return usuarios.containsKey(usuario) && usuarios.get(usuario).equals(password);
    }
}