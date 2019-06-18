;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Battle of Numbers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; components
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (role red)
  (role green)


  (<= (base (cell ?i ?j ?n ?r))
      (index ?i)
      (index ?j)
      (number ?n)
      (role ?r))

  (<= (base (capture ?r 0)) (role ?r))
  (<= (base (capture ?r ?n)) (role ?r) (captureadd ?m ?n))
  (base (step 1))
  (<= (base (step ?n)) (stepcount ?m ?n))
  (<= (base (control ?r)) (role ?r))


  (<= (input ?r (move ?x1 ?y1 ?x2 ?y2))
      (role ?r)
      (orthogonal ?x1 ?y1 ?x2 ?y2))

  (<= (input ?r (move ?x1 ?y1 ?x2 ?y2))
      (role ?r)
      (diagonal ?x1 ?y1 ?x2 ?y2))

  (<= (input ?r noop) (role ?r))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(init (cell 1 1 1 red))
(init (cell 2 1 3 red))
(init (cell 3 1 5 red))
(init (cell 4 1 4 red))
(init (cell 5 1 2 red))

(init (cell 1 5 2 green))
(init (cell 2 5 4 green))
(init (cell 3 5 5 green))
(init (cell 4 5 3 green))
(init (cell 5 5 1 green))

(init (control red))
(init (capture red 0))
(init (capture green 0))

