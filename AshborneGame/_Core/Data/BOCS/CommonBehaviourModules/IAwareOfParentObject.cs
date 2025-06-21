using AshborneGame._Core.Data.BOCS.ItemSystem;

namespace AshborneGame._Core.Data.BOCS.CommonBehaviourModules
{
    public interface IAwareOfParentObject
    {
        BOCSGameObject ParentObject { get; set; }

        public void SetParentItem(Item parentItem)
        {
            ParentObject = parentItem ?? throw new ArgumentNullException(nameof(parentItem), "Parent item cannot be null.");
        }
    }
}
