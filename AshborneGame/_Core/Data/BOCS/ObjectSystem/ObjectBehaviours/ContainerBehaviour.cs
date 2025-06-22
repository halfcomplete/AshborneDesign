using AshborneGame._Core.Data.BOCS.ItemSystem;
using AshborneGame._Core.Data.BOCS.NPCSystem.NPCBehaviourModules;
using AshborneGame._Core.Data.BOCS.ObjectSystem.ObjectBehaviourModules;
using AshborneGame._Core.Game;
using AshborneGame._Core.Globals.Enums;
using AshborneGame._Core.Globals.Services;

namespace AshborneGame._Core.Data.BOCS.ObjectSystem.ObjectBehaviours
{
    public class ContainerBehaviour : IHasInventory
    {
        public bool IsOpen { get; private set; }
        public bool IsLocked { get; private set; }
        public Inventory Inventory { get; private set; } = new Inventory();

        public ContainerBehaviour(bool isOpen, bool isLocked)
        {
            IsOpen = isOpen;
            IsLocked = isLocked;
        }
    }
}
