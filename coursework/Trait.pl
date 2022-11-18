%Begin Question 4.1
%Fact: all numbers are divisible by 1.
%Rule: for any numbers N and N-1:
%		N is prime iff is is not divisible by all numbers below it, except 1.
prime2( N, N ).
prime2( N, D )
    :- mod(N, D) =\= 0,
    D1 is D + 1,
    prime2(N, D1).

%Rule: for any integer N:
%   if the only factors of N are 1 and N, it is prime.
prime( N )
  :- prime2(N, 2).

%End Question 4.1

%Begin Question 4.2
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

