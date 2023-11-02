using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Runtime.CompilerServices;

namespace BTL.Models
{
    public class Product
    {
        public Product() 
        {
            OrderDetails = new HashSet<OrderDetail>();
        }
        [Key]
        public string ProductID {  get; set; }
        public string ProductName { get; set; }
        [Column(TypeName = "decimal(18,2)")]
        public decimal ProductPrice { get; set; }
        public string ProductImagePath { get; set; }
        public string ColorID { get; set; }
        public string SizeID { get; set; }
        public string TypeID { get; set; }
        public virtual Color? Color { get; set; }
        public virtual Size? Size { get; set;}
        public virtual Type? Type { get; set;}
        [NotMapped]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
