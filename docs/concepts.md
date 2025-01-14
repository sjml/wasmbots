---
title: Basic Concepts
---

# Basic Concepts of WasmBots

_I initially wrote the first version of this to help explain the project to a friend who is a novice programmer. The philosophy part might be off-putting, and you can feel free to skip. With the technical part, you may very well already know this stuff, and if that's the case, congratulations! Please don't feel condescended to; you are simply not the target audience for this. If this seems remedial to you, the other docs like [the low-level interface](./interface.md) and [library description](./libraries.md) may be more your speed._


## Whither the Context
If you've been programming for a while, you know that your code can do quite a bit without touching the "outside" world. That is, you can generate a bunch of text or do complicated mathematical modeling without needing to deal with the filesystem or the network. But at some point you're probably going to want one of those things, and at that point you have to call some code that you probably didn't write. In a C program this might take the form of `#include <stdio.h>`, or in Python `import sys`; how that other code works isn't really important at the moment, but you can think of it as a kind of "host" that provides your program with what it needs from the world outside its immediate little self-created environment of functions and variables. 

But there's more to that "host" layer than you might think, especially if you're used to higher-level languages like Python that hide some of those details. How does your code even know what time it is? Or how long it's been running? Or the name of the current user? How does it send information to a GPU, or read the values of the thumbstick on a gamepad? 

All of those things work because your program runs in a larger context --- that context is usually an operating system, but it doesn't have to be. 


## A Brain and a Demon
In the 17th century, French philosopher [René Descartes](https://en.wikipedia.org/wiki/Ren%C3%A9_Descartes) was concerned with epistemology --- how do we _know_ what we know? How can we be sure the world around us is real? It might be the trick of a demon who casts a screen over our heads and plays the sights and sounds that it pleases, deceiving us into belief in a reality that is not so. This seems unlikely, but a rigorous epistemologist would have to concede that they can never rule out the possibility. Given that, we may even begin to doubt our own existence. Descartes's way out of this despair was the famous [_cogito, ergo sum_](https://en.wikipedia.org/wiki/Cogito,_ergo_sum): "I think, therefore I am." Even if everything I know is a deception, I must still exist, for there is something which is being deceived; my act of thinking is the only thing of which I can be absolutely certain. From there he proceeded to rebuild all of philosophy. (I actually don't love Descartes's mind-body dualism but it's a useful metaphor here.)

These days, a similar thought experiment is posed as the "[brain in a jar](https://tvtropes.org/pmwiki/pmwiki.php/Main/BrainInAJar):" suppose I took your brain out of your head (sorry) but preserved it perfectly (you're welcome) in a container that would provide all the nutrients it needed and clear away all the waste products. Furthermore, I track down all the neurons that connected to your muscles and hook them up to a computer simulation so we know what your body should be doing. That same simulation is also connected to your sensory neurons, feeding back the information you would have been receiving from the real world. So from the perspective of your brain, everything is just as it was before. When you want to walk, you feel the sensation of your body moving and see the world moving around you appropriately. You wouldn't be able to tell the difference. (Or would you? This is the kind of fun you get into in philosophy class... sometimes.)

My point in all of this is that you can think of your program as the brain in the jar, and the host environment as the thing it's hooked up to. Most programs are hooked up to an operating system that gives them a filesystem, the ability to allocate memory, access to hardware, etc. But programs can live in different kinds of hosts. [A script that runs in a game engine](https://ck.uesp.net/wiki/Papyrus_Introduction), for instance, will often have no access to the file system, nor can it allocate memory. Closer to home, [a JavaScript program that runs in a webpage](https://developer.mozilla.org/en-US/docs/Web/JavaScript) can only do things that the browser allows; it cannot read files unless the user uploads them, nor can it access the computer's hardware without permission. We sometimes call this "sandboxing" like the way we let a child play in a designated area knowing that they can really only mess things up within that area.

So the host environment can expose all kinds of different capacities, and a program is usually written to target a specific kind of host. But the program itself doesn't know anything about how the host operates or even if it's telling the truth --- when told to write a file, the host could put it on the local drive, or upload it to a remote server, or do nothing at all. The program has no real way of knowing what's happening out there, and has to kind of accept the reality as presented by the host. 


## A Well-Behaved Host
Most such host environments are fairly polite. When your program needs something, like more memory, or access to the internet, or to write something to a file, they will do whatever they can to provide it. Maybe there are limits to some resources, but for the most part the two worlds cooperate in fairly predictable ways. 

One of the main tasks of operating systems, especially modern ones, is protecting programs from each other. If you used a Macintosh before OS X, you might remember the peril that could descend from programs gone astray --- a single bad program could crash the entire computer, because there were not robust safeguards to keep them from messing with each other or the system itself. Programming is hard enough as it is; it becomes nearly impossible to do if some other program can overwrite your memory. A host environment does a lot of work (address space randomization, executable-only memory, etc.) to avoid such problems; it should absolutely **never** cause them itself by interfering with the contents of a running program's memory. 

Except when it should. 


## Some Non-Malicious Mischief
The WebAssembly host environment has total access to the memory of its guest module. This includes all the executable code, all the data, all the allocations, everything. It can read it and, significantly, it can write to it. Now our brain-in-a-jar has a very different experience. 

Of course, to keep all this orderly, in the WasmBots system, [one of the first things that happens](./interface.md#handshake) is the host tells the module how much memory it needs for communication, and the module is expected to report back a location in memory that the host can freely use. The module itself has to keep track of this somehow, and the details of how that happens are specific to each programming language. (Usually it can just be as simple as declaring a buffer of the appropriate size and making sure it doesn't get deallocated.) Once that's done, every time the program gets its regular `tick()` call, the contents of that memory have "miraculously" changed --- the host wrote new information there, as if our evil scientist was directly rewiring the neurons of our brain-in-a-jar. 

So, whenever it is time for your module to take another turn, it looks in this memory buffer and finds information about the current state of its world: what it can see around it, what happened on the last turn, etc. It in turn replies to the host by writing its response (move one square north, open the door to my left, etc.) into a known spot in memory that the host reads from. 


## Other Jars, Other Demons
WasmBots modules can also be run within the context of [a trainer](./trainers.md) which makes it easier to debug logic problems, but it does so by becoming a bit more deceptive. The module still receives its normal setup and tick functions, but the host lies to it: since time limits aren't enforced, it doesn't give accurate elapsed time information, and it can feed whatever information is useful for the one doing the debugging. It could warp the player around the level, give it false information about the terrain, etc. 

And the poor module has no choice but to accept the reality it's given. Useful for us, though! 

(All of this is ignoring that the "world" of WasmBots is itself a simulation, so what even is "truth" in such a context? Anyway, Baudrillard's _Simulacra and Simulation_ is a good book.)


## Humanities Nerd Time is Over... for now
So that might give you a better sense of the conceptual idea of building a module for WasmBots. At this point we have to switch from "philosophy nerd" to "software nerd" and start writing some code. For that, look at the [libraries](./libraries.md) or, if you want to go deep, the [low-level interface](./interface.md). Godspeed. 🫡
