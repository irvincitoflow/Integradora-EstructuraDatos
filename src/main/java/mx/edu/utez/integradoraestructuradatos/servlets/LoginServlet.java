package mx.edu.utez.integradoraestructuradatos.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.integradoraestructuradatos.repository.RepositorioUsuarios;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        if (usuario == null || usuario.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=vacios");
            return;
        }

        if (RepositorioUsuarios.validarLogin(usuario, password)) {
            request.getSession().setAttribute("usuarioLogueado", usuario);
            response.sendRedirect(request.getContextPath() + "/PantallaInicio.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=credenciales");
        }
    }
}