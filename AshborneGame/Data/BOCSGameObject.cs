using AshborneGame.Data.BOCS.ItemSystem.ItemBehaviourModules;
using AshborneGame.Core;

namespace AshborneGame.ConsoleApp.Data.Objects
{
    public abstract class BOCSGameObject
    {
        /// <summary>
        /// Gets the name of the object. This is used for identification and display.
        /// </summary>
        public abstract string Name { get; }

        /// <summary>
        /// Gets the unique identifier of the object.
        /// </summary>
        public string ID { get; init; } = Guid.NewGuid().ToString();

        public Dictionary<Type, List<object>> Behaviours { get; private set; } = new();

        #region Behaviours
        public void AddBehaviour(Type type, object behaviour)
        {
            if (type == null || behaviour == null)
                throw new ArgumentNullException();

            if (!type.IsAssignableFrom(behaviour.GetType()))
                throw new ArgumentException($"The provided behaviour does not implement or inherit from the specified type: {type.FullName}");

            // Enforce behaviour dependencies
            if (type == typeof(IActOnUse) && !Behaviours.ContainsKey(typeof(IUsable)))
                throw new InvalidOperationException($"Cannot add IActOnUse without IUsable. {Name} must be usable before it can act on use.");

            if (type == typeof(IActOnEquip) && !Behaviours.ContainsKey(typeof(IEquippable)))
                throw new InvalidOperationException($"Cannot add IActOnEquip without IEquippable. {Name} must be equippable before it can act on equip.");

            // Initialize the list if it doesn't exist
            if (!Behaviours.ContainsKey(type))
            {
                Behaviours[type] = new List<object>();
            }

            // Add the behavior to the list
            Behaviours[type].Add(behaviour);

            if (type == typeof(IUsable))
            {
                OutputHandler.DisplayDebugMessage($"{Name} is now usable.", ConsoleMessageTypes.ERROR);
            }

            OutputHandler.DisplayDebugMessage($"Added behaviour of type {type.FullName} to {Name}.", ConsoleMessageTypes.INFO);
            OutputHandler.DisplayDebugMessage($"All registered behaviours for {Name}: {string.Join(", ", Behaviours.Keys.Select(t => t.Name))}", ConsoleMessageTypes.INFO);
            foreach (var b in Behaviours)
            {
                OutputHandler.DisplayDebugMessage($"- {b.GetType().Name}: {string.Join(", ", b)}", ConsoleMessageTypes.INFO);
            }
            OutputHandler.WriteLine("");
        }

        public void RemoveBehaviour<T>() where T : class => Behaviours.Remove(typeof(T));

        public bool TryGetBehaviour<T>(out T behaviour) where T : class
        {
            OutputHandler.DisplayDebugMessage($"Trying to get behaviour of type {typeof(T).FullName} from {Name}.", Enums.ConsoleMessageTypes.INFO);
            if (Behaviours.TryGetValue(typeof(T), out var behaviours) && behaviours.Count > 0 && behaviours[0] is T castedBehaviour)
            {
                OutputHandler.DisplayDebugMessage($"Successfully retrieved behaviour of type {typeof(T).Name} from {Name}.", Enums.ConsoleMessageTypes.INFO);
                behaviour = castedBehaviour;
                return true;
            }
            OutputHandler.DisplayDebugMessage($"Failed to retrieve behaviour of type {typeof(T).Name} from {Name}. This could be correct.", Enums.ConsoleMessageTypes.WARNING);
            OutputHandler.DisplayDebugMessage($"Current behaviours count: {Behaviours.Count}", Enums.ConsoleMessageTypes.INFO);
            OutputHandler.DisplayDebugMessage($"Available behaviours: {string.Join(", ", Behaviours.Keys.Select(k => k.Name))}", Enums.ConsoleMessageTypes.INFO);
            behaviour = null!;
            return false;
        }

        public bool HasBehaviours<T>() where T : class => Behaviours.ContainsKey(typeof(T)) && Behaviours[typeof(T)].Count > 0;

        public IEnumerable<T> GetAllBehaviours<T>() where T : class
        {
            if (Behaviours.TryGetValue(typeof(T), out var behaviours))
            {
                return behaviours.OfType<T>();
            }
            return Enumerable.Empty<T>();
        }

        #endregion Behaviours
    }
}
