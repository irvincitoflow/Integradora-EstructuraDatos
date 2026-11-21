package mx.edu.utez.integradoraestructuradatos;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RegistrarVentaServlet")
public class RegistrarVentaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        if ("atender".equals(accion)) {
            RepositorioCarWash.atenderSiguienteAuto();
            response.sendRedirect(request.getContextPath() + "/PantallaPrincipal.jsp");
            return;
        }

        String tarjeta = request.getParameter("tarjeta");
        String nombreCliente = request.getParameter("nombreCliente");
        String paquete = request.getParameter("paquete");
        String precio = request.getParameter("precio");

        if (tarjeta != null && !tarjeta.trim().isEmpty() && paquete != null) {
            RepositorioCarWash.registrarVenta(tarjeta, nombreCliente, paquete, precio);
            response.sendRedirect(request.getContextPath() + "/PantallaPrincipal.jsp?exito=1&tarjeta=" + tarjeta.trim());
        } else {
            response.sendRedirect(request.getContextPath() + "/PantallaPrincipal.jsp?error=1");
        }
    }
}
