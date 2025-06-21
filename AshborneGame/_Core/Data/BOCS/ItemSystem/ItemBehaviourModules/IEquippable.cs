
namespace AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviourModules
{
    public interface IEquippable
    {
        (bool IsEquippable, List<string> BodyParts) EquipInfo { get; set; }

        void Equip(Item item, string bodyPart);

        void Unequip(Item item, string bodyPart);
    }
}
