true, next :: prop -> bool.

at :: pos -> obj -> prop.

target :: pos -> prop.

does :: agent -> action -> bool.

player_obj, is_box, object :: obj -> bool.

controls :: agent -> obj -> bool.

wall_at :: pos -> bool.

pos :: pos -> bool.

obj :: obj -> bool.

action :: action -> bool.

role :: agent -> bool.

is_left, is_right, is_up, is_down, is_noop :: action -> bool.

left, right, up, down, noop :: action. 

left_of, right_of, above, below :: pos -> pos -> bool.

bounds :: pos -> bool.

dir :: action -> bool.

pos11, pos21, pos31, pos41, pos51 :: pos.
pos12, pos22, pos32, pos42, pos52 :: pos.
pos13, pos23, pos33, pos43, pos53 :: pos.
pos14, pos24, pos34, pos44, pos54 :: pos.
pos15, pos25, pos35, pos45, pos55 :: pos.

x, obj1, obj2 :: obj.

black :: agent.

