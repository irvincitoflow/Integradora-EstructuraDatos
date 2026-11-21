<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="mx.edu.utez.integradoraestructuradatos.repository.RepositorioPaquetes" %>
<%@ page import="mx.edu.utez.integradoraestructuradatos.estructurasDatos.ListaDoblePaquetes" %>
<%@ page import="mx.edu.utez.integradoraestructuradatos.estructurasDatos.nodos.NodoPaquete" %>
<%@ page import="java.net.URLEncoder" %>
<%
    ListaDoblePaquetes lista = RepositorioPaquetes.obtenerTodos();
    int totalPaquetes = 0;
    NodoPaquete temp = lista.cabeza;
    while (temp != null) {
        totalPaquetes++;
        temp = temp.siguiente;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Paquetes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="assets/css/paquetes.css">
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
        <button type="button" class="btn-logout" onclick="location.href='Logout.jsp'">
            Cerrar Sesión <i class="bi bi-box-arrow-right"></i>
        </button>
    </div>
</header>

<main class="contenedor">
    <section class="card-formulario">
        <h2>Crear Paquete</h2>

        <form id="form-crear" action="${pageContext.request.contextPath}/PaqueteServlet" method="post">
            <input type="hidden" name="accion" value="crear">

            <div class="campo">
                <label for="nombre">Nombre del paquete</label>
                <input type="text" id="nombre" name="nombre" placeholder="Ej. Paquete Premium" required>
            </div>

            <div class="fila-doble">
                <div class="campo">
                    <label for="precio">Precio ($)</label>
                    <input type="number" step="0.01" id="precio" name="precio" placeholder="Ej. 250" required>
                </div>
                <div class="campo">
                    <label for="duracion">Duración (minutos)</label>
                    <input type="number" id="duracion" name="duracion" placeholder="Ej. 45" required>
                </div>
            </div>

            <div class="campo">
                <label for="descripcion">Descripción del paquete</label>
                <textarea id="descripcion" name="descripcion" placeholder="Ej. Incluye lavado profundo exterior e interior..." required></textarea>
            </div>

            <button type="submit" class="btn-publicar">Publicar Paquete</button>
        </form>
    </section>

    <section class="lista-paquetes">
        <h2>Paquetes Activos (<%= totalPaquetes %>)</h2>
        <div>
            <%
                NodoPaquete actual = lista.cabeza;
                while (actual != null) {
                    String nombreEncoded = URLEncoder.encode(actual.dato.nombre, "UTF-8");
            %>
            <article class="tarjeta-paquete">
                <div class="paquete-header">
                    <div>
                        <h3><%= actual.dato.nombre %> $<%= actual.dato.precio %></h3>
                        <span class="duracion"><%= actual.dato.duracionMinutos %> min</span>
                    </div>
                    <div class="acciones">
                        <button type="button" title="Editar"
                                onclick="location.href='EdicionPaquetes.jsp?nombre=<%= nombreEncoded %>'">
                            <i class="bi bi-pencil-square"></i>
                        </button>
                        <button type="button" title="Eliminar"
                                onclick="solicitarEliminar('<%= actual.dato.nombre %>')">
                            <i class="bi bi-trash"></i>
                        </button>
                    </div>
                </div>
                <p style="font-size: 14px; color: #475569; margin-top: 8px;"><%= actual.dato.descripcion %></p>
            </article>
            <%
                    actual = actual.siguiente;
                }
            %>
        </div>
    </section>
</main>

<form id="form-eliminar" action="${pageContext.request.contextPath}/PaqueteServlet" method="post" style="display:none;">
    <input type="hidden" name="accion" value="eliminar">
    <input type="hidden" name="nombre" id="input-eliminar-nombre">
</form>

<div class="alerta-overlay" id="alerta-eliminar">
    <div class="alerta-card">
        <div class="icono-estado peligro">
            <i class="bi bi-trash"></i>
        </div>
        <h3>¿Eliminar paquete?</h3>
        <p>Se eliminará <strong id="texto-eliminar"></strong> de la lista de paquetes activos.</p>
        <div class="grupo-botones">
            <button type="button" class="btn-secundario" onclick="cerrarAlerta('alerta-eliminar')">Cancelar</button>
            <button type="button" class="btn-peligro" onclick="confirmarEliminar()">Sí, eliminar</button>
        </div>
    </div>
</div>

<script>
    function solicitarEliminar(nombre) {
        document.getElementById('input-eliminar-nombre').value = nombre;
        document.getElementById('texto-eliminar').textContent = '"' + nombre + '"';
        document.getElementById('alerta-eliminar').classList.add('activo');
    }

    function cerrarAlerta(id) {
        document.getElementById(id).classList.remove('activo');
    }

    function confirmarEliminar() {
        document.getElementById('form-eliminar').submit();
    }
</script>

</body>
</html>