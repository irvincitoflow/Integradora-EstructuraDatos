<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <button class="btn-logout">Cerrar Sesion <i class="bi bi-box-arrow-right ms-1"></i></button>
    </header>
    <main class="main-container">
        <section class="card serch-card">
            <div class="input-group">
                <label for="tarjeta">Ingresa codigo de tarjeta</label>
                <input type="text" id="tarjeta" value="923847922">
            </div>
            <button class="btn-principal">Buscar</button>
        </section>

        <section class="card results-card">
            <div class="results-header">
                <div class="client-details">
                    <p><strong>Nombre de Cliente</strong> Francisco Emanuel Fuentes Perez</p>
                    <p><strong>Número de tarjeta</strong> 1009876542</p>
                    <p><strong>Número de visitas</strong> 3 / 5</p>
                </div>
                <div class="counter-box">
                    <span>3/5</span>
                </div>
            </div>

            <div class="services-list">
                <div class="service-bar">
                    <span>Lavado Express</span>
                    <span>Costo: $$$</span>
                </div>
                <div class="service-bar">
                    <span>Lavado Detallado</span>
                    <span>Costo: $$$</span>
                </div>
                <div class="service-bar">
                    <span>Lavado Intenso</span>
                    <span>Costo: $$$</span>
                </div>
            </div>
        </section>
    </main>
</body>
</html>
