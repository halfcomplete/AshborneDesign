using AshborneGame._Core._Player;
using AshborneGame._Core.Data.BOCS.ItemSystem;
using AshborneGame._Core.Data.BOCS.NPCSystem.NPCBehaviourModules;
using AshborneGame._Core.Globals.Interfaces;
using AshborneGame._Core.Globals.Services;
using AshborneGame._Core.Game.CommandHandling.Commands.BaseCommands;

namespace AshborneGame._Core.Game.CommandHandling.Commands.InventoryCommands
{
    internal class GiveCommand : BaseInventoryCommand, ICommand
    {
        public override string Name => "give";
        public override string Description => "Takes something from the player and gives it to someone / something else.";

        public override bool TryExecute(List<string> args, Player player)
        {
            if (args.Count == 0)
            {
                IOService.Output.WriteLine("Give what? Specify an item and optionally a quantity (e.g. 'give 3 gold coin').");
                return false;
            }

            int quantity = ParseQuantity(ref args);
            if (quantity == 0)
            {
                IOService.Output.WriteLine("Invalid amount.");
                return false;
            }

            string itemName = string.Join(" ", args).Trim();
            Inventory originInventory = player.Inventory;
            Inventory? destinationInventory = ResolveDestinationInventory(player);

            if (quantity < 0 && string.IsNullOrEmpty(itemName))
            {
                return GiveAllItems(originInventory, destinationInventory);
            }

            if (destinationInventory == null)
            {
                IOService.Output.WriteLine("You are not targeting a container or an NPC with an inventory.");
                return false;
            }

            if (string.IsNullOrEmpty(itemName))
            {
                IOService.Output.WriteLine("Give what? Specify an item.");
                return false;
            }

            Item? item = originInventory.GetItem(itemName);
            if (item == null)
            {
                IOService.Output.WriteLine($"You cannot give {itemName} because it is not in your inventory.");
                return false;
            }

            int availableCount = originInventory.Slots
                .Where(slot => slot.Item.Name == item.Name)
                .Sum(slot => slot.Quantity);

            if (quantity < 0)
            {
                quantity = availableCount;
            }

            if (availableCount < quantity)
            {
                IOService.Output.WriteLine($"You don't have enough {itemName} to give {quantity}.");
                return false;
            }

            originInventory.TransferItem(originInventory, destinationInventory, item, quantity);
            IOService.Output.WriteLine($"Successfully gave {quantity} x {item.Name}.");

            ShowInventorySummary(player.Inventory, "Your inventory now contains:");
            ShowInventorySummary(destinationInventory, "The opened container / NPC now has:");

            return true;
        }

        private Inventory? ResolveDestinationInventory(Player player)
        {
            if (player.OpenedInventory != null)
                return player.OpenedInventory;

            if (player.CurrentNPCInteraction != null &&
                player.CurrentNPCInteraction.TryGetBehaviour<IHasInventory>(out var npcInventory))
            {
                return npcInventory.Inventory;
            }

            return null;
        }

        private bool GiveAllItems(Inventory origin, Inventory? destination)
        {
            if (destination == null)
            {
                IOService.Output.WriteLine("There is no opened container or NPC to give items to.");
                return false;
            }

            origin.TransferAllItems(origin, destination);
            IOService.Output.WriteLine("You gave all your items.");

            ShowInventorySummary(origin, "Your inventory is now empty.");
            ShowInventorySummary(destination, "The opened container / NPC now has:");

            return true;
        }
    }
}
