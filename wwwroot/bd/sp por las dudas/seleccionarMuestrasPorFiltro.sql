ALTER PROCEDURE SeleccionarMuestraPorFiltro
    @Provincia varchar(100) = null,
    @Hospital varchar(100) = null,
    @ApellidoBebe varchar(100) = null,
    @ApellidoMama varchar(100) = null,
    @FechaDesde datetime = null,
    @FechaHasta datetime = null,
    @OrdenadoPor varchar(100) = null
AS
BEGIN
	
    -- Definir la consulta principal
    SELECT *
    FROM Muestra
	WHERE
	Localidad = @provincia 
    AND IdHospitalMuestra = (SELECT IdHospital FROM Hospital WHERE NombreHospital = @hospital) 
    AND ApellidoBebe = @apellidoBebe 
    AND ApellidoMama = @apellidoMama 
    AND FechaEnvio >= @fechaDesde 
    AND FechaLlegada <= @fechaHasta
	ORDER BY
        CASE
            WHEN @ordenadoPor = 'ApellidoBebe' THEN Convert(varchar, ApellidoBebe)
            WHEN @ordenadoPor = 'ApellidoMama' THEN Convert(varchar, ApellidoMama)
            WHEN @ordenadoPor = 'FechaHoraExtraccion' THEN Convert(varchar, FechaHoraExtraccion)
            ELSE Convert(varchar, IdMuestra)
		END
		DESC
END
go
