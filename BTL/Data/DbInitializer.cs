using BTL.Models;
using Microsoft.EntityFrameworkCore;
using Type = BTL.Models.Type;

namespace BTL.Data
{
    public class DbInitializer
    {
        public static void Initializer(IServiceProvider serviceProvider)
        {
            using (var context = new StoreContext(serviceProvider.GetRequiredService<DbContextOptions<StoreContext>>())) 
            {
                return;
            }
        }
    }
}
