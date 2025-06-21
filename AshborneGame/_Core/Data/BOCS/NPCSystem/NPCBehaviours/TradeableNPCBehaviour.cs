using AshborneGame._Core.Data.BOCS.ItemSystem;
using AshborneGame._Core.Data.BOCS.NPCSystem.NPCBehaviourModules;

namespace AshborneGame._Core.Data.BOCS.NPCSystem.NPCBehaviours
{
    public class TradeableNPCBehaviour : IHasInventory
    {
        public Inventory Inventory { get; private set; } = new Inventory();

        public bool IsTradeable { get; set; } = true;
    }
}
