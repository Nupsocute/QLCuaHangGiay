using BTL.Data;
using BTL.Models;
using Microsoft.AspNetCore.Mvc;

namespace BTL.ViewComponents
{
    public class TypeViewComponent : ViewComponent
    {
        StoreContext db;
        List<Models.Type> types;
        public TypeViewComponent(StoreContext _context)
        {
           db = _context;
           types = db.Types.ToList();
        }
        public async Task<IViewComponentResult> InvokeAsync()
        {
            return View("RenderType", types);
        }
    }
}
