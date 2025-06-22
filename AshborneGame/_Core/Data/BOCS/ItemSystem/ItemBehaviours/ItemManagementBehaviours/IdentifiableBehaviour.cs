using AshborneGame._Core.Data.BOCS.CommonBehaviourModules;
using AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviourModules;
using AshborneGame._Core.Globals.Services;

namespace AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviours.ItemManagementBehaviours
{
    public class IdentifiableBehaviour : ItemBehaviourBase<IdentifiableBehaviour>, IIdentifiable, IAwareOfParentObject
    {
        public BOCSGameObject ParentObject { get; set; }

        public bool IsIdentified { get; set; } = false;

        private string _baseDescription = string.Empty;

        public IdentifiableBehaviour(BOCSGameObject parentObject, string baseDescription)
        {
            ParentObject = parentObject;
            _baseDescription = baseDescription;
        }

        public void Identify()
        {
            if (IsIdentified)
            {
                IOService.Output.WriteLine("This item is already identified.");
                return;
            }
            IsIdentified = true;
            IOService.Output.WriteLine($"You have identified the item: {ParentObject.Name}");
            IOService.Output.WriteLine(_baseDescription);
        }

        public override IdentifiableBehaviour DeepClone()
        {
            return new IdentifiableBehaviour(ParentObject, _baseDescription) { IsIdentified = IsIdentified };
        }
    }
}
