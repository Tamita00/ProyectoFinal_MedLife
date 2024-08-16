using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using ProyectoFinal_MedLife.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;

namespace ProyectoFinal_MedLife.Controllers;

[Authorize]
public class HomeController : Controller
{
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

            var finalData = new Muestra
            {
                // Datos de la Parte 1
                InstitucionNacimiento = parte1["InstitucionNacimiento"],
                IdHospitalMuestra = int.Parse(parte1["IdHospitalMuestra"]),

                // Datos de la Parte 2
                ApellidoBebe = parte2["ApellidoBebe"],
                NombreBebe = parte2["NombreBebe"],
                FechaHoraNacimiento = DateTime.Parse(parte2["FechaHoraNacimiento"]),
                FechaHoraExtraccion = DateTime.Parse(parte2["FechaHoraExtraccion"]),
                Sexo = parte2["Sexo"],
                Alimentacion = parte2["Alimentacion"],
                FechaIngestaLeche = DateTime.Parse(parte2["FechaIngestaLeche"]),
                SemanasGestacion = int.Parse(parte2["SemanasGestacion"]),
                Peso = int.Parse(parte2["Peso"]),
                CondicionRN = parte2["CondicionRN"],
                PatologiaBase = parte2["PatologiaBase"],
                Parto = parte2["Parto"],
                EmbarazoMultiple = bool.Parse(parte2["EmbarazoMultiple"]),
                EmbarazoGemelar = bool.Parse(parte2["EmbarazoGemelar"]),

                // Datos de la Parte 3
                ApellidoMama = parte3["ApellidoMama"],
                NombreMama = parte3["NombreMama"],
                Documento = int.Parse(parte3["Documento"]),
                Domicilio = parte3["Domicilio"],
                Localidad = parte3["Localidad"],
                Telefono = int.Parse(parte3["Telefono"]),
                LugarControlEmbarazo = parte3["LugarControlEmbarazo"],

                // Datos de la Parte 4
                Antibioticos = bool.Parse(parte4["Antibioticos"]),
                DesinfectantesYodados = bool.Parse(parte4["DesinfectantesYodados"]),
                Transfusion = bool.Parse(parte4["Transfusion"]),
                FechaTransfusion = DateTime.Parse(parte4["FechaTransfusion"]),
                Dopamina = bool.Parse(parte4["Dopamina"]),
                Dobutamina = bool.Parse(parte4["Dobutamina"]),
                CorticoidesMadre = bool.Parse(parte4["CorticoidesMadre"]),
                CorticoidesBebe = bool.Parse(parte4["CorticoidesBebe"]),
                Tiroidepatias = bool.Parse(parte4["Tiroidepatias"]),
                Otras = parte4["Otras"],
                RepiteMuestra = bool.Parse(parte4["RepiteMuestra"]),
                Prematuro = bool.Parse(parte4["Prematuro"]),
                MalaMuestra = bool.Parse(parte4["MalaMuestra"]),
                ResultadoAlterado = bool.Parse(parte4["ResultadoAlterado"]),
                Analitico = int.Parse(parte4["Analitico"]),
                Responsable = parte4["Responsable"],
                RolResponsable = parte4["RolResponsable"],
                FirmaSello = parte4["FirmaSello"],

                // Datos de la Parte 5
                FechaEnvio = DateTime.Parse(form["FechaEnvio"]),
                FechaLlegada = DateTime.Parse(form["FechaLlegada"]),
                Observaciones = form["Observaciones"]
            };
            
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
