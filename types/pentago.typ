true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

red, black :: agent.

1, 2, 3, 4, 5, 6 :: pos.

0, 50, 100 :: int.

cellholds :: pos -> pos -> pos -> agent -> prop.

placecontrol, rotatecontrol :: agent -> prop.

clockwise, counterclockwise :: dir.

place :: pos -> pos -> pos -> action.

rotate :: pos -> dir -> action.

noop :: action.

add, cell :: pos -> pos -> pos -> bool.

direction :: dir -> bool.

globalindex :: pos -> pos -> pos -> pos -> pos -> bool.

horizontalflip, verticalflip :: pos -> pos -> pos -> pos -> bool.

index, quadrant :: pos -> bool.

rotation :: dir -> pos -> pos -> pos -> pos -> bool.

succ :: pos -> pos -> bool.

