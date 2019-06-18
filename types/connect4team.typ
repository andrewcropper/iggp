true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

red, blue, orange, cyan :: agent.

1, 2, 3, 4, 5, 6, 7, 8 :: pos.

0, 50, 100 :: score.

hot, cold :: temp.

cell :: pos -> pos -> agent -> prop.

control :: agent -> prop.

drop :: pos -> action.

noop :: action.

succ :: pos -> pos -> bool.

team :: temp -> agent -> bool. 

x, y :: pos -> bool.


