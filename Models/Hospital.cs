public class Hospital {
    public int IdHospital { get; set; }
    public string NombreHospital { get; set; }
    public string[] Referentes { get; set; } = new string[5]; // Array de 5 referentes
    public string[] EmailsRef { get; set; } = new string[5]; // Array de 5 emails
    public long[] TelefonosRef { get; set; } = new long[5]; // Array de arrays de teléfonos

    public string Direccion { get; set; }
    public string Localidad { get; set; }
    public string Provincia { get; set; }
    public long Telefono { get; set; }
    public string Responsable { get; set; }
    public string Servicio { get; set; }

    public Hospital() {}

    public Hospital(int id, string nombre, string[] referentes, string[] emails, int[] telefonos, string dire, string localidad, string pcia, int tel, string responsable, string svc) {
        IdHospital = id;
        NombreHospital = nombre;

        // Copiar los referentes
        for (int i = 0; i < 5 && i < referentes.Length; i++) {
            Referentes[i] = referentes[i];
        }

        // Copiar los emails
        for (int i = 0; i < 5 && i < emails.Length; i++) {
            EmailsRef[i] = emails[i];
        }

        // Copiar los telefonos
         for (int i = 0; i < 5 && i < telefonos.Length; i++) {
            TelefonosRef[i] = telefonos[i];
        }

        Direccion = dire;
        Localidad = localidad;
        Provincia = pcia;
        Telefono = tel;
        Responsable = responsable;
        Servicio = svc;
    }
}