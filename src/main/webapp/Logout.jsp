<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cerrar Sesión</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="assets/css/paquetes.css">
</head>
<body>

<main class="contenedor-centrado">
    <section class="card-logout">
        <div class="icono-estado">
            <i class="bi bi-box-arrow-right"></i>
        </div>
        <h2>¿Cerrar sesión?</h2>
        <p>Estás a punto de salir del sistema. Tendrás que ingresar tus credenciales nuevamente para continuar.</p>

        <div class="grupo-botones">
            <button type="button" class="btn-secundario" onclick="history.back()">Cancelar</button>
            <button type="button" class="btn-primario" onclick="location.href='login.jsp'">Sí, cerrar sesión</button>
        </div>
    </section>
</main>

</body>
</html>