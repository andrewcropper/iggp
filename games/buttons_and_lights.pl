%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;; Buttons and Lights
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;; Components
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%%   (role robot)

%%   (base p)
%%   (base q)
%%   (base r)
%%   (base 1)
%%   (base 2)
%%   (base 3)
%%   (base 4)
%%   (base 5)
%%   (base 6)
%%   (base 7)

%%   (input robot a)
%%   (input robot b)
%%   (input robot c)

%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;; init
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%%   (init 1)

%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;; legal
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%%   (legal robot a)
%%   (legal robot b)
%%   (legal robot c)

%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;; next
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%%   (<= (next p) (does robot a) (not (true p)))
%%   (<= (next p) (does robot b) (true q))
%%   (<= (next p) (does robot c) (true p))

%%   (<= (next q) (does robot a) (true q))
%%   (<= (next q) (does robot b) (true p))
%%   (<= (next q) (does robot c) (true r))

%%   (<= (next r) (does robot a) (true r))
%%   (<= (next r) (does robot b) (true r))
%%   (<= (next r) (does robot c) (true q))

%%   (<= (next ?y) (true ?x) (successor ?x ?y))


next(p):-does(robot,a),not(true(p)).
next(p):-does(robot,b),true(q).
next(p):-does(robot,c),true(p).

next(q):-does(robot,a),true(q).
next(q):-does(robot,b),true(p).
next(q):-does(robot,c),true(r).

next(r):-does(robot,a),true(r).
next(r):-does(robot,b),true(r).
next(r):-does(robot,c),true(q).


%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;; goal
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%%   (<= (goal robot 100) (true p) (true q) (true r))
%%   (<= (goal robot 0) (not (true p)))
%%   (<= (goal robot 0) (not (true q)))
%%   (<= (goal robot 0) (not (true r)))

goal(robot,100):-true(p),true(q),true(r).
goal(robot,0):-not(true(p)).
goal(robot,0):-not(true(q)).
goal(robot,0):-not(true(r)).



%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;; terminal
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  %% (<= terminal (true p) (true q) (true r))
  %% (<= terminal (true 7))

terminal:-true(p),true(q),true(r).
terminal:-true(7).

%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;; Data
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%%   (successor 1 2)
%%   (successor 2 3)
%%   (successor 3 4)
%%   (successor 4 5)
%%   (successor 5 6)
%%   (successor 6 7)

%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;