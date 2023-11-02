using BTL.Data;
using BTL.Infrastructure;
using BTL.Models;
using Microsoft.AspNetCore.Mvc;
using System.Data.Common;

namespace BTL.Controllers
{
    public class CheckOutController : Controller
    {
        private StoreContext db;
        public CheckOutController(StoreContext db)
        {
            this.db = db;
        }
        public IActionResult Index()
        {
            return View(HttpContext.Session.GetJson<Cart>("cart") ?? new Cart());
        }
        private bool LoginIdExists(string id)
        {
            return(db.Users?.Any(e=>e.LoginID == id)).GetValueOrDefault();
        }
        public IActionResult Create()
        {
            var LoginID = HttpContext.Session.GetString("LoginID");
            ViewBag.LoginID = LoginID;
            if (LoginIdExists(LoginID) == true)
            {
                ViewBag.UserID = db.Users.Where(p => p.LoginID == LoginID).Select(s=>s.UserID).SingleOrDefault();
                var user = db.Users.Where(p => p.LoginID == LoginID).SingleOrDefault();
                ViewBag.Email = user.Email;
                ViewBag.Phone = user.Phone;
                ViewBag.Address = user.Address;
                ViewBag.Name = user.Name;
                return View(user);
            }
            else
            {
                var autoID = db.Users.Count();
                ViewBag.UserID = "US00" + (autoID + 1).ToString();
                ViewBag.check = 2;
                return View();
            }
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create([Bind("UserID, Name, Email, Phone, Address, LoginID")] User user)
        {
            if (ModelState.IsValid)
            {
                ViewBag.UserID = user.UserID;
                ViewBag.LoginID = user.LoginID;
                if (LoginIdExists(user.LoginID) == true)
                {
                    db.Users.Update(user);
                    db.SaveChanges();
                }
                else
                {
                    db.Users.Add(user);
                    db.SaveChanges();               
                }
                return View("Index", HttpContext.Session.GetJson<Cart>("cart") ?? new Cart());
            }
            else
            {
                var LoginID = HttpContext.Session.GetString("LoginID");
                var us = db.Users.Where(p => p.LoginID == LoginID).SingleOrDefault();
                ViewBag.UserID = us.UserID;
                ViewBag.LoginID = us.LoginID;
                ViewBag.Email = us.Email;
                ViewBag.Phone = us.Phone;
                ViewBag.Address = us.Address;
                ViewBag.Name = us.Name;
                return View();
            }
        }
        public IActionResult UpdateOrder()
        {
            string lgid = HttpContext.Session.GetString("LoginID");
            Order order = new Order {
                CreatedDate = DateTime.Now,
                UserID = db.Users.Where(p => p.LoginID ==lgid).Select(s => s.UserID).SingleOrDefault(),
                OrderID = "OD00" + (db.Orders.Count() + 1).ToString()
            };
            db.Orders.Add(order);
            db.SaveChanges();
            Cart cart = HttpContext.Session.GetJson<Cart>("cart");
            foreach (var item in cart.Lines) {
                OrderDetail detail = new OrderDetail
                {
                    OrderDetailID = "OR00" + (db.OrderDetails.Count() + 1).ToString(),
                    OrderID = order.OrderID,
                    ProductID = item.Product.ProductID,
                    Quantity = item.Quantity
                };
                db.OrderDetails.Add(detail);
                db.SaveChanges();
            }
            HttpContext.Session.GetJson<Cart>("cart").Clear();
            TempData["Alter"] = "Done";
            return RedirectToAction("Index", "Store");
        }
    }
}
