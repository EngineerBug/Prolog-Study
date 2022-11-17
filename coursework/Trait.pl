%Begin Question 4.1
%prime( N )
%  :-

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

%Begin Question 4.1
%Fact: all numbers are divisible by 1.
%Rule: for any numbers N and N-1:
%		N is prime iff is is not divisible by all numbers below it, except 1.
prime2( _, 1 ).
prime2( N, D )
    :- 0 =\= mod(N, D),
    D1 is D - 1,
    prime2(N, D1).

%Fact: 2 is the smallest prime number.
prime( 2 ).
prime( N )
  :- N1 is N - 1,
    0 =\= mod( N, N1 ),
    prime( N1 ).

main
	:- prime2(10, 9).
