true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

white, black :: agent.

x, o, b :: mark.

1, 2, 3 :: pos.

0, 50, 100 :: score.

cell :: pos -> pos -> mark -> prop.

control :: agent -> prop.

mark :: pos -> pos -> action.

noop :: action.

index :: pos -> bool.