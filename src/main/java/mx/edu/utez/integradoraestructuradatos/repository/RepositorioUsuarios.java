package mx.edu.utez.integradoraestructuradatos.repository;


import mx.edu.utez.integradoraestructuradatos.estructurasDatos.tda.Usuario;
import mx.edu.utez.integradoraestructuradatos.estructurasDatos.ListaUsuario;

public class RepositorioUsuarios {

    private static final ListaUsuario usuarios = new ListaUsuario();

    static {
        Usuario fran = new Usuario("Frank", "paco123");
        Usuario u1 = new Usuario("irvin", "1234");
        Usuario u2 = new Usuario("manu", "1234");
        Usuario u3 = new Usuario("eder", "1234");
        Usuario u4 = new Usuario("andrew", "1234");

        usuarios.insertar(fran);
        usuarios.insertar(u1);
        usuarios.insertar(u2);
        usuarios.insertar(u3);
        usuarios.insertar(u4);
    }

    public static boolean existeUsuario(String usuario) {
        Usuario encontrado = usuarios.buscar(usuario);
        if (encontrado != null) {
            return true;
        } else {
            return false;
        }
    }

    public static void registrar(String usuario, String password) {
        Usuario nuevo = new Usuario(usuario, password);
        usuarios.insertar(nuevo);
    }

    public static boolean validarLogin(String usuario, String password) {
        boolean valido = usuarios.validarLogin(usuario, password);
        return valido;
    }
}