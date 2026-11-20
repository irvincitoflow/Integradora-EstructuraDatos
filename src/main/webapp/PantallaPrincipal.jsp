<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio - Selección de Paquetes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/inicio.css"></head>
<body>

<header class="navbar">
    <div class="user-info">
        <i class="bi bi-person-circle avatar-icon"></i>
        <span>Usuario</span>
    </div>
    <button type="button" class="btn-logout">Cerrar Sesión <i class="bi bi-box-arrow-right"></i></button>
</header>

<main class="home-container">
    <section class="welcome-header">
        <h1>Bienvenido</h1>
        <p>Selecciona el paquete de la compra</p>
    </section>

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
            <button type="button" class="btn-principal btn-select">Seleccionar</button>
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
            <button type="button" class="btn-principal btn-select">Seleccionar</button>
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
            <button type="button" class="btn-principal btn-select">Seleccionar</button>
        </article>
    </section>

    <section class="card client-info-card">
        <h3>Información del Cliente</h3>
        <div class="client-details">
            <p><strong>Nombre</strong> Francisco Emanuel Fuentes Perez</p>
            <p><strong>Número de tarjeta</strong> 1009876542</p>
        </div>
        <div class="client-actions">
            <button type="button" class="btn-principal">Editar datos</button>
        </div>
    </section>
</main>

</body>
</html>