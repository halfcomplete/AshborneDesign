
namespace AshborneGame._Core.Data.BOCS.ItemSystem
{
    public class InventorySlot
    {
        public Item Item { get; }
        public int Quantity { get; private set; }

        public bool IsFull => Quantity >= Item.StackLimit;

        public InventorySlot(Item item, int quantity = 1)
        {
            Item = item ?? throw new ArgumentNullException(nameof(item));
            Quantity = Math.Clamp(quantity, 0, item.StackLimit);
        }

        /// <summary>
        /// Returns the number of items that could not be added due to stack limit but also adds as many as possible.
        /// </summary>
        /// <param name="amount"></param>
        /// <returns></returns>
        public int Add(int amount)
        {
            int space = Item.StackLimit - Quantity;
            int toAdd = Math.Min(space, amount);
            Quantity += toAdd;
            return amount - toAdd; // leftover
        }

        /// <summary>
        /// Returns the number of items that could not be removed due to insufficient quantity but also removes as many as possible.
        /// </summary>
        /// <param name="amount"></param>
        /// <returns></returns>
        public int Remove(int amount)
        {
            int toRemove = Math.Min(amount, Quantity);
            Quantity -= toRemove;
            return amount - toRemove;
        }

        public bool IsEmpty => Quantity <= 0;
    }

}
