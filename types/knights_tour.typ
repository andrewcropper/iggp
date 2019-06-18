true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

robot :: agent.

1, 2, 3, 4, 5, 6 :: pos.

pos :> int.

0, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 33, 36, 39, 40, 42, 45, 48, 50, 51, 54, 57, 60, 63, 66, 69, 72, 75, 80, 85, 90, 96, 100 :: int.

moveCount :: int -> prop.

knight, hole :: mark.

cell :: pos -> pos -> mark -> prop.

move :: pos -> pos -> pos -> pos -> action.

count, x, y :: add_arg.

add :: int -> add_arg -> int -> int -> bool.

col, row :: pos -> bool.

knightMove :: pos -> pos -> pos -> pos -> bool.

scoreMap :: int -> int -> bool.

piece :: mark -> bool.

