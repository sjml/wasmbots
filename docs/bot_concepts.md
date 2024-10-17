## bad bots
Behavior that should get shut down (hopefully gracefully)

* tries to grow memory too big
* writes outside scratchpad
* crash during start/init
* overrunning tick time limit (soft)
* rust that doesn't implement client_setup
* name too long
* name too short

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
