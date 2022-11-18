%Begin Question 3.1
%indices( [], _, [])
%indices( _, [], [])
%indices( IS, XS, ES )
%  :- 

%End Question 3.1

%Begin Question 4.2 -- INCORRECT --
%possible( X, Y, Z )
%  :- 

appendlist([], X, X).
appendlist([T|H], X, [T|L]) 
    :- appendlist(H, X, L).

possible([], []).
possible([X], [X]) :-!.
possible([T|H], X) 
    :- permutation(H, H1), 
    appendlist(L1, L2, H1), 
    appendlist(L1, [T], X1), 
    appendlist(X1, L2, X).

%End Question 4.2 -- INCORRECT --

%Begin Question 3.2
%possible( GRID )
%  :-

%End Question 3.2

%Begin Question 3.3
%acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
% :-

%suko( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
%  :-

%End Question 3.3

%any main predicates for testing goes here