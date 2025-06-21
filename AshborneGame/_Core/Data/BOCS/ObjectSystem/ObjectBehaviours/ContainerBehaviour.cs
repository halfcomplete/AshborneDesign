using AshborneGame._Core.Data.BOCS.ItemSystem;
using AshborneGame._Core.Data.BOCS.NPCSystem.NPCBehaviourModules;

namespace AshborneGame._Core.Data.BOCS.ObjectSystem.ObjectBehaviours
{
    public class ContainerBehaviour : IHasInventory
    {
        public Inventory Inventory { get; private set; } = new Inventory();
    }
}
