package mx.edu.utez.integradoraestructuradatos.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.integradoraestructuradatos.repository.RepositorioServicios;
import mx.edu.utez.integradoraestructuradatos.repository.RepositorioTarjeta;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/RegistrarVentaServlet")
public class RegistrarVentaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String tarjeta = request.getParameter("tarjeta");
        String nombreCliente = request.getParameter("nombreCliente");
        String matriculas = request.getParameter("matriculas");
        String paquete = request.getParameter("paquete");
        String precioStr = request.getParameter("precio");

        if (tarjeta == null || tarjeta.trim().isEmpty() ||
                nombreCliente == null || nombreCliente.trim().isEmpty() ||
                matriculas == null || matriculas.trim().isEmpty() ||
                paquete == null || paquete.trim().isEmpty() ||
                precioStr == null || precioStr.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/PantallaPrincipal.jsp?error=vacios");
            return;
        }

        tarjeta = tarjeta.trim();

        if (!RepositorioTarjeta.esBinarioValido(tarjeta)) {
            response.sendRedirect(request.getContextPath() + "/PantallaPrincipal.jsp?error=binario");
            return;
        }

        // Si la tarjeta binaria es válida pero aún no estaba en la lista, se registra automáticamente
        if (!RepositorioTarjeta.existeTarjeta(tarjeta)) {
            RepositorioTarjeta.registrar(tarjeta);
        }

        String empleado = (String) request.getSession().getAttribute("usuarioLogueado");
        if (empleado == null || empleado.trim().isEmpty()) {
            empleado = "Empleado";
        }

        double precio = Double.parseDouble(precioStr);

        RepositorioServicios.registrar(
                tarjeta,
                nombreCliente.trim(),
                empleado,
                matriculas.trim().toUpperCase(),
                paquete.trim(),
                precio,
                LocalDate.now()
        );

        response.sendRedirect(request.getContextPath() + "/PantallaPrincipal.jsp?exito=1&tarjeta=" + tarjeta);
    }
}