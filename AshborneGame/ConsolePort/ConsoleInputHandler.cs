using AshborneGame._Core.Game;
using AshborneGame._Core.Globals.Interfaces;

namespace AshborneGame.ConsolePort
{
    public class ConsoleInputHandler : IInputHandler
    {
        public string GetPlayerInput()
        {
            Console.Write("> ");
            return Console.ReadLine() ?? string.Empty;
        }
    }
}
