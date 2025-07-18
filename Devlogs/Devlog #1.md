# Devlog #1 - Building the core engine

Hi! I'm Eric, the solo dev for Ashborne, and you're reading my second devlog ever written, and Devlog #1 for Ashborne!
If you haven't read Devlog #0 yet, do check it out. It covers my base vision, goals, and ideas for the game. This devlog
will cover most of the work that I've done the past week or so on Ashborne, which is all about the core engine. Let's
get started!

## What my core engine is built around
Ashborne's engine is built around a custom architecture called BOCS, which stands for <b>B</b>ehaviour-oriented <b>O</b>bject <b>C</b>omposition
<b>S</b>ystem. The basic idea is this:

Each game object in Ashborne - so an item, NPC, or actual object in the game (like a chest) - inherits from <em>BOCSGameObject.cs</em>, which
contains a List<BehaviourBase> of <em>Behaviours</em>. This List determines what that object does, and can even be modified at runtime. 
For example, an item might have a <em>BreakableBehaviour</em>, or an <em>OnEquipChangePlayerStatBehaviour</em>. That obviously 
means that that item can break but also changes a player stat when it's equipped.

Each <em>Behaviour</em> is then broken down into tiny little <em>Modules</em> which are just interfaces that tell any behaviours that implement
the module, "Hey! This behaviour can do this!" So, modules tell other systems what a behaviour can do, and behaviours are told by the system
to do it. An <em>OnEquipChangePlayerStatBehaviour</em> would therefore implement two modules: <em>IActOnEquip</em> and <em>IChangePlayerStat</em>.

This is where the beauty of BOCS comes into play. <em>IActOnEquip</em> tells every system that this behaviour does something when the item it's
attached to is equipped. This can then be notified by an <em>EquippableBehaviour</em> which implements the <em>IEquippable</em> module. This
behaviour tells systems that this item can be equipped, and so systems can access the <em>EquippableBehaviour</em> instance part of the item
and call its <em>Equip()</em> method. Inside this method, there is some logic for equipping the item, but the best part is when it loops through
the parent item's Behaviour List, finds EVERY Behaviour that implements the <em>IActOnEquip</em> interface, and calls that instance's <em>OnEquip()</em>
method. THEN that specific Behaviour (e.g. <em>OnEquipChangePlayerStatBehaviour</em>) can write it's own logic for what happens when the <em>OnEquip()</em> method is called
and all of a sudden we have a modular, reusable, and testable architecture for managing objects. Going back to <em>OnEquipChangePlayerStatBehaviour</em>,
this behaviour could write up that, upon <em>OnEquip()</em> being called, it increases a certain stat (determined upon instantiation of the class)
by a certain amount (possible negative, also determined upon instantiation).

For a helmet, this could be increasing Defense by 10 when it's equipped. And don't forget, the interfaces are reusable for practically every
Behaviour (of course, it would not make sense for an NPC Behaviour to be equippable). That means that we could have an <em>OnEquipFireSpellBehaviour</em>
or an <em>OnUseChangePlayerStatBehaviour</em> or even an <em>OnUseBreakBehaviour</em>. And if an item doesn't have a BreakableBehaviour, say, then
that item is unbreakable.

Finally, this behaviour is extendable to NPCs, or in-game objects. An NPC could have the <em>OnInteractGiveQuestBehaviour</em>, which an object could also have.
The only difference would be the type of interaction that activates it, and the quest that it gives. An NPC could even have an <em>AttackableBehaviour</em> 
which tells systems that the player can attack this NPC. NPCs could even have modules that determine what it does during combat, for example a
<em>TryAttackFirstBehaviour</em> means that the NPC will always try to attack the player first during a battle. A <em>OnLowHealthRetreatBehaviour</em>
which could be generalised to <em>OnStatThresholdRetreatBehaviour</em> or <em>OnStatThresholdActBehaviour</em> would mean that the NPC
retreats from battle when it's on low health, or low defense, or high bleeding, or whatever anything. And maybe the NPC will only retreat
on the first encounter with the player, so after they retreat, their retreat behaviour can just be removed and they won't ever retreat again.
Cool, right?

