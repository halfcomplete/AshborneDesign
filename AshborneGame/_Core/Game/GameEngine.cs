using AshborneGame._Core._Player;
using AshborneGame._Core.Data.BOCS.ItemSystem;
using AshborneGame._Core.Data.BOCS.NPCSystem;
using AshborneGame._Core.Data.BOCS.NPCSystem.NPCBehaviourModules;
using AshborneGame._Core.Data.BOCS.ObjectSystem;
using AshborneGame._Core.Data.BOCS.ObjectSystem.ObjectBehaviourModules;
using AshborneGame._Core.Data.BOCS.ObjectSystem.ObjectBehaviours;
using AshborneGame._Core.Game.CommandHandling;
using AshborneGame._Core.Globals.Enums;
using AshborneGame._Core.Globals.Interfaces;
using AshborneGame._Core.Globals.Services;
using AshborneGame._Core.Scenes;
using System;

namespace AshborneGame._Core.Game
{
    /// <summary>
    /// Main game engine that handles game state and player interactions.
    /// This class is responsible for:
    /// - Initialising the game world and its contents
    /// - Managing the player and their inventory
    /// - Running the main game loop
    /// - Handling game state transitions
    /// </summary>
    public class GameEngine
    {
        #pragma warning disable CS8618 // Non-nullable field must contain a non-null value when exiting constructor. Consider adding the 'required' modifier or declaring as nullable.
        public static Player Player { get; private set; }
        

        private bool _isRunning;
        private Location _startingLocation;

        public GameEngine(IInputHandler input, IOutputHandler output)
        {
            IOService.Initialise(input, output);

            InitialiseGameWorld();

            IOService.Output.WriteLine("Game engine initialised successfully.");

            IOService.Output.WriteLine("Starting game engine...");
            Start();
        }
        #pragma warning restore CS8618 // Non-nullable field must contain a non-null value when exiting constructor. Consider adding the 'required' modifier or declaring as nullable.

        private void InitialiseGameWorld()
        {
            // Initialise locations
            Location Dusty_Armoury = new Location("Dusty Armoury", "The room is dark", 5);
            _startingLocation = Dusty_Armoury;

            InitialisePlayer();

            // Initialise objects and sublocations
            GameObject chest = GameObjectFactory.CreateChest("rusted chest", "A large, rusted chest covered in cobwebs", isLocked: true);
            NPC dummy = NPCFactory.CreateDummy("Training Dummy", "It's a wooden training dummy used for practice", 50);
            NPC guard = NPCFactory.CreateNPC("guard", "stern-looking", "Halt! Who goes there?", "I am the guard of this armoury");

            Sublocation dustyCorner = new Sublocation(Dusty_Armoury, chest, "rusted chest", "It's covered in cobwebs", 3);
            Sublocation dummyCorner = new Sublocation(Dusty_Armoury, dummy, "training dummy", "A wooden training dummy used for practice.", 2);
            Sublocation guardCorner = new Sublocation(Dusty_Armoury, guard, "guard", "A stern-looking guard stands watch.", 4);
            Dusty_Armoury.AddSublocation(dustyCorner);
            Dusty_Armoury.AddSublocation(dummyCorner);
            Dusty_Armoury.AddSublocation(guardCorner);

            // Initialise items
            Item torch = ItemFactory.CreateLightSourceEquipment("torch", "A small torch that lights up the area.", new List<string> { "hand", "offhand" }, ItemQualities.None, -1, 32);
            Item key = ItemFactory.CreateKey("rusty key", "An old rusty key that looks like it might fit a lock.", "You turn the key and hear a click.", new List<string>() { chest.ID });
            IOService.Output.DisplayDebugMessage($"Key: {key.Behaviours.Count} behaviours", ConsoleMessageTypes.WARNING);
            Item iron_sword = ItemFactory.CreateWeapon("iron sword", "A basic iron sword", ItemQualities.Uncommon, 2, 20);
            Item leather_cap = ItemFactory.CreateArmour("leather cap", "A basic leather cap that protects your head.", new List<string> { "head" },
                                                        ItemQualities.Common, 30, new Dictionary<PlayerStatTypes, int> { { PlayerStatTypes.Defense, 10 } });
            Item healing_potion = ItemFactory.CreateHealthPotion("health potion", 20);
            Item damage_potion = ItemFactory.CreateHealthPotion("damage potion", -20);
            Item mysterious_scroll = ItemFactory.CreateMagicScroll("mysterious scroll", "A scroll with ancient runes", "You read the scroll and feel a surge of power");

            // Place items
            Player.Inventory.AddItem(torch, 1);
            Player.EquipItem(torch, "hand");
            Player.Inventory.AddItem(key, 1);
            Player.Inventory.AddItem(healing_potion, 5);
            Player.Inventory.AddItem(damage_potion, 5);
            Player.Inventory.AddItem(mysterious_scroll, 1);

            if (chest.TryGetBehaviour<IHasInventory>(out var inventoryBehaviour) && inventoryBehaviour is ContainerBehaviour)
            {
                inventoryBehaviour.Inventory.AddItem(iron_sword);
                inventoryBehaviour.Inventory.AddItem(leather_cap);
                inventoryBehaviour.Inventory.AddItem(healing_potion, 3);
            }
            
            IOService.Output.WriteLine("Game world initialised.");
        }

        private void InitialisePlayer()
        {
            Player = new Player("Hero", _startingLocation);
            Player.Inventory.AddItem(ItemFactory.CreateLightSourceEquipment("torch", "A small torch that lights up the area.", new List<string> { "hand", "offhand" }, ItemQualities.None, -1, 32), 1);
            IOService.Output.WriteLine("Player initialised with default inventory.");
        }

        public void Start()
        {
            IOService.Output.WriteLine("Welcome to *Ashborne*.");
            IOService.Output.WriteLine("Type 'help' if you are unsure what to do.");
            IOService.Output.WriteLine(string.Empty);

            _isRunning = true;

            while (_isRunning)
            {
                string input = IOService.Input.GetPlayerInput().Trim().ToLowerInvariant();

                if (string.IsNullOrWhiteSpace(input))
                {
                    IOService.Output.WriteLine("You must enter a command.");
                    continue;
                }

                List<string> splitInput = input.Split(' ').ToList();
                string action = splitInput[0].ToLowerInvariant();
                int toSkip = 1;
                if (input.StartsWith("go to"))
                {
                    action = "go to";
                    toSkip = 2;
                }
                else if (input.StartsWith("talk to"))
                {
                    action = "talk to";
                    toSkip = 2;
                }
                bool isValidCommand = CommandManager.TryExecute(action, splitInput.Skip(toSkip).ToList(), Player);
                while (!isValidCommand)
                {
                    IOService.Output.WriteLine("Invalid command. Please try again or type 'help' for assistance.");
                    input = IOService.Input.GetPlayerInput().Trim();

                    if (string.IsNullOrWhiteSpace(input))
                    {
                        IOService.Output.WriteLine("You must enter a command.");
                        continue;
                    }

                    splitInput = input.Split(' ').ToList();

                    isValidCommand = CommandManager.TryExecute(splitInput[0], splitInput.Skip(1).ToList(), Player);
                }
            }
        }

        private void DisplaySceneIntro()
        {
            // Will later be tied to actual scenes
            IOService.Output.WriteLine("📍 You stand beneath the blood-red banners of a forgotten courtyard.");
        }
    }
}
