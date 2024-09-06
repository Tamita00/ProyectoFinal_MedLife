public class Muestra {
    public int IdMuestra { get; set; }
    public int IdResultado { get; set; }
    public string InstitucionNacimiento { get; set; }
    public int IdHospitalMuestra { get; set; }
    public string ApellidoBebe { get; set; }
    public string NombreBebe { get; set; }
    public DateTime FechaHoraNacimiento { get; set; }
    public DateTime FechaHoraExtraccion { get; set; }
    public string Sexo { get; set; }
    public string Alimentacion { get; set; }
    public DateTime FechaIngestaLeche { get; set; }
    public int SemanasGestacion { get; set; }
    public int Peso { get; set; }
    public string CondicionRN { get; set; }
    public string PatologiaBase { get; set; }
    public string Patologia { get; set; }
    public string Parto { get; set; }
    public bool EmbarazoMultiple { get; set; }
    public bool EmbarazoGemelar { get; set; }
    public string ApellidoMama { get; set; }
    public string NombreMama { get; set; }
    public int Documento { get; set; }
    public string Domicilio { get; set; }
    public string Localidad { get; set; }
    public int Telefono { get; set; }
    public string LugarControlEmbarazo { get; set; }
    public bool Antibioticos { get; set; }
    public bool DesinfectantesYodados { get; set; }
    public bool Transfusion { get; set; }
    public DateTime FechaTransfusion { get; set; }
    public bool Dopamina { get; set; }
    public bool Dobutamina { get; set; }
    public bool CorticoidesMadre { get; set; }
    public bool CorticoidesBebe { get; set; }
    public bool Tiroidepatias { get; set; }
    public string Otras { get; set; }
    public bool RepiteMuestra { get; set; }
    public bool Prematuro { get; set; }
    public bool MalaMuestra { get; set; }
    public bool ResultadoAlterado { get; set; }
    public bool Analitico { get; set; }
    public string Responsable { get; set; }
    public string RolResponsable { get; set; }
    public string FirmaSello { get; set; }
    public DateTime FechaEnvio { get; set; }
    public DateTime FechaLlegada { get; set; }
    public string Observaciones { get; set; }

    // Constructor vacío
    public Muestra() {}

    // Constructor con parámetros
    public Muestra(int idMuestra, int idResultado, string institucionNacimiento, int idHospitalMuestra, string apellidoBebe, string nombreBebe, DateTime fechaHoraNacimiento, 
                    DateTime fechaHoraExtraccion, string sexo, string alimentacion, DateTime fechaIngestaLeche, int semanasGestacion, int peso, string condicionRN, 
                    string patologiaBase, string patologia, string parto, bool embarazoMultiple, bool embarazoGemelar, string apellidoMama, string nombreMama, int documento, string domicilio, 
                    string localidad, int telefono, string lugarControlEmbarazo, bool antibioticos, bool desinfectantesYodados, bool transfusion, DateTime fechaTransfusion, 
                    bool dopamina, bool dobutamina, bool corticoidesMadre, bool corticoidesBebe, bool tiroidepatias, string otras, bool repiteMuestra, bool prematuro, 
                    bool malaMuestra, bool resultadoAlterado, bool analitico, string responsable, string rolResponsable, string firmaSello, DateTime fechaEnvio, 
                    DateTime fechaLlegada, string observaciones) {
        IdMuestra = idMuestra;
        IdResultado = idResultado;
        InstitucionNacimiento = institucionNacimiento;
        IdHospitalMuestra = idHospitalMuestra;
        ApellidoBebe = apellidoBebe;
        NombreBebe = nombreBebe;
        FechaHoraNacimiento = fechaHoraNacimiento;
        FechaHoraExtraccion = fechaHoraExtraccion;
        Sexo = sexo;
        Alimentacion = alimentacion;
        FechaIngestaLeche = fechaIngestaLeche;
        SemanasGestacion = semanasGestacion;
        Peso = peso;
        CondicionRN = condicionRN;
        PatologiaBase = patologiaBase;
        Patologia = patologia;
        Parto = parto;
        EmbarazoMultiple = embarazoMultiple;
        EmbarazoGemelar = embarazoGemelar;
        ApellidoMama = apellidoMama;
        NombreMama = nombreMama;
        Documento = documento;
        Domicilio = domicilio;
        Localidad = localidad;
        Telefono = telefono;
        LugarControlEmbarazo = lugarControlEmbarazo;
        Antibioticos = antibioticos;
        DesinfectantesYodados = desinfectantesYodados;
        Transfusion = transfusion;
        FechaTransfusion = fechaTransfusion;
        Dopamina = dopamina;
        Dobutamina = dobutamina;
        CorticoidesMadre = corticoidesMadre;
        CorticoidesBebe = corticoidesBebe;
        Tiroidepatias = tiroidepatias;
        Otras = otras;
        RepiteMuestra = repiteMuestra;
        Prematuro = prematuro;
        MalaMuestra = malaMuestra;
        ResultadoAlterado = resultadoAlterado;
        Analitico = analitico;
        Responsable = responsable;
        RolResponsable = rolResponsable;
        FirmaSello = firmaSello;
        FechaEnvio = fechaEnvio;
        FechaLlegada = fechaLlegada;
        Observaciones = observaciones;
    }
}