### TL;DR
BOCS (<b>B</b>ehaviour-oriented <b>O</b>bject <b>C</b>omposition <b>S</b>ystem) has a BOCSGameObject base class, which the classes Item.cs, NPC.cs,
and GameObject.cs  inherit from. This base class allows for runtime adding, removing or changing of Behaviours. Each Behaviour inherits from a base class
BehaviourBase.cs, and implement Modules. Modules are small, reusable interfaces that determine what a Behaviour can do, while Behaviours determine
what the BOCSGameObject actually does. This allows for an extremely modular system that is testable, safe, and perfect for Ashborne.

## How did I design this?
I'm gonna be honest - I didn't design this all on my own. I took a lot of inspiration from currently existing systems like ECS (Entity Component System),
which are very performant and highly data-oriented. This is perfect for other games that require simulations with thousands of entities. However,
ECS is built around separating data from logic and requires external systems to change entity state, which leads to a lot of verbose and disconnected
logic in a narrative-driven game like Ashborne. Because I couldn't find a perfect solution for Ashborne, I decided to take systems like ECS and Unity's MonoBehaviour
architecture to make BOCS. You can probably tell where I got the idea of Behaviours from. I took that idea and then took it one step further with an extra
layer of modularity (quite literally) - the modules.

## Cool, anything else?
Another big part of Ashborne is immersiveness and description. This was a massive problem, and I'm still designing a system for good, flowing
descriptions. It will probably never be as good as a real writer - actually, definitely - because real writers have so much imagination
and wordplay that they can use for every scenario that pure code cannot replicate. Therefore, I settled on this Descriptions system, which I believe
is "good enough".

In the game there are Scenes, which is just a group of Locations. Locations are then made up of GameObjects, and Sublocations. Each Sublocation
may then have another GameObject. GameObjects, of course, are interactable. Scenes do not have descriptions - rather, they have Locations, a
Scene name, and some exposed methods to get the Scene Headers that are displayed whenever the player enters a new Scene. Each Location, however,
has a lot of descriptions. These are managed by a DescriptionProfileManager, which each Location has one of. DescriptionProfileManagers have a
bunch of Lists and Fields and Properties that contain descriptive lines for these scenarios:
- the player arrives for the first time (the longest description),
- the player arrives for the second time (to keep it non-repetitive),
- the player comes back (after second time),
- sensory descriptions that are accessed to the discretion of outside systems (visual, auditory, etc),
- ambient descriptions that are accessed randomly, or after certain durations of time (to add a feeling of aliveness),
- and conditional descriptions, which are accessed whenever their associated "condition" is fulfilled (e.g. player is holding a torch)

Combined, they should create a short-ish paragraph that fully describes the Location (or Sublocation) based on many different factors.
Conditional Descriptions are the most complicated. They are tracked using a List of ConditionalDescription.cs instances, each of which
has a Description and a Condition. The Condition is just a lambda that takes in the current game state and returns true or false.

## GameState?
Yes, Ashborne has a GameStateManager.cs instance. I'm... not sure why I made it non-static, but whatever. GameStateManager has a BUNCH
of Dictionaries, etc, to track the exact state of the game. For example:
- flags, which are: string, bool,
- counters, which are: string, int,
- and labels, which are: string, string.

A massive problem with this architecture is... can you guess it? Typos! Capitalisation! Refactoring! Lack of autocomplete! Lack of compiler checks!
Messy duplication! If I use strings for keys, and use them everywhere, then it'll be impossible to maintain. Just imagine if I wanted to rename a flag...
I would have to rename it in every file in my codebase, in every Ink file that I use it in, and everywhere else. Horrible. So what's the solution, you ask?

A GameStateKeys static class! With nested static classes within the GameStateKeys class, I can group flags, counters, labels, and the like, and define
constants for their keys, with values as the real key. Instead of the flag "Player.Actions.Sat_On_Throne" set to true, I can have the flag
Player.Actions.Sat_On_Throne as the key (which is the constant name for "Player.Actions.Sat_On_Throne") and true as the value.
Then I can simply just access those constants from within the code, or from within Ink, to have compiler checks, autocomplete, clean refactoring,
typo errors, capitalisation errors, etc, etc. The benefits are endless, not because of how good the solution is, but because of how bad it was before.

## Anything else?
Nope, because this devlog is getting super long! Bye!

\- Eric
<br>Written 14/07/2025




