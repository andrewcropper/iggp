%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%% ;;; Centipede
%% ;;;
%% ;;; The player must shoot the centipede before it comes down and kills him!
%% ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%% (role black)

%% (<= (base (at ?x ?y ?obj)) (bounds ?x) (bounds ?y) (object ?obj))
%% (<= (base (dir ?c ?d)) (centipede ?c) (is_dir ?d))

%% (is_dir left)
%% (is_dir right)

%% (is_left left)
%% (is_right right)
%% (is_fire fire)
%% (is_noop noop)

%% (<= (input ?r left) (role ?r))
%% (<= (input ?r right) (role ?r))
%% (<= (input ?r fire) (role ?r))
%% (<= (input ?r noop) (role ?r))

%% (bounds 1)
%% (bounds 2)
%% (bounds 3)
%% (bounds 4)
%% (bounds 5)
%% (bounds 6)
%% (bounds 7)
%% (bounds 8)

%% (succ 1 2)
%% (succ 2 3)
%% (succ 3 4)
%% (succ 4 5)
%% (succ 5 6)
%% (succ 6 7)
%% (succ 7 8)

%% (<= (has_pred ?x) (succ ?y ?x))
%% (<= (has_succ ?x) (succ ?x ?y))

%% (object x)
%% (object o)
%% (object c)

%% (init (at 1 1 x))
%% (init (at 8 8 c))

%% (init (dir c left))

%% (controls black x)

%% (centipede c)

%% (bullet o)

%% (<= aux_bullet_exists (bullet ?obj) (true (at ?x ?y ?obj)))

%% (<= no_bullet (bullet ?obj) (not (bullet_somewhere ?obj)))
%% (<= (bullet_somewhere ?obj) (bullet ?obj) (true (at ?x ?y ?obj)))


%% (<= aux_centipede_exists (centipede ?obj) (true (at ?x ?y ?obj)))

%% (<= aux_centipede_at_bottom (centipede ?obj) (true (at ?x ?y ?obj)) (not (has_pred ?y)))

%% (<= (aux_bullet_below ?x ?y) (bullet ?obj) (true (at ?x ?z ?obj)) (succ ?z ?y))

%% (<= (legal ?r left) (true (at ?x ?y ?obj)) (controls ?r ?obj) (succ ?z ?x))
%% (<= (legal ?r right) (true (at ?x ?y ?obj)) (controls ?r ?obj) (succ ?x ?z))
%% (<= (legal ?r fire) (true (at ?x ?y ?obj)) (controls ?r ?obj) (succ ?y ?z) (not aux_bullet_exists))
%% (<= (legal ?r noop) (controls ?r ?obj))

%% (<= (next (dir ?obj left)) (true (at ?x ?y ?obj)) (centipede ?obj) (not (aux_bullet_below ?x ?y)) (true (dir ?obj left)) (has_pred ?x))

%% (<= (next (dir ?obj right)) (true (at ?x ?y ?obj)) (centipede ?obj) (not (aux_bullet_below ?x ?y)) (true (dir ?obj left)) (not (has_pred ?x)))

%% (<= (next (at ?z ?y ?obj)) (true (at ?x ?y ?obj)) (centipede ?obj) (not (aux_bullet_below ?x ?y)) (true (dir ?obj left)) (succ ?z ?x))

%% (<= (next (at ?x ?z ?obj)) (true (at ?x ?y ?obj)) (centipede ?obj) (not (aux_bullet_below ?x ?y)) (true (dir ?obj left)) (not (has_pred ?x)) (succ ?z ?y))

%% (<= (next (dir ?obj right)) (true (at ?x ?y ?obj)) (centipede ?obj) (not (aux_bullet_below ?x ?y)) (true (dir ?obj right)) (has_succ ?x))

%% (<= (next (dir ?obj left)) (true (at ?x ?y ?obj)) (centipede ?obj) (not (aux_bullet_below ?x ?y)) (true (dir ?obj right)) (not (has_succ ?x)))

%% (<= (next (at ?z ?y ?obj)) (true (at ?x ?y ?obj)) (centipede ?obj) (not (aux_bullet_below ?x ?y)) (true (dir ?obj right)) (succ ?x ?z))

%% (<= (next (at ?x ?z ?obj)) (true (at ?x ?y ?obj)) (centipede ?obj) (not (aux_bullet_below ?x ?y)) (true (dir ?obj right)) (not (has_succ ?x)) (succ ?z ?y))


%% (<= (next (at ?x ?y ?obj)) (true (at ?z ?y ?obj)) (does ?r left) (controls ?r ?obj) (succ ?x ?z))
%% (<= (next (at ?x ?y ?obj)) (true (at ?z ?y ?obj)) (does ?r right) (controls ?r ?obj) (succ ?z ?x))
%% (<= (next (at ?x ?y ?obj)) (true (at ?x ?y ?obj)) (does ?r fire) (controls ?r ?obj))
%% (<= (next (at ?x ?y ?obj)) (true (at ?x ?y ?obj)) (does ?r noop) (controls ?r ?obj))

%% (<= (next (at ?x ?z ?obj)) (true (at ?x ?y ?obj)) (bullet ?obj) (succ ?y ?z))

%% (<= (next (at ?x ?z ?bullet)) (true (at ?x ?y ?obj)) (bullet ?bullet) (does ?r fire) (controls ?r ?obj) (succ ?y ?z))

%% (<= (goal black 100) (not aux_centipede_exists))
%% (<= (goal black 10) aux_centipede_exists (not aux_centipede_at_bottom))
%% (<= (goal black 0) aux_centipede_at_bottom)


%% (<= terminal (not aux_centipede_exists))
%% (<= terminal aux_centipede_at_bottom)


%% aux_centipede_exists(centipede,O?obj) (true (at ?x ?y ?obj)))

aux_centipede_at_bottom(centipede ?obj) (true (at ?x ?y ?obj)) (not (has_pred ?y)))


terminal:- not(aux_centipede_exists).
terminal:- aux_centipede_at_bottom.