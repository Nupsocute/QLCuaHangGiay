using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace BTL.Models
{
    public class User
    {
        public User() 
        {
            Orders = new HashSet<Order>();
        }
        public string UserID { get; set; }
        [StringLength(100, MinimumLength = 4, ErrorMessage = "Name length must be between 4 and 100")]
        [Required(ErrorMessage = "Name is required")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Email is reqiured")]
        [RegularExpression(@"[A-Za-z0-9._%+-]+@gmail\.com",
        ErrorMessage = "Email must end with @gmail.com")]
        public string Email { get; set; }
        public string Phone { get; set; }
        [DisplayName("Địa chỉ")]
        [DataType(DataType.MultilineText)]
        [Required(ErrorMessage = "Adress is required")]
        public string Address { get; set; }
        public string LoginID { get; set; }
        public virtual Login? Login { get; set; }
        public virtual ICollection<Order> Orders { get; set;}
    }
}
