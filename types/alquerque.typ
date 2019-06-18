true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> decad -> bool.

terminal :: bool.

role :: agent -> bool.

red, black :: agent.

agent :> cell_type.

blank :: cell_type.

cell :: pos -> pos -> cell_type -> prop.

index :: pos -> bool.

mark :: cell_type -> bool.

score :: agent -> decad -> prop.

incr :: decad -> decad -> bool.

succ :: int -> int -> bool.

nex :: pos -> pos -> bool.

control :: agent -> prop.

step :: int -> prop.

move :: pos -> pos -> pos -> pos -> action.

jump :: pos -> pos -> pos -> pos -> pos -> pos -> action.

noop :: action.

doublet :: pos -> pos -> pos -> pos -> bool.

triplet :: pos -> pos -> pos -> pos -> pos -> pos -> bool.

distinctcell :: pos -> pos -> pos -> pos -> bool.

distinct, new :: pos -> pos -> bool.

horizontal, vertical, backslash, slash :: pos -> pos -> pos -> pos -> bool.

0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 :: decad.

1, 2, 3, 4, 5 :: pos.

decad :> int.

pos :> int.

6, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 26, 27, 28, 29 :: int.

