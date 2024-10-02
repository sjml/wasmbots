Moves
=====

Wait
    - no-op, no operands
SetBotInfo
    - four bytes offset (bot name)
    - one byte length (bot name)
    - majorOffset
    - minorOffset
    - patchOffset
    - only valid during setup
Move
    - direction UP, RIGHT, DOWN, LEFT (one byte)
    - number of spaces (one byte)
Attack
    - square relative to you (2 bytes x and 2 bytes y)
Cast
    - square (4 bytes)
    - spell (1 byte)
    - spell params (4 bytes)
Examine
    - no operands; take a turn to ID a weapon or scroll in your square
Take
    - no operands; take the item on your square
Resign
    - no operands; resigns the game


Responses
=========

Nothing/Ok
    - you waited or moved, and it worked. grats. 
Error
    - last command was not understood (invalid)
Failure
    - last command was understood but didn't work (moving into a wall, for example)
AttackResult
    - hit or miss
    - how much damage you did
SpellResult
    - 4 bytes specific to spell
      - HP affected (damage done or healed)
      - other stuff?
ExamineResult
    - type of thing (spell or item or player)
    - index into spell list or item list or player list
