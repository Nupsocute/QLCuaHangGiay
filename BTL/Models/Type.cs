using System.ComponentModel.DataAnnotations;

namespace BTL.Models
{
    public class Type
    {
        public Type() 
        {
            Products = new HashSet<Product>();
        }
        [Key]
        public string TypeID {  get; set; }
        public string TypeName { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
