package mx.edu.utez.integradoraestructuradatos.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.integradoraestructuradatos.estructurasDatos.PilaServicio;
import mx.edu.utez.integradoraestructuradatos.repository.RepositorioServicios;
import mx.edu.utez.integradoraestructuradatos.repository.RepositorioTarjeta;

import java.io.IOException;

@WebServlet("/BuscarTarjetaServlet")
public class BuscarTarjetaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String codigo = request.getParameter("tarjeta");
        if (codigo != null) {
            codigo = codigo.trim();
        }

        boolean existe = RepositorioTarjeta.existeTarjeta(codigo);
        PilaServicio historial = RepositorioServicios.obtenerPorTarjeta(codigo);
        int visitas = RepositorioServicios.contarServiciosTarjeta(codigo);

        request.setAttribute("codigoBuscado", codigo);
        request.setAttribute("tarjetaExiste", existe);
        request.setAttribute("historialTarjeta", historial);
        request.setAttribute("totalVisitas", visitas);

        request.getRequestDispatcher("/BuscadorCompras.jsp").forward(request, response);
    }
}