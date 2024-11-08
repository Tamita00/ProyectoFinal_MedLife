using System.ComponentModel.DataAnnotations.Schema;

namespace ProyectoFinal_MedLife.Models {
    public class Perfil{
        public int IdPerfil {get; set;}
        public string Nombre {get; set;}
        public string Apellido {get; set;}
        public string? Email {get; set;}
        public int Telefono {get; set;}
        public int IdHospital {get; set;}
        public bool LecturaPermiso {get; set;}
        public bool EdicionPermiso {get; set;}
        public bool ImpresionPermiso {get; set;}
        public string? Contrasena {get; set;}
        [NotMapped]
        public bool MantenerActivo {get; set;}

        public Perfil(){}
        public Perfil(int id, string nombre, string apellido, string email, int tel, int idHosp, bool lectura, bool edicion, bool impresion, string contra, bool mantAct)
        {
            IdPerfil = id;
            Nombre = nombre;
            Apellido = apellido;
            Email = email;
            Telefono = tel;
            IdHospital = idHosp;
            LecturaPermiso = lectura;
            EdicionPermiso = edicion;
            ImpresionPermiso = impresion;
            Contrasena = contra;
            MantenerActivo = mantAct;
        }
    }
}
