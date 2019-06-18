true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

xplayer, oplayer :: agent.

1, 2, 3 :: pos.

0, 50, 100 :: int.

mark :: pos -> pos -> pos -> pos -> symbol -> prop.

currentboard :: pos -> pos -> prop.

control :: agent -> prop.

noop :: action.

index :: pos -> bool.

x, o :: symbol.

play :: pos -> pos -> pos -> pos -> symbol -> action.

