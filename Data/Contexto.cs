using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProyectoFinal_MedLife.Data
{
    public class Contexto
    {
        public string Conexion {get;}
        public Contexto(string valor)
        {
            Conexion = valor;
        }
    }
}
