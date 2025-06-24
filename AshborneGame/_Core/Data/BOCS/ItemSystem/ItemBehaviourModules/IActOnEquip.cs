
using AshborneGame._Core._Player;

namespace AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviourModules
{
    public interface IActOnEquip
    {
        void OnEquip(Player player);
        void OnUnequip(Player player);
    }
}
