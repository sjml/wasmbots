## game mechanics
* modes
  * capture the flag
  * find the macguffin
  * last bot standing
* magic system
  * spells
    * invisibility (target cannot be seen by others)
    * bind (target can't move or attack physically)
    * silence (target cannot cast spells)
    * bioethereal (pass through other beings, but not walls)
    * haste (target gets two ticks every turn)
    * slow (target gets a tick every other turn)
  * mana as a resource?
    * automatically refill, permanent drain?
    * or DnD style spell slots? mana is simpler to implement...
* potions
  * most spell effects plus healing, mana restoration
* weapons/armor
  * physical attacks
  * polearms (longer range)
  * sword, dagger, etc. 
  * shields? (also allows distinction in 1h v 2h weapon)
* traps
  * can disarm (chance)
  * can set? (limited resource)
* playstyle
  * class system? point buy? STATS?! 
  * (can rogues pickpocket?!)
* traversal
  * locks and keys
  * teleporting tiles (maybe also can create one with a spell?)
  * hidden doors / secret passages
    * respond to Open action, but appear as Wall
  * multiple levels? 
    * a huge pain for visualizer...
  * terrain mods
    * water, rocky, etc. affects movement, maybe spells? 
* narrative choices
  * love the roguelite mechanic, but not sure there's a good way of communicating it to the bots
  * this one is very dubious

## NPCs/Monsters
* all logic in TypeScript, in host
* shopkeepers?

## Teams!
* makes CTF more fun
* attribute on player
* friendly fire allowed? 

## Meta
* persistence of some kind -- maybe stats, inventory, player portrait, then bot takes over
* tournament play -- buncha bots compete in bracket or round robin

## Tech
* re-introduce memory constraints
