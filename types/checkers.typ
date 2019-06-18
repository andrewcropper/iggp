true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

red, black :: agent.

1, 2, 3, 4, 5, 6, 7, 8 :: pos.

between :: pos -> pos -> pos -> bool.

blackpawnmove, distinctcell, redpawnmove :: pos -> pos -> pos -> pos -> bool.

cell, evensquare :: pos -> pos -> bool.

cellbetween :: pos -> pos -> pos -> pos -> pos -> pos -> bool.

countplus, pp, scoremap :: int -> int -> bool.

even, odd, index :: int -> bool.

plusx, plusy :: pos -> pos -> pos -> bool.

0, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100 :: int.

pos :> int.

blackpawn, redpawn :: pawn.

owns :: pawn -> agent -> bool.

location :: pos -> pos -> pawn -> prop.

capturecount :: agent -> int -> prop.

control :: agent -> prop.

step :: int -> prop.

noop :: action.

move, jump :: pos -> pos -> pos -> pos -> action.

