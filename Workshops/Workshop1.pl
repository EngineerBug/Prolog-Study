%Fact: the factorial of 0 is 1.
%Rule: for any number N:
%		the factorial F is the factorial of N-1 * N.
%		where N1 is N-1, F1 is the factorial of N1.
factorial( 0, 1 ).
factorial( N, F )
	:- N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

%Fact: an empty list has sum of 0.
%Rule: for any list with head H and tail T:
% 		the sum will be the sum of T plus H.
%		where N is the sum, N1 is the sum of T.
sumList( [], 0 ).
sumList( [H|T], N )
	:- sumList( T, N1 ),
    N is N1 + H.

%Fact: the maximum of a singlton list is the single element.
%Rule: for any list with heads H, H1 and tail T:
%		the maximum is not H if H1 > H. 
%Rule: for any list with heads H, H1 and tail T:
%		the maximum is not H1 if H > H1.
maxList( [N], N ).
maxList( [H,H1|T], N)
	:- H < H1,
    maxList( [H1|T], N ).
maxList( [H,H1|T], N)
	:- H >= H1,
    maxList( [H|T], N).

%Fact: if the char C is the same as the head of some list, it is a memeber.
%Rule: if the char C is not the same as the head of some list:
%		test if C is a member if tail T.
memberlist( C, [C|_] ).
memberlist( C, [_|T] )
	:- memberlist( C, T ).

%Fact: the reverse of an empty list is an empty list.
%Rule: for any list with head H and tail T:
%		the reverse of [H|T] is H appended to the reverse of T.
reverseList( [], [] ).
reverseList( [H|T], L )
	:- reverseList(T, L1),
    append(L1, [H], L).

%Fact: for any element inserted into an empty list, the result is a singlton list.
%Rule: for any integer N and list with head H and tail T:
%		if N > H insert N into T then append back onto H.
%Rule: for any integer N and list with head H and tail T:
%		if N =< H, then prepend N to the list.
insert(N, [], [N]).
insert(N, [H|T], L)
	:- N > H,
    insert(N, T, L1),
    L = [H|L1].
insert(N, [H|T], L)
	:- N =< H,
    L = [N,H|T].

%Fact: for any empty list, the sorted list is an empty list.
%Rule: for any list with head H and tail T:
%		the sorted list is H inserted into the sorted T.
%		where the sorted T is L1.
insertSort([], []).
insertSort([H|T], L)
	:- insertSort(T, L1),
    insert(H, L1, L).

main
	:- reverseList( [a,b,c,d,e,f], X ), write(X).