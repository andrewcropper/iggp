true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

red, black :: agent.

agent :> mark.

blank :: mark.

a, b, c, d, e :: pos.

0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 100 :: int.

cell :: pos -> mark -> prop.

control :: agent -> prop.

step :: int -> prop.

move :: pos -> pos -> action.

noop :: action.

adjacent :: pos -> pos -> bool.

mark :: mark -> bool.

node :: pos -> bool.

succ :: int -> int -> bool.

