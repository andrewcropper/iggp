;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FizzBuzz in GDLv1
; 2013/07/25
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Role
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(role player)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Base
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(<= (base (count ?n))
    (positive_int ?n))
(<= (base (success ?n))
    (int ?n)
    (distinct ?n 31))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(input player (say fizz))
(input player (say buzz))
(input player (say fizzbuzz))
(<= (input player (say ?n))
    (positive_int ?n)
    (distinct ?n 31))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Init
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(init (count 1))
(init (success 0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Legal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(<= (legal player (say ?n))
    (true (count ?n)))

%% pos(legal_say(player,n)):-true_count(n)
%% [P,Q,X] :- P(X,A) :- Q(A)

legal_say(player,N):-true_count(N).
legal_say(player,fizz).
legal_say(player,buzz).
legal_say(player,fizzbuzz).

legal_say(player,N):-true_count(N).
legal_say(player,A):-legal_say1(A).
legal_say1(fizz).
legal_say1(buzz).
legal_say1(fizzbuzz).

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Next
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(<= (next (count ?after))
    (true (count ?before))
    (succ ?before ?after))

(<= (next (success ?after))
    correct
    (true (success ?before))
    (succ ?before ?after))
(<= (next (success ?a))
    (not correct)
    (true (success ?a)))

(<= correct
    (true (count ?n))
    (divisible ?n 15)
    (does player (say fizzbuzz)))
(<= correct
    (true (count ?n))
    (divisible ?n 3)
    (not (divisible ?n 5))
    (does player (say fizz)))
(<= correct
    (true (count ?n))
    (divisible ?n 5)
    (not (divisible ?n 3))
    (does player (say buzz)))
(<= correct
    (true (count ?n))
    (not (divisible ?n 5))
    (not (divisible ?n 3))
    (does player (say ?n)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Terminal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(<= terminal
    (true (count 31)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Goal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(<= (goal player 100)
    (true (success 30)))
(<= (goal player 75)
    (true (success ?s))
    (less_than ?s 30)
    (less_than 24 ?s))
(<= (goal player 50)
    (true (success ?s))
    (less_than ?s 25)
    (less_than 19 ?s))
(<= (goal player 25)
    (true (success ?s))
    (less_than ?s 20)
    (less_than 14 ?s))
(<= (goal player 0)
    (true (success ?s))
    (less_than ?s 15))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Helper relations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; (minus a b c) means a - b = c
(<= (minus ?a 1 ?b)
    (succ ?b ?a))
(<= (minus ?a ?b ?c)
    (succ ?smaller_a ?a)
    (succ ?smaller_b ?b)
    (distinct ?b 1)
    (minus ?smaller_a ?smaller_b ?c))

; (divisible a b) means a is divisible by b
(<= (divisible ?n ?n)
    (positive_int ?n))
(<= (divisible ?divided ?divisor)
    (less_than ?divisor ?divided)
    (minus ?divided ?divisor ?new_divided)
    (divisible ?new_divided ?divisor))

; (less_than a b) means a < b
(<= (less_than ?a ?b)
    (succ ?a ?b))
(<= (less_than ?a ?b)
    (succ ?a ?bigger_a)
    (less_than ?bigger_a ?b))

(succ 0 1)
(succ 1 2)
(succ 2 3)
(succ 3 4)
(succ 4 5)
(succ 5 6)
(succ 6 7)
(succ 7 8)
(succ 8 9)
(succ 9 10)
(succ 10 11)
(succ 11 12)
(succ 12 13)
(succ 13 14)
(succ 14 15)
(succ 15 16)
(succ 16 17)
(succ 17 18)
(succ 18 19)
(succ 19 20)
(succ 20 21)
(succ 21 22)
(succ 22 23)
(succ 23 24)
(succ 24 25)
(succ 25 26)
(succ 26 27)
(succ 27 28)
(succ 28 29)
(succ 29 30)
(succ 30 31)

(int 0)
(<= (int ?a)
    (succ ?b ?a)
    (int ?b))

(<= (positive_int ?a)
    (int ?a)
    (distinct ?a 0))