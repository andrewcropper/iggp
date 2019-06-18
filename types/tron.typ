true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

black, white :: agent.

1, 2, 3, 4, 5 :: int.

x, o :: object.

at :: int -> int -> object -> prop.

marked :: int -> int -> prop.

left, right, up, down :: action.

0, 100 :: score.

bounds :: int -> bool.

controls :: agent -> object -> bool.

distinct :: agent -> agent -> bool.

object :: object -> bool.

succ :: int -> int -> bool.



