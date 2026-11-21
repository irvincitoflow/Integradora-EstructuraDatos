package mx.edu.utez.integradoraestructuradatos.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.integradoraestructuradatos.repository.RepositorioPaquetes;

import java.io.IOException;

@WebServlet("/PaqueteServlet")
public class PaqueteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        if ("crear".equals(accion)) {
            String nombre = request.getParameter("nombre").trim();
            String descripcion = request.getParameter("descripcion") != null ? request.getParameter("descripcion").trim() : "";
            double precio = Double.parseDouble(request.getParameter("precio"));
            int duracion = Integer.parseInt(request.getParameter("duracion"));

            if (!RepositorioPaquetes.existePaquete(nombre)) {
                RepositorioPaquetes.registrar(nombre, descripcion, precio, duracion);
            }
            response.sendRedirect(request.getContextPath() + "/GestionPaquetes.jsp");

        } else if ("editar".equals(accion)) {
            String nombreOriginal = request.getParameter("nombreOriginal").trim();
            String nuevoNombre = request.getParameter("nombre").trim();
            String descripcion = request.getParameter("descripcion") != null ? request.getParameter("descripcion").trim() : "";
            double precio = Double.parseDouble(request.getParameter("precio"));
            int duracion = Integer.parseInt(request.getParameter("duracion"));

            RepositorioPaquetes.actualizar(nombreOriginal, nuevoNombre, descripcion, precio, duracion);
            response.sendRedirect(request.getContextPath() + "/GestionPaquetes.jsp");

        } else if ("eliminar".equals(accion)) {
            String nombre = request.getParameter("nombre").trim();
            RepositorioPaquetes.eliminar(nombre);
            response.sendRedirect(request.getContextPath() + "/GestionPaquetes.jsp");
        }
    }
}