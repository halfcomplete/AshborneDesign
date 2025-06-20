
namespace AshborneGame.Data.BOCS.ItemSystem.ItemBehaviourModules
{
    internal interface IActOnUse
    {
        bool ConsumeOnUse { get; set; }
        void OnUse();
    }
}
