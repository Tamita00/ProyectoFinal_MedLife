using System.ComponentModel.DataAnnotations.Schema;

namespace ProyectoFinal_MedLife.Models {
    public class Perfil{
        public int IdPerfil {get; set;}
        public string Nombre {get; set;}
        public string Apellido {get; set;}
        public string? Email {get; set;}
        public int Telefono {get; set;}
        public int IdHospital {get; set;}
        public bool Lectura {get; set;}
        public bool Edicion {get; set;}
        public bool Impresion {get; set;}
        public string? Contrasena {get; set;}
        [NotMapped]
        public bool MantenterActivo {get; set;}

        public Perfil(){}
        public Perfil(int id, string nombre, string apellido, string email, int tel, int idHosp, bool lectura, bool edicion, bool impresion, string contra, bool mantAct)
        {
            IdPerfil = id;
            Nombre = nombre;
            Apellido = apellido;
            Email = email;
            Telefono = tel;
            IdHospital = idHosp;
            Lectura = lectura;
            Edicion = edicion;
            Impresion = impresion;
            Contrasena = contra;
            MantenterActivo = mantAct;
        }
    }
}
