using BTL.Data;
using BTL.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BTL.Controllers
{
    public class LoginController : Controller
    {
        private StoreContext db;
        public LoginController(StoreContext db)
        {
            this.db = db;
        }
        public IActionResult Index()
        {
            if (HttpContext.Session.GetString("LoginID") != null)
            {
                // Nếu người dùng đã đăng nhập, chuyển hướng đến trang khác, ví dụ trang chủ
                return RedirectToAction("Index", "Store");
            }
            else { return View(); }
        }
        [HttpPost]
        public IActionResult Login(Login lg)
        {
            if (lg != null)
            {
                {
                    var login = db.Logins.FirstOrDefault(l => l.LoginName == lg.LoginName && l.Password == lg.Password);
                    if (login != null)
                    {
                        @ViewBag.LoginName = 1;
                        HttpContext.Session.SetString("LoginID", login.LoginID.ToString());
                        return RedirectToAction("Index", "Store");
                    }
                    else
                    {
                        TempData["ErrorMessage"] = "Sai tên đăng nhập hoặc mật khẩu.";
                        return RedirectToAction("Index");
                    }
                }
            }
            else
            {
                return View();
            }
        }
        public IActionResult Logout()
        {
            @ViewBag.LoginName = 0;
            HttpContext.Session.Remove("LoginID");
            HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Index", "Store");
        }
    }
}
