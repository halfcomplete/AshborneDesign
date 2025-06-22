using AshborneGame._Core.Game;
using AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviourModules;
using AshborneGame._Core.Globals.Services;
using AshborneGame._Core.Globals.Enums;

namespace AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviours.PlayerRelatedBehaviours
{
    internal class OnUseHealPlayerBehaviour : ItemBehaviourBase<OnUseHealPlayerBehaviour>, IActOnUse
    {
        public bool ConsumeOnUse { get; set; }
        public int HealAmount { get; private set; }
        public OnUseHealPlayerBehaviour(int healAmount, bool consumeOnUse = true)
        {
            HealAmount = healAmount;
            ConsumeOnUse = consumeOnUse;
        }
        public void OnUse()
        {
            // Logic to heal the player
            GameEngine.Player.ChangeHealth(HealAmount);
            IOService.Output.WriteLine($"You heal for {HealAmount} HP. You now have {GameEngine.Player.Stats.GetStat(PlayerStatTypes.Health)} HP.");
        }

        public override OnUseHealPlayerBehaviour DeepClone()
        {
            return new OnUseHealPlayerBehaviour(HealAmount, ConsumeOnUse) { ConsumeOnUse = this.ConsumeOnUse };
        }
    }
}
