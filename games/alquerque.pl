;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Alquerque
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; components
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (role red)
  (role black)


  (<= (base (cell ?m ?n ?mark))
      (index ?m)
      (index ?n)
      (mark ?mark))

  (<= (base (score ?role 0))
      (role ?role))

  (<= (base (score ?role ?n))
      (role ?role)
      (incr ?m ?n))

  (<= (base (control ?role))
      (role ?role))

  (<= (base (step 1)))

  (<= (base (step ?n))
      (succ ?m ?n))


  (<= (input ?role (move ?u ?v ?x ?y))
      (role ?role)
      (doublet ?u ?v ?x ?y))

  (<= (input ?role (jump ?u ?v ?w ?x ?y ?z))
      (role ?role)
      (triplet ?u ?v ?w ?x ?y ?z))

  (<= (input ?role noop)
      (role ?role))


  (index 1)
  (index 2)
  (index 3)
  (index 4)
  (index 5)

  (mark black)
  (mark red)
  (mark blank)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (init (cell 1 1 black))
  (init (cell 1 2 black))
  (init (cell 1 3 black))
  (init (cell 1 4 black))
  (init (cell 1 5 black))
  (init (cell 2 1 black))
  (init (cell 2 2 black))
  (init (cell 2 3 black))
  (init (cell 2 4 black))
  (init (cell 2 5 black))
  (init (cell 3 1 blank))
  (init (cell 3 2 blank))
  (init (cell 3 3 blank))
  (init (cell 3 4 blank))
  (init (cell 3 5 blank))
  (init (cell 4 1 red))
  (init (cell 4 2 red))
  (init (cell 4 3 red))
  (init (cell 4 4 red))
  (init (cell 4 5 red))
  (init (cell 5 1 red))
  (init (cell 5 2 red))
  (init (cell 5 3 red))
  (init (cell 5 4 red))
  (init (cell 5 5 red))
  (init (score red 0))
  (init (score black 0))
  (init (control red))
  (init (step 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; legal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= (legal ?role (move ?u ?v ?x ?y))
      (true (control ?role))
      (true (cell ?u ?v ?role))
      (doublet ?u ?v ?x ?y)
      (true (cell ?x ?y blank)))

  (<= (legal red (jump ?u ?v ?w ?x ?y ?z))
      (true (control red))
      (true (cell ?u ?v red))
      (triplet ?u ?v ?w ?x ?y ?z)
      (true (cell ?w ?x black))
      (true (cell ?y ?z blank)))

  (<= (legal black (jump ?u ?v ?w ?x ?y ?z))
      (true (control black))
      (true (cell ?u ?v black))
      (triplet ?u ?v ?w ?x ?y ?z)
      (true (cell ?w ?x red))
      (true (cell ?y ?z blank)))

  (<= (legal red noop)
      (true (control black)))

  (<= (legal black noop)
      (true (control red)))

legal(black,noop):-my_true_control(red).
legal(red,noop):-my_true_control(black).
P(A,B)<-Q(A).

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; next
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= (next (cell ?u ?v blank))
      (does ?role (move ?u ?v ?x ?y)))

  (<= (next (cell ?x ?y ?role))
      (does ?role (move ?u ?v ?x ?y)))

  (<= (next (cell ?m ?n ?mark))
      (does ?role (move ?u ?v ?x ?y))
      (true (cell ?m ?n ?mark))
      (distinctcell ?m ?n ?u ?v)
      (distinctcell ?m ?n ?x ?y))

  (<= (next (cell ?u ?v blank))
      (does ?role (jump ?u ?v ?w ?x ?y ?z)))

  (<= (next (cell ?w ?x blank))
      (does ?role (jump ?u ?v ?w ?x ?y ?z)))

  (<= (next (cell ?y ?z ?role))
      (does ?role (jump ?u ?v ?w ?x ?y ?z)))

  (<= (next (cell ?m ?n ?mark))
      (does ?role (jump ?u ?v ?w ?x ?y ?z))
      (true (cell ?m ?n ?mark))
      (distinctcell ?m ?n ?u ?v)
      (distinctcell ?m ?n ?w ?x)
      (distinctcell ?m ?n ?y ?z))

  (<= (next (score ?role ?n))
      (does ?anyone (move ?u ?v ?x ?y))
      (true (score ?role ?n)))

  (<= (next (score ?role ?n))
      (does ?role (jump ?u ?v ?w ?x ?y ?z))
      (true (score ?role ?m))
      (incr ?m ?n))

  (<= (next (score ?role ?n))
      (does ?role noop)
      (true (score ?role ?n)))

  (<= (next (control black))
      (true (control red)))

  (<= (next (control red))
      (true (control black)))

  (<= (next (step ?n))
      (true (step ?m))
      (succ ?m ?n))


