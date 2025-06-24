
using AshborneGame._Core._Player;

namespace AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviourModules
{
    public interface IActOnUse
    {
        bool ConsumeOnUse { get; set; }
        void OnUse(Player player);
    }
}
