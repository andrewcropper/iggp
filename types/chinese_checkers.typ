true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

red, yellow, green, teal, blue, magenta :: agent.

agent :> cell_type.
blank :: cell_type.

a1, b1, b2, c1, c2, c3, c4, c5, c6, c7, d1, d2, d3, d4, d5, d6, e1, e2, e3, e4, e5, f1, f2, f3, f4, f5, f6, g1, g2, g3, g4, g5, g6, g7, h1, h2, i1 :: pos.

cell :: pos -> cell_type -> prop.

control :: agent -> prop.

step :: int -> prop.

noop :: action.

move :: pos -> pos -> action.

succ :: int -> int -> bool.

0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 100 :: int.

