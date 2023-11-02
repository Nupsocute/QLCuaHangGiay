using Microsoft.AspNetCore.Mvc;

namespace BTL.Controllers
{
    public class BlogDetailsController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
