using Microsoft.EntityFrameworkCore;
using BTL.Models;
using Type = BTL.Models.Type;

namespace BTL.Data
{
    public class StoreContext : DbContext
    {
        public StoreContext(DbContextOptions<StoreContext> opstions) :base(opstions) { }
        public virtual DbSet<Color> Colors { get; set; }
        public virtual DbSet<Login> Logins { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Size> Sizes { get; set; }
        public virtual DbSet<Type> Types { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>().ToTable(nameof(Users));
            modelBuilder.Entity<Type>().ToTable(nameof(Types));
            modelBuilder.Entity<Size>().ToTable(nameof(Sizes));
            modelBuilder.Entity<Role>().ToTable(nameof(Roles));
            modelBuilder.Entity<Product>().ToTable(nameof(Products));
            modelBuilder.Entity<OrderDetail>().ToTable(nameof(OrderDetails));
            modelBuilder.Entity<Order>().ToTable(nameof(Orders));
            modelBuilder.Entity<Login>().ToTable(nameof(Login));
            modelBuilder.Entity<Color>().ToTable(nameof(Colors));  

            modelBuilder.Entity<OrderDetail>().HasKey(e => e.OrderDetailID);
            modelBuilder.Entity<Size>().HasKey(e => e.SizeID);
            modelBuilder.Entity<Role>().HasKey(e => e.RoleID);
            modelBuilder.Entity<User>().HasKey(e => e.UserID);
            modelBuilder.Entity<Type>().HasKey(e => e.TypeID);
            modelBuilder.Entity<Product>().HasKey(e => e.ProductID);
            modelBuilder.Entity<Order>().HasKey(e => e.OrderID);
            modelBuilder.Entity<Login>().HasKey(e => e.LoginID);
            modelBuilder.Entity<Color>().HasKey(e => e.ColorID);
        }
    }
}
