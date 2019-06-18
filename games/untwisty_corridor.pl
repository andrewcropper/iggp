;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Untwisty Corridor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Components
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (role robot)
  
  (base p)
  (base q1)
  (base q2)
  (base q3)
  (base q4)
  (base q5)
  (base q6)
  (base q7)
  (base q8)
  (base (step 1))
  (base (step 2))
  (base (step 3))
  (base (step 4))
  (base (step 5))
  (base (step 6))
  (base (step 7))
  (base (step 8))

  (input robot a)
  (input robot b)
  (input robot c)
  (input robot d)
  (input robot e)
  (input robot f)
  (input robot g)
  (input robot h)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (init q1)
  (init (step 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; legal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (legal robot a)
  (legal robot b)
  (legal robot c)
  (legal robot d)
  (legal robot e)
  (legal robot f)
  (legal robot g)
  (legal robot h)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; next
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= (next p) (does robot a))
  (<= (next p) (does robot b))
  (<= (next p) (does robot c))
  (<= (next p) (does robot d))
  (<= (next p) (does robot e))
  (<= (next p) (does robot f))
  (<= (next p) (does robot g))
  (<= (next p) (true p))

  (<= (next q1) (does robot a))
  (<= (next q1) (does robot b))
  (<= (next q1) (does robot c))
  (<= (next q1) (does robot d))
  (<= (next q1) (does robot e))
  (<= (next q1) (does robot f))
  (<= (next q1) (does robot g))
  (<= (next q1) (does robot h))

  (<= (next q2) (does robot h) (not (true p)) (true q1))
  (<= (next q3) (does robot h) (not (true p)) (true q2))
  (<= (next q4) (does robot h) (not (true p)) (true q3))
  (<= (next q5) (does robot h) (not (true p)) (true q4))
  (<= (next q6) (does robot h) (not (true p)) (true q5))
  (<= (next q7) (does robot h) (not (true p)) (true q6))
  (<= (next q8) (does robot h) (not (true p)) (true q7))

  (<= (next (step ?n)) (true (step ?m)) (successor ?m ?n))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; goal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= (goal robot 100) (true q8))
  (<= (goal robot 0) (not (true q8)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; terminal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= terminal (true (step 8)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (successor 1 2)
  (successor 2 3)
  (successor 3 4)
  (successor 4 5)
  (successor 5 6)
  (successor 6 7)
  (successor 7 8)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;