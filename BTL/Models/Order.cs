using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BTL.Models
{
    public class Order
    {
        public Order() 
        {
            OrderDetails = new HashSet<OrderDetail>();
        }
        public string OrderID { get; set; }
        public string UserID { get; set; }
        public DateTime CreatedDate { get; set; }
        public virtual User? User { get; set; }
        [NotMapped]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
