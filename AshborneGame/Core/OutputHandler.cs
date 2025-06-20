
namespace AshborneGame.Core
{
    internal static class OutputHandler
    {
        internal static void WriteLine(string message)
        {
            Console.WriteLine(message);
        }

        internal static void DisplayMessageWithoutNewLine(string message)
        {
            Console.Write(message);
        }

        internal static void DisplayDebugMessage(string message, ConsoleMessageTypes type)
        {
            if (type == ConsoleMessageTypes.INFO)
            {
                Console.ForegroundColor = ConsoleColor.Cyan;
            }
            else if (type == ConsoleMessageTypes.WARNING)
            {
                Console.ForegroundColor = ConsoleColor.Yellow;
            }
            else if (type == ConsoleMessageTypes.ERROR)
            {
                Console.ForegroundColor = ConsoleColor.Red;
            }
            else
            {
                Console.ForegroundColor = ConsoleColor.White; // Default colour
            }

            //Console.WriteLine($"[{type}]: {message}");

            Console.ForegroundColor = ConsoleColor.White; // Reset to default after displaying the message
        }
    }
}
