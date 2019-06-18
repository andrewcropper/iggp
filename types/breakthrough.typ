true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score_type -> bool.

terminal :: bool.

role :: agent -> bool.

white, black :: agent.

1, 2, 3, 4, 5, 6, 7, 8 :: int.

index :: int -> bool.

succ :: int -> int -> bool.

0, 100 :: score_type.

cell :: int -> int -> agent -> prop.

control :: agent -> prop.

move :: int -> int -> int -> int -> action.

noop :: action.