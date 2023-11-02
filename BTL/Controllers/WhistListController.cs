using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace BTL.Controllers
{
    public class WhistListController : Controller
    {
        public IActionResult Index()
        {
            if (HttpContext.Session.GetString("LoginID") != null)
            {               
                return View();
            }
            return RedirectToAction("Index", "Login");
        }
    }
}
