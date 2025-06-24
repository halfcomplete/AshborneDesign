using AshborneGame._Core.Data.BOCS.ObjectSystem.ObjectBehaviours;
using AshborneGame._Core.Data.BOCS.NPCSystem.NPCBehaviourModules;
using AshborneGame._Core.Data.BOCS.ObjectSystem.ObjectBehaviourModules;

namespace AshborneGame._Core.Data.BOCS.ObjectSystem
{
    public static class GameObjectFactory
    {
        public static GameObject CreateChest(string name, string description, bool isLocked = false, bool isOpen = false)
        {
            var gameObject = new GameObject(name, description);
            gameObject.AddBehaviour(typeof(IHasInventory), new ContainerBehaviour());
            gameObject.AddBehaviour(typeof(IInteractable), new OpenCloseBehaviour(gameObject, isOpen));
            gameObject.AddBehaviour(typeof(IInteractable), new LockUnlockBehaviour(gameObject, isLocked));
            return gameObject;
        }
    }
}
