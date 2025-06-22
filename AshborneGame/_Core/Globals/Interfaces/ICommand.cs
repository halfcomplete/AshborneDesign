using AshborneGame._Core._Player;

namespace AshborneGame._Core.Globals.Interfaces
{
    public interface ICommand
    {
        string Name { get; }
        string Description { get; }
        bool TryExecute(List<string> arguments, _Player.Player player);
    }
}
