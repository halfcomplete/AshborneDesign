using AshborneGame._Core.Globals.Enums;

namespace AshborneGame._Core.Globals.Interfaces
{
    public interface IGameObject
    {
        /// <summary>
        /// Gets the name of the object.
        /// </summary>
        string Name { get; }

        /// <summary>
        /// Gets the description of the object.
        /// </summary>
        string Description { get; }

        /// <summary>
        /// Gets or sets whether the object can be interacted with.
        /// </summary>
        bool IsInteractable { get; set; }

        /// <summary>
        /// Gets the unique object ID
        /// </summary>
        string ID { get; init; }

        /// <summary>
        /// Interacts with the object based on its interaction type.
        /// </summary>
        void Interact(ObjectInteractionTypes _interaction);
    }
}
