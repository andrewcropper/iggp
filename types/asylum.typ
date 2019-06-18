true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

white, black :: agent.

base :: prop -> bool.

location :: file_type -> rank_type -> piece_type -> prop.

a, b, c, d, e, f, g, h :: file_type.

1, 2, 3, 4, 5, 6, 7, 8 :: rank_type.

k1, k2, q1, q2, b1, b2, b3, b4, n1, n2, n3, n4, r1, r2, r3, r4, p1, p2, p3, p4, p5, p6, p7, p8, pa, pb, pc, pd, pe, pf, pg, ph :: piece_type.

king, queen, pawn, bishop, knight, rook, pawn :: type_type.

rank_type :> int.

0, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 
20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100 :: int.

file :: file_type -> bool.

rank :: rank_type -> bool. 

type :: piece_type -> type_type -> bool.

color :: piece_type -> agent -> prop.

control :: agent -> prop.

strength :: agent -> int -> prop.

scoremap :: int -> int -> bool.

move, horizontal, vertical, kingmove, knightmove :: file_type -> rank_type -> file_type -> rank_type -> action.

pp :: int -> int -> bool.

nextfile, skipfile :: file_type -> file_type -> bool.
nextrank, skiprank :: rank_type -> rank_type -> bool.

place :: piece_type -> file_type -> rank_type -> action.

noop :: action.

location :: file_type -> rank_type -> piece_type -> prop.

step :: int -> prop.

