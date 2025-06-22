using AshborneGame._Core._Player;
using AshborneGame._Core.Data.BOCS.ItemSystem;
using AshborneGame._Core.Data.BOCS.NPCSystem.NPCBehaviourModules;
using AshborneGame._Core.Globals.Interfaces;
using AshborneGame._Core.Globals.Services;
using AshborneGame._Core.Game.CommandHandling.Commands.BaseCommands;

namespace AshborneGame._Core.Game.CommandHandling.Commands.InventoryCommands
{
    internal class TakeCommand : BaseInventoryCommand, ICommand
    {
        public override string Name => "take";
        public override string Description => "Takes an item from an object or NPC.";

        public override bool TryExecute(List<string> args, Player player)
        {
            if (args.Count == 0)
            {
                IOService.Output.WriteLine("Take what? Specify an item and optionally a quantity (e.g. 'take 2 gold coin').");
                return false;
            }

            int quantity = ParseQuantity(ref args);
            if (quantity == 0)
            {
                IOService.Output.WriteLine("Invalid amount.");
                return false;
            }

            string itemName = string.Join(" ", args).Trim();
            Inventory? originInventory = ResolveSourceInventory(player);
            Inventory destinationInventory = player.Inventory;

            if (quantity < 0 && string.IsNullOrEmpty(itemName))
            {
                return TakeAllItems(originInventory, destinationInventory);
            }

            if (originInventory == null)
            {
                IOService.Output.WriteLine("There is no open container or NPC inventory to take items from.");
                return false;
            }

            if (string.IsNullOrEmpty(itemName))
            {
                IOService.Output.WriteLine("Take what? Specify an item.");
                return false;
            }

            Item? item = originInventory.GetItem(itemName);
            if (item == null)
            {
                IOService.Output.WriteLine($"You cannot take {itemName} because it is not present.");
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
                IOService.Output.WriteLine($"There are not enough {itemName} to take {quantity}.");
                return false;
            }

            originInventory.TransferItem(originInventory, destinationInventory, item, quantity);
            IOService.Output.WriteLine($"Successfully took {quantity} x {item.Name}.");

            ShowInventorySummary(player.Inventory, "Your inventory now contains:");
            ShowInventorySummary(originInventory, "The container / NPC now has:");

            return true;
        }

        private Inventory? ResolveSourceInventory(Player player)
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

        private bool TakeAllItems(Inventory? origin, Inventory destination)
        {
            if (origin == null)
            {
                IOService.Output.WriteLine("There is no open container or NPC to take items from.");
                return false;
            }

            origin.TransferAllItems(origin, destination);
            IOService.Output.WriteLine("You took all available items.");

            ShowInventorySummary(destination, "Your inventory now contains:");
            ShowInventorySummary(origin, "The container / NPC now has:");

            return true;
        }
    }
}
