## bad bots
Behavior that should get shut down

* tries to grow memory too big
* writes outside scratchpad
* crashes
* takes too long on tick
  * gets strikes
  * dies immediately

## weird bots
Stressing the limits of the system

* chatty: spam the log


## test bots

* no-show: does not accept game params
* resigner: resign the game after X turns
* dummy: just stands still and doesn't do anything
* scaredycat: explores until it encounters an item or person and then moves in the other direction
* aggro: attacks relentlessly once it sees someone; wanders randomly otherwise
* voyager: tries to completely map the world, visually seeing every navigable space and examining every item
* rabbit: inspired by crobots; just runs around and never attacks
* rook: inspired by crobots; moves laterally looking for targets
