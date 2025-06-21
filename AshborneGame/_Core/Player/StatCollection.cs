using System.Text;
using AshborneGame._Core.Globals.Enums;

namespace AshborneGame._Core._Player
{
    public class StatCollection
    {
        private readonly Dictionary<PlayerStatTypes, StatHolder> _stats = new();

        public StatCollection()
        {
            // Initialise all stats with default values
            foreach (PlayerStatTypes statType in Enum.GetValues(typeof(PlayerStatTypes)))
            {
                int initialValue;

                switch (statType)
                {
                    case PlayerStatTypes.Health:
                        initialValue = 100;
                        break;
                    case PlayerStatTypes.MaxHealth:
                        initialValue = 100;
                        break;
                    case PlayerStatTypes.Mana:
                        initialValue = 100; 
                        break;
                    case PlayerStatTypes.MaxMana:
                        initialValue = 100;
                        break;
                    case PlayerStatTypes.Strength:
                        initialValue = 10;
                        break;
                    case PlayerStatTypes.Defense:
                        initialValue = 10;
                        break;
                    default:
                        initialValue = 10;
                        break;
                }

                _stats[statType] = new StatHolder(statType, initialValue);
            }
        }

        public StatHolder this[PlayerStatTypes type] => _stats[type];

        /// <summary>
        /// Gets the base, bonus, and total value of a specific stat.
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        /// <exception cref="ArgumentException"></exception>
        public (int, int, int) GetStat(PlayerStatTypes type)
        {
            if (_stats.TryGetValue(type, out var statHolder))
            {
                int baseValue = statHolder.BaseValue;
                int bonusValue = statHolder.BonusValue;
                int totalValue = statHolder.Total;

                return (baseValue, bonusValue, totalValue);
            }
            else
            {
                throw new ArgumentException($"Stat {type} does not exist.");
            }
        }

        public void SetBase(PlayerStatTypes type, int value)
        {
            _stats[type].SetBase(value);
        }
        public void ChangeBase(PlayerStatTypes type, int amount)
        {
            _stats[type].SetBase(_stats[type].BaseValue + amount);
        }

        public void AddBonus(PlayerStatTypes type, int bonus)
        {
            _stats[type].AddBonus(bonus);
        }

        public void RemoveBonus(PlayerStatTypes type, int bonus)
        {
            _stats[type].RemoveBonus(bonus);
        }

        public string GetFormattedStats()
        {
            var sb = new StringBuilder();
            foreach (var stat in _stats.Values)
            {
                sb.AppendLine(string.Format("{0, -10} {1, -3} ({2} + {3})", stat.Type + ":", stat.Total, stat.BaseValue, stat.BonusValue));
            }
            return sb.ToString();
        }
    }
}
