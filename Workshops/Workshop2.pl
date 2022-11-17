%Fact: an empty list has length 0.
%Rule: for any list with tail T:
%		the length is 1 + N1
%		where N1 is the length of T.
lengthList( [], 0 ).
lengthList( [_|T], N )
	:- lengthList(T, N1),
    N is N1 + 1.

%Fact: anything taken from an empty list is an empty list.
%Fact: taking nothing from a any list, given an empty list.
%Rule: takeing N elemenets from any list with head H and tail T:
%		takes N1 elements from T and appends them to H
%		where N1 is N - 1.
takeList( _, [], [] ).
takeList( 0, _, [] ).
takeList( N, [H|T], L)
	:- N1 is N - 1,
    takeList( N1, T, L1),
	append([H], L1, L).

%Fact: dropping from an empty list gives an empty list.
%Fact: dropping nothing from some list gives the list.
%Rule: dropping N elements from any list with tail T:
%		returns N1 elements dropped from the list T
%		where N1 is N - 1.
dropList( _, [], [] ).
dropList( 0, L, L ).
dropList( N, [_|T], L )
	:- N1 is N - 1,
    dropList( N1, T, L).

%Rule: for any list XS split at index N:
%		the first split is the take of XS.
%		the second split is the drop of XS.
splitList( N, XS, L1, L2)
	:- takeList( N, XS, L1 ),
    dropList( N, XS, L2 ).

%Fact: the squares of an empty list is an empty list.
%Rule: the squares of a list with head H and tail T:
%		are the squares of T appended to the square of H.
squares( [], [] ).
squares( [H|T], L )
	:- H1 is H * H,
    squares( T, L1 ),
    append([H1], L1, L).

%Fact: an empty list has no even elements.
%Rule: for any list with head H and tail T:
%       if H is odd, evaluate the evens of T.
%Rule: for any list with head H and tail T:
%       if H is even, prepend H and evaluate the evens of T.
evens( [], [] ).
evens( [H|T], L )
	:- 1 is mod( H, 2),
    evens( T, L ).
evens( [H|T], L )
    :- 0 is mod( H, 2),
    evens( T, L1),
    append([H], L1, L).

%Fact: the triangle number of 0 is nothing.
%Rule: for any number N, with triangle number N2:
%		append N2 to a list and calculate the triangle of N - 1.
triangles(0, []).
triangles(N, L)
	:- N1 is N-1,
    N2 is N*(N+1)/2,
    triangles( N1, L1 ),
    append(L1, [N2], L).

main
	:-evens([1,2,3,4,6], X), write(X).