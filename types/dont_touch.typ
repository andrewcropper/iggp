true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

black, white :: agent.

1, 2, 3, 4, 5, 6, 7, 8 :: pos.

x, o, b :: cell_type.

0, 50, 100 :: score.

cell :: pos -> pos -> cell_type -> prop.

index :: pos -> bool.

mark :: pos -> pos -> action.

noop :: action.

control :: agent -> prop.

succ :: pos -> pos -> bool.

