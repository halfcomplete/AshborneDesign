using AshborneGame._Core.Data.BOCS.CommonBehaviourModules;
using AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviourModules;
using AshborneGame._Core.Globals.Enums;
using AshborneGame._Core.Globals.Services;
using System;

namespace AshborneGame._Core.Data.BOCS.ItemSystem.ItemBehaviours.ItemManagementBehaviours
{
    public class InspectableBehaviour : ItemBehaviourBase<InspectableBehaviour>, IInspectable, IAwareOfParentObject
    {
        public BOCSGameObject ParentObject { get; set; }
        private string _baseDescription;
        private ItemQualities _rarity;
        private string? _hiddenLore;
        private bool _requiresIdentification = false;
        public bool IsInspected { get; private set; } = false;

        public InspectableBehaviour(BOCSGameObject parentObject, string baseDesc, ItemQualities rarity, string? hiddenLore, bool requiresIdentification = false)
        {
            ParentObject = parentObject ?? throw new ArgumentNullException(nameof(parentObject));
            _baseDescription = baseDesc;
            _rarity = rarity;
            _hiddenLore = hiddenLore;
            _requiresIdentification = requiresIdentification;
        }

        public InspectableBehaviour(BOCSGameObject parentObject, string baseDesc, bool requiresIdentification = false)
        {
            ParentObject = parentObject ?? throw new ArgumentNullException(nameof(parentObject));
            _baseDescription = baseDesc;
            _rarity = ItemQualities.None;
            _requiresIdentification = requiresIdentification;
        }

        public void Inspect()
        {
            if (_requiresIdentification && ParentObject.TryGetBehaviour<IIdentifiable>(out var identifiableBehaviour))
            {
                if (!identifiableBehaviour.IsIdentified)
                {
                    IOService.Output.WriteLine("You need to identify this item before you can inspect it.");
                    return;
                }
                if (_hiddenLore == null)
                {
                    return;
                }
                IOService.Output.WriteLine(_hiddenLore);
                return;
            }

            if (IsInspected)
            {
                IOService.Output.WriteLine("You have already inspected this item.");
                return;
            }

            IOService.Output.WriteLine(_baseDescription);

            // TODO: Implement logic to reveal hidden lore based on player actions or conditions, such as having a specific skill, item or quest completion.

            if (_rarity >= ItemQualities.Rare)
            {
                IOService.Output.WriteLine("This item seems extremely valuable.");
            }

            IsInspected = true;
        }

        public override InspectableBehaviour DeepClone()
        {
            return new InspectableBehaviour(ParentObject, _baseDescription, _rarity, _hiddenLore, _requiresIdentification)
            {
                IsInspected = IsInspected,
            };
        }
    }
}
