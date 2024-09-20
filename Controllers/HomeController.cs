using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using ProyectoFinal_MedLife.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using System.IO;
using Microsoft.AspNetCore.Http;
using System.Text.Json;
using Newtonsoft.Json;
using System.Web;


namespace ProyectoFinal_MedLife.Controllers;

 [Authorize]
public class HomeController : Controller
{
   
private readonly IWebHostEnvironment _environment;

public HomeController(IWebHostEnvironment environment)
{
    _environment = environment;
}

    public IActionResult Index()
    {
        return View();
    }

    public async Task<IActionResult> Salir()
    {
        await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
        return RedirectToAction("Login", "Cuenta");
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
    


    
//PÁGINA PRINCIPAL

    public IActionResult C_Home(int idUsuario)
    {
        ViewBag.idUsuario = idUsuario;
        string[] titulosHome = {"Hospitales", "Muestras enviadas", "Contactos", "Crear perfil", "Lista procesados", "Lista sin procesar", "Subir muestras", "Estadísticas"};
        ViewBag.titulos = titulosHome;
        return View("Home");
    }

//HOSPITALES

public IActionResult C_Hospitales(int idUsuario)
    {
        ViewBag.idUsuario = idUsuario;
        ViewBag.Hospitales = BD.SeleccionarHospitales();
        return View("Hospitales");
    }


//CREAR PERFIL

public IActionResult C_CrearPerfiles(int idUsuario)
    {
        ViewBag.idUsuario = idUsuario;
        ViewBag.Hospitales = BD.SeleccionarHospitales();
        return View("CrearPerfil");
    }

public IActionResult C_GuardarPerfil(int idUsuario, Perfil miPerfil)
    {
        BD.CrearPerfil(miPerfil);
        ViewBag.idUsuario = idUsuario;
        return View("Home");
    }

//CONTACTOS

public IActionResult Contactos(int idUsuario)
    {
        ViewBag.idUsuario = idUsuario;
        ViewBag.Contactos = BD.SeleccionarPerfiles();
        return View("Contactos");
    }
//SUBIR MUESTRA


    public IActionResult C_SubirMuestra(int idUsuario)
    {   
        ViewBag.idUsuario = idUsuario;
        ViewBag.Hospitales = BD.SeleccionarHospitales();
        return View("SubirMuestras");
    }

        [HttpPost]
        public ActionResult SaveParte1(FormCollection form)
        {
            TempData["Parte1"] = form;
            return Json(new { success = true });
        }

        [HttpPost]
        public ActionResult SaveParte2(FormCollection form)
        {
            TempData["Parte2"] = form;
            return Json(new { success = true });
        }

        [HttpPost]
        public ActionResult SaveParte3(FormCollection form)
        {
            TempData["Parte3"] = form;
            return Json(new { success = true });
        }

        [HttpPost]
        public ActionResult SaveParte4(FormCollection form)
        {
            TempData["Parte4"] = form;
            return Json(new { success = true });
        }

        [HttpPost]
        public ActionResult SaveParte5(FormCollection form)
        {
            TempData["Parte5"] = form;
            return Json(new { success = true });
        }
        public int SaveMuestra([FromBody] Dictionary<string, object> data)
        {

             Parte1 parte1 = JsonConvert.DeserializeObject<Parte1>(data["parte1"].ToString());
             Parte2 parte2 = JsonConvert.DeserializeObject<Parte2>(data["parte2"].ToString());
             Parte3 parte3 = JsonConvert.DeserializeObject<Parte3>(data["parte3"].ToString());
             Parte4 parte4 = JsonConvert.DeserializeObject<Parte4>(data["parte4"].ToString());
             Parte5 parte5 = JsonConvert.DeserializeObject<Parte5>(data["parte5"].ToString());
             



            
            
                // Datos de la Parte 1
                string InstitucionNacimiento = parte1.InstitucionNacimiento;
                string nombreHospital = parte1.HospitalMuestra;

                int IdHospitalMuestra = BD.SeleccionarHospitalPorNombre(nombreHospital).IdHospital; // Asumiendo que parte1["HospitalMuestraInput"] devuelve el ID

                 // Datos de la Parte 2
                string apellidoBebe = parte2.ApellidoBebe;
                string nombreBebe = parte2.NombreBebe;
                DateTime fechaHoraNacimiento = parte2.FechaHoraNacimiento ?? DateTime.Now;
                DateTime fechaHoraExtraccion = parte2.FechaHoraExtraccion ?? DateTime.Now;
                string sexo = parte2.Sexo;
                string alimentacion = parte2.Alimentacion;
                DateTime fechaIngestaLeche = parte2.FechaIngestaLeche ?? DateTime.Now;
                int semanasGestacion = parte2.SemanasGestacion;
                int peso = parte2.Peso;
                string condicionRN = parte2.CondicionRN;
                string patologiaBase = parte2.PatologiaBase;
                string patologia = parte2.Patologia;
                string parto = parte2.Parto;
                bool embarazoMultiple = parte2.EmbarazoMultiple;
                bool embarazoGemelar = parte2.EmbarazoGemelar;

                // Datos de la Parte 3
                string apellidoMama = parte3.ApellidoMama;
                string nombreMama = parte3.NombreMama;
                int documento = parte3.Documento;
                string domicilio = parte3.Domicilio;
                string localidad = parte3.Localidad;
                int telefono = parte3.Telefono;
                string lugarControlEmbarazo = parte3.LugarControlEmbarazo;

                // Datos de la Parte 4
                bool antibioticos = parte3.Antibioticos;
                bool desinfectantesYodados = parte3.DesinfectantesYodados;
                bool transfusion = parte3.Transfusion;
                DateTime fechaTransfusion = parte3.FechaTransfusion;
                bool dopamina = parte3.Dopamina;
                bool dobutamina = parte3.Dobutamina;
                bool corticoidesMadre = parte3.CorticoidesMadre;
                bool corticoidesBebe = parte3.CorticoidesBebe;
                bool tiroidepatias = parte3.Tiroidepatias;
                string otras = parte3.Otras;
                bool repiteMuestra = parte4.RepiteMuestra;
                bool prematuro = parte4.Prematuro;
                bool malaMuestra = parte4.MalaMuestra;
                bool resultadoAlterado = parte4.ResultadoAlterado;
                bool analitico = parte4.Analitico;

                // Datos de la Parte 5
                
                string responsable = parte5.Responsable;
                string rolResponsable = parte5.RolResponsable;
                DateTime fechaEnvio = parte5.FechaEnvio;
                DateTime fechaLlegada = parte5.FechaEnvio;
                string observaciones = parte5.Observaciones;

                
            
                int idMuestra = BD.InsertarMuestra(
                InstitucionNacimiento, 
                IdHospitalMuestra, 
                apellidoBebe, 
                nombreBebe, 
                fechaHoraNacimiento, 
                fechaHoraExtraccion, 
                sexo, 
                alimentacion, 
                fechaIngestaLeche, 
                semanasGestacion, 
                peso, 
                condicionRN, 
                patologiaBase, 
                patologia,
                parto, 
                embarazoMultiple, 
                embarazoGemelar, 
                apellidoMama, 
                nombreMama, 
                documento, 
                domicilio, 
                localidad, 
                telefono, 
                lugarControlEmbarazo, 
                antibioticos, 
                desinfectantesYodados, 
                transfusion, 
                fechaTransfusion, 
                dopamina, 
                dobutamina, 
                corticoidesMadre, 
                corticoidesBebe, 
                tiroidepatias, 
                otras, 
                repiteMuestra, 
                prematuro, 
                malaMuestra, 
                resultadoAlterado, 
                analitico, 
                responsable, 
                rolResponsable,  
                fechaEnvio, 
                fechaLlegada, 
                observaciones);

                return idMuestra;
        }

public bool ActualizarMuestra([FromBody] MuestraActualizada o)
        {
            int idMuestra = o.idMuestra;
            Dictionary<string, object> data = o.data;

             Parte6 parte6 = JsonConvert.DeserializeObject<Parte6>(data["parte6"].ToString()); // aca {0}


            IFormFile firmaSello1 = (IFormFile)parte6.FirmaSello;

            if (firmaSello1 != null)
            {
                if(firmaSello1.Length > 0){
                    string wwwRootLocal = this._environment.ContentRootPath + @"\wwwroot\img\Firmas\" + firmaSello1.FileName;
                    using(var stream = System.IO.File.Create(wwwRootLocal)){
                        firmaSello1.CopyToAsync(stream);
                    }
            }

            }
            
                
                // Dato de la Parte 6
                string firmaSello = (parte6.FirmaSello != null ? parte6.FirmaSello.FileName : "");
            
                BD.ActualizarMuestra(idMuestra, firmaSello);

                return true;
        }
        


// LISTA SIN PROCESAR
    public IActionResult C_ListaSinProcesarFiltrado(int idUsuario)
        {   
            ViewBag.idUsuario = idUsuario;
            return View("ListaSinProcesarFiltrado");
        }

    public IActionResult C_MostrarFiltrado(int idUsuario, string provincia, string hospital, string apellidoBebe, string apellidoMama, DateTime fechaDesde, DateTime fechaHasta, string ordenadoPor)
    {   
        List<MuestraResultado> MuestrasResultado = BD.SeleccionarMuestrasResultadoPorFiltro(provincia, hospital, apellidoBebe, apellidoMama, fechaDesde, fechaHasta, ordenadoPor);
        ViewBag.MuestrasResultado = MuestrasResultado;

        List<Muestra> Muestras = new List<Muestra>(); // Lista para almacenar las muestras

        foreach (MuestraResultado muestraResultado in MuestrasResultado)
        {
            Muestra muestra = BD.SeleccionarMuestraPorId(muestraResultado.IdMuestra); // Obtener la muestra correspondiente
            if (muestra != null)
            {
                Muestras.Add(muestra); // Agregar la muestra a la lista
            }
        }
        ViewBag.Muestras = Muestras;
        ViewBag.idUsuario = idUsuario;
        return View("ListaSinProcesar");
    }

    public IActionResult C_GuardarMuestras(int idUsuario, string provincia, string hospital, string apellidoBebe, string apellidoMama, DateTime fechaDesde, DateTime fechaHasta, string ordenadoPor)
    {   
       List<MuestraResultado> MuestrasResultado = BD.SeleccionarMuestrasResultadoPorFiltro(provincia, hospital, apellidoBebe, apellidoMama, fechaDesde, fechaHasta, ordenadoPor);
        ViewBag.MuestrasResultado = MuestrasResultado;

        List<Muestra> Muestras = new List<Muestra>(); // Lista para almacenar las muestras

        foreach (MuestraResultado muestraResultado in MuestrasResultado)
        {
            Muestra muestra = BD.SeleccionarMuestraPorId(muestraResultado.IdMuestra); // Obtener la muestra correspondiente
            if (muestra != null)
            {
                Muestras.Add(muestra); // Agregar la muestra a la lista
            }
        }
        ViewBag.Muestras = Muestras;
        return View("ListaSinProcesar");
    }

    //ESTO ESTA MAL PERO ESTA SERIA LA IDEA -->
    /*public IActionResult GuardarIndividual(int muestraId, string resultado)
    {
        try
        {
            BD.ActualizarMuestra(muestraId, resultado);

            return Json(new { success = true });
        }
        catch (Exception ex)
        {
            return Json(new { success = false, message = ex.Message });
        }
    }

    // Método para guardar todos los cambios (ejemplo)
    public IActionResult GuardarTodos(List<MuestraViewModel> muestras)
    {
        try
        {
            foreach (var muestra in muestras)
            {
                BD.ActualizarMuestra(muestra.Id, muestra.Resultado);
            }

            return Json(new { success = true });
        }
        catch (Exception ex)
        {
            return Json(new { success = false, message = ex.Message });
        }
    }
*/





//CONTACTOS


}
