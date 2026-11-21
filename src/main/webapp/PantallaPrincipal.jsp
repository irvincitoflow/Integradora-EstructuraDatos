<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="mx.edu.utez.integradoraestructuradatos.repository.RepositorioPaquetes" %>
<%@ page import="mx.edu.utez.integradoraestructuradatos.estructurasDatos.ListaDoblePaquetes" %>
<%@ page import="mx.edu.utez.integradoraestructuradatos.estructurasDatos.nodos.NodoPaquete" %>
<%
    String tarjetaRegistrada = request.getParameter("tarjeta");
    ListaDoblePaquetes listaPaquetes = RepositorioPaquetes.obtenerTodos();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio - Selección de Paquetes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/inicio.css">
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
        <button type="button" class="btn-logout"
                onclick="location.href='${pageContext.request.contextPath}/Logout.jsp'">
            Cerrar Sesion <i class="bi bi-box-arrow-right ms-1"></i>
        </button>
    </div>
</header>

<main class="home-container">
    <section class="welcome-header">
        <h1>Registrar Venta</h1>
        <p>Ingresa los datos del cliente y selecciona el paquete de lavado</p>
    </section>

    <% if ("1".equals(request.getParameter("exito")) && tarjetaRegistrada != null) { %>
    <section class="card" style="width: 100%; border-left: 6px solid #16a34a; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 12px;">
        <div>
            <strong style="color: #16a34a;">¡Servicio registrado en el historial!</strong>
            <p style="font-size: 14px; margin-top: 4px;">Se guardó el lavado en la tarjeta <strong><%= tarjetaRegistrada %></strong>.</p>
        </div>
        <button type="button" class="btn-principal"
                onclick="location.href='${pageContext.request.contextPath}/BuscarTarjetaServlet?tarjeta=<%= tarjetaRegistrada %>'">
            Ver en Buscador de Tarjetas
        </button>
    </section>
    <% } else if ("binario".equals(request.getParameter("error"))) { %>
    <section class="card" style="width: 100%; border-left: 6px solid #dc2626;">
        <strong style="color: #dc2626;">Tarjeta inválida:</strong> Debe ser un número binario de exactamente 8 dígitos (ej. 00000001).
    </section>
    <% } else if ("vacios".equals(request.getParameter("error"))) { %>
    <section class="card" style="width: 100%; border-left: 6px solid #dc2626;">
        <strong style="color: #dc2626;">Campos incompletos:</strong> Llena nombre, matrículas y tarjeta antes de elegir un paquete.
    </section>
    <% } %>

    <form id="form-venta" action="${pageContext.request.contextPath}/RegistrarVentaServlet" method="post">
        <input type="hidden" name="paquete" id="input-paquete">
        <input type="hidden" name="precio" id="input-precio">
        <input type="hidden" name="tarjeta" id="input-tarjeta">
        <input type="hidden" name="nombreCliente" id="input-nombre">
        <input type="hidden" name="matriculas" id="input-matriculas">
    </form>

    <section class="packages-grid">
        <%
            NodoPaquete actual = listaPaquetes.cabeza;
            while (actual != null) {
        %>
        <article class="card package-card">
            <div class="package-content">
                <div class="package-top">
                    <h2><%= actual.dato.nombre %></h2>
                    <span class="package-price">$<%= actual.dato.precio %></span>
                </div>
                <p class="package-duration"><strong>Duración:</strong> <%= actual.dato.duracionMinutos %> min</p>
                <p class="services-title">Descripción:</p>
                <p style="font-size: 14px; color: #475569; line-height: 1.5;"><%= actual.dato.descripcion %></p>
            </div>
            <button type="button" class="btn-principal btn-select"
                    onclick="registrarCompra('<%= actual.dato.nombre %>', '<%= actual.dato.precio %>')">
                Seleccionar
            </button>
        </article>
        <%
                actual = actual.siguiente;
            }
        %>
    </section>

    <section class="card client-info-card">
        <h3>Información del Cliente y Vehículo</h3>
        <div class="client-details">
            <p>
                <strong>Nombre del cliente</strong>
                <input type="text" id="campo-nombre" placeholder="Ej. Carlos Perez" required
                       style="padding: 6px 10px; border: 1px solid #cbd5e1; border-radius: 6px; width: 65%;">
            </p>
            <p>
                <strong>Matrículas / Placas</strong>
                <input type="text" id="campo-matriculas" placeholder="Ej. PXA-123-A" required
                       style="padding: 6px 10px; border: 1px solid #cbd5e1; border-radius: 6px; width: 65%;">
            </p>
            <p>
                <strong>Número de tarjeta (8 bits)</strong>
                <input type="text" id="campo-tarjeta" maxlength="8" placeholder="Ej. 00000001" required
                       style="padding: 6px 10px; border: 1px solid #cbd5e1; border-radius: 6px; width: 65%;">
            </p>
        </div>
    </section>
</main>

<script>
    function registrarCompra(paquete, precio) {
        var tarjeta = document.getElementById('campo-tarjeta').value.trim();
        var nombre = document.getElementById('campo-nombre').value.trim();
        var matriculas = document.getElementById('campo-matriculas').value.trim();

        if (!nombre || !matriculas || !tarjeta) {
            alert('Por favor ingresa nombre del cliente, matrículas y número de tarjeta antes de seleccionar un paquete.');
            return;
        }

        document.getElementById('input-paquete').value = paquete;
        document.getElementById('input-precio').value = precio;
        document.getElementById('input-tarjeta').value = tarjeta;
        document.getElementById('input-nombre').value = nombre;
        document.getElementById('input-matriculas').value = matriculas;

        document.getElementById('form-venta').submit();
    }
</script>

</body>
</html>