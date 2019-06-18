true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

red, blue :: agent.

index :: pos -> bool. 

1, 2, 3, 4, 5, 6, 7 :: pos.

pos :> int.

0, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 40, 50, 60, 70, 80, 90, 100 :: int.

cell :: pos -> pos -> agent -> prop. 

capture :: agent -> int -> prop.

control :: agent -> prop. 

step :: int -> prop. 

move :: pos -> pos -> pos -> pos -> action.

noop :: action.

onboard :: pos -> pos -> bool.

add :: pos -> pos -> pos -> bool.

diagonal, ell, orthogonal :: pos -> pos -> pos -> pos -> bool.

captureadd, scoremap, stepcount :: int -> int -> bool.

rotation :: agent -> agent -> bool.

spawns :: pos -> pos -> agent -> bool.



