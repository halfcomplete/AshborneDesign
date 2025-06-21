using AshborneGame._Core.Globals.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AshborneGame._Core.Globals.Services
{
    public static class IOService
    {
        public static IInputHandler Input => _input ?? throw new InvalidOperationException("IOService.Input was accessed before being initialised.");
        public static IOutputHandler Output => _output ?? throw new InvalidOperationException("IOService.Output was accessed before being initialised.");

        private static IInputHandler? _input;
        private static IOutputHandler? _output;

        public static bool IsInitialised => _input != null && _output != null;

        public static void Initialise(IInputHandler input, IOutputHandler output)
        {
            _input = input ?? throw new ArgumentNullException(nameof(input));
            _output = output ?? throw new ArgumentNullException(nameof(output));
        }

    }
}
