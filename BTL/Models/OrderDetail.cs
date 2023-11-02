namespace BTL.Models
{
    public class OrderDetail
    {
        public string OrderDetailID { get; set; }
        public string OrderID {  get; set; }
        public string ProductID {  get; set; }
        public int Quantity {  get; set; }
        public virtual Product? Product { get; set; }
        public virtual Order? Order { get; set; }
    }
}
