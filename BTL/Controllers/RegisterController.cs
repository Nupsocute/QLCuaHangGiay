using BTL.Data;
using BTL.Models;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace BTL.Controllers
{
    public class RegisterController : Controller
    {
        private StoreContext db;
        public RegisterController(StoreContext db)
        {
            this.db = db;
        }
        public IActionResult Index()
        {
            if (HttpContext.Session.GetString("LoginID") != null)
            {
                // Người dùng đã đăng nhập - cho phép truy cập vào trang "My Account"
                return RedirectToAction("Index", "Login");
            }
            else
            {
                // Người dùng chưa đăng nhập - chuyển hướng về trang đăng nhập
                return View();
            }
        }
        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Register(Login lg)
        {
            if (lg == null)
            {
                return View("Index");
            }
            else
            {
                var login = db.Logins.Select(l => l.LoginName).ToList();
                foreach (var l in login)
                {
                    if (l == lg.LoginName)
                    {
                        TempData["KhongThanhCong"] = "Tên Đăng Nhập Đã Tồn Tại";
                        return View("Index");
                    }

                }

                //int loginID = Convert.ToInt32((db.Logins.OrderBy(l => l.LoginID).Last().LoginID).Substring(2, 1));
                int count = db.Logins.Count();
                lg.LoginID = "LO" + (count + 1).ToString();
                lg.RoleID = "R001";
                db.Logins.Add(lg);
                db.SaveChanges();
                return RedirectToAction("Index", "Login");
            }
        }
    }
}