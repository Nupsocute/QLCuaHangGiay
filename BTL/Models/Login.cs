using System.ComponentModel.DataAnnotations;

namespace BTL.Models
{
    public class Login
    {
        public Login() 
        {
            Users = new HashSet<User>();
        }
        public string LoginID { get; set; }
        public string LoginName { get; set; }
        public string Password { get; set; }
        public string RoleID {  get; set; }
        public virtual Role? Role { get; set; }
        public virtual ICollection<User> Users { get; set;}
    }
}
