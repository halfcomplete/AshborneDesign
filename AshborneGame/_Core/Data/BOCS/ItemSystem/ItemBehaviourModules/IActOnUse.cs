
namespace AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviourModules
{
    public interface IActOnUse
    {
        bool ConsumeOnUse { get; set; }
        void OnUse();
    }
}
