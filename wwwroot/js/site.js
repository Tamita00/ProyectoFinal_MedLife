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

//subir muestra por partes
function saveParte1() {
    var data = $("#formParte1").serialize();
    localStorage.setItem('formParte1', data);
    $("#parte1").hide();
    $("#parte2").show();
    populateFormPart2();
}

function saveParte2() {
    var data = $("#formParte2").serialize();
    localStorage.setItem('formParte2', data);
    $("#parte2").hide();
    $("#parte3").show();
    populateFormPart3();
}

function saveParte3() {
    var data = $("#formParte3").serialize();
    localStorage.setItem('formParte3', data);
    $("#parte3").hide();
    $("#parte4").show();
    populateFormPart4();
}

function saveParte4() {
    var data = $("#formParte4").serialize();
    localStorage.setItem('formParte4', data);
    $("#parte4").hide();
    $("#parte5").show();
    populateFormPart5();
}

function goBack(part) {
    if (part === 1) {
        $("#parte1").show();
        $("#parte2").hide();
    } else if (part === 2) {
        $("#parte2").show();
        $("#parte3").hide();
        populateFormPart2();
    } else if (part === 3) {
        $("#parte3").show();
        $("#parte4").hide();
        populateFormPart3();
    } else if (part === 4) {
        $("#parte4").show();
        $("#parte5").hide();
        populateFormPart4();
    }
}

function populateFormPart2() {
    var data = localStorage.getItem('formParte2');
    if (data) {
        var formData = $.deparam(data);
        $.each(formData, function(key, value) {
            $("#formParte2 [name='" + key + "']").val(value);
        });
    }
}

function populateFormPart3() {
    var data = localStorage.getItem('formParte3');
    if (data) {
        var formData = $.deparam(data);
        $.each(formData, function(key, value) {
            $("#formParte3 [name='" + key + "']").val(value);
        });
    }
}

function populateFormPart4() {
    var data = localStorage.getItem('formParte4');
    if (data) {
        var formData = $.deparam(data);
        $.each(formData, function(key, value) {
            $("#formParte4 [name='" + key + "']").val(value);
        });
    }
}

function populateFormPart5() {
    var data = localStorage.getItem('formParte5');
    if (data) {
        var formData = $.deparam(data);
        $.each(formData, function(key, value) {
            $("#formParte5 [name='" + key + "']").val(value);
        });
    }
}

function submitForm() {
    var parte1Data = localStorage.getItem('formParte1');
    var parte2Data = localStorage.getItem('formParte2');
    var parte3Data = localStorage.getItem('formParte3');
    var parte4Data = localStorage.getItem('formParte4');
    var parte5Data = $("#formParte5").serialize();

    var finalData = [parte1Data, parte2Data, parte3Data, parte4Data, parte5Data].join('&');

    $.post('@Url.Action("SaveMuestra", "Form")', finalData, function(response) {
        if (response.success) {
            alert('Formulario guardado exitosamente');
            localStorage.removeItem('formParte1');
            localStorage.removeItem('formParte2');
            localStorage.removeItem('formParte3');
            localStorage.removeItem('formParte4');
            localStorage.removeItem('formParte5');
        } else {
            alert('Error al guardar el formulario');
        }
    });
}

// Inicializar la página con los datos guardados
$(document).ready(function() {
    if (localStorage.getItem('formParte5')) {
        $("#parte5").show();
        $("#parte4").hide();
        populateFormPart5();
    } else if (localStorage.getItem('formParte4')) {
        $("#parte4").show();
        $("#parte3").hide();
        populateFormPart4();
    } else if (localStorage.getItem('formParte3')) {
        $("#parte3").show();
        $("#parte2").hide();
        populateFormPart3();
    } else if (localStorage.getItem('formParte2')) {
        $("#parte2").show();
        $("#parte1").hide();
        populateFormPart2();
    }
});

//-----------Lista sin procesar Guardados

//ESTO ESTA MAL PERO ESTA ES LA IDEA -->

/* function guardarIndividualmente(muestraId) {
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

*/