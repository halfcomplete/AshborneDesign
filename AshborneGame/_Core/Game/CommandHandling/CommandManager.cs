using AshborneGame._Core._Player;
using AshborneGame._Core.Globals.Interfaces;
using AshborneGame._Core.Game.CommandHandling.Commands;
using AshborneGame._Core.Game.CommandHandling.Commands.InventoryCommands;

namespace AshborneGame._Core.Game.CommandHandling
{
    public static class CommandManager
    {
        public static IReadOnlyDictionary<string, ICommand> Commands => _commands;
        private static Dictionary<string, ICommand> _commands = new();

        static CommandManager()
        {
            RegisterCommand(new UseCommand());
            RegisterCommand(new TalkToNPCCommand());
            RegisterCommand(new ShowStatsCommand());
            RegisterCommand(new ShowInventoryCommand());
            RegisterCommand(new OpenObjectCommand());
            RegisterCommand(new CloseObjectCommand());
            RegisterCommand(new ShowStatsCommand());
            RegisterCommand(new ExitGameCommand());
            RegisterCommand(new AttackTargetCommand());
            RegisterCommand(new GiveCommand());
            RegisterCommand(new TakeCommand());
            RegisterCommand(new LookCommand());
            RegisterCommand(new GoCommand());
            RegisterCommand(new GoToCommand());
            RegisterCommand(new HelpCommand());
        }

        public static void RegisterCommand(ICommand command)
        {
            _commands[command.Name.ToLower()] = command;
        }

        public static bool TryExecute(string action, List<string> args, Player player)
        {
            if (_commands.TryGetValue(action.ToLower(), out var command) && command.TryExecute(args, player))
            {
                return true;
            }

            return false;
        }
    }
}
