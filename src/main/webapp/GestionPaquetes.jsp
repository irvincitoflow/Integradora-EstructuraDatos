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
    <button type="button" class="btn-logout" onclick="location.href='Logout.jsp'">
        Cerrar Sesión <i class="bi bi-box-arrow-right"></i>
    </button>
</header>

<main class="contenedor">
    <section class="card-formulario">
        <h2>Crear Paquete</h2>

        <form id="form-crear">
            <div class="campo">
                <label for="nombre">Nombre del paquete</label>
                <input type="text" id="nombre" placeholder="Ej. Paquete Premium" required>
            </div>

            <div class="fila-doble">
                <div class="campo">
                    <label for="precio">Precio</label>
                    <input type="number" id="precio" placeholder="Ej. 250" required>
                </div>
                <div class="campo">
                    <label for="duracion">Duración estimada</label>
                    <input type="text" id="duracion" placeholder="Ej. 45 min" required>
                </div>
            </div>

            <div class="campo">
                <label for="descripcion">Descripción del paquete</label>
                <textarea id="descripcion" placeholder="Ej. Incluye lavado profundo exterior e interior..."></textarea>
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

            <button type="submit" class="btn-publicar">Publicar Paquete</button>
        </form>
    </section>

    <section class="lista-paquetes">
        <h2 id="titulo-contador">Paquetes Activos (3)</h2>
        <div id="contenedor-tarjetas"></div>
    </section>
</main>

<div class="alerta-overlay" id="alerta-publicar">
    <div class="alerta-card">
        <div class="icono-estado">
            <i class="bi bi-check2-circle"></i>
        </div>
        <h3>¿Publicar paquete?</h3>
        <p>El paquete <strong id="texto-publicar"></strong> estará disponible de inmediato para los clientes.</p>
        <div class="grupo-botones">
            <button type="button" class="btn-secundario" onclick="cerrarAlerta('alerta-publicar')">Cancelar</button>
            <button type="button" class="btn-primario" id="btn-confirmar-publicar">Publicar</button>
        </div>
    </div>
</div>

<div class="alerta-overlay" id="alerta-eliminar">
    <div class="alerta-card">
        <div class="icono-estado peligro">
            <i class="bi bi-trash"></i>
        </div>
        <h3>¿Eliminar paquete?</h3>
        <p>Se eliminará <strong id="texto-eliminar"></strong> de la lista de paquetes activos.</p>
        <div class="grupo-botones">
            <button type="button" class="btn-secundario" onclick="cerrarAlerta('alerta-eliminar')">Cancelar</button>
            <button type="button" class="btn-peligro" id="btn-confirmar-eliminar">Sí, eliminar</button>
        </div>
    </div>
</div>

<script>
    var paquetesIniciales = [
        {
            nombre: 'Paquete Básico',
            precio: '120',
            duracion: '30 min',
            descripcion: 'Limpieza esencial interior y exterior.',
            servicios: ['Aspirado', 'Lavado exterior']
        },
        {
            nombre: 'Paquete Intermedio',
            precio: '160',
            duracion: '45 min',
            descripcion: 'Incluye protección de plásticos y aromatizante.',
            servicios: ['Aspirado', 'Lavado exterior', 'Hidratante para plásticos interior y exterior', 'Aroma']
        },
        {
            nombre: 'Paquete Avanzado',
            precio: '220',
            duracion: '60 min',
            descripcion: 'Servicio completo con acabado encerado.',
            servicios: ['Aspirado', 'Lavado exterior', 'Hidratante para plásticos interior y exterior', 'Aroma', 'Encerado']
        }
    ];

    if (!sessionStorage.getItem('paquetes')) {
        sessionStorage.setItem('paquetes', JSON.stringify(paquetesIniciales));
    }

    var indiceEliminar = null;

    function abrirAlerta(id) {
        document.getElementById(id).classList.add('activo');
    }

    function cerrarAlerta(id) {
        document.getElementById(id).classList.remove('activo');
    }

    function obtenerServiciosMarcados() {
        var checkboxes = document.querySelectorAll('input[name="servicios"]:checked');
        var seleccionados = [];
        for (var i = 0; i < checkboxes.length; i++) {
            seleccionados.push(checkboxes[i].value);
        }
        return seleccionados;
    }

    function renderizarPaquetes() {
        var paquetes = JSON.parse(sessionStorage.getItem('paquetes')) || [];
        var contenedor = document.getElementById('contenedor-tarjetas');
        document.getElementById('titulo-contador').textContent = 'Paquetes Activos (' + paquetes.length + ')';

        var html = '';
        for (var i = 0; i < paquetes.length; i++) {
            var p = paquetes[i];
            var listaServicios = '';
            for (var j = 0; j < p.servicios.length; j++) {
                listaServicios += '<li><i class="bi bi-check-circle"></i> ' + p.servicios[j] + '</li>';
            }

            html += '<article class="tarjeta-paquete">' +
                '<div class="paquete-header">' +
                '<div>' +
                '<h3>' + p.nombre + ' $' + p.precio + '</h3>' +
                '<span class="duracion">' + p.duracion + '</span>' +
                '</div>' +
                '<div class="acciones">' +
                '<button type="button" title="Editar" onclick="irAEditar(' + i + ')"><i class="bi bi-pencil-square"></i></button>' +
                '<button type="button" title="Eliminar" onclick="solicitarEliminar(' + i + ')"><i class="bi bi-trash"></i></button>' +
                '</div>' +
                '</div>' +
                '<ul class="paquete-servicios">' + listaServicios + '</ul>' +
                '</article>';
        }
        contenedor.innerHTML = html;
    }

    function irAEditar(index) {
        sessionStorage.setItem('paqueteEditarIndex', index);
        location.href = 'EdicionPaquetes.jsp';
    }

    function solicitarEliminar(index) {
        var paquetes = JSON.parse(sessionStorage.getItem('paquetes')) || [];
        indiceEliminar = index;
        document.getElementById('texto-eliminar').textContent = '"' + paquetes[index].nombre + '"';
        abrirAlerta('alerta-eliminar');
    }

    document.getElementById('btn-confirmar-eliminar').addEventListener('click', function() {
        if (indiceEliminar !== null) {
            var paquetes = JSON.parse(sessionStorage.getItem('paquetes')) || [];
            paquetes.splice(indiceEliminar, 1);
            sessionStorage.setItem('paquetes', JSON.stringify(paquetes));
            renderizarPaquetes();
            indiceEliminar = null;
        }
        cerrarAlerta('alerta-eliminar');
    });

    var formCrear = document.getElementById('form-crear');
    formCrear.addEventListener('submit', function(e) {
        e.preventDefault();
        var nombre = document.getElementById('nombre').value.trim();
        document.getElementById('texto-publicar').textContent = '"' + nombre + '"';
        abrirAlerta('alerta-publicar');
    });

    document.getElementById('btn-confirmar-publicar').addEventListener('click', function() {
        var paquetes = JSON.parse(sessionStorage.getItem('paquetes')) || [];
        var checks = obtenerServiciosMarcados();

        paquetes.push({
            nombre: document.getElementById('nombre').value.trim(),
            precio: document.getElementById('precio').value.trim(),
            duracion: document.getElementById('duracion').value.trim(),
            descripcion: document.getElementById('descripcion').value.trim(),
            servicios: checks.length ? checks : ['Servicio estándar']
        });

        sessionStorage.setItem('paquetes', JSON.stringify(paquetes));
        renderizarPaquetes();
        formCrear.reset();
        cerrarAlerta('alerta-publicar');
    });

    renderizarPaquetes();
</script>

</body>
</html>