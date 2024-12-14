# wallflower (implemented in [Go](https://go.dev/))

Moves in a random direction until it encounters a wall. At that point it turns left, metaphorically places its right hand on the wall and traces it all around the space. Because the dungeon has no exit, it will eventually return to its starting position, having moved around roughly the the outer third of the map counter-clockwise. (With current map generation settings this usually takes around 1100-1300 moves.) 

Originally it resigned at that point, but I figured "hey, why not let the little tyke keep going?" 

Kinda neat that this requires no smarts beyond examining the space to its right and ahead of it. (If it turns left I have it cheat by also looking to what **will** be ahead of it so it doesn't take an extra turn in a dead end.)

