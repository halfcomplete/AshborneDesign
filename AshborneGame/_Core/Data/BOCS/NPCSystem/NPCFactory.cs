using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AshborneGame._Core.Data.BOCS.NPCSystem.NPCBehaviourModules;
using AshborneGame._Core.Data.BOCS.NPCSystem.NPCBehaviours;

namespace AshborneGame._Core.Data.BOCS.NPCSystem
{
    public static class NPCFactory
    {
        public static NPC CreateNPC(string name, string description, string greeting, string selfDescription)
        {
            if (string.IsNullOrWhiteSpace(name))
            {
                throw new ArgumentException("Name cannot be null or empty.", nameof(name));
            }
            if (string.IsNullOrWhiteSpace(description))
            {
                throw new ArgumentException("Description cannot be null or empty.", nameof(description));
            }

            NPC npc = new NPC(name, description, greeting, selfDescription);
            npc.AddBehaviour(typeof(IHasInventory), new TradeableNPCBehaviour());
            return npc;
        }

        public static NPC CreateDummy(string name, string description, int maxHealth)
        {
            var dummy = new NPC(name, description);
            dummy.AddBehaviour(typeof(ICanBeAttacked), new CanBeAttackedBehaviour(dummy, maxHealth));
            return dummy;
        }
    }
}
