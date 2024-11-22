using System.Data.SqlClient;
using System.Security.Claims;
using ProyectoFinal_MedLife.Data;
using ProyectoFinal_MedLife.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using System.Text;


namespace INFOTOOLSSV.Controllers
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
            if (c.Identity != null)
            {
                if (c.Identity.IsAuthenticated)
                    
                    return RedirectToAction("Index", "Home");
            }
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(Perfil u)
        {
            try
            {
                using (SqlConnection con = new(_contexto.Conexion))
                {
                    using (SqlCommand cmd = new("ValidarUsuario", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add("@Email", System.Data.SqlDbType.VarChar).Value = u.Email;
                        cmd.Parameters.Add("@Contrasena", System.Data.SqlDbType.VarChar).Value = u.Contrasena;
                        con.Open();
                        var dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            if (dr["Email"] != null && u.Email != null)
                            {
                                int idPerfil = Convert.ToInt32(dr["IdPerfil"]); 
                                bool lectura = Convert.ToBoolean(dr["LecturaPermiso"]);
                                bool edicion = Convert.ToBoolean(dr["EdicionPermiso"]);
                                bool impresion = Convert.ToBoolean(dr["ImpresionPermiso"]);

                                List<Claim> c = new List<Claim>()
                                {
                                    new Claim(ClaimTypes.NameIdentifier, u.Email),
                                    new Claim("idPerfil", idPerfil.ToString())
                                };
                                HttpContext.Session.SetString("idperfil", idPerfil.ToString());
                                ClaimsIdentity ci = new(c, CookieAuthenticationDefaults.AuthenticationScheme);
                                AuthenticationProperties p = new();

                                p.AllowRefresh = true;
                                p.IsPersistent = u.MantenerActivo;

                                if (!u.MantenerActivo)
                                    p.ExpiresUtc = DateTimeOffset.UtcNow.AddMinutes(1);
                                else
                                    p.ExpiresUtc = DateTimeOffset.UtcNow.AddDays(1);

                                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(ci), p);
                                return RedirectToAction("Index", "Home", new { idPerfil = idPerfil });
                            }
                            else
                            {
                                ViewBag.Error = "Credenciales incorrectas o cuenta no registrada.";
                            }
                        }
                        con.Close();
                    }
                    return View();
                }
            }
            catch (System.Exception e)
            {
                ViewBag.Error = e.Message;
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