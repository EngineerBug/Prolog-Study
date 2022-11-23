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

containOneToNine(_, []).
containOneToNine([H|T], DIGITS)
  :- remover(H, DIGITS, D1),
  containOneToNine(T, D1).

%possible( X, Y, Z )
%  :-

%End Question 4.2

%Begin Question 4.3
%acceptable( X, Y, Z ) 
%  :-

%trait( X, Y, Z )
%  :-

%End Question 4.3

%any main predicates for testing goes here

