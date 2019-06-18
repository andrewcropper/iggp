true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

d, t :: agent.

agent :> mark.
b :: mark.

1, 2, 3, 4, 5 :: pos.

0, 100 :: score.

cell :: pos -> pos -> mark -> prop.

control :: agent -> prop.

move :: pos -> pos -> pos -> pos -> action.

noop :: action.

distinctCell :: pos -> pos -> pos -> pos -> bool.

x1, x2, y1, y2 :: obj.

downleft, downright, upright, upleft :: obj -> obj -> obj -> obj -> bool.

plusplus :: pos -> pos -> bool.

index :: pos -> bool.




