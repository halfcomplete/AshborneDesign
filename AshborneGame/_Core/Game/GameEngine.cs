using AshborneGame._Core._Player;
using AshborneGame._Core.Globals.Enums;
using AshborneGame._Core.Globals.Services;
using AshborneGame._Core.Scenes;
using AshborneGame._Core.Game.CommandHandling;
using AshborneGame._Core.Globals.Interfaces;

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
            InitialisePlayer();

            IOService.Output.WriteLine("Game engine initialised successfully.");

            IOService.Output.WriteLine("Starting game engine...");
            Start();
        }
        #pragma warning restore CS8618 // Non-nullable field must contain a non-null value when exiting constructor. Consider adding the 'required' modifier or declaring as nullable.

        private void InitialiseGameWorld()
        {
            _startingLocation = new Location("Starting Point", "This is where your adventure begins.");
            IOService.Output.WriteLine("Game world initialised.");
        }

        private void InitialisePlayer()
        {
            Player = new Player("Hero", _startingLocation);
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
                DisplaySceneIntro();

                string input = IOService.Input.GetPlayerInput().Trim();

                if (string.IsNullOrWhiteSpace(input))
                {
                    IOService.Output.WriteLine("You must enter a command.");
                    continue;
                }

                if (input.Equals("quit", StringComparison.OrdinalIgnoreCase))
                {
                    IOService.Output.WriteLine("🎭 The curtain falls. Thank you for playing *Ashborne*.");
                    _isRunning = false;
                    continue;
                }

                List<string> splitInput = input.Split(' ').ToList();
                bool isValidCommand = CommandManager.TryExecute(splitInput[0], splitInput.Skip(1).ToList(), Player);
                while (!isValidCommand)
                {
                    IOService.Output.WriteLine("Invalid command. Please try again or type 'help' for assistance.");
                    input = IOService.Input.GetPlayerInput().Trim();

                    if (string.IsNullOrWhiteSpace(input))
                    {
                        IOService.Output.WriteLine("You must enter a command.");
                        continue;
                    }

                    if (input.Equals("quit", StringComparison.OrdinalIgnoreCase))
                    {
                        IOService.Output.WriteLine("🎭 The curtain falls. Thank you for playing *Ashborne*.");
                        _isRunning = false;
                        continue;
                    }

                    splitInput = input.Split(' ').ToList();

                    CommandManager.TryExecute(splitInput[0], splitInput.Skip(1).ToList(), Player);
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
