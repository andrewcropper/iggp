;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Hunter
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Components
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (role robot)

  (<= (base (cell ?m ?n ?p)) (row ?m) (col ?n) (piece ?p))
  (<= (base (captures ?m)) (scoremap ?m ?n))
  (<= (base (step ?n)) (succ ?m ?n))

  (<= (input robot (move ?m1 ?n1 ?m2 ?n2))
      (row ?m1)
      (col ?n1)
      (knightmove ?m1 ?n1 ?m2 ?n2))

  (row 1)
  (row 2)
  (row 3)
  (row 4)
  (row 5)

  (col 1)
  (col 2)
  (col 3)

  (piece knight)
  (piece pawn)
  (piece blank)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (init (cell 1 1 knight))
  (init (cell 1 2 pawn))
  (init (cell 1 3 pawn))
  (init (cell 2 1 pawn))
  (init (cell 2 2 pawn))
  (init (cell 2 3 pawn))
  (init (cell 3 1 pawn))
  (init (cell 3 2 pawn))
  (init (cell 3 3 pawn))
  (init (cell 4 1 pawn))
  (init (cell 4 2 pawn))
  (init (cell 4 3 pawn))
  (init (cell 5 1 pawn))
  (init (cell 5 2 pawn))
  (init (cell 5 3 pawn))
  (init (captures 0))
  (init (step 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; legal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= (legal robot (move ?m1 ?n1 ?m2 ?n2))
      (true (cell ?m1 ?n1 knight))
      (knightmove ?m1 ?n1 ?m2 ?n2))

p(A,B,C,D):-
  q(A,B),
  r(A,B,C,D).

legal_move(robot,M1,N1,M2,N2):-
  knightmove(m1,n1,m2,n2),
  true_cell(m1,n2,knight),

legal_move(robot,M1,N1,M2,N2):-lm1(M1,N1,M2,N2).
lm1(A,B,C,D):-lm2(A,B),knightmove(A,B,C,D).
lm2(A,B):-true_cell(A,B,knight).

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; next
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= (next (cell ?m2 ?n2 knight))
      (does robot (move ?m1 ?n1 ?m2 ?n2)))

  (<= (next (cell ?m1 ?n1 blank))
      (does robot (move ?m1 ?n1 ?m2 ?n2)))

  (<= (next (cell ?u ?v pawn))
      (true (cell ?u ?v pawn))
      (does robot (move ?m1 ?n1 ?m2 ?n2))
      (distinct ?u ?m2))

  (<= (next (cell ?u ?v pawn))
      (true (cell ?u ?v pawn))
      (does robot (move ?m1 ?n1 ?m2 ?n2))
      (distinct ?v ?n2))

  (<= (next (cell ?u ?v blank))
      (true (cell ?u ?v blank))
      (does robot (move ?m1 ?n1 ?m2 ?n2))
      (distinct ?u ?m2))

  (<= (next (cell ?u ?v blank))
      (true (cell ?u ?v blank))
      (does robot (move ?m1 ?n1 ?m2 ?n2))
      (distinct ?v ?n2))

  (<= (next (captures ?old))
      (does robot (move ?m1 ?n1 ?m2 ?n2))
      (true (cell ?m2 ?n2 blank))
      (true (captures ?old)))

next_captures(A):-

  (<= (next (captures ?new))
      (does robot (move ?m1 ?n1 ?m2 ?n2))
      (true (cell ?m2 ?n2 pawn))
      (true (captures ?old))
      (succ ?old ?new))

  (<= (next (step ?new))
      (true (step ?old))
      (succ ?old ?new))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; goal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= (goal robot ?goal)
      (true (captures ?count))
      (scoremap ?count ?goal))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; terminal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= terminal (true (step 16)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Views
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= (knightmove ?m1 ?n1 ?m2 ?n2)
      (add1row ?m1 ?m2)
      (add2col ?n1 ?n2))

  (<= (knightmove ?m1 ?n1 ?m2 ?n2)
      (add1row ?m1 ?m2)
      (add2col ?n2 ?n1))

  (<= (knightmove ?m1 ?n1 ?m2 ?n2)
      (add1row ?m2 ?m1)
      (add2col ?n1 ?n2))

  (<= (knightmove ?m1 ?n1 ?m2 ?n2)
      (add1row ?m2 ?m1)
      (add2col ?n2 ?n1))

  (<= (knightmove ?m1 ?n1 ?m2 ?n2)
      (add2row ?m1 ?m2)
      (add1col ?n1 ?n2))

  (<= (knightmove ?m1 ?n1 ?m2 ?n2)
      (add2row ?m1 ?m2)
      (add1col ?n2 ?n1))

  (<= (knightmove ?m1 ?n1 ?m2 ?n2)
      (add2row ?m2 ?m1)
      (add1col ?n1 ?n2))

  (<= (knightmove ?m1 ?n1 ?m2 ?n2)
      (add2row ?m2 ?m1)
      (add1col ?n2 ?n1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (succ  0  1)
  (succ  1  2)
  (succ  2  3)
  (succ  3  4)
  (succ  4  5)
  (succ  5  6)
  (succ  6  7)
  (succ  7  8)
  (succ  8  9)
  (succ  9 10)
  (succ 10 11)
  (succ 11 12)
  (succ 12 13)
  (succ 13 14)
  (succ 14 15)
  (succ 15 16)

  (add1row 1 2)
  (add1row 2 3)
  (add1row 3 4)
  (add1row 4 5)

  (add2row 1 3)
  (add2row 2 4)
  (add2row 3 5)

  (add1col 1 2)
  (add1col 2 3)

  (add2col 1 3)

  (scoremap  0   0)
  (scoremap  1   1)
  (scoremap  2   3)
  (scoremap  3   7)
  (scoremap  4  11)
  (scoremap  5  16)
  (scoremap  6  22)
  (scoremap  7  29)
  (scoremap  8  37)
  (scoremap  9  45)
  (scoremap 10  54)
  (scoremap 11  64)
  (scoremap 12  75)
  (scoremap 13  87)
  (scoremap 14 100)

