true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score_int -> bool.

terminal :: bool.

role :: agent -> bool.

robot :: agent.

1, 2, 3 :: pos.

index :: pos -> bool.

succ :: pos -> pos -> bool.

scoremap :: time_step -> score_int -> bool.

pos :> cell_type.

successor :: time_step -> time_step -> bool.

4, 5, 6, 7, 8, b :: cell_type.

tile :: cell_type -> bool.

cell_type :> time_step.

time_step :> score_int.

0, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50 :: time_step.

60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 100 :: score_int.

cell :: pos -> pos -> cell_type -> prop.

step :: time_step -> prop.

move :: pos -> pos -> action.



