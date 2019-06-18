true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

black :: agent.

0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 :: int.

x, red1, red2, red3, red4, red5, green1, green2, green3, green4, green5 :: obj.

at :: int -> int -> obj -> prop.

score, time :: int -> prop.

left, right, up, down :: action.

controls :: agent -> obj -> bool.

bounds, world_max, world_min, number :: int -> bool.

green_object, red_object, object, player_object :: obj -> bool.

succ, world_succ :: int -> int -> bool.

is_down, is_left, is_up, is_right :: action -> bool.