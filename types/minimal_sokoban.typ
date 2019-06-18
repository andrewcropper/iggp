true, next :: prop -> bool.

at :: pos -> obj -> prop.

target :: pos -> prop.

does :: agent -> action -> bool.

player_obj, is_box, object :: obj -> bool.

controls :: agent -> obj -> bool.

wall_at :: pos -> bool.

is_noop :: action -> bool.

role :: agent -> bool.

left, right, up, down, noop :: action. 

dir :: pos -> action -> pos -> bool.

bounds :: pos -> bool.

pos11, pos21, pos31, pos41, pos51 :: pos.
pos12, pos22, pos32, pos42, pos52 :: pos.
pos13, pos23, pos33, pos43, pos53 :: pos.
pos14, pos24, pos34, pos44, pos54 :: pos.
pos15, pos25, pos35, pos45, pos55 :: pos.

x, obj1, obj2 :: obj.

black :: agent.

