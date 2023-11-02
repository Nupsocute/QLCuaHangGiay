using Azure;
using BTL.Data;
using BTL.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Security.Cryptography;
using X.PagedList;

namespace BTL.Controllers
{
    public class ShopController : Controller
    {
        private StoreContext db;
        public ShopController(StoreContext db)
        {
            this.db = db;
        }
        public IActionResult Index(string tid, int? page)
        {
            if (tid == null)
            {
                int pageSize = 9;
                int pageNumber = page == null || page < 0 ? 1 : page.Value;
                var products = db.Products.AsNoTracking().Include(s => s.Type).ToList(); 
                PagedList<Product> lst = new PagedList<Product>(products, pageNumber, pageSize);
                return View(lst);
            }
            else
            {
                int pageSize = 9;
                int pageNumber = page == null || page < 0 ? 1 : page.Value;
                var products = db.Products.AsNoTracking().Where(l => l.TypeID == tid).Include(s => s.Type).ToList();
                PagedList<Product> lst = new PagedList<Product>(products, pageNumber, pageSize);
                ViewBag.tid = tid;
                return View(lst);                   
            }
        }
        public IActionResult Index1()
        {
            return View("Index1");
        }

        

    }
}
