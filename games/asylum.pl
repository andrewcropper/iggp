;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Asylum
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; components
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (role white)
  (role black)


  (<= (base (location ?x ?y ?piece))
      (file ?x)
      (rank ?y)
      (type ?piece ?type))

  (<= (base (color ?piece ?role))
      (type ?piece ?type)
      (role ?role))

  (<= (base (control ?role))
      (role ?role))

  (<= (base (strength ?role ?m))
      (role ?role)
      (scoremap ?m ?n))

  (<= (base (step ?n))
      (pp ?m ?n))


  (<= (input ?role (move ?u ?v ?x ?y))
      (role ?role)
      (horizontal ?u ?v ?x ?y))

  (<= (input ?role (move ?u ?v ?x ?y))
      (role ?role)
      (horizontal ?x ?y ?u ?v))

  (<= (input ?role (move ?u ?v ?x ?y))
      (role ?role)
      (vertical ?u ?v ?x ?y))

  (<= (input ?role (move ?u ?v ?x ?y))
      (role ?role)
      (vertical ?x ?y ?u ?v))

  (<= (input ?role (move ?u ?v ?x ?y))
      (role ?role)
      (northeast ?u ?v ?x ?y))

  (<= (input ?role (move ?u ?v ?x ?y))
      (role ?role)
      (northeast ?x ?y ?u ?v))

  (<= (input ?role (move ?u ?v ?x ?y))
      (role ?role)
      (southeast ?u ?v ?x ?y))

  (<= (input ?role (move ?u ?v ?x ?y))
      (role ?role)
      (southeast ?x ?y ?u ?v))

  (<= (input ?role (move ?u ?v ?x ?y))
      (role ?role)
      (knightmove ?u ?v ?x ?y))

  (<= (input white (move ?x 2 ?x 4))
      (file ?x))

  (<= (input black (move ?x 7 ?x 5))
      (file ?x))

  (<= (input ?role (place ?piece ?x ?y))
      (role ?role)
      (type ?piece ?type)
      (file ?x)
      (rank ?y))

  (<= (input ?role noop)
      (role ?role))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (init (location a 1 r1))
  (init (location b 1 n1))
  (init (location c 1 b1))
  (init (location d 1 q1))
  (init (location e 1 k1))
  (init (location f 1 b2))
  (init (location g 1 n2))
  (init (location h 1 r2))

  (init (location a 2 p1))
  (init (location b 2 p2))
  (init (location c 2 p3))
  (init (location d 2 p4))
  (init (location e 2 p5))
  (init (location f 2 p6))
  (init (location g 2 p7))
  (init (location h 2 p8))

  (init (location a 7 pa))  
  (init (location b 7 pb))  
  (init (location c 7 pc))  
  (init (location d 7 pd))  
  (init (location e 7 pe))  
  (init (location f 7 pf))  
  (init (location g 7 pg))  
  (init (location h 7 ph))  

  (init (location a 8 r3))
  (init (location b 8 n3))
  (init (location c 8 b3))
  (init (location d 8 q2))
  (init (location e 8 k2))
  (init (location f 8 b4))
  (init (location g 8 n4))
  (init (location h 8 r4))

  (init (color k1 white))
  (init (color q1 white))
  (init (color b1 white))
  (init (color b2 white))
  (init (color n1 white))
  (init (color n2 white))
  (init (color r1 white))
  (init (color r2 white))
  (init (color p1 white))
  (init (color p2 white))
  (init (color p3 white))
  (init (color p4 white))
  (init (color p5 white))
  (init (color p6 white))
  (init (color p7 white))
  (init (color p8 white))

  (init (color k2 black))
  (init (color q2 black))
  (init (color b3 black))
  (init (color b4 black))
  (init (color n3 black))
  (init (color n4 black))
  (init (color r3 black))
  (init (color r4 black))
  (init (color pa black))
  (init (color pb black))
  (init (color pc black))
  (init (color pd black))
  (init (color pe black))
  (init (color pf black))
  (init (color pg black))
  (init (color ph black))

  (init (control white))

  (init (strength white 16))
  (init (strength black 16))
    
  (init (step 1))
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; legal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= (legal ?role (move ?x1 ?y1 ?x2 ?y2))
      (true (control ?role))
      (true (color ?piece ?role))
      (true (location ?x1 ?y1 ?piece))
      (validmove ?piece ?x1 ?y1 ?x2 ?y2)
      (not (celloccupiedby ?x2 ?y2 ?role)))
    
  (<= (legal ?role (place ?piece ?x ?y))
      (true (control ?role))
      (true (color ?piece ?role))
      (not (onboard ?piece))
      (cellempty ?x ?y))
    
  (legal white noop)
  (legal black noop)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; next
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= (next (location ?x2 ?y2 ?piece))
      (does ?role (move ?x1 ?y1 ?x2 ?y2))
      (true (location ?x1 ?y1 ?piece)))

  (<= (next (location ?x ?y ?piece))
      (does ?role (move ?x1 ?y1 ?x2 ?y2))
      (true (location ?x ?y ?piece))
      (distinct (f ?x ?y) (f ?x1 ?y1))
      (distinct (f ?x ?y) (f ?x2 ?y2)))

  (<= (next (location ?x ?y ?piece))
      (does ?role (place ?piece ?x ?y)))

  (<= (next (location ?x ?y ?piece))
      (does ?role (place ?piece1 ?x1 ?y1))
      (true (location ?x ?y ?piece)))

  (<= (next (location ?x ?y ?piece))
      (true (control ?role))
      (does ?role noop)
      (true (location ?x ?y ?piece)))


  (<= (next (color ?piece ?role))
      (does ?role (move ?x1 ?y1 ?x2 ?y2))
      (true (location ?x2 ?y2 ?piece)))

  (<= (next (color ?piece ?color))
      (does ?role (move ?x1 ?y1 ?x2 ?y2))
      (true (color ?piece ?color))
      (not (true (location ?x2 ?y2 ?piece))))

  (<= (next (color ?piece ?color))
      (does ?role (place ?anything ?x ?y))
      (true (color ?piece ?color)))

  (<= (next (color ?piece ?color))
      (true (control ?role))
      (does ?role noop)
      (true (color ?piece ?color)))


  (<= (next (strength ?role ?n))
      (does ?role (move ?x1 ?y1 ?x2 ?y2))
      (celloccupied ?x2 ?y2)
      (true (strength ?role ?m))
      (pp ?m ?n))

  (<= (next (strength ?opponent ?m))
      (does ?role (move ?x1 ?y1 ?x2 ?y2))
      (celloccupiedby ?x2 ?y2 ?opponent)
      (true (strength ?opponent ?n))
      (pp ?m ?n))

  (<= (next (strength ?anyone ?count))
      (does ?role (move ?x1 ?y1 ?x2 ?y2))
      (not (celloccupied ?x2 ?y2))
      (true (strength ?anyone ?count)))

  (<= (next (strength ?anyone ?count))
      (does ?role (place ?anything ?x ?y))
      (true (strength ?anyone ?count)))

  (<= (next (strength ?anyone ?count))
      (true (control ?role))
      (does ?role noop)
      (true (strength ?anyone ?count)))


  (<= (next (control white)) (true (control black)))
  (<= (next (control black)) (true (control white)))


  (<= (next (step ?n))
      (true (step ?m))
      (pp ?m ?n))   
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; goal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= (goal ?role ?goal)
      (true (strength ?role ?count))
      (scoremap ?count ?goal))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; terminal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= terminal
      (true (strength ?role 32)))

  (<= terminal
      (true (step 100))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; views
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (<= (horizontal ?x1 ?y ?x2 ?y)
      (nextfile ?x1 ?x2)
      (rank ?y))

  (<= (horizontal ?x1 ?y ?x3 ?y)
      (nextfile ?x1 ?x2)
      (horizontal ?x2 ?y ?x3 ?y))


  (<= (vertical ?x ?y1 ?x ?y2)
      (nextrank ?y1 ?y2)
      (file ?x))

  (<= (vertical ?x ?y1 ?x ?y3)
      (nextrank ?y1 ?y2)
      (vertical ?x ?y2 ?x ?y3))


  (<= (northeast ?x1 ?y1 ?x2 ?y2)
      (nextfile ?x1 ?x2)
      (nextrank ?y1 ?y2))

  (<= (northeast ?x1 ?y1 ?x3 ?y3)
      (nextfile ?x1 ?x2)
      (nextrank ?y1 ?y2)
      (cellempty ?x2 ?y2)
      (northeast ?x2 ?y2 ?x3 ?y3))


  (<= (southeast ?x1 ?y1 ?x2 ?y2)
      (nextfile ?x1 ?x2)
      (nextrank ?y2 ?y1))

  (<= (southeast ?x1 ?y1 ?x3 ?y3)
      (nextfile ?x1 ?x2)
      (nextrank ?y2 ?y1)
      (cellempty ?x2 ?y2)
      (southeast ?x2 ?y2 ?x3 ?y3))


  (<= (validmove ?piece ?x1 ?y1 ?x2 ?y2)
      (type ?piece pawn)
      (true (color ?piece white))
      (whitepawnmove ?x1 ?y1 ?x2 ?y2))

  (<= (validmove ?piece ?x1 ?y1 ?x2 ?y2)
      (type ?piece pawn)
      (true (color ?piece black))
      (blackpawnmove ?x1 ?y1 ?x2 ?y2))

  (<= (validmove ?piece ?x1 ?y1 ?x2 ?y2)
      (type ?piece rook)
      (rookmove ?x1 ?y1 ?x2 ?y2))

  (<= (validmove ?piece ?x1 ?y1 ?x2 ?y2)
      (type ?piece knight)
      (knightmove ?x1 ?y1 ?x2 ?y2))

  (<= (validmove ?piece ?x1 ?y1 ?x2 ?y2)
      (type ?piece bishop)
      (bishopmove ?x1 ?y1 ?x2 ?y2))

  (<= (validmove ?piece ?x1 ?y1 ?x2 ?y2)
      (type ?piece queen)
      (queenmove ?x1 ?y1 ?x2 ?y2))

  (<= (validmove ?piece ?x1 ?y1 ?x2 ?y2)
      (type ?piece king)
      (kingmove ?x1 ?y1 ?x2 ?y2))


  (<= (whitepawnmove ?x 2 ?x 4)
      (cellempty ?x 3)
      (cellempty ?x 4))

  (<= (whitepawnmove ?x ?y1 ?x ?y2)
      (nextrank ?y1 ?y2)
      (cellempty ?x ?y2))

  (<= (whitepawnmove ?x1 ?y1 ?x2 ?y2)
      (nextfile ?x1 ?x2)
      (nextrank ?y1 ?y2)
      (celloccupiedby ?x2 ?y2 black))

  (<= (whitepawnmove ?x1 ?y1 ?x2 ?y2)
      (nextfile ?x2 ?x1)
      (nextrank ?y1 ?y2)
      (celloccupiedby ?x2 ?y2 black))


  (<= (blackpawnmove ?x 7 ?x 5)
      (cellempty ?x 6)
      (cellempty ?x 5))

  (<= (blackpawnmove ?x ?y1 ?x ?y2)
      (nextrank ?y2 ?y1)
      (cellempty ?x ?y2))

  (<= (blackpawnmove ?x1 ?y1 ?x2 ?y2)
      (nextfile ?x1 ?x2)
      (nextrank ?y2 ?y1)
      (celloccupiedby ?x2 ?y2 white))

  (<= (blackpawnmove ?x1 ?y1 ?x2 ?y2)
      (nextfile ?x2 ?x1)
      (nextrank ?y2 ?y1)
      (celloccupiedby ?x2 ?y2 white))


  (<= (rookmove ?x1 ?y1 ?x2 ?y2)
      (horizontalmove ?x1 ?y1 ?x2 ?y2))

  (<= (rookmove ?x1 ?y1 ?x2 ?y2)
      (horizontalmove ?x2 ?y2 ?x1 ?y1))

  (<= (rookmove ?x1 ?y1 ?x2 ?y2)
      (verticalmove ?x1 ?y1 ?x2 ?y2))

  (<= (rookmove ?x1 ?y1 ?x2 ?y2)
      (verticalmove ?x2 ?y2 ?x1 ?y1))

    
  (<= (knightmove ?x1 ?y1 ?x2 ?y2)
      (skipfile ?x1 ?x2)
      (nextrank ?y1 ?y2))

  (<= (knightmove ?x1 ?y1 ?x2 ?y2)
      (skipfile ?x1 ?x2)
      (nextrank ?y2 ?y1))

  (<= (knightmove ?x1 ?y1 ?x2 ?y2)
      (skipfile ?x2 ?x1)
      (nextrank ?y1 ?y2))

  (<= (knightmove ?x1 ?y1 ?x2 ?y2)
      (skipfile ?x2 ?x1)
      (nextrank ?y2 ?y1))

  (<= (knightmove ?x1 ?y1 ?x2 ?y2)
      (skiprank ?y1 ?y2)
      (nextfile ?x1 ?x2))

  (<= (knightmove ?x1 ?y1 ?x2 ?y2)
      (skiprank ?y1 ?y2)
      (nextfile ?x2 ?x1))

  (<= (knightmove ?x1 ?y1 ?x2 ?y2)
      (skiprank ?y2 ?y1)
      (nextfile ?x1 ?x2))

  (<= (knightmove ?x1 ?y1 ?x2 ?y2)
      (skiprank ?y2 ?y1)
      (nextfile ?x2 ?x1))


  (<= (bishopmove ?x1 ?y1 ?x2 ?y2)
      (northeastmove ?x1 ?y1 ?x2 ?y2))

  (<= (bishopmove ?x1 ?y1 ?x2 ?y2)
      (northeastmove ?x2 ?y2 ?x1 ?y1))

  (<= (bishopmove ?x1 ?y1 ?x2 ?y2)
      (southeastmove ?x1 ?y1 ?x2 ?y2))

  (<= (bishopmove ?x1 ?y1 ?x2 ?y2)
      (southeastmove ?x2 ?y2 ?x1 ?y1))


  (<= (queenmove ?x1 ?y1 ?x2 ?y2)
      (rookmove ?x1 ?y1 ?x2 ?y2))

  (<= (queenmove ?x1 ?y1 ?x2 ?y2)
      (bishopmove ?x1 ?y1 ?x2 ?y2))

    
  (<= (kingmove ?x1 ?y ?x2 ?y)
      (nextfile ?x1 ?x2)
      (rank ?y))

  (<= (kingmove ?x1 ?y ?x2 ?y)
      (nextfile ?x2 ?x1)
      (rank ?y))

  (<= (kingmove ?x ?y1 ?x ?y2)
      (nextrank ?y1 ?y2)
      (file ?x))

  (<= (kingmove ?x ?y1 ?x ?y2)
      (nextrank ?y2 ?y1)
      (file ?x))

  (<= (kingmove ?x1 ?y1 ?x2 ?y2)
      (nextfile ?x1 ?x2)
      (nextrank ?y1 ?y2))
    
  (<= (kingmove ?x1 ?y1 ?x2 ?y2)
      (nextfile ?x2 ?x1)
      (nextrank ?y1 ?y2))
    
  (<= (kingmove ?x1 ?y1 ?x2 ?y2)
      (nextfile ?x1 ?x2)
      (nextrank ?y2 ?y1))
    
  (<= (kingmove ?x1 ?y1 ?x2 ?y2)
      (nextfile ?x2 ?x1)
      (nextrank ?y2 ?y1))   


  (<= (horizontalmove ?x1 ?y ?x2 ?y)
      (nextfile ?x1 ?x2)
      (rank ?y))

  (<= (horizontalmove ?x1 ?y ?x3 ?y)
      (nextfile ?x1 ?x2)
      (cellempty ?x2 ?y)
      (horizontalmove ?x2 ?y ?x3 ?y))


  (<= (verticalmove ?x ?y1 ?x ?y2)
      (nextrank ?y1 ?y2)
      (file ?x))

  (<= (verticalmove ?x ?y1 ?x ?y3)
      (nextrank ?y1 ?y2)
      (cellempty ?x ?y2)
      (verticalmove ?x ?y2 ?x ?y3))


  (<= (northeastmove ?x1 ?y1 ?x2 ?y2)
      (nextfile ?x1 ?x2)
      (nextrank ?y1 ?y2))

  (<= (northeastmove ?x1 ?y1 ?x3 ?y3)
      (nextfile ?x1 ?x2)
      (nextrank ?y1 ?y2)
      (cellempty ?x2 ?y2)
      (northeastmove ?x2 ?y2 ?x3 ?y3))


  (<= (southeastmove ?x1 ?y1 ?x2 ?y2)
      (nextfile ?x1 ?x2)
      (nextrank ?y2 ?y1))

  (<= (southeastmove ?x1 ?y1 ?x3 ?y3)
      (nextfile ?x1 ?x2)
      (nextrank ?y2 ?y1)
      (cellempty ?x2 ?y2)
      (southeastmove ?x2 ?y2 ?x3 ?y3))


  (<= (onboard ?piece)
      (true (location ?x ?y ?piece)))
    

  (<= (celloccupied ?x ?y)
      (true (location ?x ?y ?piece)))


  (<= (celloccupiedby ?x ?y ?role)
      (true (location ?x ?y ?piece))
      (true (color ?piece ?role)))


  (<= (cellempty ?x ?y)
      (file ?x)
      (rank ?y)
      (not (celloccupied ?x ?y)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (file a)
  (file b)
  (file c)
  (file d)
  (file e)
  (file f)
  (file g)
  (file h)

  (rank 1)
  (rank 2)
  (rank 3)
  (rank 4)
  (rank 5)
  (rank 6)
  (rank 7)
  (rank 8)
    
  (nextrank 1 2)
  (nextrank 2 3)
  (nextrank 3 4)
  (nextrank 4 5)
  (nextrank 5 6)
  (nextrank 6 7)
  (nextrank 7 8)

  (nextfile a b)
  (nextfile b c)
  (nextfile c d)
  (nextfile d e)
  (nextfile e f)
  (nextfile f g)
  (nextfile g h)

  (skiprank 1 3)
  (skiprank 2 4)
  (skiprank 3 5)
  (skiprank 4 6)
  (skiprank 5 7)
  (skiprank 6 8)
    
  (skipfile a c)
  (skipfile b d)
  (skipfile c e)
  (skipfile d f)
  (skipfile e g)
  (skipfile f h)

  (type k1 king)
  (type k2 king)
  (type q1 queen)
  (type q2 queen)
  (type p1 pawn)
  (type b1 bishop)
  (type b2 bishop)
  (type b3 bishop)
  (type b4 bishop)
  (type n1 knight)
  (type n2 knight)
  (type n3 knight)
  (type n4 knight)
  (type r1 rook)
  (type r2 rook)
  (type r3 rook)
  (type r4 rook)
  (type p1 pawn)
  (type p2 pawn)
  (type p3 pawn)
  (type p4 pawn)
  (type p5 pawn)
  (type p6 pawn)
  (type p7 pawn)
  (type p8 pawn)
  (type pa pawn)
  (type pb pawn)
  (type pc pawn)
  (type pd pawn)
  (type pe pawn)
  (type pf pawn)
  (type pg pawn)
  (type ph pawn)

  (scoremap  0   0)
  (scoremap  1   3)
  (scoremap  2   6)
  (scoremap  3   9)
  (scoremap  4  12)
  (scoremap  5  15)
  (scoremap  6  18)
  (scoremap  7  21)
  (scoremap  8  25)
  (scoremap  9  28)
  (scoremap 10  31)
  (scoremap 11  34)
  (scoremap 12  37)
  (scoremap 13  40)
  (scoremap 14  43)
  (scoremap 15  46)
  (scoremap 16  50)
  (scoremap 17  53)
  (scoremap 18  56)
  (scoremap 19  59)
  (scoremap 20  62)
  (scoremap 21  65)
  (scoremap 22  68)
  (scoremap 23  71)
  (scoremap 24  75)
  (scoremap 25  78)
  (scoremap 26  81)
  (scoremap 27  84)
  (scoremap 28  87)
  (scoremap 29  90)
  (scoremap 30  93)
  (scoremap 31  96)
  (scoremap 32 100)

  (pp  0   1)
  (pp  1   2)
  (pp  2   3)
  (pp  3   4)
  (pp  4   5)
  (pp  5   6)
  (pp  6   7)
  (pp  7   8)
  (pp  8   9)
  (pp  9  10)
  (pp 10  11)
  (pp 11  12)
  (pp 12  13)
  (pp 13  14)
  (pp 14  15)
  (pp 15  16)
  (pp 16  17)
  (pp 17  18)
  (pp 18  19)
  (pp 19  20)   
  (pp 20  21)
  (pp 21  22)
  (pp 22  23)
  (pp 23  24)
  (pp 24  25)
  (pp 25  26)
  (pp 26  27)
  (pp 27  28)
  (pp 28  29)
  (pp 29  30)   
  (pp 30  31)
  (pp 31  32)
  (pp 32  33)
  (pp 33  34)
  (pp 34  35)
  (pp 35  36)
  (pp 36  37)
  (pp 37  38)
  (pp 38  39)
  (pp 39  40)   
  (pp 40  41)
  (pp 41  42)
  (pp 42  43)
  (pp 43  44)
  (pp 44  45)
  (pp 45  46)
  (pp 46  47)
  (pp 47  48)
  (pp 48  49)
  (pp 49  50)   
  (pp 50  51)
  (pp 51  52)
  (pp 52  53)
  (pp 53  54)
  (pp 54  55)
  (pp 55  56)
  (pp 56  57)
  (pp 57  58)
  (pp 58  59)
  (pp 59  60)   
  (pp 60  61)
  (pp 61  62)
  (pp 62  63)
  (pp 63  64)
  (pp 64  65)
  (pp 65  66)
  (pp 66  67)
  (pp 67  68)
  (pp 68  69)
  (pp 69  70)   
  (pp 70  71)
  (pp 71  72)
  (pp 72  73)
  (pp 73  74)
  (pp 74  75)
  (pp 75  76)
  (pp 76  77)
  (pp 77  78)
  (pp 78  79)
  (pp 79  80)   
  (pp 80  81)
  (pp 81  82)
  (pp 82  83)
  (pp 83  84)
  (pp 84  85)
  (pp 85  86)
  (pp 86  87)
  (pp 87  88)
  (pp 88  89)
  (pp 89  90)   
  (pp 90  91)
  (pp 91  92)
  (pp 92  93)
  (pp 93  94)
  (pp 94  95)
  (pp 95  96)
  (pp 96  97)
  (pp 97  98)
  (pp 98  99)
  (pp 99 100)   

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;