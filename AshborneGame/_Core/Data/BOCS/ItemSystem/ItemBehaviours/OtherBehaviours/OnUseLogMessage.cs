using AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviourModules;
using AshborneGame._Core.Globals.Services;
using AshborneGame._Core.Globals.Enums;

namespace AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviours.OtherBehaviours
{
    internal class OnUseLogMessage : ItemBehaviourBase<OnUseLogMessage>, IActOnUse
    {
        public bool ConsumeOnUse { get; set; } = false;
        private readonly string message;

        public OnUseLogMessage(string message)
        {
            this.message = message;
        }

        public void OnUse()
        {
            IOService.Output.DisplayDebugMessage($"On Use Trigger successfully called, message: {message}", ConsoleMessageTypes.INFO);
        }

        public override OnUseLogMessage DeepClone()
        {
            return new OnUseLogMessage(message);
        }
    }
}
