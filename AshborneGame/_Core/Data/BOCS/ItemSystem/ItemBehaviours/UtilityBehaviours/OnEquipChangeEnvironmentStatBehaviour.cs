using AshborneGame._Core.Globals.Services;
using AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviourModules;

namespace AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviours.UtilityBehaviours
{
    internal class OnEquipChangeEnvironmentStatBehaviour : ItemBehaviourBase<OnEquipChangeEnvironmentStatBehaviour>, IActOnEquip
    {
        string Message;
        public OnEquipChangeEnvironmentStatBehaviour(string message)
        {
            Message = message;
        }
        public void OnEquip()
        {
            IOService.Output.WriteLine(Message);
        }

        public void OnUnequip()
        {
            IOService.Output.WriteLine(Message);
        }

        public override OnEquipChangeEnvironmentStatBehaviour DeepClone()
        {
            return new OnEquipChangeEnvironmentStatBehaviour(Message);
        }
    }
}
