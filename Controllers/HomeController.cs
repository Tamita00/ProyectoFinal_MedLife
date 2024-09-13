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

    /*public IActionResult GuardarSubirMuestra(
        int idUsuario,
        string InstitucionNacimiento, 
        string HospitalMuestra, 
        string ApellidoBebe, 
        string NombreBebe, 
        DateTime FechaHoraNacimiento, 
        DateTime FechaHoraExtraccion, 
        string Sexo, 
        string Alimentacion, 
        DateTime FechaIngestaLeche, 
        int SemanasGestacion, 
        int Peso, 
        string CondicionRN, 
        string PatologiaBase, 
        string Patologia,
        string Parto, 
        bool EmbarazoMultiple, 
        bool EmbarazoGemelar, 
        string ApellidoMama, 
        string NombreMama, 
        int Documento, 
        string Domicilio, 
        string Localidad, 
        int Telefono, 
        string LugarControlEmbarazo, 
        bool Antibioticos, 
        bool DesinfectantesYodados, 
        bool Transfusion, 
        DateTime FechaTransfusion, 
        bool Dopamina, 
        bool Dobutamina, 
        bool CorticoidesMadre, 
        bool CorticoidesBebe, 
        bool Tiroidepatias, 
        string Otras, 
        bool RepiteMuestra, 
        bool Prematuro, 
        bool MalaMuestra, 
        bool ResultadoAlterado, 
        int Analitico, 
        string Responsable, 
        string RolResponsable, 
        DateTime FechaEnvio, 
        DateTime FechaLlegada, 
        string observaciones,
        IFormFile MyFile)
    {   
        if(MyFile.Length > 0){
            string wwwRootLocal = this._environment.ContentRootPath + @"\wwwroot\img\Firmas\" + MyFile.FileName;
            using(var stream = System.IO.File.Create(wwwRootLocal)){
                MyFile.CopyToAsync(stream);
            }
        }

        int IdHospitalMuestra = BD.SeleccionarHospitalPorNombre(HospitalMuestra).IdHospital;
        BD.InsertarMuestra(
            InstitucionNacimiento, 
            IdHospitalMuestra, 
            ApellidoBebe, 
            NombreBebe, 
            FechaHoraNacimiento, 
            FechaHoraExtraccion, 
            Sexo, 
            Alimentacion, 
            FechaIngestaLeche, 
            SemanasGestacion, 
            Peso, 
            CondicionRN, 
            PatologiaBase, 
            Patologia, 
            Parto, 
            EmbarazoMultiple, 
            EmbarazoGemelar, 
            ApellidoMama, 
            NombreMama, 
            Documento, 
            Domicilio, 
            Localidad, 
            Telefono, 
            LugarControlEmbarazo, 
            Antibioticos, 
            DesinfectantesYodados, 
            Transfusion, 
            FechaTransfusion, 
            Dopamina, 
            Dobutamina, 
            CorticoidesMadre, 
            CorticoidesBebe, 
            Tiroidepatias, 
            Otras, 
            RepiteMuestra, 
            Prematuro, 
            MalaMuestra, 
            ResultadoAlterado, 
            Analitico, 
            Responsable, 
            RolResponsable, 
            MyFile.FileName, 
            FechaEnvio, 
            FechaLlegada, 
            observaciones);
        ViewBag.idUsuario = idUsuario;
        ViewBag.Hospitales = BD.SeleccionarHospitales();
        return View("SubirMuestras");
    }*/

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

        public bool SaveMuestra([FromBody] Dictionary<string, object> data)
        {

             Parte1 parte1 = JsonConvert.DeserializeObject<Parte1>(data["parte1"].ToString());
             Parte2 parte2 = JsonConvert.DeserializeObject<Parte2>(data["parte2"].ToString());
             Parte3 parte3 = JsonConvert.DeserializeObject<Parte3>(data["parte3"].ToString());
             Parte4 parte4 = JsonConvert.DeserializeObject<Parte4>(data["parte4"].ToString());
             Parte5 parte5 = JsonConvert.DeserializeObject<Parte5>(data["parte5"].ToString());


            IFormFile MyFile = parte5.FirmaSello;

    
            if(MyFile.Length > 0){
                string wwwRootLocal = this._environment.ContentRootPath + @"\wwwroot\img\Firmas\" + MyFile.FileName;
                using(var stream = System.IO.File.Create(wwwRootLocal)){
                    MyFile.CopyToAsync(stream);
                }
            }

            
                // Datos de la Parte 1
                string InstitucionNacimiento = parte1.InstitucionNacimiento;
                string nombreHospital = parte1.HospitalMuestra;

                int IdHospitalMuestra = BD.SeleccionarHospitalPorNombre(nombreHospital).IdHospital; // Asumiendo que parte1["HospitalMuestraInput"] devuelve el ID

                 // Datos de la Parte 2
                string apellidoBebe = parte2.ApellidoBebe;
                string nombreBebe = parte2.NombreBebe;
                DateTime fechaHoraNacimiento = parte2.FechaHoraNacimiento;
                DateTime fechaHoraExtraccion = parte2.FechaHoraExtraccion;
                string sexo = parte2.Sexo;
                string alimentacion = parte2.Alimentacion;
                DateTime fechaIngestaLeche = parte2.FechaIngestaLeche;
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
                bool antibioticos = parte4.Antibioticos;
                bool desinfectantesYodados = parte4.DesinfectantesYodados;
                bool transfusion = parte4.Transfusion;
                DateTime fechaTransfusion = parte4.FechaTransfusion;
                bool dopamina = parte4.Dopamina;
                bool dobutamina = parte4.Dobutamina;
                bool corticoidesMadre = parte4.CorticoidesMadre;
                bool corticoidesBebe = parte4.CorticoidesBebe;
                bool tiroidepatias = parte4.Tiroidepatias;
                string otras = parte4.Otras;
                bool repiteMuestra = parte4.RepiteMuestra;
                bool prematuro = parte4.Prematuro;
                bool malaMuestra = parte4.MalaMuestra;
                bool resultadoAlterado = parte4.ResultadoAlterado;
                bool analitico = parte4.Analitico;
                string responsable = parte4.Responsable;
                string rolResponsable = parte4.RolResponsable;
         //string FirmaSello = (string)MyFile["FirmaSello"];

                // Datos de la Parte 5
                
                DateTime FechaEnvio = DateTime.Parse(parte5.FechaEnvio);
                DateTime FechaLlegada = DateTime.Parse(parte5.FechaEnvio);
                string FirmaSello = parte5.FirmaSello;
                string Observaciones = parte5.Observaciones;
           
            
            BD.InsertarMuestra(
            InstitucionNacimiento, 
            IdHospitalMuestra, 
            ApellidoBebe, 
            NombreBebe, 
            FechaHoraNacimiento, 
            FechaHoraExtraccion, 
            Sexo, 
            Alimentacion, 
            FechaIngestaLeche, 
            SemanasGestacion, 
            Peso, 
            CondicionRN, 
            PatologiaBase, 
            Patologia,
            Parto, 
            EmbarazoMultiple, 
            EmbarazoGemelar, 
            ApellidoMama, 
            NombreMama, 
            Documento, 
            Domicilio, 
            Localidad, 
            Telefono, 
            LugarControlEmbarazo, 
            Antibioticos, 
            DesinfectantesYodados, 
            Transfusion, 
            FechaTransfusion, 
            Dopamina, 
            Dobutamina, 
            CorticoidesMadre, 
            CorticoidesBebe, 
            Tiroidepatias, 
            Otras, 
            RepiteMuestra, 
            Prematuro, 
            MalaMuestra, 
            ResultadoAlterado, 
            Analitico, 
            Responsable, 
            RolResponsable, 
            FirmaSello, 
            FechaEnvio, 
            FechaLlegada, 
            Observaciones);

            return view("Home");
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
