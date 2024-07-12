using System.Diagnostics;
using ProyectoFinal_MedLife.Models;
using Microsoft.AspNetCore.Mvc;
using System.IO;
using Microsoft.AspNetCore.Hosting;
namespace ProyectoFinal_MedLife.Controllers;
using Microsoft.AspNetCore.Hosting;


public class HomeController : Controller
{
    private readonly IWebHostEnvironment _environment;
    private readonly ILogger<HomeController> _logger;

    public HomeController(IWebHostEnvironment environment, ILogger<HomeController> logger)
    {
        _environment = environment;
        _logger = logger;
    }


    public IActionResult Index()
    {
        return View();
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
        return View("Home");
    }
//SUBIR MUESTRA

    public IActionResult C_SubirMuestra(int idUsuario)
    {   
        ViewBag.idUsuario = idUsuario;
        ViewBag.Hospitales = BD.SeleccionarHospitales();
        return View("SubirMuestras");
    }

    public IActionResult GuardarSubirMuestra(
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
}
