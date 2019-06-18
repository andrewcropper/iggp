true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

red, black :: agent.

agent :> mark.

blank :: mark.

1, 2, 3, 4 :: pos.

pos :> int.

0, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 37, 50, 62, 75, 87, 100 :: int.

cell :: pos -> pos -> mark -> prop.

score :: agent -> int -> prop.

control :: agent -> prop.

step :: int -> prop.

move :: pos -> pos -> pos -> pos -> action.

jump :: pos -> pos -> pos -> pos -> pos -> pos -> action.

noop :: action.

distinctcell, doublet, horizontal, vertical :: pos -> pos -> pos -> pos -> bool.

incr :: int -> int -> bool.

index :: pos -> bool.

mark :: mark -> bool.

nextspot :: pos -> pos -> bool.


succ :: int -> int -> bool.

triplet :: pos -> pos -> pos -> pos -> pos -> pos -> bool.



