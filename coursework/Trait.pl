%Begin Question 4.1
%Fact: all numbers are divisible by 1.
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

containOneToNine(_, []).
containOneToNine([H|T], DIGITS)
  :-remover(H, DIGITS, D1),
    containOneToNine(T, D1).

possible( X, Y, Z )
	:- \+ prime(X),
      \+ prime(Y),
      \+ prime(Z),
      X < 360,
      Y < 360,
      Z < 360,
      numToList(X, XS),
      numToList(Y, YS),
      numToList(Z, ZS),
      append(XS, YS, L1),
      append(L1, ZS, L2),
      containOneToNine(L2, [1,2,3,4,5,6,7,8,9]).

%End Question 4.2

%Begin Question 4.3

%all bearings should be different quadrents
%integer divide (//) all bearings by 90 and check they are all different
%acceptable( X, Y, Z ) 
%  :-

%trait( X, Y, Z )
%  :-

%End Question 4.3

%any main predicates for testing goes here

