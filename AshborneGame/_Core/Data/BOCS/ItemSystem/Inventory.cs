using AshborneGame._Core.Data.BOCS.CommonBehaviourModules;
using AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviourModules;
using AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviours;
using AshborneGame._Core.Game;
using AshborneGame._Core.Globals.Services;
using System.Text;

namespace AshborneGame._Core.Data.BOCS.ItemSystem
{
    /// <summary>
    /// Represents a collection of items that can be carried by a player or stored in a container.
    /// Uses InventorySlot to manage item stacking and quantities.
    /// </summary>
    public class Inventory
    {
        /// <summary>
        /// Internal list of inventory slots.
        /// </summary>
        private readonly List<InventorySlot> _slots = new();

        /// <summary>
        /// Public read-only view of the inventory slots.
        /// </summary>
        public IReadOnlyList<InventorySlot> Slots => _slots.AsReadOnly();

        /// <summary>
        /// Initializes a new empty inventory.
        /// </summary>
        public Inventory() { }

        /// <summary>
        /// Adds an item to the inventory, stacking where possible.
        /// </summary>
        public void AddItem(Item item, int count = 1)
        {
            if (item == null)
                throw new ArgumentNullException(nameof(item));
            if (count <= 0)
                throw new ArgumentException("Count must be greater than 0.", nameof(count));

            int remaining = count;

            // Fill existing stacks
            foreach (var slot in _slots)
            {
                if (slot.Item.Name == item.Name && !slot.IsFull)
                {
                    remaining = slot.Add(remaining);
                    if (remaining <= 0) return;
                }
            }

            // Create new stacks
            while (remaining > 0)
            {
                int toAdd = Math.Min(item.StackLimit, remaining);
                var newItem = new Item(
                    item.Name, item.Description, item.UseDescription, item.StackLimit, item.ItemType, item.Quality
                );

                // Deep clone behaviours if applicable
                foreach (var kvp in item.Behaviours)
                {
                    if (kvp.Key is IBreakable)
                    {
                        continue;
                    }

                    foreach (var behaviour in kvp.Value)
                    {
                        dynamic dynamicBehaviour = behaviour;
                        var clone = dynamicBehaviour.DeepClone();
                        newItem.AddBehaviour(kvp.Key, clone);
                        if (clone is IAwareOfParentObject awareOfParent)
                        {
                            awareOfParent.ParentObject = newItem;
                        }
                    }
                }
                
                _slots.Add(new InventorySlot(newItem, toAdd));
                remaining -= toAdd;
            }
        }

        /// <summary>
        /// Removes a quantity of an item from the inventory.
        /// </summary>
        public void RemoveItem(Item item, int count = 1)
        {
            if (item == null)
                throw new ArgumentNullException(nameof(item));
            if (count <= 0)
                throw new ArgumentException("Count must be greater than 0.", nameof(count));

            var relevantSlots = _slots
                .Where(s => s.Item.Name == item.Name)
                .OrderByDescending(s => s.Quantity)
                .ToList();

            int removed = 0;

            foreach (var slot in relevantSlots)
            {
                if (removed >= count) break;

                int needed = count - removed;
                int taken = slot.Remove(needed);
                removed += taken;

                if (slot.IsEmpty)
                    _slots.Remove(slot);
            }

            if (removed < count)
                throw new InvalidOperationException($"Tried to remove {count}, but only removed {removed}.");
        }

        /// <summary>
        /// Finds the first item by name.
        /// </summary>
        public Item? GetItem(string itemName)
        {
            return _slots
                .Select(slot => slot.Item)
                .FirstOrDefault(item => item.Name.Equals(itemName, StringComparison.OrdinalIgnoreCase));
        }

        /// <summary>
        /// Returns a textual summary of the inventory.
        /// </summary>
        public (bool, string) GetInventoryContents()
        {
            if (_slots.Count == 0)
                return (true, "");

            var sb = new StringBuilder();
            foreach (var slot in _slots)
            {
                var equipped = string.Empty;
                if (slot.Item.TryGetBehaviour<IEquippable>(out var equippableBehaviour) && equippableBehaviour.EquipInfo.IsEquippable)
                {
                    // If the item is equippable, check if it's equipped
                    var isEquipped = GameEngine.Player.EquippedItems.TryGetValue(slot.Item.Name.ToLower(), out var equippedItem) && equippedItem != null;
                    equipped = isEquipped ? " (Equipped)" : "";
                }
                
                sb.AppendLine($"{slot.Quantity} x {slot.Item.Name} - {slot.Item.Description}{equipped}");
            }

            return (false, sb.ToString());
        }

        public void PrintInventoryContents()
        {
            var (isEmpty, contents) = GetInventoryContents();
            if (isEmpty)
            {
                IOService.Output.WriteLine("Your inventory is empty.");
            }
            else
            {
                IOService.Output.WriteLine("Your inventory contains:");
                IOService.Output.WriteLine(contents);
            }
        }

        /// <summary>
        /// Transfers items between two inventories.
        /// </summary>
        public void TransferItem(Inventory originInventory, Inventory destinationInventory, Item item, int count)
        {
            IOService.Output.WriteLine($"Transferring {count} x {item.Name} from {originInventory.GetType().Name} to {destinationInventory.GetType().Name}.");
            originInventory.RemoveItem(item, count);
            destinationInventory.AddItem(item, count);
        }

        public void TransferAllItems(Inventory originInventory, Inventory destinationInventory)
        {
            IOService.Output.WriteLine($"Transferring all items from {originInventory.GetType().Name} to {destinationInventory.GetType().Name}.");
            
            var uneditedInventory = new Inventory();
            uneditedInventory._slots.AddRange(originInventory.Slots.Select(slot => new InventorySlot(slot.Item, slot.Quantity)));
            foreach (var slot in uneditedInventory.Slots)
            {
                if (!slot.IsEmpty)
                {
                    destinationInventory.AddItem(slot.Item, slot.Quantity);
                    originInventory.RemoveItem(slot.Item, slot.Quantity);
                }
            }
        }
    }
}
