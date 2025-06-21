using AshborneGame._Core._Player;
using AshborneGame._Core.Data.BOCS.NPCSystem;
using AshborneGame._Core.Game.CommandHandling.Commands;
using AshborneGame._Core.Globals.Services;
using AshborneGame._Core.Scenes;
using Moq;
using System.Numerics;
using System.Xml.Linq;
using Xunit;

public class TalkToNPCCommandTests
{
    [Fact]
    public void TalkToNPC_Fails_When_NoSublocation()
    {
        // Arrange
        var command = new TalkToNPCCommand();
        var player = new Player();

        // Act
        var result = command.TryExecute(new List<string> { "Elias" }, player);

        // Assert
        result.Should().BeFalse();
    }

    [Fact]
    public void TalkToNPC_Fails_When_ObjectIsNotNPC()
    {
        var command = new TalkToNPCCommand();
        var player = new Player
        {
            CurrentSublocation = new Sublocation
            {
                Object = new object() // Not an NPC
            }
        };

        var result = command.TryExecute(new List<string> { "Elias" }, player);

        result.Should().BeFalse();
    }

    [Fact]
    public void TalkToNPC_Succeeds_When_NPC_Present()
    {
        var npc = new TestNPC("Elias");
        var command = new TalkToNPCCommand();
        var player = new Player
        {
            CurrentSublocation = new Sublocation
            {
                Object = npc
            }
        };

        var result = command.TryExecute(new List<string> { "Elias" }, player);

        result.Should().BeTrue();
        npc.WasTalkedTo.Should().BeTrue();
    }

    private class TestNPC : NPC
    {
        public bool WasTalkedTo = false;
        public TestNPC(string name) => Name = name;
        public override void Talk() => WasTalkedTo = true;
    }
}
