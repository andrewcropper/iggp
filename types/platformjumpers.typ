true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

red, blue :: agent.

1, 2, 3, 4, 5, 6, 7, 8, 9, 10 :: pos.

0, 50, 100 :: int.

cell, jumper :: agent -> pos -> pos -> prop.

rowed, coled :: pos -> prop.

control :: agent -> prop.

jump :: pos -> pos -> pos -> pos -> action.

row, col :: pos -> action.

noop :: action.

board_succ, board_succ_two :: pos -> pos -> bool.

goal_row :: agent -> pos -> bool.

index :: pos -> bool.

knights_move_down, knights_move_up, slow_move_down, slow_move_up :: pos -> pos -> pos -> pos -> bool.

valid_move :: agent -> pos -> pos -> pos -> pos -> bool.

