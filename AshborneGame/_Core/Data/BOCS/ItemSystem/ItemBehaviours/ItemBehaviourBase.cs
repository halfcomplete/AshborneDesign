namespace AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviours
{
    public abstract class ItemBehaviourBase<T>
    {
        public abstract T DeepClone();
    }
}
