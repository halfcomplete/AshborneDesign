using AshborneGame._Core._Player;
using AshborneGame._Core.Data.BOCS.ItemSystem;
using AshborneGame._Core.Data.BOCS.NPCSystem;
using AshborneGame._Core.Data.BOCS.NPCSystem.NPCBehaviourModules;
using AshborneGame._Core.Data.BOCS.NPCSystem.NPCBehaviours;
using AshborneGame._Core.Data.BOCS.ObjectSystem;
using AshborneGame._Core.Scenes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AshborneTests
{
    static internal class TestUtils
    {
        /// <summary>
        /// Creates a test player with a default name "TestPlayer" and a default location "Test Location". Has a null sublocation and an empty inventory.
        /// </summary>
        static internal Player CreateTestPlayer(string name = "TestPlayer", Location? location = null)
        {
            if (location == null)
            {
                location = new Location("Test Location", "A place for testing.", 1);
            }
            var player = new Player(name, location);
            return player;
        }

        /// <summary>
        /// Creates a test NPC with a default name "TestNPC". Has no behaviours.
        /// </summary>
        static internal NPC CreateTestNPC(string name = "TestNPC")
        {
            return new NPC(name);
        }

        /// <summary>
        /// Creates a test NPC with a default name "TestNPCWithInventory" and adds a TradeableNPCBehaviour to it. Optionally adds items to the NPC's inventory.
        /// </summary>
        static internal NPC CreateTestNPCWithInventory(string name = "TestNPCWithInventory", List<Item>? items = null)
        {
            var npc = new NPC(name);
            npc.AddBehaviour(typeof(IHasInventory), new TradeableNPCBehaviour());
            if (items != null)
            {
                npc.TryGetBehaviour(out TradeableNPCBehaviour inv);
                foreach (var item in items)
                {
                    inv.Inventory.AddItem(item);
                }
            }
            return npc;
        }

        /// <summary>
        /// Returns a test location with a default name "Test Location" and a default description "A place for testing.". Has a minimum visibility of 1.
        /// </summary>
        static internal Location CreateTestLocation(string name = "Test Location")
        {
            return new Location(name, "A place for testing.", 1);
        }

        /// <summary>
        /// Returns a test sublocation with a default name "Test Sublocation" and a default location "Test Location". Has a default game object "Test Object".
        /// </summary>
        static internal Sublocation CreateTestSublocation(string name = "Test Sublocation")
        {
            Sublocation sublocation = new Sublocation(
                CreateTestLocation(),
                CreateTestGameObject(),
                name,
                "A sublocation for testing.",
                5
            );
            return sublocation;
        }

        static internal GameObject CreateTestGameObject(string name = "Test Object")
        {
            return new GameObject(name, "A test object.");
        }
    }
}
