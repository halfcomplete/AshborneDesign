using AshborneGame._Core._Player;
using AshborneGame._Core.Data.BOCS.ObjectSystem.ObjectBehaviourModules;
using AshborneGame._Core.Data.BOCS.ObjectSystem.ObjectBehaviours;
using AshborneGame._Core.Globals.Enums;
using AshborneGame._Core.Globals.Interfaces;
using AshborneGame._Core.Globals.Services;
using AshborneGame._Core.Scenes;

namespace AshborneGame._Core.Game.CommandHandling.Commands
{
    public class OpenCommand : ICommand
    {
        public string Name => "open";
        public string Description => "Opens an object.";

        public bool TryExecute(List<string> args, Player player)
        {
            if (args.Count == 0)
            {
                IOService.Output.WriteLine("Open what? Specify an object.");
                return false;
            }

            string objectName = string.Join(" ", args).Trim();
            Sublocation? sublocation = player.CurrentSublocation;

            if (sublocation == null)
            {
                IOService.Output.WriteLine("There's nothing to open here.");
                return false;
            }

            if (sublocation.Object.TryGetBehaviour<IInteractable>(out var openCloseBehaviour) && openCloseBehaviour is ContainerBehaviour)
            {
                if (sublocation.Object.TryGetBehaviour<IInteractable>(out var lockUnlockBehaviour) && lockUnlockBehaviour is LockUnlockBehaviour)
                {
                    LockUnlockBehaviour lockUnlockBehaviour1 = (LockUnlockBehaviour)lockUnlockBehaviour;
                    if (lockUnlockBehaviour1.IsLocked)
                    {
                        IOService.Output.WriteLine($"You cannot open {objectName} because it is locked.");
                        return false;
                    }
                    else
                    {
                        openCloseBehaviour.Interact(ObjectInteractionTypes.Open);
                        return true;
                    }
                }
                return false;
            }
            else
            {
                IOService.Output.WriteLine($"You cannot open that.");
                return false;
            }
        }
    }
}
