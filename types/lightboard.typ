true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

robot :: agent.

1, 2, 3, 4, 5, 6, 7, 8 :: pos.

pos :> int.

0, 9, 100 :: int.

on :: pos -> pos -> prop.

step :: int -> prop.

toggle :: pos -> pos -> action.

index :: pos -> bool.

successor :: int -> int -> bool.
