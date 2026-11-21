<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="mx.edu.utez.integradoraestructuradatos.repository.RepositorioCarWash" %>
<%@ page import="java.util.Queue" %>
<%
    String tarjetaRegistrada = request.getParameter("tarjeta");
    Queue<String> cola = RepositorioCarWash.getColaLavado();
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
        <span>Usuario</span>
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
        <p>Verifica los datos de la tarjeta y selecciona el paquete de la compra</p>
    </section>

    <% if ("1".equals(request.getParameter("exito")) && tarjetaRegistrada != null) { %>
    <section class="card" style="width: 100%; border-left: 6px solid #16a34a; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 12px;">
        <div>
            <strong style="color: #16a34a;">¡Venta registrada con éxito!</strong>
            <p style="font-size: 14px; margin-top: 4px;">Se sumó la compra y visita a la tarjeta <strong><%= tarjetaRegistrada %></strong>.</p>
        </div>
        <button type="button" class="btn-principal"
                onclick="location.href='${pageContext.request.contextPath}/BuscarTarjetaServlet?tarjeta=<%= tarjetaRegistrada %>'">
            Ver en Buscador de Tarjetas
        </button>
    </section>
    <% } %>

    <!-- Formulario oculto que envía la venta al Servlet -->
    <form id="form-venta" action="${pageContext.request.contextPath}/RegistrarVentaServlet" method="post">
        <input type="hidden" name="paquete" id="input-paquete">
        <input type="hidden" name="precio" id="input-precio">
        <input type="hidden" name="tarjeta" id="input-tarjeta">
        <input type="hidden" name="nombreCliente" id="input-nombre">
    </form>

    <section class="packages-grid">
        <article class="card package-card">
            <div class="package-content">
                <div class="package-top">
                    <h2>Lavado Expres</h2>
                    <span class="package-price">$50</span>
                </div>
                <p class="package-duration"><strong>Duración:</strong> 30 min</p>
                <p class="services-title">Servicio:</p>
                <ul class="package-features">
                    <li><i class="bi bi-check-lg"></i> Aspirado</li>
                    <li><i class="bi bi-check-lg"></i> Lavado Exterior</li>
                </ul>
            </div>
            <button type="button" class="btn-principal btn-select" onclick="registrarCompra('Lavado Expres', '50')">
                Seleccionar
            </button>
        </article>

        <article class="card package-card">
            <div class="package-content">
                <div class="package-top">
                    <h2>Lavado Plus</h2>
                    <span class="package-price">$80</span>
                </div>
                <p class="package-duration"><strong>Duración:</strong> 60 min</p>
                <p class="services-title">Servicio:</p>
                <ul class="package-features">
                    <li><i class="bi bi-check-lg"></i> Aspirado</li>
                    <li><i class="bi bi-check-lg"></i> Lavado Exterior</li>
                    <li><i class="bi bi-check-lg"></i> Encerado</li>
                </ul>
            </div>
            <button type="button" class="btn-principal btn-select" onclick="registrarCompra('Lavado Plus', '80')">
                Seleccionar
            </button>
        </article>

        <article class="card package-card">
            <div class="package-content">
                <div class="package-top">
                    <h2>Full Pack</h2>
                    <span class="package-price">$250</span>
                </div>
                <p class="package-duration"><strong>Duración:</strong> 120 min</p>
                <p class="services-title">Servicio:</p>
                <ul class="package-features">
                    <li><i class="bi bi-check-lg"></i> Aspirado</li>
                    <li><i class="bi bi-check-lg"></i> Lavado Exterior</li>
                    <li><i class="bi bi-check-lg"></i> Encerado</li>
                    <li><i class="bi bi-check-lg"></i> Motor</li>
                </ul>
            </div>
            <button type="button" class="btn-principal btn-select" onclick="registrarCompra('Full Pack', '250')">
                Seleccionar
            </button>
        </article>
    </section>

    <section class="card client-info-card">
        <h3>Información del Cliente</h3>
        <div class="client-details">
            <p>
                <strong>Nombre</strong>
                <input type="text" id="campo-nombre" placeholder="Ingresa el nombre del cliente"
                       style="padding: 6px 10px; border: 1px solid #cbd5e1; border-radius: 6px; width: 65%;">
            </p>
            <p>
                <strong>Número de tarjeta</strong>
                <input type="text" id="campo-tarjeta" placeholder="Ingresa el código de tarjeta" required
                       style="padding: 6px 10px; border: 1px solid #cbd5e1; border-radius: 6px; width: 65%;">
            </p>
        </div>
    </section>

    <!-- Visualización de la Cola (FIFO) de turnos de lavado -->
    <section class="card client-info-card">
        <h3>Cola de Lavado en Espera (<%= cola.size() %>)</h3>
        <% if (cola.isEmpty()) { %>
        <p style="font-size: 14px; color: #64748b;">No hay autos en espera en este momento.</p>
        <% } else { %>
        <ol style="margin-left: 20px; font-size: 14px; color: #1E293B; line-height: 1.8;">
            <% for (String turno : cola) { %>
            <li><%= turno %></li>
            <% } %>
        </ol>
        <form action="${pageContext.request.contextPath}/RegistrarVentaServlet" method="post" class="client-actions">
            <input type="hidden" name="accion" value="atender">
            <button type="submit" class="btn-principal">Despachar siguiente auto (Atender)</button>
        </form>
        <% } %>
    </section>
</main>

<script>
    function registrarCompra(paquete, precio) {
        var tarjeta = document.getElementById('campo-tarjeta').value.trim();
        var nombre = document.getElementById('campo-nombre').value.trim();

        if (!tarjeta) {
            alert('Por favor ingresa un número de tarjeta antes de seleccionar el paquete.');
            document.getElementById('campo-tarjeta').focus();
            return;
        }

        document.getElementById('input-paquete').value = paquete;
        document.getElementById('input-precio').value = precio;
        document.getElementById('input-tarjeta').value = tarjeta;
        document.getElementById('input-nombre').value = nombre;

        document.getElementById('form-venta').submit();
    }
</script>

</body>
</html>