
namespace AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviourModules
{
    public interface IIdentifiable
    {
        bool IsIdentified { get; set; }

        void Identify();
    }
}
