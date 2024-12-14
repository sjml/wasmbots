# explorer (implemented in [Zig](https://ziglang.org/))

Maybe the most "real" bot of the bunch. Actually maps out the space, keeps track of what it's seen, and does A* pathfinding between points. 

Basic algorithm is to find the closest space it has _seen_ but not _visited_. ("Visited" being defined as getting within one space of it, so it doesn't look overly meticulous.) Once it reaches the end of that path, it picks another such space. 

If there are no such spaces, it picks a closed door that it has seen, moves to it, and opens it. It picks the closest door, but measured by [Manhattan distance](https://en.wikipedia.org/wiki/Manhattan_distance), so with intervening walls it may pick strange targets. I actually like the weirdness of this! Makes it seem like the bot is eccentric and whimsical! 

If it has visited all its known spaces and there are no more doors to open, it resigns. (With current map generation settings this usually takes around 2700 - 3000 moves.)
