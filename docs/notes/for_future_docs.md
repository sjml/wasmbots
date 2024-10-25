* flow control
  * refresh resets the states of the player programs to their initials, sets everyone to their starting hit points, and puts them back to spawn points
    * NOTE they may not be the *same* spawn points as initially
    * similarly the system RNG is not put back to its initial state
      * local RNG *is* restored, so you'll get the same sequence from calls to the host's `getRandomInt`, but the host's RNG (which does things like roll dice for damage, etc.) will be different
    * this is not about reproducibility, just about running again
