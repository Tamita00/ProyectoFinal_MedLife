public class Hospital {
    public int IdHospital {get; set;}
    public string Nombre {get; set;}
    public string[] Referentes {get; set;}
    public string[] EmailsRef{get; set;}
    public int[] TelefonosRef {get; set;}
    public string Direccion {get; set;}
    public string Localidad {get; set;}
    public string Provincia {get; set;}
    public int Telefono {get; set;}
    public string Responsable {get; set;}
    public string Servicio {get; set;}

    public Hospital(){}
    public Hospital(int id, string nombre, string[] referentes, string[] emails, int[] telefonos, string dire, string localidad, string pcia, int tel, string responsable, string svc)
    {
        IdHospital = id;
        Nombre = nombre;
        //faltan los arrays pero no se como inicializarlos acá no me deja Referentes[] = referentes[];
        Direccion = dire;
        Localidad = localidad;
        Provincia = pcia;
        Telefono = tel;
        Responsable = responsable;
        Servicio = svc;
    }

}