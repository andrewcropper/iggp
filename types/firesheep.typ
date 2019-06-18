true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

red, blue :: agent.

1, 2, 3, 4, 5, 6, 7, 8, 9 :: index.

0, 10, 11, 12, 20, 30, 40, 50, 60, 70, 80, 90, 100 :: int.

index :> int.

at :: index -> index -> index -> prop.

up, down, left, right, stopped :: dir.

sheep :: index -> int -> dir -> prop.

frozen, burning :: index -> index -> index -> prop.

score :: agent -> int -> prop.

grass :: agent -> index -> index -> prop.

grass_last_turn, has_kill, has_force_noop, forced :: agent -> prop.

freeze, burn, kill :: index -> action.

force_noop :: agent -> action.

noop :: action.

succ, score_succ :: int -> int -> bool.

adjacent :: index -> index -> index -> index -> bool.

board_succ :: index -> index -> bool.

border_bottom, border_top, index, sheep_index :: index -> bool.

direction :: dir -> bool.

life_val :: int -> bool.

life_succ :: int -> int -> bool.

