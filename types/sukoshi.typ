true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

robot :: agent.

1, 2, 3 :: pos.

pos :> mark.

b :: mark.

0, 100 :: score.

cell :: pos -> pos -> mark -> prop.

mark :: pos -> pos -> mark -> action.

digit, index, filler :: mark -> bool.

