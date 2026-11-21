<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if (session.getAttribute("usuarioLogueado") == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Car Wash</title>
    <link rel="stylesheet" href="css/CSSPantallaInicio.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>

<header class="navbar">
    <div class="user-info">
        <i class="bi bi-person-circle avatar-icon"></i>
        <span>${sessionScope.usuarioLogueado}</span>
    </div>
    <button type="button" class="btn-logout" onclick="location.href='${pageContext.request.contextPath}/Logout.jsp'">
        Cerrar Sesion <i class="bi bi-box-arrow-right ms-1"></i>
    </button>
</header>

<main class="main-content">
    <div class="card">
        <h1>¡Bienvenido a tu Car Wash!</h1>
        <h2>¿Qué deseas hacer hoy?</h2>

        <div class="card-buttons">
            <button type="button" class="btn-action" onclick="location.href='${pageContext.request.contextPath}/BuscadorCompras.jsp'">
                Buscar tarjeta
            </button>
            <button type="button" class="btn-action" onclick="location.href='${pageContext.request.contextPath}/PantallaPrincipal.jsp'">
                Registrar venta
            </button>
            <button type="button" class="btn-action" onclick="location.href='${pageContext.request.contextPath}/GestionPaquetes.jsp'">
                Gestionar paquetes
            </button>
        </div>
    </div>
</main>

</body>
</html>