(init (step 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; legal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(<= (legal ?player ?move)
    (legal2 ?player ?move))

(<= (legal ?player noop)
    (role ?player)
    (not (true (control ?player))))

(<= (legal ?player noop)
    (true (control ?player))
    (not (hasLegalMove ?player)))

(<= (hasLegalMove ?player)
    (legal2 ?player ?move))

(<= (legal2 ?player (move ?x1 ?y1 ?x2 ?y2))
    (true (control ?player))
    (true (cell ?x1 ?y1 ?n ?player))
    (orthogonal ?x1 ?y1 ?x2 ?y2)
    (forward ?x1 ?y1 ?x2 ?y2 ?player)
    (opencell ?x2 ?y2))

;could comment this out to only allow diagonals if capturing.
(<= (legal2 ?player (move ?x1 ?y1 ?x2 ?y2))
    (true (control ?player))
    (true (cell ?x1 ?y1 ?n ?player))
    (diagonal ?x1 ?y1 ?x2 ?y2)
    (forward ?x1 ?y1 ?x2 ?y2 ?player)
    (opencell ?x2 ?y2))

(<= (legal2 ?player1 (move ?x1 ?y1 ?x2 ?y2))
    (true (control ?player1))
    (true (cell ?x1 ?y1 ?n1 ?player1))
    (diagonal ?x1 ?y1 ?x2 ?y2)
    (true (cell ?x2 ?y2 ?n2 ?player2))
    (distinct ?player1 ?player2)
    (eatable ?n1 ?n2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; next
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(<= (next (cell ?x2 ?y2 ?n ?player))
    (true (cell ?x1 ?y1 ?n ?player))
    (does ?player (move ?x1 ?y1 ?x2 ?y2)))

(<= (next (cell ?x ?y ?n ?player))
    (true (cell ?x ?y ?n ?player))
    (not (camefrom ?x ?y))
    (not (wentto ?x ?y)))

(<= (next (capture ?player ?count))
    (true (capture ?player ?count))
    (not (captured ?player)))

(<= (next (capture ?player ?count2))
    (true (capture ?player ?count1))
    (captured ?player)
    (captureadd ?count1 ?count2))

(<= (next (control red))
    (true (control green)))

(<= (next (control green))
    (true (control red)))

(<= (next (step ?t2))
    (true (step ?t1))
    (stepcount ?t1 ?t2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; goal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= (goal ?player1 100)
      (true (capture ?player1 ?count1))
      (true (capture ?player2 ?count2))
      (distinct ?player1 ?player2)
      (greater ?count1 ?count2))

  (<= (goal ?player2 0)
      (true (capture ?player1 ?count1))
      (true (capture ?player2 ?count2))
      (distinct ?player1 ?player2)
      (greater ?count1 ?count2))

  (<= (goal ?player1 50)
      (true (capture ?player1 ?count1))
      (true (capture ?player2 ?count2))
      (distinct ?player1 ?player2)
      (not (distinct ?count1 ?count2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; terminal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= terminal (true (step 41)))
  (<= terminal (true (capture ?r 5)))
  (<= terminal
      (not (hasLegalMove green))
      (not (hasLegalMove red)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Views
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= (camefrom ?x1 ?y1) (does ?player (move ?x1 ?y1 ?x2 ?y2)))
  (<= (wentto ?x2 ?y2) (does ?player (move ?x1 ?y1 ?x2 ?y2)))

  (<= (captured ?player)
      (true (control ?player))
      (wentto ?x ?y)
      (true (cell ?x ?y ?n ?player2)))

  (<= (forward ?x1 ?y1 ?x2 ?y2 green)
      (succ ?y2 ?y1)
      (index ?x1)
      (index ?x2))

  (<= (forward ?x1 ?y1 ?x2 ?y2 red)
      (succ ?y1 ?y2)
      (index ?x1)
      (index ?x2))

  (<= (orthogonal ?x1 ?y ?x2 ?y)
      (succ ?x1 ?x2)
      (index ?y))

  (<= (orthogonal ?x1 ?y ?x2 ?y)
      (succ ?x2 ?x1)
      (index ?y))

  (<= (orthogonal ?x ?y1 ?x ?y2)
      (succ ?y1 ?y2)
      (index ?x))

  (<= (orthogonal ?x ?y1 ?x ?y2)
      (succ ?y2 ?y1)
      (index ?x))


  (<= (diagonal ?x1 ?y1 ?x2 ?y2)
      (succ ?x1 ?x2)
      (succ ?y1 ?y2))

  (<= (diagonal ?x1 ?y1 ?x2 ?y2)
      (succ ?x1 ?x2)
      (succ ?y2 ?y1))

  (<= (diagonal ?x1 ?y1 ?x2 ?y2)
      (succ ?x2 ?x1)
      (succ ?y1 ?y2))

  (<= (diagonal ?x1 ?y1 ?x2 ?y2)
      (succ ?x2 ?x1)
      (succ ?y2 ?y1))

  (<= (onboard ?x ?y)
      (index ?x)
      (index ?y))

  (<= (opencell ?x ?y)
      (onboard ?x ?y)
      (not (occupiedcell ?x ?y)))

  (<= (occupiedcell ?x ?y)
      (onboard ?x ?y)
      (number ?n)
      (role ?player)
      (true (cell ?x ?y ?n ?player)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(index 1)
(index 2)
(index 3)
(index 4)
(index 5)

(number 1)
(number 2)
(number 3)
(number 4)
(number 5)

(succ 1 2)
(succ 2 3)
(succ 3 4)
(succ 4 5)

(eatable 5 5)
(eatable 5 4)
(eatable 5 3)
(eatable 5 2)
(eatable 4 4)
(eatable 4 3)
(eatable 4 2)
(eatable 4 1)
(eatable 3 3)
(eatable 3 2)
(eatable 3 1)
(eatable 2 2)
(eatable 2 1)
(eatable 1 1)
(eatable 1 5)

(captureadd 0 1)
(captureadd 1 2)
(captureadd 2 3)
(captureadd 3 4)
(captureadd 4 5)

(stepcount 1 2)
(stepcount 2 3)
(stepcount 3 4)
(stepcount 4 5)
(stepcount 5 6)
(stepcount 6 7)
(stepcount 7 8)
(stepcount 8 9)
(stepcount 9 10)
(stepcount 10 11)
(stepcount 11 12)
(stepcount 12 13)
(stepcount 13 14)
(stepcount 14 15)
(stepcount 15 16)
(stepcount 16 17)
(stepcount 17 18)
(stepcount 18 19)
(stepcount 19 20)
(stepcount 20 21)
(stepcount 21 22)
(stepcount 22 23)
(stepcount 23 24)
(stepcount 24 25)
(stepcount 25 26)
(stepcount 26 27)
(stepcount 27 28)
(stepcount 28 29)
(stepcount 29 30)
(stepcount 30 31)
(stepcount 31 32)
(stepcount 32 33)
(stepcount 33 34)
(stepcount 34 35)
(stepcount 35 36)
(stepcount 36 37)
(stepcount 37 38)
(stepcount 38 39)
(stepcount 39 40)
(stepcount 40 41)

(greater 5 4)
(greater 5 3)
(greater 5 2)
(greater 5 1)
(greater 5 0)
(greater 4 3)
(greater 4 2)
(greater 4 1)
(greater 4 0)
(greater 3 2)
(greater 3 1)
(greater 3 0)
(greater 2 1)
(greater 2 0)
(greater 1 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;