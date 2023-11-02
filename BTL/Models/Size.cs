    using System.ComponentModel.DataAnnotations;
using System.Security.Cryptography.X509Certificates;

namespace BTL.Models
{
    public class Size
    {
        public Size()
        {
            Products = new HashSet<Product>();
        }
        public string SizeID { get; set; }
        public string SizeName { get; set; }

        public string? Description { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
