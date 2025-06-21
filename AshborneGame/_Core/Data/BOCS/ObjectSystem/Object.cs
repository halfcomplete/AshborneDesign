
namespace AshborneGame._Core.Data.BOCS.ObjectSystem
{
    public class Object : BOCSGameObject
    {
        public override string Name { get; }

        public Object(string name)
        {
            Name = name ?? throw new ArgumentNullException(nameof(name), "Object name cannot be null.");
        }
    }
}
