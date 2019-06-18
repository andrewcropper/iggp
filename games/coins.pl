(role you)

;; Solution:
;; 11111111
;; 12110111
;; 12010121
;; 22000121
;; 22000022

(init (cell 1 onecoin))
(init (cell 2 onecoin))
(init (cell 3 onecoin))
(init (cell 4 onecoin))
(init (cell 5 onecoin))
(init (cell 6 onecoin))
(init (cell 7 onecoin))
(init (cell 8 onecoin))
(init (step 1))

%% legal_jump(jump,A,B):-my_true_cell(A,onecoin),my_true_cell(B,onecoin),legal_jump1(A,B).
%% legal_jump1(A,B):-twobetween(A,B).
%% legal_jump1(A,B):-twobetween(B,A).

(<= (legal you (jump ?x ?y))
	(true (cell ?x onecoin))
	(true (cell ?y onecoin))
	(or (twobetween ?x ?y) (twobetween ?y ?x)))

(<= (next (step ?y))
	(true (step ?x))
	(succ ?x ?y))
(<= (next (cell ?x zerocoins))
	(does you (jump ?x ?y)))
(<= (next (cell ?y twocoins))
	(does you (jump ?x ?y)))
(<= (next (cell ?x ?c))
	(true (cell ?x ?c))
	(does you (jump ?y ?z))
	(distinct ?x ?y)
	(distinct ?x ?z))

next_cell(X,zerocoins):-does_jump(you,X,Y).
next_cell(Y,twocoins):-does_jump(you,X,Y).

next_cell(X,C):-
	my_true_cell(X,C),
	my_true_cell(Y,C),
	does_jump(you,Y,Z),
	distinct(X,Y),
	distinct(Y,Z).

(<= terminal
	(not anylegalmove))
(<= anylegalmove
	(legal you ?m))

(<= (goal you 100)
	(true (step 5)))
(<= (goal you 0)
	(true (cell ?x onecoin)))

goal(you,100):-true_step(5).
goal(you,0):-my_true_cell(X,onecoin).

(<= (zerobetween ?x ?y)
	(succ ?x ?y))
(<= (zerobetween ?x ?y)
	(succ ?x ?z)
	(true (cell ?z zerocoins))
	(zerobetween ?z ?y))

(<= (onebetween ?x ?y)
	(succ ?x ?z)
	(true (cell ?z onecoin))
	(zerobetween ?z ?y))
(<= (onebetween ?x ?y)
	(succ ?x ?z)
	(true (cell ?z zerocoins))
	(onebetween ?z ?y))

(<= (twobetween ?x ?y)
	(succ ?x ?z)
	(true (cell ?z twocoins))
	(zerobetween ?z ?y))
(<= (twobetween ?x ?y)
	(succ ?x ?z)
	(true (cell ?z onecoin))
	(onebetween ?z ?y))
(<= (twobetween ?x ?y)
	(succ ?x ?z)
	(true (cell ?z zerocoins))
	(twobetween ?z ?y))

(succ 1 2)
(succ 2 3)
(succ 3 4)
(succ 4 5)
(succ 5 6)
(succ 6 7)
(succ 7 8)
