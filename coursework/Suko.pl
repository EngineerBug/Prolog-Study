%Begin Question 3.1

index(0, [H|_], H).
index(N, [_|T], E)
	:- N1 is N - 1,
    index(N1, T, E).

indices( [], _, []).
indices( _, [], []).
indices( IS, XS, ES )
  :- IS = [H|T],
    index(H, XS, E),
    indices(T, XS, S),
    append([E], S, ES). 

%End Question 3.1

%Begin Question 3.2
possiblePrint([], []).
possiblePrint([X], [X]) :-!.
possiblePrint(GRID, X) 
    :- GRID = [H|T],
    possiblePrint(T, T1),
    append(L1, L2, T1), 
    append(L1, [H], X1), 
    append(X1, L2, X).

possible(GRID)
	:- possiblePrint(GRID, _).

%End Question 3.2

%Begin Question 3.3
% V = sum(VS)
% U = sum(US)
% W = sum(WS)
%
% T0 = 
%
%acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
% :-

%suko( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
%  :-

%End Question 3.3

%any main predicates for testing goes here