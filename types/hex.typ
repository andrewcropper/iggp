true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

red, black :: agent.

index :: pos -> bool. 

a, b, c, d, e, f, g, h, i :: row.

1, 2, 3, 4, 5, 6, 7 :: col.

col :> int.

0, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 100 :: int.

cell :: row -> col -> agent -> prop.

connected :: int -> row -> col -> prop.

owner :: int -> agent -> prop.

step :: int -> prop.

control :: agent -> prop.

place :: row -> col -> action.

noop :: action.

