<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión - Car Wash</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>

<main class="login-wrapper">
    <!-- Panel Izquierdo: Formulario de Inicio de Sesión -->
    <section class="login-panel">
        <div class="login-box">
            <div class="logo-container">
                <img src="${pageContext.request.contextPath}/assets/img/LogoCarwash.png" alt="Logo Car Wash Blanco" class="logo-img">
            </div>

            <h1>Inicio de Sesión</h1>

            <% if ("vacios".equals(request.getParameter("error"))) { %>
            <p style="color: red;">Debes llenar todos los campos.</p>
            <% } else if ("credenciales".equals(request.getParameter("error"))) { %>
            <p style="color: red;">Usuario o contraseña incorrectos.</p>
            <% } else if ("ya_existe".equals(request.getParameter("aviso"))) { %>
            <p style="color: orange;">Ese usuario ya tiene cuenta. Inicia sesión aquí.</p>
            <% } else if ("registrado".equals(request.getParameter("aviso"))) { %>
            <p style="color: green;">Cuenta creada con éxito. Ya puedes entrar.</p>
            <% } %>

            <form action="LoginServlet" method="post" class="login-form">
                <div class="form-group">
                    <label for="usuario">Usuario</label>
                    <input type="text" id="usuario" name="usuario" required autocomplete="username">
                </div>

                <div class="form-group">
                    <label for="password">Contraseña</label>
                    <input type="password" id="password" name="password" required autocomplete="current-password">
                </div>

                <button type="submit" class="btn-login">Iniciar Sesión</button>
            </form>

            <div class="login-links">
                <a href="#" class="forgot-link">¿Olvidaste tu contraseña?</a>
                <p class="register-text">
                    ¿No tienes cuenta? <a href="#" class="register-link">Regístrate aquí</a>
                </p>
            </div>
        </div>
    </section>

    <!-- Panel Derecho: Bienvenida -->
    <section class="welcome-panel">
        <div class="welcome-content">
            <img src="${pageContext.request.contextPath}/assets/img/LogoCarW.png" alt="Logo Car Wash Oscuro" class="welcome-logo">
            <h2>¡Bienvenido a tu Car Wash!</h2>
            <p>La forma más rápida de mantener tu auto impecable</p>
        </div>
    </section>
</main>

</body>
</html>