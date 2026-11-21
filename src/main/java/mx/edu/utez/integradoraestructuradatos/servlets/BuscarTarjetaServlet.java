package mx.edu.utez.integradoraestructuradatos.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.integradoraestructuradatos.repository.RepositorioCarWash;

import java.io.IOException;

@WebServlet("/BuscarTarjetaServlet")
public class BuscarTarjetaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String codigo = request.getParameter("tarjeta");
        ClienteTarjeta resultado = RepositorioCarWash.buscarTarjeta(codigo);

        request.setAttribute("codigoBuscado", codigo);
        request.setAttribute("clienteEncontrado", resultado);
        request.getRequestDispatcher("/BuscadorCompras.jsp").forward(request, response);
    }
}
