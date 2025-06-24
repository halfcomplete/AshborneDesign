using AshborneGame._Core._Player;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AshborneGame._Core.Game
{
    public class GameSession
    {
        public Player Player { get; set; }

        public GameSession(Player player)
        {
            Player = player;
        }
    }
}
