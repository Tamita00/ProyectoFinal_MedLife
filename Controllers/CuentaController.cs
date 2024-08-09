using System.Data.SqlClient;
using System.Security.Claims;
using ProyectoFinal_MedLife.Data;
using ProyectoFinal_MedLife.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
namespace ProyectoFinal_MedLife.Controllers
{
    public class CuentaController : Controller
    {
        private readonly Contexto _contexto;
        public CuentaController(Contexto contexto)
        {
            _contexto = contexto;
        }
        public IActionResult Login()
        {
            ClaimsPrincipal c = HttpContext.User;
            if (c.Identity != null && c.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index", "Home");
            }
            return View();
        }
        [HttpPost]
         public async Task<IActionResult> Login(Perfil p)
         {
             try 
             {
                 using(SqlConnection con = new(_contexto.Conexion))
                 {
                    using(SqlCommand cmd = new("ValidarUsuario", con))
                    {
                         cmd.CommandType = System.Data.CommandType.StoredProcedure;
                         cmd.Parameters.Add("@Email", System.Data.SqlDbType.VarChar).Value=p.Email;
                         cmd.Parameters.Add("@Contrasena", System.Data.SqlDbType.VarChar).Value = p.Contrasena;
                         con.Open();
                         var dr = cmd.ExecuteReader();
                         while(dr.Read())
                         {
                            if(dr["Email"]!=null && p.Email != null)
                            {
                                List<Claim> c = new List<Claim>()
                                {
                                    new Claim(ClaimTypes.NameIdentifier, p.Email)
                                };
                                ClaimsIdentity ci = new (c, CookieAuthenticationDefaults.AuthenticationScheme);
                                AuthenticationProperties props = new ();
                                props.AllowRefresh = true;
                                props.IsPersistent = p.MantenterActivo;

                                if(!p.MantenterActivo)
                                     props.ExpiresUtc = DateTimeOffset.UtcNow.AddMinutes(1);
                                else
                                     props.ExpiresUtc = DateTimeOffset.UtcNow.AddDays(1);
                                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(ci), props);
                                return RedirectToAction("Index", "Home");
                             }
                            else {
                                ViewBag.Error = "Credenciales incorrectas o cuenta no registrada";
                            }
                         }
                         con.Close();
                    }
                    return View();
                 }
             } catch {
                 return View();
             }
         }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View("Error!");
        }
    }
}