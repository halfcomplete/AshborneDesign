using AshborneGame._Core.Game;
using AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviourModules;
using AshborneGame._Core.Globals.Services;
using AshborneGame._Core.Globals.Enums;

namespace AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviours.PlayerRelatedBehaviours
{
    internal class OnUseDamagePlayerBehaviour : ItemBehaviourBase<OnUseDamagePlayerBehaviour>, IActOnUse
    {
        public bool ConsumeOnUse { get; set; }
        public int DamageAmount { get; private set; }
        public OnUseDamagePlayerBehaviour(int damageAmount, bool consumeOnUse = true)
        {
            DamageAmount = damageAmount;
            ConsumeOnUse = consumeOnUse;
        }
        public void OnUse()
        {
            // Logic to apply damage to the player
            GameEngine.Player.ChangeHealth(-DamageAmount);
            IOService.Output.WriteLine($"You take {DamageAmount} damage. You now have {GameEngine.Player.Stats.GetStat(PlayerStatTypes.Health)} HP.");
        }

        public override OnUseDamagePlayerBehaviour DeepClone()
        {
            return new OnUseDamagePlayerBehaviour(DamageAmount, ConsumeOnUse);
        }
    }
}
