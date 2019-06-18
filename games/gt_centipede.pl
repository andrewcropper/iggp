;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;  Game Theory: The Centipede Game
;;;
;;;  A two player game with alternating play in which, in each round,
;;;  each player has the option to either continue or finish. If a player
;;;  finishes, the game ends immediately. Otherwise, the game continues.
;;;  The payoffs are constructed so that the decisions are as follows:
;;;
;;;  Let [x,y] denote a payoff of 'x' to White and 'y' to Black.
;;;
;;;  1. White decides whether to finish at [5,0] or continue.
;;;  2. Black decides whether to finish at [0,15] or continue.
;;;  3. White decides whether to finish at [15,10] or continue.
;;;  4. Black decides whether to finish at [10,25] or continue.
;;;     (etc)
;;;  17. White decides whether to finish at [85,80] or continue.
;;;  18. Black decides whether to finish at [80,95] or continue.
;;;  19. The game finishes at [95,90].
;;;
;;;  Conventional game theory suggests that rational players will finish
;;;  the game immediately. To see why this is the case, consider Black's
;;;  final move: a decision between 95 points and 90 points. A rational
;;;  player will finish rather than continue. Assuming that Black will
;;;  finish on move 18, then by similar logic White will finish on move 17,
;;;  to get 85 points rather than 80, and so on, until White must logically
;;;  choose to finish on move 1.
;;;
;;;  Background: http://en.wikipedia.org/wiki/Centipede_game
;;;
;;;  GDL BY: Sam Schreiber (schreib@cs.stanford.edu)
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ROLE Relations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(role white)
(role black)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INIT Relations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(init (whitePayoff 5))
(init (blackPayoff 0))
(init (control white))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LEGAL Relations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(<= (legal white finish)
    (true (control white)))

(<= (legal white continue)
    (true (control white)))

(<= (legal black finish)
    (true (control black)))

(<= (legal black continue)
    (true (control black)))

(<= (legal white noop)
    (true (control black)))

(<= (legal black noop)
    (true (control white)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; NEXT Relations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(<= (next (whitePayoff ?xNext))
    (true (whitePayoff ?x))
    (does white continue)
    (succ ?xNext ?x))

(<= (next (blackPayoff ?xNext))
    (true (blackPayoff ?x))
    (does white continue)
    (succ ?x ?x1)
    (succ ?x1 ?x2)
    (succ ?x2 ?xNext))

(<= (next (blackPayoff ?xNext))
    (true (blackPayoff ?x))
    (does black continue)
    (succ ?xNext ?x))

(<= (next (whitePayoff ?xNext))
    (true (whitePayoff ?x))
    (does black continue)
    (succ ?x ?x1)
    (succ ?x1 ?x2)
    (succ ?x2 ?xNext))

(<= (next (whitePayoff ?x))
    (true (whitePayoff ?x))
    (does black finish))

(<= (next (whitePayoff ?x))
    (true (whitePayoff ?x))
    (does white finish))

(<= (next (blackPayoff ?x))
    (true (blackPayoff ?x))
    (does black finish))

(<= (next (blackPayoff ?x))
    (true (blackPayoff ?x))
    (does white finish))

(<= (next (gameOver))
    (does white finish))

(<= (next (gameOver))
    (does black finish))

(<= (next (control black))
    (true (control white)))

(<= (next (control white))
    (true (control black)))

(<= (next (gameOver))
    (true (blackPayoff 95)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TERMINAL Relations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(<= terminal
    (true (gameOver)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GOAL Relations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(<= (goal white ?x)
    (true (gameOver))
    (true (whitePayoff ?x)))

p(x,A):-q(A),r.
goal(white,X):-my_true_whitePayoff(X),gameOver.
goal(black,X):-my_true_blackPayoff(X),gameOver.
goal(A,0):-not_true_gameover.

(<= (goal black ?x)
    (true (gameOver))
    (true (blackPayoff ?x)))

(<= (goal white 0)
    (not (true (gameOver))))

(<= (goal black 0)
    (not (true (gameOver))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Static Relations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(succ 0 5)
(succ 5 10)
(succ 10 15)
(succ 15 20)
(succ 20 25)
(succ 25 30)
(succ 30 35)
(succ 35 40)
(succ 40 45)
(succ 45 50)
(succ 50 55)
(succ 55 60)
(succ 60 65)
(succ 65 70)
(succ 70 75)
(succ 75 80)
(succ 80 85)
(succ 85 90)
(succ 90 95)
(succ 95 100)