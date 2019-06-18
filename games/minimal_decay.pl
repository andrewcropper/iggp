;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Minimal Decay
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%% (legal player noop)
%% (legal player pressButton)

%% (<= (next (value ?x)) (true (value ?y)) (succ ?x ?y) (does player noop))
%% (<= (next (value 5)) (does player pressButton))

%% (init (value 5))

%% (succ 0  1)
%% (succ 1  2)
%% (succ 2  3)
%% (succ 3  4)
%% (succ 4  5)



legal(player,noop).
legal(player,pressButton).

next_value(5):-does_player(pressButton).
next_value(A):- true_value(B),succ(B,A),does_player(noop).

%% P(A)<-Q(B).
%% P(A)<-Q(B),R(B,A),S(C).

%% P(A)

(<= (next (value ?x)) (true (value ?y)) (succ ?x ?y) (does player noop)).
