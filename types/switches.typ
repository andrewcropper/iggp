true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

black :: agent.

x, wall, obj1, d1 :: obj.

1, 2, 3, 4, 5 :: pos.

100 :: score.

at :: pos -> pos -> obj -> prop.

target :: pos -> pos -> prop.

open :: obj -> pos -> prop.

switch :: pos -> pos -> obj -> prop.

noop, up, down, left, right :: action.

bounds :: pos -> bool.

controls :: agent -> obj -> bool.

dir :: action -> bool.

door, is_box :: obj -> bool.

object, player_obj :: obj -> bool.

succ :: pos -> pos -> bool.