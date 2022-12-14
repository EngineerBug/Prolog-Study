% Begin Question 4.1

% Fact: all numbers are divisible by themselves.
% Rule: for any numbers N and N-1:
%		N is prime iff is is not divisible by all numbers below it, except 1.
primeCheck( N, N ).
primeCheck( N, D )
    :- 
    mod(N, D) =\= 0,
    D1 is D + 1,
    primeCheck(N, D1).

% Rule: for any integer N:
%   if there are no factors (F) of N where 1 < F < N, it is prime.
prime( N )
  :- primeCheck(N, 2).

%End Question 4.1

%Begin Question 4.2

% This predicate returns successive permutations of GRID.
% Grid is a list of any element type and X is the permutation.
% Fact: the only permutation of an empty list is an empty list.
% Fact: the only permutation of a singleton list is a singleton list.
% Rule: for any list [H|T]:
%       a permutation is L1 ++ H ++ L2
%       where L1 and L2 are arbitrary separations of T.
possiblePrint([], []).
possiblePrint([X], [X]) :-!.
possiblePrint(GRID, X) 
    :- 
    GRID = [H|T],
    possiblePrint(T, T1),
    append(L1, L2, T1), 
    append(L1, [H], X1),
    append(X1, L2, X).

% Rule: a set of three bearings follow the constraints:
%       - they cannot contain 0, or duplicate digits (hence using permutations of 1..9).
%       - they cannot share digits with other bearings (hence using permutations of 1..9).
%       - they should (for the reader's conveniance) be returned in ascending order.
%
% I was confused with this question, so I will explain my thinking.
% My thinking here was to refine the search space as much as possible.
% To this end, I worked out that 1,2,3 must be the hundreds digits and therefore the lowest tens + units digits was 45.
% Therefore the range of the bearings were 144 < X < 200 and 244 < Y < 300 and 344 < Z < 360.
possible( X, Y, Z )
	:-
    %these are in a funny order so that trait gives the final answer last.
    possiblePrint(['1','6','8','2','7','9','3','4','5'], [A,B,C,D,E,F,G,H,I]),
	name(X, [A,B,C]),
    X > 144,
	X < 200,
	name(Y, [D,E,F]),
    Y > 244,
	Y < 300,
	name(Z, [G,H,I]),
	Z > 344,
    Z < 360.

%End Question 4.2

%Begin Question 4.3

% Fact: an empty list is a valid set
% Rule: any list [H|T] is a set if:
%       H is not in T, and T is a set.
isSet([]).
isSet([H|T])
	:- 
    \+ member(H, T),
    isSet(T).

% All bearings should be different quadrents
% Integer divide (//) all bearings by 90 and check they are all different
% Check if ONE set of bearings is acceptable
acceptable( X, Y, Z ) 
	%check none of the bearings are prime
	:-
    \+ prime(X),
	\+ prime(Y),
	\+ prime(Z),
    %check all the bearings are in different quadrents
    X1 is X // 90,
    Y1 is Y // 90,
    Z1 is Z // 90,
    isSet([X1, Y1, Z1]).

%returns 8 answers, including the final answer!
trait( X, Y, Z ) 
  :- possible( X, Y, Z ),
  acceptable( X, Y, Z ).

%End Question 4.3

%Final answer: 159, 267, 348

%any main predicates for testing goes here
%main
	%:- prime(19). %true
	%:- prime(4). %false
	%:- prime(11110). % false.
	%:- possible(X,Y,Z). %true x1000
	%:- isSet([1,2,3,4]). %true
	%:- isSet([1,1,1,2]). %false
	%:- acceptable(178, 249, 356). %true
	%:- trait(X, Y, Z).
	%:- possible(A, B, C), write(A), write(B), write(C).