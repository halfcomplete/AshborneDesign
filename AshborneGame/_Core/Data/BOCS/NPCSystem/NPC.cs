using AshborneGame._Core.Game;
using AshborneGame._Core.Globals.Services;

namespace AshborneGame._Core.Data.BOCS.NPCSystem
{
    public class NPC : BOCSGameObject
    {
        /// <summary>
        /// The name of the NPC. This is used for identification and display.
        /// </summary>
        public override string Name { get; }

        /// <summary>
        /// A describer for the NPC, providing shallow details about their appearance or role. Often used with their name to give context.
        /// </summary>
        public string Description { get; }

        /// <summary>
        /// A line of dialogue that the NPC uses to greet the player. This is typically used when the player first encounters the NPC.
        /// </summary>
        public string Greeting { get; }

        /// <summary>
        /// A line of dialogue that the NPC uses to describe themself. This is typically used when the player interacts with the NPC.
        /// </summary>
        public string SelfDescription { get; }

        public NPC(string name)
        {
            Name = name ?? throw new ArgumentNullException(nameof(name), "Name cannot be null.");
            Description = "An NPC."; // Default description
            Greeting = "Hello!"; // Default greeting
            SelfDescription = "I am an NPC."; // Default self-description
        }

        public NPC(string name, string description)
        {
            Name = name ?? throw new ArgumentNullException(nameof(name), "Name cannot be null.");
            Description = description ?? throw new ArgumentNullException(nameof(description), "Description cannot be null.");
            Greeting = "Hello!"; // Default greeting
            SelfDescription = "I am an NPC."; // Default self-description
        }

        public NPC(string name, string description, string greeting, string selfDescription)
        {
            Name = name ?? throw new ArgumentNullException(nameof(name), "Name cannot be null.");
            Description = description ?? throw new ArgumentNullException(nameof(description), "Description cannot be null.");
            Greeting = greeting ?? throw new ArgumentNullException(nameof(greeting), "Greeting cannot be null.");
            SelfDescription = selfDescription ?? throw new ArgumentNullException(nameof(selfDescription), "SelfDescription cannot be null.");
        }

        public virtual void Talk()
        {
            IOService.Output.WriteLine($"{Name}: {Greeting} {SelfDescription}.");
            GameEngine.Player.CurrentNPCInteraction = this;
        }
    }
}
