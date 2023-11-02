using BTL.Data;
using BTL.Infrastructure;
using BTL.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace BTL.Controllers
{
    public class CartController : Controller
    {
        public Cart? Cart { get; set; }
        private StoreContext db;
        public CartController(StoreContext db)
        {
            this.db = db;
        }
        public IActionResult Index()
        {
            ViewBag.SizeName = TempData["sn"];
            ViewBag.ColorName = TempData["cn"];
            ViewBag.BrandName = TempData["bn"];
            ViewBag.ProductImage = TempData["pi"];
            return View("Cart", HttpContext.Session.GetJson<Cart>("cart") ?? new Cart());
        }
        public IActionResult AddToCart(string id)
        {
            if (HttpContext.Session.GetString("LoginID") != null)
            {
                var product = db.Products.SingleOrDefault(x => x.ProductID == id);
                ViewBag.Size = new SelectList(db.Sizes, "SizeID", "SizeName");
                ViewBag.Color = new SelectList(db.Colors, "ColorID", "ColorName");
                return View(product);
            }
            return RedirectToAction("Index", "Login"); 
        }

        public IActionResult AddTCart(string id)
        {
            Product? product = db.Products.FirstOrDefault(p => p.ProductID == id);
            if (product != null)
            {
                //Khong co thi tao moi
                Cart = HttpContext.Session.GetJson<Cart>("cart") ?? new Cart();
                Cart.AddItem(product, 1);
                HttpContext.Session.SetJson("cart", Cart);
                var a = db.Products.Include(s => s.Size).Include(c => c.Color).Include(t => t.Type).FirstOrDefault(p => p.ProductID == id);
                TempData["sn"] = a.Size.SizeName;
                TempData["cn"] = a.Color.ColorName;
                TempData["bn"] = a.Type.TypeName;
                TempData["pi"] = a.ProductImagePath;
                ViewBag.SizeName = a.Size.SizeName;
                ViewBag.ColorName = a.Color.ColorName;
                ViewBag.BrandName = a.Type.TypeName;
                ViewBag.ProductImage = a.ProductImagePath;
            }
            return View("Cart", Cart);
        }
        public IActionResult UpTCart(string id)
        {
            Product? product = db.Products.FirstOrDefault(p => p.ProductID == id);
            if (product != null)
            {
                //Khong co thi tao moi
                Cart = HttpContext.Session.GetJson<Cart>("cart") ?? new Cart();
                Cart.AddItem(product, -1);
                HttpContext.Session.SetJson("cart", Cart);
                var a = db.Products.Include(s => s.Size).Include(c => c.Color).Include(t => t.Type).FirstOrDefault(p => p.ProductID == id);
                TempData["sn"] = a.Size.SizeName;
                TempData["cn"] = a.Color.ColorName;
                TempData["bn"] = a.Type.TypeName;
                ViewBag.SizeName = a.Size.SizeName;
                ViewBag.ColorName = a.Color.ColorName;
                ViewBag.BrandName = a.Type.TypeName;
            }
            return View("Cart", Cart);
        }
        public IActionResult RemoveFromCart(string id)
        {
            Product? product = db.Products.FirstOrDefault(p => p.ProductID == id);
            if (product != null)
            {
                Cart = HttpContext.Session.GetJson<Cart>("cart");
                Cart.RemoveLine(product);
                HttpContext.Session.SetJson("cart", Cart);
            }
            return View("Cart", Cart);
        }

    }
}