next_control(black):-
      true_control(red).

next_control(red):-
      true_control(black).

next_control(red):-true_control(black).

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; goal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= (goal ?role ?n) (true (score ?role ?n)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; terminal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= terminal (true (score ?role 100)))

  (<= terminal (true (step 30)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Views
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= (distinctcell ?u ?v ?x ?y)
      (index ?u)
      (index ?x)
      (distinct ?u ?x)
      (index ?v)
      (index ?y))

  (<= (distinctcell ?u ?v ?x ?y)
      (index ?v)
      (index ?y)
      (distinct ?v ?y)
      (index ?u)
      (index ?x))


  (<= (doublet ?u ?v ?x ?y)
      (horizontal ?u ?v ?x ?y))

  (<= (doublet ?u ?v ?x ?y)
      (horizontal ?x ?y ?u ?v))

  (<= (doublet ?u ?v ?x ?y)
      (vertical ?u ?v ?x ?y))

  (<= (doublet ?u ?v ?x ?y)
      (vertical ?x ?y ?u ?v))

  (<= (doublet ?u ?v ?x ?y)
      (slash ?u ?v ?x ?y))

  (<= (doublet ?u ?v ?x ?y)
      (slash ?x ?y ?u ?v))

  (<= (doublet ?u ?v ?x ?y)
      (backslash ?u ?v ?x ?y))

  (<= (doublet ?u ?v ?x ?y)
      (backslash ?x ?y ?u ?v))


  (<= (triplet ?u ?v ?w ?x ?y ?z)
      (horizontal ?u ?v ?w ?x)
      (horizontal ?w ?x ?y ?z))

  (<= (triplet ?u ?v ?w ?x ?y ?z)
      (horizontal ?y ?z ?w ?x)
      (horizontal ?w ?x ?u ?v))

  (<= (triplet ?u ?v ?w ?x ?y ?z)
      (vertical ?u ?v ?w ?x)
      (vertical ?w ?x ?y ?z))

  (<= (triplet ?u ?v ?w ?x ?y ?z)
      (vertical ?y ?z ?w ?x)
      (vertical ?w ?x ?u ?v))

  (<= (triplet ?u ?v ?w ?x ?y ?z)
      (slash ?u ?v ?w ?x)
      (slash ?w ?x ?y ?z))

  (<= (triplet ?u ?v ?w ?x ?y ?z)
      (slash ?y ?z ?w ?x)
      (slash ?w ?x ?u ?v))

  (<= (triplet ?u ?v ?w ?x ?y ?z)
      (backslash ?u ?v ?w ?x)
      (backslash ?w ?x ?y ?z))

  (<= (triplet ?u ?v ?w ?x ?y ?z)
      (backslash ?y ?z ?w ?x)
      (backslash ?w ?x ?u ?v))


  (<= (horizontal ?u ?v ?x ?v)
      (nex ?u ?x)
      (index ?v))

  (<= (vertical ?u ?v ?u ?y)
      (nex ?v ?y)
      (index ?u))

  (slash 3 1 2 2)
  (slash 2 2 1 3)
  (slash 5 1 4 2)
  (slash 4 2 3 3)
  (slash 3 3 2 4)
  (slash 2 4 1 5)
  (slash 5 3 4 4)
  (slash 4 4 3 5)

  (backslash 3 1 4 2)
  (backslash 4 2 5 3)
  (backslash 1 1 2 2)
  (backslash 2 2 3 3)
  (backslash 3 3 4 4)
  (backslash 4 4 5 5)
  (backslash 1 3 2 4)
  (backslash 2 4 3 5)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (nex 1 2)
  (nex 2 3)
  (nex 3 4)
  (nex 4 5)

  (incr  0  10)
  (incr 10  20)
  (incr 20  30)
  (incr 30  40)
  (incr 40  50)
  (incr 50  60)
  (incr 60  70)
  (incr 70  80)
  (incr 80  90)
  (incr 90 100)

  (succ  1   2)
  (succ  2   3)
  (succ  3   4)
  (succ  4   5)
  (succ  5   6)
  (succ  6   7)
  (succ  7   8)
  (succ  8   9)
  (succ  9  10)
  (succ 10  11)
  (succ 11  12)
  (succ 12  13)
  (succ 13  14)
  (succ 14  15)
  (succ 15  16)
  (succ 16  17)
  (succ 17  18)
  (succ 18  19)
  (succ 19  20)
  (succ 20  21)
  (succ 21  22)
  (succ 22  23)
  (succ 23  24)
  (succ 24  25)
  (succ 25  26)
  (succ 26  27)
  (succ 27  28)
  (succ 28  29)
  (succ 29  30)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;