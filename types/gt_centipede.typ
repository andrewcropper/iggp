true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

white, black :: agent.

0,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100 :: int.

whitePayoff, blackPayoff :: int -> prop.

control :: agent -> prop.

finish, continue, noop :: action.

succ :: int -> int -> bool.

opponent :: agent -> agent -> bool.

gameOver :: prop.

claim_made_by :: agent -> prop.

