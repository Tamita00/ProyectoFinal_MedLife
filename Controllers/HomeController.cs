using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using ProyectoFinal_MedLife.Models;

namespace ProyectoFinal_MedLife.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    [HttpPost]
    public IActionResult Home(int idUsuario)
    {
        ViewBag.idUsuario = idUsuario;
        string[] titulos = {"Hospitales", "Muestras enviadas", "Contactos", "Crear perfil", "Lista procesados", "Lista sin procesar", "Subir muestras", "Estadísticas"};
        ViewBag.titulos = titulos;
        return View();
    }
}
