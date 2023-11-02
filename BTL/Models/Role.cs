using System.ComponentModel.DataAnnotations;

namespace BTL.Models
{
    public class Role
    {
        public Role() 
        {
            Logins = new HashSet<Login>();
        }
        public string RoleID { get; set; }
        public string RoleName { get; set; }
        public string? Description { get; set; }
        public virtual ICollection<Login> Logins { get; set; }
    }
}
