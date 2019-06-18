%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;; Tron
%% ;;;
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%% (role black)
%% (role white)

%% (<= (base (at ?x ?y ?obj)) (bounds ?x) (bounds ?y) (object ?obj))
%% (<= (base (marked ?x ?y)) (bounds ?x) (bounds ?y))


%% (<= (input ?r left) (role ?r))
%% (<= (input ?r right) (role ?r))
%% (<= (input ?r up) (role ?r))
%% (<= (input ?r down) (role ?r))

%% (bounds 1)
%% (bounds 2)
%% (bounds 3)
%% (bounds 4)
%% (bounds 5)

%% (succ 1 2)
%% (succ 2 3)
%% (succ 3 4)
%% (succ 4 5)

%% (object x)
%% (object o)

%% (init (at 1 1 x))
%% (init (at 2 5 o))

%% (controls black x)
%% (controls white o)

%% (<= (aux_something_at ?x ?y) (true (at ?x ?y ?obj)))

(<= (legal ?r left) (true (at ?x ?y ?obj)) (controls ?r ?obj) (succ ?z ?x) (not (aux_something_at ?z ?y)))
(<= (legal ?r right) (true (at ?x ?y ?obj)) (controls ?r ?obj) (succ ?x ?z) (not (aux_something_at ?z ?y)))
(<= (legal ?r up) (true (at ?x ?y ?obj)) (controls ?r ?obj) (succ ?y ?z) (not (aux_something_at ?x ?z)))
(<= (legal ?r down) (true (at ?x ?y ?obj)) (controls ?r ?obj) (succ ?z ?y) (not (aux_something_at ?x ?z)))

%% (<= (next (at ?x ?y ?obj)) (true (at ?z ?y ?obj)) (does ?r left) (controls ?r ?obj) (succ ?x ?z))
%% (<= (next (at ?x ?y ?obj)) (true (at ?z ?y ?obj)) (does ?r right) (controls ?r ?obj) (succ ?z ?x))
%% (<= (next (at ?x ?y ?obj)) (true (at ?x ?z ?obj)) (does ?r up) (controls ?r ?obj) (succ ?z ?y))
%% (<= (next (at ?x ?y ?obj)) (true (at ?x ?z ?obj)) (does ?r down) (controls ?r ?obj) (succ ?y ?z))
%% (<= (next (marked ?x ?y)) (true (at ?x ?y ?obj)))
%% (<= (next (marked ?x ?y)) (true (marked ?x ?y)))

%% (distinct black white)
%% (distinct white black)

%% (<= (goal black 100) (aux_dead white) (not (aux_dead black)))
%% (<= (goal black 0) (aux_dead black))
%% (<= (goal white 100) (aux_dead black) (not (aux_dead white)))
%% (<= (goal white 0) (aux_dead white))

%% (<= (aux_dead ?r) (controls ?r ?obj) (true (at ?x ?y ?obj)) (true (marked ?x ?y)))


%% (<= terminal (aux_dead ?r))
aux_dead(R):-controls(R,O),true_at(X,Y,O),true_marked(X,Y).

goal(A,0):-controls(A,O),true_at(X,Y,O),true_marked(X,Y).
goal(A,100):-controls(A,O),true_at(X,Y,O),true_marked(X,Y).


%% goal(black,100):-aux_dead(white), not(aux_dead(black))).

%% (<= (goal black 0) (aux_dead black))
%% (<= (goal white 100) (aux_dead black) (not (aux_dead white)))
%% (<= (goal white 0) (aux_dead white))

%% terminal:- aux_dead(R).


%% terminal:-controls(R,O),terminal1(O).
%% terminal1(O):-true_at(X,Y,O),true_marked(X,Y).