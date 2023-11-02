using BTL.Data;
using BTL.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Drawing;

namespace BTL.Controllers
{
    public class StoreController : Controller
    {
        private StoreContext db;
        public StoreController(StoreContext db)
        {
            this.db = db;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult AddToCart(int MaSanPham) 
        {
            var sp = (MaSanPham);
            return View();
        }
    }
}
