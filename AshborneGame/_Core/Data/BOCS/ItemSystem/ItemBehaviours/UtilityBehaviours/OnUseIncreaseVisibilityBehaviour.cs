using AshborneGame._Core.Game;
using AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviourModules;

namespace AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviours.UtilityBehaviours
{
    internal class OnUseIncreaseVisibilityBehaviour : ItemBehaviourBase<OnUseIncreaseVisibilityBehaviour>, IActOnUse
    {
        private int _visibilityIncreaseAmount = 3;
        public bool ConsumeOnUse { get; set; }
        public OnUseIncreaseVisibilityBehaviour(int visibilityIncrease, bool consumeOnUse = true)
        {
            _visibilityIncreaseAmount = visibilityIncrease;
            ConsumeOnUse = consumeOnUse;
        }
        public void OnUse()
        {
            GameEngine.Player.SetVariable("visibility", GameEngine.Player.Visibility + _visibilityIncreaseAmount);
        }

        public override OnUseIncreaseVisibilityBehaviour DeepClone()
        {
            return new OnUseIncreaseVisibilityBehaviour(_visibilityIncreaseAmount, ConsumeOnUse);
        }
    }
}
