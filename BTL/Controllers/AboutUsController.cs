using Microsoft.AspNetCore.Mvc;

namespace BTL.Controllers
{
    public class AboutUsController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
