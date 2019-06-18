true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

robot :: agent.

1, 2, 3 :: pos.

pos :> mark.

4, 5, 6, 7, 8, 9, b :: mark.

0, 100 :: score.

cell :: pos -> pos -> pos -> pos -> mark -> prop.

mark :: pos -> pos -> pos -> pos -> mark -> action.

digit, filler :: mark -> bool.

index :: pos -> bool.