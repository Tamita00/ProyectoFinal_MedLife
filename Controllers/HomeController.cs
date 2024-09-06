using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using ProyectoFinal_MedLife.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using System.IO;
using Microsoft.AspNetCore.Http;




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

        [HttpPost]
        public ActionResult SaveMuestra(FormCollection form)
        {
            var parte1 = TempData["Parte1"] as FormCollection;
            var parte2 = TempData["Parte2"] as FormCollection;
            var parte3 = TempData["Parte3"] as FormCollection;
            var parte4 = TempData["Parte4"] as FormCollection;
            var parte5 = TempData["Parte5"] as FormCollection;

            string nombreHospital = (string)parte1["HospitalMuestraInput"];

            IFormFile MyFile = Request.Form.Files["MyFile"];

    
            if(MyFile.Length > 0){
                string wwwRootLocal = this._environment.ContentRootPath + @"\wwwroot\img\Firmas\" + MyFile.FileName;
                using(var stream = System.IO.File.Create(wwwRootLocal)){
                    MyFile.CopyToAsync(stream);
                }
            }

            
                // Datos de la Parte 1
                string InstitucionNacimiento = (string)parte1["InstitucionNacimiento"];
                int IdHospitalMuestra = BD.SeleccionarHospitalPorNombre(nombreHospital).IdHospital; // Asumiendo que parte1["HospitalMuestraInput"] devuelve el ID

                // Datos de la Parte 2
                string ApellidoBebe = (string)parte2["ApellidoBebe"];
                string NombreBebe = (string)parte2["NombreBebe"];
                DateTime FechaHoraNacimiento = DateTime.Parse(parte2["FechaHoraNacimiento"]);
                DateTime FechaHoraExtraccion = DateTime.Parse(parte2["FechaHoraExtraccion"]);
                string Sexo = (string)(parte2["Sexo"]);
                string Alimentacion = (string)parte2["Alimentacion"];
                DateTime FechaIngestaLeche = DateTime.Parse(parte2["FechaIngestaLeche"]);
                int SemanasGestacion = int.Parse(parte2["SemanasGestacion"]);
                int Peso = int.Parse(parte2["Peso"]);
                string CondicionRN = (string)parte2["CondicionRN"];
                string PatologiaBase = (string)parte2["PatologiaBase"];
                string Patologia = (string)parte2["Patologia"];

                string Parto = (string)parte2["Parto"];
                bool EmbarazoMultiple = bool.Parse(parte2["EmbarazoMultiple"]);
                bool EmbarazoGemelar = bool.Parse(parte2["EmbarazoGemelar"]);

                // Datos de la Parte 3
                string ApellidoMama = (string)parte3["ApellidoMama"];
                string NombreMama = (string)parte3["NombreMama"];
                int Documento = int.Parse(parte3["Documento"]);
                string Domicilio = (string)parte3["Domicilio"];
                string Localidad = (string)parte3["Localidad"];
                int Telefono = int.Parse(parte3["Telefono"]);
                string LugarControlEmbarazo = (string)parte3["LugarControlEmbarazo"];

                // Datos de la Parte 4
                bool Antibioticos = bool.Parse(parte4["Antibioticos"]);
                bool DesinfectantesYodados = bool.Parse(parte4["DesinfectantesYodados"]);
                bool Transfusion = bool.Parse(parte4["Transfusion"]);
                DateTime FechaTransfusion = DateTime.Parse(parte4["FechaTransfusion"]);
                bool Dopamina = bool.Parse(parte4["Dopamina"]);
                bool Dobutamina = bool.Parse(parte4["Dobutamina"]);
                bool CorticoidesMadre = bool.Parse(parte4["CorticoidesMadre"]);
                bool CorticoidesBebe = bool.Parse(parte4["CorticoidesBebe"]);
                bool Tiroidepatias = bool.Parse(parte4["Tiroidepatias"]);
                string Otras = (string)parte4["Otras"];
                bool RepiteMuestra = bool.Parse(parte4["RepiteMuestra"]);
                bool Prematuro = bool.Parse(parte4["Prematuro"]);
                bool MalaMuestra = bool.Parse(parte4["MalaMuestra"]);
                bool ResultadoAlterado = bool.Parse(parte4["ResultadoAlterado"]);
                bool Analitico = bool.Parse(parte4["Analitico"]); // Ajustado a string para el formulario si no se convierte a int
                string Responsable = (string)parte4["Responsable"];
                string RolResponsable = (string)parte4["RolResponsable"];
                //string FirmaSello = (string)MyFile["FirmaSello"];

                // Datos de la Parte 5
                
                DateTime FechaEnvio = DateTime.Parse(form["FechaEnvio"]);
                DateTime FechaLlegada = DateTime.Parse(form["FechaLlegada"]);
                string Observaciones = (string)form["Observaciones"];
           
            
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
            Observaciones);
            TempData.Remove("Parte1");
            TempData.Remove("Parte2");
            TempData.Remove("Parte3");
            TempData.Remove("Parte4");

            return Json(new { success = true });
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
