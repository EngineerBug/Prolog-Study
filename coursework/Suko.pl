%Begin Question 3.1
%indices( [], _, [])
%indices( _, [], [])
%indices( IS, XS, ES )
%  :- 

%End Question 3.1

%Begin Question 3.2 -- INCORRECT --

%Fact: any list appended to an empty list is the list.
%Rule: any two lists appended together are:
%		the first element of the first list,
%		appended to both appended lists.
appendList([], L, L).
appendList([H|T], L1, [H|L]) 
    :- appendList(T, L1, L).

%Fact: any list has head H and tail T.
headTail([H|T], H, T).

possiblePrint([], []).
possiblePrint([X], [X])
	:-!.
possiblePrint(GRID, X) 
    :- headTail(GRID, H, T),
    possiblePrint(T, T1),
    appendList(L1, L2, T1), 
    appendList(L1, [H], X1), 
    appendList(X1, L2, X).

%End Question 3.2 -- INCORRECT --

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