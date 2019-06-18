%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;; Horseshoe
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;; components
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%%   (role red)
%%   (role black)


%%   (<= (base (cell ?node ?mark)) (node ?node) (mark ?mark))

%%   (<= (base (control ?role))
%%       (role ?role))

%%   (<= (base (step 1)))

%%   (<= (base (step ?n))
%%       (succ ?m ?n))


%%   (<= (input ?role (move ?x ?y))
%%       (role ?role)
%%       (adjacent ?x ?y))

%%   (<= (input ?role noop)
%%       (role ?role))


%%   (node a)
%%   (node b)
%%   (node c)
%%   (node d)
%%   (node e)

%%   (mark black)
%%   (mark red)
%%   (mark blank)

%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;; init
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%%   (init (cell a red))
%%   (init (cell b black))
%%   (init (cell c blank))
%%   (init (cell d red))
%%   (init (cell e black))
%%   (init (control red))
%%   (init (step 1))

%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;; legal
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%%   (<= (legal ?role (move ?x ?y))
%%       (true (control ?role))
%%       (true (cell ?x ?role))
%%       (adjacent ?x ?y)
%%       (true (cell ?y blank)))

%% (<= (legal_move(?r,?x ?y))
%%       (true_control ?role))
%%       (true_cell ?x ?role))
%%       (adjacent ?x ?y)
%%       (true_cell ?y blank)))

%% pos(legal_move(0,red, c, b)).
legal_move(R,X,Y):-
  true_control(R),
  true_cell(X,R),
  adjacent(X,Y),
  true_cell(Y,black).

%% legal_move(A,B,C):-

legal_move(R,X,Y):-f1(R,X),f2(X,Y).
f1(R,X):-true_control(R),true_cell(X,R).
f2(X,Y):-adjacent(X,Y),f3(Y).
f3(A):-true_cell(A,black).



%%   (<= (legal red noop)
%%       (true (control black)))

%%   (<= (legal black noop)
%%       (true (control red)))

%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;; next
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%%   (<= (next (cell ?y ?role))
%%       (does ?role (move ?x ?y)))

%%   (<= (next (cell ?x blank))
%%       (does ?role (move ?x ?y)))

%%   (<= (next (cell ?z ?mark))
%%       (does ?role (move ?x ?y))
%%       (true (cell ?z ?mark))
%%       (distinct ?x ?z)
%%       (distinct ?y ?z))

%%   (<= (next (control red))
%%       (true (control black)))

%%   (<= (next (control black))
%%       (true (control red)))

%% next_control(b):-true_conteol()

%%   (<= (next (step ?n))
%%       (true (step ?m))
%%       (succ ?m ?n))

%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;; goal
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  %% (<= (goal red 100)
  %%     (true (control black))
  %%     (not (free black)))

  %% (<= (goal black 100)
  %%     (true (control red))
  %%     (not (free red)))

  %% (<= (goal ?role 0)
  %%     (true (control ?role)))


  %% (<= (goal red 0)
  %%     (free black))

  %% (<= (goal black 0)
  %%     (free red))

%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;; terminal
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  %% (<= terminal (true (control ?role)) (not (free ?role)))
  %% (<= terminal (true (step 20)))

terminal:-true_step(20).

free(R):-
  true_cell(X,R),
  adjacent(X,Y),
  true_cell(Y,blank).

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Views
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

free(R):-
  true_cell(X,R),
  adjacent(X,Y),
  true_cell(Y,blank).

  %% (<= (free ?role)
  %%     (true (cell ?x ?role))
  %%     (adjacent ?x ?y)
  %%     (true (cell ?y blank)))

%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;; Data
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%%   (adjacent a b)
%%   (adjacent a c)
%%   (adjacent b a)
%%   (adjacent b c)
%%   (adjacent b e)
%%   (adjacent c a)
%%   (adjacent c b)
%%   (adjacent c d)
%%   (adjacent c e)
%%   (adjacent d c)
%%   (adjacent d e)
%%   (adjacent e b)
%%   (adjacent e c)
%%   (adjacent e d)

%%   (succ 1 2)
%%   (succ 2 3)
%%   (succ 3 4)
%%   (succ 4 5)
%%   (succ 5 6)
%%   (succ 6 7)
%%   (succ 7 8)
%%   (succ 8 9)
%%   (succ 9 10)
%%   (succ 10  11)
%%   (succ 11  12)
%%   (succ 12  13)
%%   (succ 13  14)
%%   (succ 14  15)
%%   (succ 15  16)
%%   (succ 16  17)
%%   (succ 17  18)
%%   (succ 18  19)
%%   (succ 19  20)

