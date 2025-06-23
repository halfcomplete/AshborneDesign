using AshborneGame._Core._Player;
using AshborneGame._Core.Data.BOCS.NPCSystem;
using AshborneGame._Core.Game.CommandHandling.Commands;
using AshborneGame._Core.Globals.Services;
using AshborneGame._Core.Scenes;
using Moq;
using System.Numerics;
using System.Xml.Linq;
using Xunit;
using FluentAssertions;
using AshborneGame._Core.Data.BOCS.ObjectSystem;
using AshborneGame._Core.Globals.Interfaces;
using AshborneTests;

public class TalkToNPCCommandTests
{
    [Fact]
    public void TalkToNPC_Fails_When_NoSublocation()
    {
        IOService.Initialise(new Mock<IInputHandler>().Object, new Mock<IOutputHandler>().Object);

        // Arrange
        var command = new TalkToNPCCommand();
        var player = TestUtils.CreateTestPlayer();

        // Act
        var result = command.TryExecute(new List<string> { "Elias" }, player);

        // Assert
        result.Should().BeFalse();
    }

    [Fact]
    public void TalkToNPC_Fails_When_ObjectIsNotNPC()
    {
        var command = new TalkToNPCCommand();
        var player = TestUtils.CreateTestPlayer();
        var testSublocation = TestUtils.CreateTestSublocation();

        var result = command.TryExecute(new List<string> { "Elias" }, player);

        result.Should().BeFalse();
    }

    [Fact]
    public void TalkToNPC_Succeeds_When_NPC_Present()
    {
        var npc = new TestNPC("Elias");
        var command = new TalkToNPCCommand();
        Sublocation testSublocation = new Sublocation(
            new Location("Test Location", "A place for testing."),
            npc,
            "Test Sublocation",
            "A sublocation for testing.",
            5
        );
        var player = new Player();
        player.MoveTo(testSublocation);

        var result = command.TryExecute(new List<string> { "Elias" }, player);

        result.Should().BeTrue();
        npc.WasTalkedTo.Should().BeTrue();
    }

    private class TestNPC : NPC
    {
        public bool WasTalkedTo = false;
        public TestNPC(string name) : base(name) { }
        public override void Talk() => WasTalkedTo = true;
    }
}
