using AshborneGame._Core.Data.BOCS.ItemSystem;
using AshborneGame._Core.Globals.Enums;
using AshborneGame._Core.Globals.Services;

namespace AshborneGame._Core.Data.BOCS.ObjectSystem
{
    /// <summary>
    /// Represents a container object like a chest or box.
    /// </summary>
    public class Container : BOCSGameObject
    {
        public override string Name { get; }
        public string Description { get; }
        public bool IsLocked { get; private set; }
        public bool IsOpen { get; private set; }
        public bool IsInteractable { get; set; }

        private Inventory _inventory = new();

        /// <summary>
        /// Initializes a new instance of the Container class.
        /// </summary>
        /// <param name="name">The name of the container.</param>
        /// <param name="description">The description of the container.</param>
        /// <param name="isInteractive">Whether the container can be interacted with.</param>
        public Container(string name, string description, bool isInteractive, bool isLocked, bool isOpen)
        {
            Name = name ?? throw new ArgumentNullException(nameof(name));
            Description = description ?? throw new ArgumentNullException(nameof(description));
            IsInteractable = isInteractive;
            IsLocked = isLocked;
            IsOpen = isOpen;
            ID = Guid.NewGuid().ToString();
        }

        public Container(string name, string description, bool isLocked, bool isOpen)
            : this(name, description, true, isLocked, isOpen)
        {
        }

        public void SetupAddItem(Item item, int quantity = 1)
        {
            _inventory.AddItem(item, quantity);
        }

        public void AddItem(Item item, int quantity = 1)
        {
            if (IsLocked)
            {
                IOService.Output.WriteLine($"The {Name} is locked. You need to unlock it first.");
                return;
            }
            _inventory.AddItem(item, quantity);
            IOService.Output.WriteLine($"You add {quantity} x {item.Name} to the {Name}.");
        }

        public void Interact(ObjectInteractionTypes interactionType)
        {
            if (!IsInteractable)
            {
                IOService.Output.WriteLine($"The {Name} is not interactable.");
                return;
            }
        }
        

        
    }
}
