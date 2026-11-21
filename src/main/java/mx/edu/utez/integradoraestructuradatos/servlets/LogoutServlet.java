package mx.edu.utez.integradoraestructuradatos.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtiene la sesión actual sin crear una nueva
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate(); // Destruye todos los datos de la sesión
        }

        // Redirige a la pantalla de inicio de sesión
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}
