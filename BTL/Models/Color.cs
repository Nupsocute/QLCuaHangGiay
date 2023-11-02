using System.ComponentModel.DataAnnotations;

namespace BTL.Models
{
    public class Color
    {
        public Color() 
        {
            Products = new HashSet<Product>();
        }
        public string ColorID { get; set; }
        public string ColorName { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
