using System.Data.SqlClient;
using System.Data;
using Dapper;
namespace ProyectoFinal_MedLife;

public static class BD{
    private static string ConnectionString = @"Server=localhost;DataBase=MedLife;Trusted_Connection=True;";

    //Seleccionar

    // Método para seleccionar todos los hospitales de la base de datos
        public static List<Hospital> SeleccionarHospitales()
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SeleccionarHospitales"; // Nombre del procedimiento almacenado

                return db.Query<Hospital>(sql, commandType: CommandType.StoredProcedure).AsList();
            }
        }

    // Método para seleccionar un hospital por su Id
        public static Hospital SeleccionarHospitalPorId(int idHospital)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SeleccionarHospitalPorId"; // Nombre del procedimiento almacenado
                var parameters = new { IdHospital = idHospital };

                return db.QueryFirstOrDefault<Hospital>(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }
    
        // Método para seleccionar un hospital por su nombre
        public static Hospital SeleccionarHospitalPorNombre(string nombreHospital)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SeleccionarHospitalPorNombre"; // Nombre del procedimiento almacenado
                var parameters = new { NombreHospital = nombreHospital };

                return db.QueryFirstOrDefault<Hospital>(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }

        // Método para seleccionar una muestra por su Id
        public static Muestra SeleccionarMuestraPorId(int idMuestra)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SeleccionarMuestraPorId"; // Nombre del procedimiento almacenado
                var parameters = new { IdMuestra = idMuestra };

                return db.QueryFirstOrDefault<Muestra>(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }

        // Método para seleccionar pacientes por filtros
        public static List<Paciente> SeleccionarPacientesPorFiltros(string provincia, string hospital, string apellido, string nombre, DateTime fechaRegistroDesde, DateTime fechaRegistroHasta)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SeleccionarPacientesPorFiltros"; // Nombre del procedimiento almacenado
                var parameters = new
                {
                    Provincia = provincia,
                    Hospital = hospital,
                    Apellido = apellido,
                    Nombre = nombre,
                    FechaRegistroDesde = fechaRegistroDesde,
                    FechaRegistroHasta = fechaRegistroHasta
                };

                return db.Query<Paciente>(sql, parameters, commandType: CommandType.StoredProcedure).AsList();
            }
        }

        // Método para buscar un perfil por su Id
        public static Perfil BuscarPerfilPorId(int idPerfil)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SeleccionarPerfilPorId"; // Nombre del procedimiento almacenado
                var parameters = new { IdPerfil = idPerfil };

                return db.QueryFirstOrDefault<Perfil>(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }

        // Método para seleccionar perfiles 
        public static Perfil SeleccionarPerfiles()
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SeleccionarPerfiles"; // Nombre del procedimiento almacenado

                return db.QueryFirstOrDefault<Perfil>(sql, commandType: CommandType.StoredProcedure);
            }
        }


    //......Actualizar

        // Método para actualizar una muestra en la base de datos
        public static void ActualizarMuestra(int idMuestra, int idResultado, DateTime fechaEnvio, DateTime fechaLlegada, string observaciones)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "ActualizarMuestra"; // Nombre del procedimiento almacenado
                var parameters = new
                {
                    IdMuestra = idMuestra,
                    IdResultado = idResultado,
                    FechaEnvio = fechaEnvio,
                    FechaLlegada = fechaLlegada,
                    Observaciones = observaciones
                };

                db.Execute(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }

    //Eliminar

        // Método para eliminar un hospital de la base de datos
        public static void EliminarHospital(int idHospital)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "EliminarHospital"; // Nombre del procedimiento almacenado
                var parameters = new { IdHospital = idHospital };

                db.Execute(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }


        // Método para eliminar una muestra de la base de datos
        public static void EliminarMuestra(int idMuestra)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "EliminarMuestra"; // Nombre del procedimiento almacenado
                var parameters = new { IdMuestra = idMuestra };

                db.Execute(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }


        // Método para eliminar una muestra y su resultado de la base de datos
        public static void EliminarMuestraYResultado(int idMuestra)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "EliminarMuestraYResultado"; // Nombre del procedimiento almacenado
                var parameters = new { IdMuestra = idMuestra };

                db.Execute(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }


        // Método para eliminar un paciente de la base de datos
        public static void EliminarPaciente(int idPaciente)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "EliminarPaciente"; // Nombre del procedimiento almacenado
                var parameters = new { IdPaciente = idPaciente };

                db.Execute(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }

    
    //Insertar

        public static void InsertarHospital(string nombreHospital, string email1, string email2, string email3, string email4, string email5,
            string referente1, string referente2, string referente3, string referente4, string referente5,
            int tel1, int? tel2, int? tel3, int? tel4, int? tel5,
            string direccion, string localidad, string provincia, int telefono, string responsable, string servicio)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "InsertarHospital"; // Nombre del procedimiento almacenado
                var parameters = new
                {
                    NombreHospital = nombreHospital,
                    Email1 = email1,
                    Email2 = email2,
                    Email3 = email3,
                    Email4 = email4,
                    Email5 = email5,
                    Referente1 = referente1,
                    Referente2 = referente2,
                    Referente3 = referente3,
                    Referente4 = referente4,
                    Referente5 = referente5,
                    Tel1 = tel1,
                    Tel2 = tel2,
                    Tel3 = tel3,
                    Tel4 = tel4,
                    Tel5 = tel5,
                    Direccion = direccion,
                    Localidad = localidad,
                    Provincia = provincia,
                    Telefono = telefono,
                    Responsable = responsable,
                    Servicio = servicio
                };

                db.Execute(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }

    // Método para insertar una nueva muestra en la base de datos
        public static void InsertarMuestra( string institucionNacimiento, int idHospitalMuestra,
            string apellidoBebe, string nombreBebe, DateTime fechaHoraNacimiento, DateTime fechaHoraExtraccion,
            string sexo, string alimentacion, DateTime fechaIngestaLeche, int semanasGestacion, int peso,
            string condicionRN, string patologiaBase, string patologia, string parto, bool embarazoMultiple, bool embarazoGemelar,
            string apellidoMama, string nombreMama, int documento, string domicilio, string localidad,
            int telefono, string lugarControlEmbarazo, bool antibioticos, bool desinfectantesYodados,
            bool transfusion, DateTime fechaTransfusion, bool dopamina, bool dobutamina, bool corticoidesMadre,
            bool corticoidesBebe, bool tiroidepatias, string otras, bool repiteMuestra, bool prematuro,
            bool malaMuestra, bool resultadoAlterado, int analitico, string responsable, string rolResponsable,
            string MyFile, DateTime fechaEnvio, DateTime fechaLlegada, string observaciones)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "InsertarMuestra"; // Nombre del procedimiento almacenado
                var parameters = new
                {
                    InstitucionNacimiento = institucionNacimiento,
                    IdHospitalMuestra = idHospitalMuestra,
                    ApellidoBebe = apellidoBebe,
                    NombreBebe = nombreBebe,
                    FechaHoraNacimiento = fechaHoraNacimiento,
                    FechaHoraExtraccion = fechaHoraExtraccion,
                    Sexo = sexo,
                    Alimentacion = alimentacion,
                    FechaIngestaLeche = fechaIngestaLeche,
                    SemanasGestacion = semanasGestacion,
                    Peso = peso,
                    CondicionRN = condicionRN,
                    PatologiaBase = patologiaBase,
                    Patologia = patologia,
                    Parto = parto,
                    EmbarazoMultiple = embarazoMultiple,
                    EmbarazoGemelar = embarazoGemelar,
                    ApellidoMama = apellidoMama,
                    NombreMama = nombreMama,
                    Documento = documento,
                    Domicilio = domicilio,
                    Localidad = localidad,
                    Telefono = telefono,
                    LugarControlEmbarazo = lugarControlEmbarazo,
                    Antibioticos = antibioticos,
                    DesinfectantesYodados = desinfectantesYodados,
                    Transfusion = transfusion,
                    FechaTransfusion = fechaTransfusion,
                    Dopamina = dopamina,
                    Dobutamina = dobutamina,
                    CorticoidesMadre = corticoidesMadre,
                    CorticoidesBebe = corticoidesBebe,
                    Tiroidepatias = tiroidepatias,
                    Otras = otras,
                    RepiteMuestra = repiteMuestra,
                    Prematuro = prematuro,
                    MalaMuestra = malaMuestra,
                    ResultadoAlterado = resultadoAlterado,
                    Analitico = analitico,
                    Responsable = responsable,
                    RolResponsable = rolResponsable,
                    FirmaSello = MyFile,
                    FechaEnvio = fechaEnvio,
                    FechaLlegada = fechaLlegada,
                    ObservacionesMuestra = observaciones
                };

                db.Execute(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }


        // Método para insertar una nueva muestra y su resultado en la base de datos
        public static void InsertarMuestraYResultado(string institucionNacimiento, int idHospitalMuestra,
            string apellidoBebe, string nombreBebe, DateTime fechaHoraNacimiento, DateTime fechaHoraExtraccion,
            string sexo, string alimentacion, DateTime fechaIngestaLeche, int semanasGestacion, int peso,
            string condicionRN, string patologiaBase, string parto, bool embarazoMultiple, bool embarazoGemelar,
            string apellidoMama, string nombreMama, int documento, string domicilio, string localidad,
            int telefono, string lugarControlEmbarazo, bool antibioticos, bool desinfectantesYodados,
            bool transfusion, DateTime fechaTransfusion, bool dopamina, bool dobutamina, bool corticoidesMadre,
            bool corticoidesBebe, bool tiroidepatias, string otras, bool repiteMuestra, bool prematuro,
            bool malaMuestra, bool resultadoAlterado, int analitico, string responsable, string rolResponsable,
            string firmaSello, DateTime fechaEnvio, DateTime fechaLlegada, string observaciones,
            string tshNeonatal, string metodologiaTsh, string fenilanina, string metodologiaFenilanina,
            string irtNeonatal, string metodologiaIrt, string galactosa, string metodologiaGalactosa,
            string hidroxiprogesterona, string metodologiaHidro, string biotinidasa, string metodologiaBiotinidasa,
            string normalidadTsh, string normalidadFenilanina, string normalidadIrt, string normalidadGalactosa,
            string normalidadHidro, string normalidadBiotinidasa, string observacionesResultado)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "InsertarMuestraYResultado"; // Nombre del procedimiento almacenado
                var parameters = new
                {
                    InstitucionNacimiento = institucionNacimiento,
                    IdHospitalMuestra = idHospitalMuestra,
                    ApellidoBebe = apellidoBebe,
                    NombreBebe = nombreBebe,
                    FechaHoraNacimiento = fechaHoraNacimiento,
                    FechaHoraExtraccion = fechaHoraExtraccion,
                    Sexo = sexo,
                    Alimentacion = alimentacion,
                    FechaIngestaLeche = fechaIngestaLeche,
                    SemanasGestacion = semanasGestacion,
                    Peso = peso,
                    CondicionRN = condicionRN,
                    PatologiaBase = patologiaBase,
                    Parto = parto,
                    EmbarazoMultiple = embarazoMultiple,
                    EmbarazoGemelar = embarazoGemelar,
                    ApellidoMama = apellidoMama,
                    NombreMama = nombreMama,
                    Documento = documento,
                    Domicilio = domicilio,
                    Localidad = localidad,
                    Telefono = telefono,
                    LugarControlEmbarazo = lugarControlEmbarazo,
                    Antibioticos = antibioticos,
                    DesinfectantesYodados = desinfectantesYodados,
                    Transfusion = transfusion,
                    FechaTransfusion = fechaTransfusion,
                    Dopamina = dopamina,
                    Dobutamina = dobutamina,
                    CorticoidesMadre = corticoidesMadre,
                    CorticoidesBebe = corticoidesBebe,
                    Tiroidepatias = tiroidepatias,
                    Otras = otras,
                    RepiteMuestra = repiteMuestra,
                    Prematuro = prematuro,
                    MalaMuestra = malaMuestra,
                    ResultadoAlterado = resultadoAlterado,
                    Analitico = analitico,
                    Responsable = responsable,
                    RolResponsable = rolResponsable,
                    FirmaSello = firmaSello,
                    FechaEnvio = fechaEnvio,
                    FechaLlegada = fechaLlegada,
                    Observaciones = observaciones,
                    TshNeonatal = tshNeonatal,
                    MetodologiaTsh = metodologiaTsh,
                    Fenilanina = fenilanina,
                    MetodologiaFenilanina = metodologiaFenilanina,
                    IrtNeonatal = irtNeonatal,
                    MetodologiaIrt = metodologiaIrt,
                    Galactosa = galactosa,
                    MetodologiaGalactosa = metodologiaGalactosa,
                    Hidroxiprogesterona = hidroxiprogesterona,
                    MetodologiaHidro = metodologiaHidro,
                    Biotinidasa = biotinidasa,
                    MetodologiaBiotinidasa = metodologiaBiotinidasa,
                    NormalidadTsh = normalidadTsh,
                    NormalidadFenilanina = normalidadFenilanina,
                    NormalidadIrt = normalidadIrt,
                    NormalidadGalactosa = normalidadGalactosa,
                    NormalidadHidro = normalidadHidro,
                    NormalidadBiotinidasa = normalidadBiotinidasa,
                    ObservacionesResultado = observacionesResultado
                };

                db.Execute(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }

        // Método para insertar un nuevo paciente en la base de datos
        public static void InsertarPaciente(int idMuestra, int acta, int hc, int? idGarrahan, DateTime fechaEnvio, DateTime? fechaLlegada)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "InsertarPaciente"; // Nombre del procedimiento almacenado
                var parameters = new
                {
                    IdMuestra = idMuestra,
                    Acta = acta,
                    Hc = hc,
                    IdGarrahan = idGarrahan,
                    FechaEnvio = fechaEnvio,
                    FechaLlegada = fechaLlegada
                };

                db.Execute(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }





}