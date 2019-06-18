true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

at :: int -> int -> obj -> prop.

target :: int -> int -> prop.

does :: agent -> action -> bool.

player_obj, is_box :: obj -> bool.

controls :: agent -> obj -> bool.

object :: obj -> bool.

role :: agent -> bool.

black :: agent.

is_left, is_right, is_up, is_down, is_noop :: action -> bool.

left, right, up, down, noop :: action. 

succ :: int -> int -> bool.

bounds :: int -> bool.

dir :: action -> bool.

1, 2, 3, 4, 5 :: int.

0, 100 :: score.

x, obj1, obj2, wall :: obj.

