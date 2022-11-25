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

remover( _, [], []).
remover( R, [R|T], T2) 
  :- remover( R, T, T2).
remover( R, [H|T], [H|T2]) 
  :- H \= R, 
  remover( R, T, T2).

%Fact: turning 0 into a list is [0]
%Rule: for any number N,
numToList( 0, [0] ).
numToList( N, L )
	:-N1 is N // 10, 
  numToList(N1, L1), 
  N2 is (N mod 10), 
  append(L1, [N2] ,L).

containOneToNine(_, _, _, []).
containOneToNine([H1|T1], [H2|T2], [H3|T3], DIGITS)
  :-remover(H1, DIGITS, D1),
  remover(H2, D1, D2),
  remover(H3, D2, D3),
  containOneToNine(T1, T2, T3, D3).

%generate all triples that are valid bearings
possible( A, B, C )
	:- A < 360,
	B < 360,
  C < 360,
  %the following five lines turn X, Y and Z into a list of digits
  numToList(A, AS),
  numToList(B, BS),
  numToList(C, CS),
  %check that the bearings contain 1..9
  containOneToNine(AS, BS, CS, [1,2,3,4,5,6,7,8,9]).

%End Question 4.2

%Begin Question 4.3

isSet([]).
isSet([H|T])
	:- \+ member(H, T),
    isSet(T).

%all bearings should be different quadrents
%integer divide (//) all bearings by 90 and check they are all different
%check if ONE set of bearings is acceptable
acceptable( A, B, C ) 
	:- \+ prime(A),
	\+ prime(B),
	\+ prime(C),
  A1 is A // 90,
  B1 is B // 90,
  C1 is C // 90,
  isSet([A1, B1, C1]).

%given the question, I should be able 
trait( A, B, C )
  :- possible(A, B, C),
  acceptable(A, B, C).

%End Question 4.3

%any main predicates for testing goes here
main
	%:- prime(19). %true
	%:- prime(4). %false
	%:- prime(11110). % false
	%:- numToList(1234, X), write(X). % [1,2,3,4] true
	:- containOneToNine([1,2], [3], [4], [6,5,4,3,2,1]). %true
	%:- containOneToNine([1,2,4], [], [], [4,3,2,1]). %false
	%:- containOneToNine([1,2,3],[4,5,6], [7,8,9] [1,2,3,4,5,6,7,8,9]). %true
	%:- possible(123,456,789). %true x1000
	%:- isSet([1,2,3,4]). %true
	%:- isSet([1,1,1,2]). %false
	%:- acceptable(178, 249, 356). %true
	%:- trait(178, 249, 356).
	%:- possible(A, B, C), write(A), write(B), write(C).