;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Scissors Paper Stone
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%% (<= (legal ?p scissors) (player ?p))
%% (<= (legal ?p paper) (player ?p))
%% (<= (legal ?p stone) (player ?p))

legal(A,B):-player(A),q(B).
q(paper).
q(scissors).
q(stone).

%% (<= terminal (true (step 3)))

terminal:-true_step(3).

%% (<= (goal ?p ?s) (true (score ?p ?s)))

goal(A,B):-true_score(A,B).

%% (<= (next (step ?n)) (true (step ?m)) (succ ?m ?n))
%% (<= (next (score ?p ?n)) (true (score ?p ?n)) (draws ?p))
%% (<= (next (score ?p ?n)) (true (score ?p ?n)) (loses ?p))
%% (<= (next (score ?p ?n)) (true (score ?p ?n2)) (succ ?n2 ?n) (wins ?p))

%% (<= (draws ?p) (does ?p ?a) (does ?q ?a) (distinct ?p ?q))
%% (<= (wins ?p) (does ?p ?a1) (does ?q ?a2) (distinct ?p ?q) (beats ?a1 ?a2))
%% (<= (loses ?p) (does ?p ?a1) (does ?q ?a2) (distinct ?p ?q) (beats ?a2 ?a1))

next_score(A,B):-true_score(A,B),wins(A).
next_score(A,B):-true_score(A,B),not(wins(A)).
wins(A):-does(A,C),does(B,E),beats(C,E).
%% loses(A):-does(A,C),does(B,E),distinct(A,B),beats(E,C).

%% draws(A):-does(A,B),draws1(A,B).
%% draws1(A,B):-distinct(A,C),does(C,B).
%% wins(A):-does(A,B),wins1(A,B).
%% wins1(A,B):-does(C,E),distinct(A,B),beats(C,E).

(beats scissors paper)
(beats paper stone)
(beats stone scissors)

(succ 0  1)
(succ 1  2)
(succ 2  3)

(player p1)
(player p2)

(init (step 0))
(init (score p1 0))
(init (score p2 0))

