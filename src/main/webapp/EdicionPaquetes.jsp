<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="mx.edu.utez.integradoraestructuradatos.repository.RepositorioPaquetes" %>
<%@ page import="mx.edu.utez.integradoraestructuradatos.estructurasDatos.tda.Paquete" %>
<%
    String nombreParam = request.getParameter("nombre");
    Paquete paquete = (nombreParam != null) ? RepositorioPaquetes.buscar(nombreParam) : null;
    if (paquete == null) {
        response.sendRedirect(request.getContextPath() + "/GestionPaquetes.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Paquete</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="assets/css/paquetes.css">
</head>
<body>

<header class="navbar">
    <div class="user-info">
        <i class="bi bi-person-circle avatar-icon"></i>
        <span>${usuarioLogueado}</span>
    </div>
    <button type="button" class="btn-logout" onclick="location.href='Logout.jsp'">
        Cerrar Sesión <i class="bi bi-box-arrow-right"></i>
    </button>
</header>

<main class="contenedor-centrado">
    <section class="card-formulario">
        <h2>Editar Paquete</h2>

        <form action="${pageContext.request.contextPath}/PaqueteServlet" method="post">
            <input type="hidden" name="accion" value="editar">
            <input type="hidden" name="nombreOriginal" value="<%= paquete.nombre %>">

            <div class="campo">
                <label for="nombre">Nombre del paquete</label>
                <input type="text" id="nombre" name="nombre" value="<%= paquete.nombre %>" required>
            </div>

            <div class="fila-doble">
                <div class="campo">
                    <label for="precio">Precio ($)</label>
                    <input type="number" step="0.01" id="precio" name="precio" value="<%= paquete.precio %>" required>
                </div>
                <div class="campo">
                    <label for="duracion">Duración (minutos)</label>
                    <input type="number" id="duracion" name="duracion" value="<%= paquete.duracionMinutos %>" required>
                </div>
            </div>

            <div class="campo">
                <label for="descripcion">Descripción del paquete</label>
                <textarea id="descripcion" name="descripcion" required><%= paquete.descripcion %></textarea>
            </div>

            <div class="grupo-botones">
                <button type="button" class="btn-secundario" onclick="location.href='GestionPaquetes.jsp'">Cancelar</button>
                <button type="submit" class="btn-primario">Guardar Cambios</button>
            </div>
        </form>
    </section>
</main>

</body>
</html>