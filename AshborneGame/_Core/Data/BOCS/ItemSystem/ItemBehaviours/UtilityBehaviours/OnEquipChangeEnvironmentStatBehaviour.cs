using AshborneGame._Core._Player;
using AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviourModules;
using AshborneGame._Core.Globals.Services;

namespace AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviours.UtilityBehaviours
{
    internal class OnEquipChangeEnvironmentStatBehaviour : ItemBehaviourBase<OnEquipChangeEnvironmentStatBehaviour>, IActOnEquip
    {
        string Message;
        public OnEquipChangeEnvironmentStatBehaviour(string message)
        {
            Message = message;
        }
        public void OnEquip(Player player)
        {
            IOService.Output.WriteLine(Message);
        }

        public void OnUnequip(Player player)
        {
            IOService.Output.WriteLine(Message);
        }

        public override OnEquipChangeEnvironmentStatBehaviour DeepClone()
        {
            return new OnEquipChangeEnvironmentStatBehaviour(Message);
        }
    }
}
