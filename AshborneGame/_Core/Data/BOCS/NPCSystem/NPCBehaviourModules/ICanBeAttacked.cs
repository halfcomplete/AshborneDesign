using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AshborneGame._Core.Data.BOCS.NPCSystem.NPCBehaviourModules
{
    public interface ICanBeAttacked
    {
        float Health { get; set; }
        float MaxHealth { get; set; }
        void Attacked(float damage);
    }
}
