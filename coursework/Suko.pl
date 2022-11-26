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

sumList([E], E).
sumList([H|T], N)
	:- sumList(T, N1),
    N is N1 + H.

% V = sum(VS)
% U = sum(US)
% W = sum(WS)
%
% sum(TS) = sum(4 * center + 2 * each edge center + 1 * each corner)
%
acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
 :- sumList(US, U),
    sumList(VS, V),
    sumList(WS, W),
    %check T0
    indices([0,1,3,4], GRID, T0S),
    sumList(T0S, T0),
    %check T1
    indices([1,2,4,5], GRID, T1S),
    sumList(T1S, T1),
    %check T2
    indices([3,4,6,7], GRID, T2S),
    sumList(T2S, T2),
    %check T3
    indices([4,5,7,8], GRID, T3S),
    sumList(T3S, T3).

%suko( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
%  :-

%End Question 3.3

%any main predicates for testing goes here