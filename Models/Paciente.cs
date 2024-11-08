public class Paciente{
    public int IdPaciente {get; set;}
    public int IdMuestra {get; set;}
    public int Acta {get; set;}
    public int Hc {get; set;}
    
    public Paciente(){}
    public Paciente(int idPaciente, int idMuestra, int acta, int hc)
    {
        IdPaciente = idPaciente;
        IdMuestra = idMuestra;
        Acta = acta;
        Hc = hc;
    }
}