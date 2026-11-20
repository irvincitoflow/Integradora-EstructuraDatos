<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Paquete</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="assets/css/paquetes.css">
</head>
<body>

<header class="navbar">
    <div class="user-info">
        <i class="bi bi-person-circle avatar-icon"></i>
        <span>Usuario</span>
    </div>
    <button type="button" class="btn-logout" onclick="location.href='Logout.jsp'">
        Cerrar Sesión <i class="bi bi-box-arrow-right"></i>
    </button>
</header>

<main class="contenedor-centrado">
    <section class="card-formulario">
        <h2>Editar Paquete</h2>

        <form id="form-editar">
            <div class="campo">
                <label for="nombre">Nombre del paquete</label>
                <input type="text" id="nombre" required>
            </div>

            <div class="fila-doble">
                <div class="campo">
                    <label for="precio">Precio</label>
                    <input type="number" id="precio" required>
                </div>
                <div class="campo">
                    <label for="duracion">Duración estimada</label>
                    <input type="text" id="duracion" required>
                </div>
            </div>

            <div class="campo">
                <label for="descripcion">Descripción del paquete</label>
                <textarea id="descripcion"></textarea>
            </div>

            <div class="campo">
                <label>Servicios Incluidos</label>
                <div class="servicios-grid">
                    <label class="check-item"><input type="checkbox" name="servicios" value="Aspirado"> Aspirado</label>
                    <label class="check-item"><input type="checkbox" name="servicios" value="Lavado exterior"> Lavado de exterior</label>
                    <label class="check-item"><input type="checkbox" name="servicios" value="Toldo y Telas"> Toldo y Telas</label>
                    <label class="check-item"><input type="checkbox" name="servicios" value="Motor"> Motor</label>
                    <label class="check-item"><input type="checkbox" name="servicios" value="Encerado"> Encerado</label>
                    <label class="check-item"><input type="checkbox" name="servicios" value="Detailing"> Detailing</label>
                </div>
            </div>

            <div class="grupo-botones">
                <button type="button" class="btn-secundario" onclick="location.href='GestionPaquetes.jsp'">Cancelar</button>
                <button type="submit" class="btn-primario">Guardar Cambios</button>
            </div>
        </form>
    </section>
</main>

<script>
    var paquetes = JSON.parse(sessionStorage.getItem('paquetes')) || [];
    var indice = Number(sessionStorage.getItem('paqueteEditarIndex'));
    var paquete = paquetes[indice];

    if (!paquete) {
        location.href = 'GestionPaquetes.jsp';
    } else {
        document.getElementById('nombre').value = paquete.nombre;
        document.getElementById('precio').value = paquete.precio;
        document.getElementById('duracion').value = paquete.duracion;
        document.getElementById('descripcion').value = paquete.descripcion || '';

        var checkboxes = document.querySelectorAll('input[name="servicios"]');
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = paquete.servicios.indexOf(checkboxes[i].value) !== -1;
        }
    }

    document.getElementById('form-editar').addEventListener('submit', function(e) {
        e.preventDefault();
        var checkboxes = document.querySelectorAll('input[name="servicios"]:checked');
        var serviciosSeleccionados = [];
        for (var i = 0; i < checkboxes.length; i++) {
            serviciosSeleccionados.push(checkboxes[i].value);
        }

        paquetes[indice] = {
            nombre: document.getElementById('nombre').value.trim(),
            precio: document.getElementById('precio').value.trim(),
            duracion: document.getElementById('duracion').value.trim(),
            descripcion: document.getElementById('descripcion').value.trim(),
            servicios: serviciosSeleccionados.length ? serviciosSeleccionados : ['Servicio estándar']
        };

        sessionStorage.setItem('paquetes', JSON.stringify(paquetes));
        location.href = 'GestionPaquetes.jsp';
    });
</script>

</body>
</html>