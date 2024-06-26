function mostrarCampoExtra(selectId) {
    var valorSeleccionado = document.getElementById(selectId).value;
    var campoExtraId = "campoExtra" + selectId.charAt(0).toUpperCase() + selectId.slice(1);

    if (valorSeleccionado === "si") {
        document.getElementById(campoExtraId).style.display = "block";
    } else {
        document.getElementById(campoExtraId).style.display = "none";
    }
}


// Función para establecer la fecha y hora máxima actual en campos datetime-local
function setFechaMaxima(input) {
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var day = now.getDate();
    var hours = now.getHours();
    var minutes = now.getMinutes();
    var formattedDate = `${year}-${month.toString().padStart(2, '0')}-${day.toString().padStart(2, '0')}T${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}`;
    input.max = formattedDate;
}

// Llamar a la función para establecer la fecha y hora máxima al cargar la página
window.onload = function() {
    var inputsDateTime = document.querySelectorAll('input[type="datetime-local"]');
    inputsDateTime.forEach(function(input) {
        setFechaMaxima(input);
    });
};