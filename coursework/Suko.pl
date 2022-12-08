%Begin Question 3.1

% Fact: zero is the first index in a list
% Rule: for any index N and list [_|T]:
%       find index N - 1 for list T.
index(0, [H|_], H).
index(N, [_|T], E)
	:- N1 is N - 1,
    index(N1, T, E).

% Fact: An empty set of indices from any list gives an empty list.
% Fact: Any set of indices from an empty list give an empty list.
% Rule: for each index in the indices:
%       find the element at the index and append it to the result, 
%       then find the next index.
indices( [], _, []).
indices( _, [], []).
indices( IS, XS, ES )
    :- 
    IS = [H|T],
    index(H, XS, E),
    indices(T, XS, S),
    append([E], S, ES). 

%End Question 3.1

%Begin Question 3.2

% This predicate returns successive permutations of GRID.
% Grid is a list of any element type and X is the permutation.
% Fact: the only permutation of an empty list is an empty list.
% Fact: the only permutation of a singleton list is a singleton list.
% Rule: for any list [H|T]:
%       a permutation is L1 ++ H ++ L2
%       where L1 and L2 are arbitrary separations of T.
possiblePrint([], []).
possiblePrint([X], [X]) :-!.
possiblePrint(GRID, X) 
    :- 
    GRID = [H|T],
    possiblePrint(T, T1),
    append(L1, L2, T1), 
    append(L1, [H], X1), 
    append(X1, L2, X).

% Rule: GRID is each successive permutation of 1..9
possible( GRID )
	:- possiblePrint([1,2,3,4,5,6,7,8,9], GRID).

%End Question 3.2

%Begin Question 3.3

% Fact: the sum of a singleton list is the value of the element.
% Rule: The sum of any list [H|T]:
%       is H + the sum of T.
sumList([E], E).
sumList([H|T], N)
	:- 
    sumList(T, N1),
    N is N1 + H.

% V = sum(VS)
% U = sum(US)
% W = sum(WS)
% Top left corner adds to T0 
% Top right corner add to T1
% Bottom left corner add to T2
% Bottom right corner add to T3
acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
    :- 
    sumList(US, U),
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

% Find the permutation of 1..9 which satisfies the input.
suko( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID )
    :- 
    possible(GRID),
    acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID ).

%End Question 3.3

%any main predicates for testing goes here