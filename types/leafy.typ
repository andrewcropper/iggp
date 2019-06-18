true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

red, blue :: agent.

1, 2, 3, 4, 5, 6, 7, 8 :: pos.

0, 50, 100 :: int.

leaf :: pos -> pos -> prop.

isplayer :: pos -> pos -> agent -> prop.

move :: pos -> pos -> action.

close :: pos -> pos -> bool.

index :: pos -> bool.

