<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <span>Usuario</span>
    </div>
    <button type="button" class="btn-logout" onclick="location.href='${pageContext.request.contextPath}/Logout.jsp'">
        Cerrar Sesion <i class="bi bi-box-arrow-right ms-1"></i>
    </button>
</header>

<main class="contenedor">
    <section class="card-formulario">
        <h2>Crear Paquete</h2>

        <form action="#">
            <div class="campo">
                <label for="nombre">Nombre del paquete</label>
                <input type="text" id="nombre" name="nombre" required>
            </div>

            <div class="fila-doble">
                <div class="campo">
                    <label for="precio">Precio</label>
                    <input type="number" id="precio" name="precio" required>
                </div>
                <div class="campo">
                    <label for="duracion">Duración estimada</label>
                    <input type="text" id="duracion" name="duracion" required>
                </div>
            </div>

            <div class="campo">
                <label for="descripcion">Descripción del paquete</label>
                <textarea id="descripcion" name="descripcion"></textarea>
            </div>

            <div class="campo">
                <label>Servicios Incluidos</label>
                <div class="servicios-grid">
                    <label class="check-item"><input type="checkbox" name="servicios" value="aspirado"> Aspirado</label>
                    <label class="check-item"><input type="checkbox" name="servicios" value="lavado"> Lavado de exterior</label>
                    <label class="check-item"><input type="checkbox" name="servicios" value="toldo"> Toldo y Telas</label>
                    <label class="check-item"><input type="checkbox" name="servicios" value="motor"> Motor</label>
                    <label class="check-item"><input type="checkbox" name="servicios" value="encerado"> Encerado</label>
                    <label class="check-item"><input type="checkbox" name="servicios" value="detailing"> Detailing</label>
                </div>
            </div>

            <button type="submit" class="btn-publicar">Publicar Paquete</button>
        </form>
    </section>

    <section class="lista-paquetes">
        <h2>Paquetes Activos (3)</h2>

        <article class="tarjeta-paquete">
            <div class="paquete-header">
                <div>
                    <h3>Paquete Básico $120</h3>
                    <span class="duracion">30 min</span>
                </div>
                <div class="acciones">
                    <button type="button" title="Editar"><i class="bi bi-pencil-square"></i></button>
                    <button type="button" title="Eliminar"><i class="bi bi-trash"></i></button>
                </div>
            </div>
            <ul class="paquete-servicios">
                <li><i class="bi bi-check-circle"></i> Aspirado</li>
                <li><i class="bi bi-check-circle"></i> Lavado exterior</li>
            </ul>
        </article>

        <article class="tarjeta-paquete">
            <div class="paquete-header">
                <div>
                    <h3>Paquete Básico $120</h3>
                    <span class="duracion">30 min</span>
                </div>
                <div class="acciones">
                    <button type="button" title="Editar"><i class="bi bi-pencil-square"></i></button>
                    <button type="button" title="Eliminar"><i class="bi bi-trash"></i></button>
                </div>
            </div>
            <ul class="paquete-servicios">
                <li><i class="bi bi-check-circle"></i> Aspirado</li>
                <li><i class="bi bi-check-circle"></i> Lavado exterior</li>
            </ul>
        </article>

        <article class="tarjeta-paquete">
            <div class="paquete-header">
                <div>
                    <h3>Paquete Básico $120</h3>
                    <span class="duracion">30 min</span>
                </div>
                <div class="acciones">
                    <button type="button" title="Editar"><i class="bi bi-pencil-square"></i></button>
                    <button type="button" title="Eliminar"><i class="bi bi-trash"></i></button>
                </div>
            </div>
            <ul class="paquete-servicios">
                <li><i class="bi bi-check-circle"></i> Aspirado</li>
                <li><i class="bi bi-check-circle"></i> Lavado exterior</li>
            </ul>
        </article>
    </section>
</main>

</body>
</html>