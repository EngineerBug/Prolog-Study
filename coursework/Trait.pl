%Begin Question 4.1
%Fact: all numbers are divisible by themselves.
%Rule: for any numbers N and N-1:
%		N is prime iff is is not divisible by all numbers below it, except 1.
primeCheck( N, N ).
primeCheck( N, D )
    :- mod(N, D) =\= 0,
    D1 is D + 1,
    primeCheck(N, D1).

%Rule: for any integer N:
%   if there are no factors (F) of N where 1 < F < N, it is prime.
prime( N )
  :- primeCheck(N, 2).

%End Question 4.1

%Begin Question 4.2
possiblePrint([], []).
possiblePrint([X], [X]) :-!.
possiblePrint(GRID, X) 
    :- GRID = [H|T],
    possiblePrint(T, T1),
    append(L1, L2, T1), 
    append(L1, [H], X1),
    append(X1, L2, X).

listToNum([E], E).
listToNum([H|T], N)
	:- length(T, L1),
    listToNum(T, N1),
    N is N1 + (H * (10 ^ L1)).

possible( X, Y, Z )
	:-possiblePrint([1,6,8,2,7,9,3,4,5],[A,B,C,D,E,F,G,H,I]),
    listToNum([A,B,C], X),
    X < 360,
    listToNum([D,E,F], Y),
    Y < 360,
    listToNum([G,H,I], Z),
    Z <360.

%End Question 4.2

%Begin Question 4.3

isSet([]).
isSet([H|T])
	:- \+ member(H, T),
    isSet(T).

%all bearings should be different quadrents
%integer divide (//) all bearings by 90 and check they are all different
%check if ONE set of bearings is acceptable
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

%given the question, I should be able 
trait( X, Y, Z ) 
  :- possible( X, Y, Z ) ,
  acceptable( X, Y, Z ) .

%End Question 4.3

%any main predicates for testing goes here
main
	:- prime(19). %true
	%:- prime(4). %false
	%:- prime(11110). % false.
	%:- possible(123,456,789). %true x1000
	%:- isSet([1,2,3,4]). %true
	%:- isSet([1,1,1,2]). %false
	%:- acceptable(178, 249, 356). %true
	%:- trait(178, 249, 356).
	%:- possible(A, B, C), write(A), write(B), write(C).