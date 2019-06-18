true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

red, green, blue :: agent.

index :: pos -> bool. 

a, b, c, d, e, f, g, h, i :: row.

1, 2, 3, 4, 5, 6, 7, 8, 9 :: col.

col :> int.

0,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62, 100 :: int.

cell :: row -> col -> agent -> prop.

connected :: int -> row -> col -> prop.

owner :: int -> agent -> prop.

step :: int -> prop.

control :: agent -> prop.

place :: row -> col -> action.

noop :: action.

adjacent :: row -> col -> row -> col -> bool.

col :: col -> bool.

imaginary, middle, redbeg, redend :: row -> col -> bool.

nextcol :: col -> col -> bool.

nextrow :: row -> row -> bool.

row :: row -> bool.

succ :: int -> int -> bool.

