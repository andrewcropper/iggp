true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

player :: agent -> bool.

step :: int -> prop.

score :: agent -> int -> prop.

0, 1, 2, 3 :: int.

p1, p2 :: agent.

scissors, paper, stone :: action.

beats :: action -> action -> bool.

succ :: int -> int -> bool.

