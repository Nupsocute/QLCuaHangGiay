using BTL.Data;
using BTL.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using X.PagedList;

namespace BTL.Controllers
{
    public class AdminController : Controller
    {
        private StoreContext db;

        public AdminController(StoreContext context)
        {
            this.db = context;
        }
        //public IActionResult Index()
        //{

        //    var products = db.Products.ToList();
        //    return View(products);
        //}


        public IActionResult Index(int? page)
        {
            int pageSize = 5;
            int pagenumber = page == null || page < 0 ? 1 : page.Value;
            var LstSanPham = db.Products.Include(s => s.Size).Include(t => t.Type).Include(c => c.Color).AsNoTracking().OrderBy(p => p.ProductID);
            PagedList<Product> lst = new PagedList<Product>(LstSanPham, pagenumber, pageSize);
            return View(lst);
        }
        [HttpGet]
        public IActionResult Create()
        {
            ViewBag.ColorID = new SelectList(db.Colors.ToList(), "ColorID", "ColorID");
            ViewBag.SizeID = new SelectList(db.Sizes.ToList(), "SizeID", "SizeID");
            ViewBag.TypeID = new SelectList(db.Types.ToList(), "TypeID", "TypeID");
            return View();
        }
        [HttpPost]
        public IActionResult Create(Product pro)
        {
            if (ModelState.IsValid)
            {
                db.Products.Add(pro);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(pro);
        }

        [HttpGet]
        public IActionResult Edit(string ProductID)
        {
            ViewBag.ColorID = new SelectList(db.Colors.ToList(), "ColorID", "ColorID");
            ViewBag.SizeID = new SelectList(db.Sizes.ToList(), "SizeID", "SizeID");
            ViewBag.TypeID = new SelectList(db.Types.ToList(), "TypeID", "TypeID");
            if (ProductID == null || db.Products == null)
            {
                return NotFound();
            }
            var products = db.Products.Find(ProductID);
            if (products == null)
            {
                return NotFound();
            }
            return View(products);
        }
        [HttpPost]
        public IActionResult Edit(string ProductID, [Bind("ProductID,ProductName, ProductPrice, ProductImagePath, ColorID, SizeID, TypeID")] Product product)
        {
            if (ProductID != product.ProductID)
            {
                return NotFound();
            }
            if (ModelState.IsValid)
            {
                try
                {
                    db.Products.Update(product);
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(product.ProductID))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
            }
            return RedirectToAction("Index");
        }
        private bool ProductExists(string ProductID)
        {
            return (db.Products?.Any(e => e.ProductID == ProductID)).GetValueOrDefault();
        }


        [HttpGet]
        public IActionResult Delete(string ProductID)
        {
            if (ProductID == null || db.Products == null)
            {
                return NotFound();
            }
            var products = db.Products.FirstOrDefault(p => p.ProductID == ProductID);
            if (products == null)
            {
                return NotFound();
            }
            return View(products);
        }

        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(string ProductID)
        {
            if (db.Products == null)
            {
                return Problem("db.Product trống");
            }
            var products = db.Products.Find(ProductID);
            if (products != null)
            {
                db.Products.Remove(products);
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult OrderDetailsIndex(int? page, string OrderID)
        {
            ViewBag.OrderID = OrderID;
            int pageSize = 5;
            int pagenumber = page == null || page < 0 ? 1 : page.Value;
            var LstSanPham = db.OrderDetails
                                        .Include(O => O.Product)
                                        .ThenInclude(c => c.Color)
                                        .Include(O => O.Product)
                                        .ThenInclude(s => s.Size)
                                        .Include(O => O.Product)
                                        .ThenInclude(s => s.Type)
                                        .Where(s => s.OrderID == OrderID)
                                        .AsNoTracking().ToList(); ;
            PagedList<OrderDetail> lst = new PagedList<OrderDetail>(LstSanPham, pagenumber, pageSize);
            return View(lst);

        }


        public IActionResult OrderIndex(int? page)
        {
            int pageSize = 5;
            int pagenumber = page == null || page < 0 ? 1 : page.Value;
            var LstSanPham = db.Orders.AsNoTracking().ToList(); ;
            PagedList<Order> lst = new PagedList<Order>(LstSanPham, pagenumber, pageSize);
            return View(lst);
        }

    }
}



//thanh them
