using AshborneGame._Core.Data.BOCS.CommonBehaviourModules;
using AshborneGame._Core.Globals.Enums;
using AshborneGame._Core.Globals.Services;

namespace AshborneGame._Core.Data.BOCS.ObjectSystem.ObjectBehaviours
{
    public class LockUnlockBehaviour : IAwareOfParentObject
    {
        public BOCSGameObject ParentObject { get; set; } = null!;
        public bool IsLocked { get; private set; } = false;

        public LockUnlockBehaviour(BOCSGameObject parentObject, bool initialState = false)
        {
            ParentObject = parentObject ?? throw new ArgumentNullException(nameof(parentObject));
            IsLocked = initialState;
        }

        public void Interact(ObjectInteractionTypes _interaction)
        {
            switch (_interaction)
            {
                case ObjectInteractionTypes.Lock:
                    Lock();
                    break;
                case ObjectInteractionTypes.Unlock:
                    Unlock();
                    break;
                default:
                    IOService.Output.WriteLine("Invalid interaction type for LockUnlockBehaviour.");
                    break;
            }
        }

        private void Lock()
        {
            if (IsLocked)
            {
                IOService.Output.WriteLine($"The {ParentObject.Name} is already locked.");
                return;
            }

            IsLocked = true;
            IOService.Output.WriteLine($"You lock the {ParentObject.Name}.");
        }

        private void Unlock()
        {
            if (!IsLocked)
            {
                IOService.Output.WriteLine($"The {ParentObject.Name} is already unlocked.");
                return;
            }
            IsLocked = false;
            IOService.Output.WriteLine($"You unlock the {ParentObject.Name}.");
        }
    }
}
