using Microsoft.AspNetCore.Mvc;

namespace BTL.Controllers
{
    public class MyAccountController : Controller
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
