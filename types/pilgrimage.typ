true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

red, blue :: agent.

1, 2, 3, 4, 5, 6 :: pos.

pos :> int.

0,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,20,30,40,50,100 :: int.

cell :: pos -> pos -> pos -> prop.

builder, pilgrim :: agent -> pos -> pos -> prop.

control :: agent -> prop.

phase :: agent -> phase_list -> prop.

build_terrain, place_pilgrim, pilgrimage :: phase_list.

moves :: agent -> int -> prop.

move :: pos -> pos -> pos -> pos -> action.

raise, place_pilgrim :: pos -> pos -> action.

noop :: action.

adjacent :: pos -> pos -> pos -> pos -> bool.

board_succ :: pos -> pos -> bool.

height, height_end :: pos -> bool.

height_score :: int -> int -> bool.

index :: pos -> bool.

phase_list :: phase_list -> bool.

succ, height_succ :: int -> int -> bool.

moves :: agent -> int -> prop.

phase :: agent -> phase_list -> prop.

