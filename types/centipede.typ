
bounds :: int -> bool.

bullet :: obj -> bool.

centipede :: obj -> bool.

controls :: agent -> obj -> bool.

has_pred, has_succ :: int -> bool.

input :: agent -> action -> bool.

left, right, fire, noop :: action.

is_dir, is_left, is_right, is_fire, is_noop :: action -> bool.

object :: obj -> bool.

role :: agent -> bool.

succ :: int -> int -> bool.

at :: int -> int -> obj -> prop.

dir :: obj -> action -> prop.

legal, input, does :: agent -> action -> bool.

true, next :: prop -> bool.

black :: agent.

c, o, x :: obj.

does :: agent -> action -> bool.

goal :: agent -> int -> bool.

0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 100 :: int.

no_bullet :: bool.

terminal :: bool.


