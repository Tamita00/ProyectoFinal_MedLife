function ConfirmarDNI() {
    let mensajeA = document.getElementById("mensajeB");

    const dni = document.getElementById("Documento").value.trim();

    let longitudValida = false;

    // Validar longitud exacta de 8 caracteres
    if (dni.length === 8) {
        mensajeA.style.color = "green";
        longitudValida = true;
    } else {
        mensajeA.style.color = "red";
        longitudValida = false;
    }

    // Devolver true si todas las condiciones son verdaderas
    return longitudValida;
}

function ConfirmarMinimo(minimo) {
    let mensajeA = document.getElementById("mensajeC");

    const tel = document.getElementById("Telefono").value.trim();

    let longitudValida = false;

    // Validar longitud exacta de 8 caracteres
    if (tel.length >= minimo) {
        mensajeA.style.color = "green";
        longitudValida = true;
    } else {
        mensajeA.style.color = "red";
        longitudValida = false;
    }

    // Devolver true si todas las condiciones son verdaderas
    return longitudValida;
}

function validarSemanasGestacion() {
    const maximo = 50; // Definir el máximo de semanas de gestación permitido
    let mensajeA = document.getElementById("mensajeA");
    const semanas = document.getElementById("SemanasGestacion").value.trim();
    
    if (semanas === "") {
        mensajeA.style.color = "red";
        mensajeA.textContent = "Campo requerido";
        return;
    }

    // Validar si es un número válido y menor o igual al máximo
    if (!isNaN(semanas) && parseInt(semanas) <= maximo) {
        mensajeA.style.color = "green";
        mensajeA.textContent = "Semanas de gestación válidas";
    } else {
        mensajeA.style.color = "red";
        mensajeA.textContent = "La cantidad de semanas supera el máximo permitido";
    }
}


//-----------Lista sin procesar Guardados

//ESTO ESTA MAL PERO ESTA ES LA IDEA -->

function guardarIndividualmente(muestraId) {
    var criterio = $('#criterio-' + muestraId).val();
    var metodologias = [
        $('#metodologia-' + muestraId + '-1').val(),
        $('#metodologia-' + muestraId + '-2').val(),
        $('#metodologia-' + muestraId + '-3').val(),
        $('#metodologia-' + muestraId + '-4').val(),
        $('#metodologia-' + muestraId + '-5').val(),
        $('#metodologia-' + muestraId + '-6').val()
    ];

    $.ajax({
        url: '/GuardarIndividual',
        method: 'POST',
        data: {
            muestraId: muestraId,
            criterio: criterio,
            metodologias: metodologias
        },
        success: function(response) {
            if (response.success) {
                alert('Guardado exitosamente');
            } else {
                alert('Error al guardar: ' + response.message);
            }
        },
        error: function(xhr, status, error) {
            alert('Error al guardar');
        }
    });
}

function guardarTodos() {
    var muestras = [];
    $('.muestra-form').each(function(index, element) {
        var muestraId = $(this).attr('id').replace('form-', '');
        var resultado = $('#resultado-' + muestraId).val();
        muestras.push({ Id: muestraId, Resultado: resultado });
    });

    $.ajax({
        url: '/GuardarTodos',
        method: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(muestras),
        success: function(response) {
            if (response.success) {
                alert('Todos los cambios guardados exitosamente');
            } else {
                alert('Error al guardar todos los cambios: ' + response.message);
            }
        },
        error: function(xhr, status, error) {
            alert('Error al guardar todos los cambios');
        }
    });
}