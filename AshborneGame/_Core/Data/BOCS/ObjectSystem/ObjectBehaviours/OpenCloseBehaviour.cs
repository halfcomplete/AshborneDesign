using AshborneGame._Core.Data.BOCS.CommonBehaviourModules;
using AshborneGame._Core.Data.BOCS.ObjectSystem.ObjectBehaviourModules;
using AshborneGame._Core.Game;
using AshborneGame._Core.Globals.Enums;
using AshborneGame._Core.Globals.Services;

namespace AshborneGame._Core.Data.BOCS.ObjectSystem.ObjectBehaviours
{
    public class OpenCloseBehaviour: IInteractable, IAwareOfParentObject
    {
        public BOCSGameObject ParentObject { get; set; }

        public bool IsOpen { get; private set; } = false;

        public OpenCloseBehaviour(BOCSGameObject parentObject, bool initialState)
        {
            ParentObject = parentObject;
            IsOpen = initialState;
        }

        public void Interact(ObjectInteractionTypes _interaction)
        {
            switch (_interaction)
            {
                case ObjectInteractionTypes.Open:
                    Open();
                    break;
                case ObjectInteractionTypes.Close:
                    Close();
                    break;
                default:
                    IOService.Output.WriteLine("Invalid interaction type for OpenCloseBehaviour.");
                    break;
            }
        }

        private void Open()
        {
            var behaviours = ParentObject.GetAllBehaviours<IInteractable>();

            if (behaviours.FirstOrDefault(s => s.GetType() == typeof(LockUnlockBehaviour)) is LockUnlockBehaviour lockBehaviour && lockBehaviour.IsLocked)
            {
                IOService.Output.WriteLine($"The {ParentObject.Name} is locked. You need to unlock it first.");
                return;
            }

            if (IsOpen)
            {
                IOService.Output.WriteLine($"The {ParentObject.Name} is already open.");
                return;
            }

            IsOpen = true;
            if (behaviours.FirstOrDefault(s => s.GetType() == typeof(ContainerBehaviour)) is ContainerBehaviour containerBehaviour)
            {
                GameEngine.Player.OpenedInventory = containerBehaviour.Inventory;
                IOService.Output.WriteLine($"You open the {ParentObject.Name}.");
                (bool isEmpty, string contents) = containerBehaviour.Inventory.GetInventoryContents();
                if (!isEmpty)
                {
                    IOService.Output.WriteLine($"Inside the {ParentObject.Name} you see:");
                    IOService.Output.WriteLine(contents);
                }
                else
                {
                    IOService.Output.WriteLine($"The {ParentObject.Name} is empty.");
                }
            }
        }

        private void Close()
        {
            if (!IsOpen)
            {
                IOService.Output.WriteLine($"The {ParentObject.Name} is already closed.");
                return;
            }
            
            IsOpen = false;
            GameEngine.Player.OpenedInventory = null;
            IOService.Output.WriteLine($"You close the {ParentObject.Name}.");
        }
    }
}
