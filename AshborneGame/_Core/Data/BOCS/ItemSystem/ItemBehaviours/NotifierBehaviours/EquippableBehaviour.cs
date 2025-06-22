using AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviourModules;
using AshborneGame._Core.Game;
using AshborneGame._Core.Globals.Services;
using AshborneGame._Core.Globals.Enums;

namespace AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviours.NotifierBehaviours
{
    public class EquippableBehaviour : ItemBehaviourBase<EquippableBehaviour>, IEquippable
    {
        public (bool IsEquippable, List<string> BodyParts) EquipInfo { get; set; }

        public EquippableBehaviour(List<string> bodyParts, bool isEquippable = true)
        {
            if (bodyParts == null || bodyParts.Count == 0)
            {
                throw new ArgumentException("Body parts cannot be null or empty.", nameof(bodyParts));
            }
            EquipInfo = (isEquippable, bodyParts);
        }

        public void Equip(Item item, string bodyPart)
        {
            if (string.IsNullOrWhiteSpace(bodyPart) || !GameEngine.Player.EquippedItems.ContainsKey(bodyPart.ToLower()) || !EquipInfo.BodyParts.Contains(bodyPart))
            {
                throw new ArgumentException($"Invalid equipment slot: {bodyPart}", nameof(bodyPart));
            }

            GameEngine.Player.EquipItem(item, bodyPart);
            IOService.Output.DisplayDebugMessage($"Equipped {item.Name} in the {bodyPart} slot.", ConsoleMessageTypes.INFO);
            IOService.Output.WriteLine($"You equip {item.Name} on your {bodyPart}.");
            IOService.Output.DisplayDebugMessage($"Item Behaviour Values: {item.Behaviours.Values.SelectMany(x => x).OfType<IActOnEquip>().Count()}", ConsoleMessageTypes.INFO);
            foreach (var behaviour in item.Behaviours)
            {
                IOService.Output.DisplayDebugMessage($"Behaviour Type: {behaviour.Key.Name}, Count: {behaviour.Value.Count}", ConsoleMessageTypes.INFO);
            }
            foreach (var behaviour in item.Behaviours.Values.SelectMany(x => x).OfType<IActOnEquip>())
            {
                behaviour.OnEquip();
            }
        }

        public void Unequip(Item item, string bodyPart)
        {
            if (string.IsNullOrWhiteSpace(bodyPart) || !GameEngine.Player.EquippedItems.ContainsKey(bodyPart.ToLower()))
            {
                throw new ArgumentException($"Invalid equipment slot: {bodyPart}", nameof(bodyPart));
            }

            if (GameEngine.Player.EquippedItems[bodyPart] == null)
            {
                throw new InvalidOperationException($"No item is currently equipped in the {bodyPart} slot.");
            }
            GameEngine.Player.UnequipItem(item, bodyPart);

            foreach (var behaviour in item.Behaviours.Values.SelectMany(x => x).OfType<IActOnEquip>())
            {
                behaviour.OnUnequip();
            }
        }

        public override EquippableBehaviour DeepClone()
        {
            return new EquippableBehaviour(new List<string>(EquipInfo.BodyParts), EquipInfo.IsEquippable);
        }
    }
}
