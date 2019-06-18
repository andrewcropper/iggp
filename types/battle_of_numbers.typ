true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> step_int -> bool.

terminal :: bool.

number :> step_int.

0, 1, 2, 3, 4, 5 :: number.

6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 
20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 50, 100 :: step_int.

red, green :: agent.

cell :: number -> number -> number -> agent -> prop.

capture :: agent -> number -> prop.

captureadd :: number -> number -> prop.

step :: step_int -> prop.

control :: agent -> prop.

role :: agent -> bool.

diagonal, orthogonal :: number -> number -> number -> number -> bool.

eatable, greater, onboard :: number -> number -> bool.

index, number :: number -> bool.

succ :: number -> number -> bool.

stepcount :: step_int -> step_int -> bool.

forward :: number -> number -> number -> number -> agent -> bool.

move :: number -> number -> number -> number -> action.

noop :: action.

