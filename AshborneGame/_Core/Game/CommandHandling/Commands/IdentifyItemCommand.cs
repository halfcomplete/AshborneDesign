
using AshborneGame._Core._Player;
using AshborneGame._Core.Data.BOCS.ItemSystem;
using AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviourModules;
using AshborneGame._Core.Globals.Interfaces;
using AshborneGame._Core.Globals.Services;

namespace AshborneGame._Core.Game.CommandHandling.Commands
{
    internal class IdentifyItemCommand : ICommand
    {
        public string Name => "IdentifyItemCommand";
        public string Description => "Identifies an in-game item for further details.";

        public bool TryExecute(List<string> args, Player player)
        {
            if (args.Count == 0)
            {
                IOService.Output.WriteLine("Identify what? Specify an item.");
                return false;
            }
            string itemName = string.Join(" ", args).Trim();
            Item? item = player.Inventory.GetItem(itemName);
            if (item != null)
            {
                if (!item.TryGetBehaviour<IIdentifiable>(out var identifiableBehaviour))
                {
                    IOService.Output.WriteLine($"{item.Name} cannot be inspected.");
                    return false;
                }
                IOService.Output.WriteLine($"Identifying {item.Name}: {item.Description}");
                identifiableBehaviour.Identify();
                return true;
            }
            else
            {
                IOService.Output.WriteLine($"You don't have a {itemName} to identify.");
                return false;
            }
        }
    }
}
