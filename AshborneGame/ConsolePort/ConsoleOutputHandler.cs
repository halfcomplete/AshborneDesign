using AshborneGame._Core.Globals.Enums;
using AshborneGame._Core.Globals.Interfaces;

namespace AshborneGame.ConsolePort
{
    public class ConsoleOutputHandler : IOutputHandler
    {
        public void Write(string message)
        {
            Console.Write(message);
        }

        public void WriteLine(string message)
        {
            Console.WriteLine(message);
        }

        public void DisplayDebugMessage(string message, ConsoleMessageTypes type)
        {
            switch (type)
            {
                case ConsoleMessageTypes.INFO:
                    Console.ForegroundColor = ConsoleColor.Cyan;
                    break;
                case ConsoleMessageTypes.WARNING:
                    Console.ForegroundColor = ConsoleColor.Yellow;
                    break;
                case ConsoleMessageTypes.ERROR:
                    Console.ForegroundColor = ConsoleColor.Red;
                    break;
                default:
                    Console.ForegroundColor = ConsoleColor.White;
                    break;
            }

            Console.WriteLine($"[{type}]: {message}");
            Console.ResetColor();
        }
    }
}
