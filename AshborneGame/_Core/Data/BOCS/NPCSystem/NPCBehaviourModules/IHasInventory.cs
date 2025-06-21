using AshborneGame._Core.Data.BOCS.ItemSystem;
    
namespace AshborneGame._Core.Data.BOCS.NPCSystem.NPCBehaviourModules
{
    public interface IHasInventory
    {
        Inventory Inventory { get; }
    }
}
