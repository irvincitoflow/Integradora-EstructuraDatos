<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="mx.edu.utez.integradoraestructuradatos.ClienteTarjeta" %>
<%
    ClienteTarjeta cliente = (ClienteTarjeta) request.getAttribute("clienteEncontrado");
    String codigoBuscado = (String) request.getAttribute("codigoBuscado");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" href="css/BuscadorCSS.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Buscador de compras</title>
</head>
<body>
<header class="navbar">
    <div class="user-info">
        <i class="bi bi-person-circle avatar-icon"></i>
        <span>Usuario</span>
    </div>
    <button type="button" class="btn-logout" onclick="location.href='${pageContext.request.contextPath}/Logout.jsp'">
        Cerrar Sesion <i class="bi bi-box-arrow-right ms-1"></i>
    </button>
</header>

<main class="main-container">
    <form action="${pageContext.request.contextPath}/BuscarTarjetaServlet" method="get" class="card serch-card">
        <div class="input-group">
            <label for="tarjeta">Ingresa codigo de tarjeta (Ej. 1009876542 o 923847922)</label>
            <input type="text" id="tarjeta" name="tarjeta"
                   value="<%= codigoBuscado != null ? codigoBuscado : "" %>"
                   placeholder="Ingresa el código de tarjeta" required>
        </div>
        <button type="submit" class="btn-principal">Buscar</button>
    </form>

    <% if (cliente != null) { %>
    <section class="card results-card">
        <div class="results-header">
            <div class="client-details">
                <p><strong>Nombre de Cliente</strong> <%= cliente.getNombreCliente() %></p>
                <p><strong>Número de tarjeta</strong> <%= cliente.getCodigoTarjeta() %></p>
                <p><strong>Número de visitas</strong> <%= cliente.getVisitas() %> / 5</p>
            </div>
            <div class="counter-box">
                <span><%= cliente.getVisitas() %>/5</span>
            </div>
        </div>

        <div class="services-list">
            <% for (String item : cliente.getHistorialServicios()) {
                String[] partes = item.split(" - ");
            %>
            <div class="service-bar">
                <span><%= partes[0] %></span>
                <span>Costo: <%= partes.length > 1 ? partes[1] : "" %></span>
            </div>
            <% } %>
        </div>
    </section>
    <% } else if (codigoBuscado != null) { %>
    <section class="card results-card">
        <p style="color: red; text-align: center;">No se encontró ninguna tarjeta con el código <strong><%= codigoBuscado %></strong>.</p>
    </section>
    <% } %>
</main>
</body>
</html>