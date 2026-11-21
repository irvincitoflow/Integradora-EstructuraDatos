<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="mx.edu.utez.integradoraestructuradatos.estructurasDatos.PilaServicio" %>
<%@ page import="mx.edu.utez.integradoraestructuradatos.estructurasDatos.nodos.NodoServicio" %>
<%
    String codigoBuscado = (String) request.getAttribute("codigoBuscado");
    Boolean tarjetaExiste = (Boolean) request.getAttribute("tarjetaExiste");
    PilaServicio historial = (PilaServicio) request.getAttribute("historialTarjeta");
    Integer totalVisitas = (Integer) request.getAttribute("totalVisitas");
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
        <span>${usuarioLogueado}</span>
    </div>
    <div style="display: flex; gap: 10px;">
        <button type="button" class="btn-logout" style="background-color: #475569;"
                onclick="location.href='${pageContext.request.contextPath}/PantallaInicio.jsp'">
            Inicio
        </button>
        <button type="button" class="btn-logout" onclick="location.href='${pageContext.request.contextPath}/Logout.jsp'">
            Cerrar Sesion <i class="bi bi-box-arrow-right ms-1"></i>
        </button>
    </div>
</header>

<main class="main-container">
    <form action="${pageContext.request.contextPath}/BuscarTarjetaServlet" method="get" class="card serch-card">
        <div class="input-group">
            <label for="tarjeta">Ingresa código de tarjeta binaria (Ej. 00000001 o 00000010)</label>
            <input type="text" id="tarjeta" name="tarjeta" maxlength="8"
                   value="<%= codigoBuscado != null ? codigoBuscado : "" %>"
                   placeholder="Ingresa los 8 dígitos binarios" required>
        </div>
        <button type="submit" class="btn-principal">Buscar</button>
    </form>

    <% if (tarjetaExiste != null && tarjetaExiste) {
        String nombreCliente = (historial != null && !historial.estaVacia())
                ? historial.verCima().nombreCliente
                : "Sin servicios registrados aún";
        int visitas = (totalVisitas != null) ? totalVisitas : 0;
    %>
    <section class="card results-card">
        <div class="results-header">
            <div class="client-details">
                <p><strong>Nombre de Cliente:</strong> <%= nombreCliente %></p>
                <p><strong>Número de tarjeta:</strong> <%= codigoBuscado %></p>
                <p><strong>Servicios acumulados:</strong> <%= visitas %> / 5</p>
            </div>
            <div class="counter-box">
                <span><%= visitas %>/5</span>
            </div>
        </div>

        <div class="services-list">
            <% if (historial == null || historial.estaVacia()) { %>
            <p style="color: #64748b; text-align: center;">Esta tarjeta está activa pero aún no tiene lavados registrados.</p>
            <% } else {
                NodoServicio actual = historial.cima;
                while (actual != null) {
            %>
            <div class="service-bar">
                <span>
                    <strong><%= actual.dato.paquete %></strong> | Placas: <%= actual.dato.matriculas %> | Atendió: <%= actual.dato.nombreEmpleado %> (<%= actual.dato.fecha %>)
                </span>
                <span>Costo: $<%= actual.dato.precio %></span>
            </div>
            <%
                        actual = actual.siguiente;
                    }
                } %>
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