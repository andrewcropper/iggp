true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

you :: agent.

1, 2, 3, 4, 5, 6, 7, 8 :: pos.

0, 100 :: score.

zerocoins, onecoin, twocoins :: cell_value.

cell :: pos -> cell_value -> prop.

jump :: pos -> pos -> action.

step :: pos -> prop.

zerobetween, onebetween, twobetween, succ :: pos -> pos -> prop.