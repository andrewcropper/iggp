true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

wolf, sheep :: agent.

0, 100 :: int.

c1, c2, c3, c4, c5, c6, c7, c8 :: pos.

b, s, w :: mark.

cell :: pos -> pos -> mark -> prop.

control :: agent -> prop.

move :: pos -> pos -> pos -> pos -> action.

noop :: action.

does_move :: agent -> pos -> pos -> pos -> pos -> bool.

adjacent :: agent -> pos -> pos -> pos -> pos -> bool.

smaller, succ :: pos -> pos -> bool.
