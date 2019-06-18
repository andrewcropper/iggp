true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

red, green :: agent.

0, 50, 100 :: score.

1, 2, 3, 4 :: pos.

pos :> cell_type.

b :: cell_type.

cell :: pos -> pos -> cell_type -> prop.

control :: agent -> prop.

mark :: pos -> pos -> pos -> action.

noop :: action.

filler :: cell_type -> bool.

index :: pos -> bool.



