true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

red, white :: agent.

0, 1, 2, 3, 4, 5, 6, 7, 8, 50, 100 :: int.

dirt, b, r, w :: cell_type.

cell :: int -> int -> cell_type -> prop.

control :: agent -> prop.

drop :: int -> action.

number :: int -> bool.

succ :: int -> int -> bool.